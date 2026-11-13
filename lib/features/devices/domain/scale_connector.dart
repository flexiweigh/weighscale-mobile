import 'discovered_device.dart';

enum ConnectFailureReason { timeout, rejected, unsupported, unknown }

class ScaleConnectException implements Exception {
  const ScaleConnectException(this.reason);

  final ConnectFailureReason reason;
}

abstract class ScaleConnector {
  Future<void> connect({
    required DiscoveredDevice device,
    required String profileId,
  });
}