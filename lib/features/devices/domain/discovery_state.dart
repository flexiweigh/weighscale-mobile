import 'device_scanner.dart';
import 'discovered_device.dart';

enum DiscoveryStatus { idle, scanning, finished, unavailable }

class DiscoveryState {
  const DiscoveryState({
    this.status = DiscoveryStatus.idle,
    this.devices = const [],
    this.unavailable = const {},
  });

  final DiscoveryStatus status;
  final List<DiscoveredDevice> devices;
  final Map<DeviceTransport, ScannerAvailability> unavailable;

  bool get isScanning => status == DiscoveryStatus.scanning;

  DiscoveryState copyWith({
    DiscoveryStatus? status,
    List<DiscoveredDevice>? devices,
    Map<DeviceTransport, ScannerAvailability>? unavailable,
  }) {
    return DiscoveryState(
      status: status ?? this.status,
      devices: devices ?? this.devices,
      unavailable: unavailable ?? this.unavailable,
    );
  }
}