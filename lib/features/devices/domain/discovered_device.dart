enum DeviceTransport { ble, wifi, usb, spp }

enum SignalStrength { strong, good, weak, unknown }

class DiscoveredDevice {
  const DiscoveredDevice({
    required this.id,
    required this.transport,
    this.name,
    this.signal = SignalStrength.unknown,
    this.detail,
  });

  final String id;
  final DeviceTransport transport;
  final String? name;
  final SignalStrength signal;
  final String? detail;

  String get key => '${transport.name}:$id';

  bool get isNamed => name != null && name!.trim().isNotEmpty;
}