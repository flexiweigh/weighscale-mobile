import '../../../devices/domain/scale_session.dart';
import 'home_card_states.dart';

ScaleCardState scaleCardStateOf(
    ScaleSession session, {
      required String unnamedLabel,
    }) {
  final name = session.deviceName ?? unnamedLabel;
  final reading = session.reading;
  final weight = reading == null ? null : reading.weightMilli / 1000;
  final unit = reading?.unit.name ?? 'kg';

  return switch (session.status) {
    ScaleStatus.notConnected => const ScaleCardState.notConnected(),
    ScaleStatus.connecting => ScaleCardState.connecting(deviceName: name),
    ScaleStatus.connected => ScaleCardState.connected(
      deviceName: name,
      profileName: session.profileName ?? '',
      weight: weight,
      unit: unit,
      isStable: reading?.isStable ?? false,
    ),
    ScaleStatus.lost => ScaleCardState.disconnected(
      deviceName: name,
      weight: weight,
      unit: unit,
    ),
  };
}