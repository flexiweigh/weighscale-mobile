import 'discovered_device.dart';

enum ScannerAvailability {
  available,
  adapterOff,
  permissionDenied,
  permissionPermanentlyDenied,
  unsupported,
}

enum AccessFix { none, requestPermission, turnOnAdapter, openSettings }

abstract class DeviceScanner {
  DeviceTransport get transport;

  Future<ScannerAvailability> availability();

  AccessFix fixFor(ScannerAvailability availability);

  Future<ScannerAvailability> requestAccess();

  Stream<DiscoveredDevice> scan({required Duration timeout});
}