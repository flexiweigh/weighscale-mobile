import 'discovered_device.dart';
import 'scale_reading.dart';

enum ScaleStatus { notConnected, connecting, connected, lost }

class ScaleSession {
  const ScaleSession({
    this.status = ScaleStatus.notConnected,
    this.device,
    this.profileId,
    this.profileName,
    this.reading,
    this.reconnectAttempt = 0,
  });

  static const maxReconnectAttempts = 5;

  final ScaleStatus status;
  final DiscoveredDevice? device;
  final String? profileId;
  final String? profileName;
  final ScaleReading? reading;
  final int reconnectAttempt;

  bool get isConnected => status == ScaleStatus.connected;

  String? get deviceName => device != null && device!.isNamed ? device!.name : null;

  ScaleSession copyWith({
    ScaleStatus? status,
    ScaleReading? reading,
    int? reconnectAttempt,
  }) {
    return ScaleSession(
      status: status ?? this.status,
      device: device,
      profileId: profileId,
      profileName: profileName,
      reading: reading ?? this.reading,
      reconnectAttempt: reconnectAttempt ?? this.reconnectAttempt,
    );
  }
}