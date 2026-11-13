import '../domain/discovered_device.dart';
import '../domain/scale_connector.dart';

class FakeScaleConnector implements ScaleConnector {
  const FakeScaleConnector();

  @override
  Future<void> connect({
    required DiscoveredDevice device,
    required String profileId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 1200));
  }
}