import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/device_scanner.dart';
import '../domain/discovered_device.dart';
import '../domain/discovery_state.dart';
import '../domain/scale_connector.dart';
import 'connect_sheet_state.dart';
import 'device_providers.dart';

final connectSheetControllerProvider =
NotifierProvider.autoDispose<ConnectSheetController, ConnectSheetState>(
  ConnectSheetController.new,
);

class ConnectSheetController extends AutoDisposeNotifier<ConnectSheetState> {
  StreamSubscription<DiscoveryState>? _subscription;
  bool _disposed = false;

  @override
  ConnectSheetState build() {
    ref.onDispose(() {
      _disposed = true;
      _subscription?.cancel();
    });
    Future.microtask(_init);
    return const ConnectSheetState();
  }

  Future<void> _init() async {
    final profiles = await ref.read(scaleProfileRepositoryProvider).list();
    if (_disposed) return;
    state = state.copyWith(
      profiles: profiles,
      selectedProfileId: profiles.isEmpty ? null : profiles.first.id,
    );
    await startScan();
  }

  Future<void> startScan() async {
    await _subscription?.cancel();
    if (_disposed) return;
    state = state.copyWith(
      discovery: const DiscoveryState(status: DiscoveryStatus.scanning),
      clearFailure: true,
    );
    _subscription = ref.read(deviceDiscoveryServiceProvider).scan().listen(
          (discovery) {
        if (!_disposed) state = state.copyWith(discovery: discovery);
      },
    );
  }

  void selectProfile(String id) {
    state = state.copyWith(selectedProfileId: id);
  }

  Future<bool> connect(DiscoveredDevice device) async {
    final profileId = state.selectedProfileId;
    if (profileId == null || state.isConnecting) return false;

    await _subscription?.cancel();
    _subscription = null;

    state = state.copyWith(
      discovery: state.discovery.copyWith(status: DiscoveryStatus.finished),
      connectingKey: device.key,
      clearFailure: true,
    );

    try {
      await ref
          .read(scaleConnectorProvider)
          .connect(device: device, profileId: profileId);
      if (_disposed) return true;
      state = state.copyWith(clearConnecting: true);
      return true;
    } on ScaleConnectException catch (error) {
      if (_disposed) return false;
      state = state.copyWith(clearConnecting: true, failure: error.reason);
      return false;
    }
  }

  AccessFix fixFor(DeviceTransport transport, ScannerAvailability availability) {
    return ref
        .read(deviceDiscoveryServiceProvider)
        .fixFor(transport, availability);
  }

  Future<void> fixAccess(DeviceTransport transport) async {
    if (state.isFixingAccess || state.isConnecting) return;
    state = state.copyWith(isFixingAccess: true);
    await ref.read(deviceDiscoveryServiceProvider).requestAccess(transport);
    if (_disposed) return;
    state = state.copyWith(isFixingAccess: false);
    await refreshAvailability();
  }

  Future<void> refreshAvailability() async {
    if (_disposed || state.isConnecting || state.isFixingAccess) return;
    if (state.discovery.unavailable.isEmpty) return;

    final current =
    await ref.read(deviceDiscoveryServiceProvider).checkAvailability();
    if (_disposed) return;

    final recovered = state.discovery.unavailable.keys
        .any((t) => current[t] == ScannerAvailability.available);

    if (recovered) {
      await startScan();
      return;
    }

    state = state.copyWith(
      discovery: state.discovery.copyWith(
        unavailable: {
          for (final entry in current.entries)
            if (entry.value != ScannerAvailability.available)
              entry.key: entry.value,
        },
      ),
    );
  }
}