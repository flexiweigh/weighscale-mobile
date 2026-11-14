import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/discovered_device.dart';
import '../domain/scale_connector.dart';
import '../domain/scale_profile_summary.dart';
import '../domain/scale_reading.dart';
import '../domain/scale_session.dart';
import 'device_providers.dart';

final scaleSessionProvider =
NotifierProvider<ScaleSessionController, ScaleSession>(
  ScaleSessionController.new,
);

class ScaleSessionController extends Notifier<ScaleSession> {
  static const _retryDelay = Duration(seconds: 3);

  ScaleLink? _link;
  StreamSubscription<ScaleReading>? _subscription;
  int _generation = 0;

  @override
  ScaleSession build() {
    ref.onDispose(() {
      _generation++;
      _subscription?.cancel();
      _link?.close();
    });
    return const ScaleSession();
  }

  Future<void> connect({
    required DiscoveredDevice device,
    required ScaleProfileSummary profile,
  }) async {
    final generation = ++_generation;
    await _release();
    state = ScaleSession(
      status: ScaleStatus.connecting,
      device: device,
      profileId: profile.id,
      profileName: profile.name,
    );
    try {
      final link = await ref
          .read(scaleConnectorProvider)
          .connect(device: device, profileId: profile.id);
      if (generation != _generation) {
        await link.close();
        return;
      }
      _attach(link, generation);
    } on ScaleConnectException {
      if (generation == _generation) state = const ScaleSession();
      rethrow;
    }
  }

  Future<void> disconnect() async {
    _generation++;
    await _release();
    state = const ScaleSession();
  }

  Future<void> reconnect() async {
    if (state.device == null || state.profileId == null) return;
    final generation = ++_generation;
    await _release();
    unawaited(_recover(generation, immediate: true));
  }

  Future<void> tare() async {
    if (!state.isConnected) return;
    await _link?.tare();
  }

  Future<void> zero() async {
    if (!state.isConnected) return;
    await _link?.zero();
  }

  void _attach(ScaleLink link, int generation) {
    _link = link;
    state = state.copyWith(status: ScaleStatus.connected, reconnectAttempt: 0);
    _subscription = link.readings.listen(
          (reading) {
        if (generation == _generation) state = state.copyWith(reading: reading);
      },
      onError: (Object _) => _onLost(generation),
      onDone: () => _onLost(generation),
      cancelOnError: true,
    );
  }

  void _onLost(int generation) {
    if (generation != _generation) return;
    final next = ++_generation;
    unawaited(_release().then((_) => _recover(next)));
  }

  Future<void> _recover(int generation, {bool immediate = false}) async {
    final device = state.device;
    final profileId = state.profileId;
    if (device == null || profileId == null) return;

    for (var attempt = 1;
    attempt <= ScaleSession.maxReconnectAttempts;
    attempt++) {
      if (generation != _generation) return;
      state = state.copyWith(
        status: ScaleStatus.lost,
        reconnectAttempt: attempt,
      );
      if (!(immediate && attempt == 1)) {
        await Future<void>.delayed(_retryDelay);
        if (generation != _generation) return;
      }
      try {
        final link = await ref
            .read(scaleConnectorProvider)
            .connect(device: device, profileId: profileId);
        if (generation != _generation) {
          await link.close();
          return;
        }
        _attach(link, generation);
        return;
      } on ScaleConnectException {
        if (generation != _generation) return;
      }
    }
  }

  Future<void> _release() async {
    final subscription = _subscription;
    final link = _link;
    _subscription = null;
    _link = null;
    await subscription?.cancel();
    await link?.close();
  }
}