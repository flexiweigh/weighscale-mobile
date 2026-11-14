import 'dart:async';

import '../../items/domain/item_enums.dart';
import '../domain/discovered_device.dart';
import '../domain/scale_connector.dart';
import '../domain/scale_reading.dart';

class FakeScaleConnector implements ScaleConnector {
  FakeScaleLink? lastLink;
  bool rejectConnections = false;

  @override
  Future<ScaleLink> connect({
    required DiscoveredDevice device,
    required String profileId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    if (rejectConnections) {
      throw const ScaleConnectException(ConnectFailureReason.rejected);
    }
    final link = FakeScaleLink();
    lastLink = link;
    return link;
  }
}

class FakeScaleLink implements ScaleLink {
  FakeScaleLink({this.rawMilli = 85500});

  final int rawMilli;

  int _offsetMilli = 0;
  int _ticksSinceChange = 0;
  bool _closed = false;
  bool _lost = false;

  void simulateLoss() => _lost = true;

  @override
  Stream<ScaleReading> get readings async* {
    while (!_closed) {
      if (_lost) throw StateError('link lost');
      final base = rawMilli - _offsetMilli;
      final settling = _ticksSinceChange < 4 && base != 0;
      final wobble = settling ? (_ticksSinceChange.isEven ? 120 : -80) : 0;
      yield ScaleReading(
        weightMilli: base + wobble,
        unit: WeightUnit.kg,
        isStable: !settling,
      );
      _ticksSinceChange++;
      await Future<void>.delayed(const Duration(milliseconds: 400));
    }
  }

  @override
  Future<void> tare() async {
    _offsetMilli = rawMilli;
    _ticksSinceChange = 0;
  }

  @override
  Future<void> zero() => tare();

  @override
  Future<void> close() async {
    _closed = true;
  }
}