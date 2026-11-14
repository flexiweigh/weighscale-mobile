import 'discovered_device.dart';
import 'scale_reading.dart';

enum ConnectFailureReason { timeout, rejected, unsupported, unknown }

class ScaleConnectException implements Exception {
  const ScaleConnectException(this.reason);

  final ConnectFailureReason reason;
}

abstract class ScaleLink {
  Stream<ScaleReading> get readings;

  Future<void> tare();

  Future<void> zero();

  Future<void> close();
}

abstract class ScaleConnector {
  Future<ScaleLink> connect({
    required DiscoveredDevice device,
    required String profileId,
  });
}