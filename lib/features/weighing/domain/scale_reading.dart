import '../../items/domain/item_enums.dart';

enum ScaleLinkStatus { disconnected, connecting, connected }

class ScaleReading {
  const ScaleReading({
    required this.weightMilli,
    required this.unit,
    required this.isStable,
  });

  final int weightMilli;
  final WeightUnit unit;
  final bool isStable;
}

class ScaleState {
  const ScaleState({
    required this.status,
    this.deviceName,
    this.reading,
  });

  const ScaleState.disconnected()
      : status = ScaleLinkStatus.disconnected,
        deviceName = null,
        reading = null;

  final ScaleLinkStatus status;
  final String? deviceName;
  final ScaleReading? reading;

  bool get isConnected => status == ScaleLinkStatus.connected;
}