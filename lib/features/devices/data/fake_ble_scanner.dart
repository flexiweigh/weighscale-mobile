import '../domain/device_scanner.dart';
import '../domain/discovered_device.dart';

class FakeBleScanner implements DeviceScanner {
  FakeBleScanner({this.current = ScannerAvailability.available});

  ScannerAvailability current;

  static const _devices = [
    DiscoveredDevice(
      id: 'AA:BB:CC:00:00:01',
      transport: DeviceTransport.ble,
      name: 'Scale-01',
      signal: SignalStrength.strong,
      detail: 'FFE0',
    ),
    DiscoveredDevice(
      id: 'AA:BB:CC:00:00:02',
      transport: DeviceTransport.ble,
      name: 'TruckScale-BLE',
      signal: SignalStrength.good,
      detail: 'FFE0',
    ),
    DiscoveredDevice(
      id: 'AA:BB:CC:00:00:03',
      transport: DeviceTransport.ble,
      signal: SignalStrength.weak,
    ),
  ];

  @override
  DeviceTransport get transport => DeviceTransport.ble;

  @override
  Future<ScannerAvailability> availability() async => current;

  @override
  AccessFix fixFor(ScannerAvailability availability) => switch (availability) {
    ScannerAvailability.permissionDenied => AccessFix.requestPermission,
    ScannerAvailability.permissionPermanentlyDenied => AccessFix.openSettings,
    ScannerAvailability.adapterOff => AccessFix.turnOnAdapter,
    _ => AccessFix.none,
  };

  @override
  Future<ScannerAvailability> requestAccess() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (current == ScannerAvailability.permissionDenied ||
        current == ScannerAvailability.adapterOff) {
      current = ScannerAvailability.available;
    }
    return current;
  }

  @override
  Stream<DiscoveredDevice> scan({required Duration timeout}) async* {
    for (final device in _devices) {
      await Future<void>.delayed(const Duration(milliseconds: 700));
      yield device;
    }
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}