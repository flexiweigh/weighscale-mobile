import '../../items/domain/item_enums.dart';
import '../domain/scale_reader.dart';
import '../domain/scale_reading.dart';

class FakeScaleReader implements ScaleReader {
  FakeScaleReader({this.deviceName = 'Scale-01', this.rawMilli = 85500});

  final String deviceName;
  final int rawMilli;

  int _offsetMilli = 0;
  int _ticksSinceChange = 0;

  @override
  Stream<ScaleState> watch() async* {
    while (true) {
      final base = rawMilli - _offsetMilli;
      final settling = _ticksSinceChange < 4 && base != 0;
      final wobble = settling ? (_ticksSinceChange.isEven ? 120 : -80) : 0;
      yield ScaleState(
        status: ScaleLinkStatus.connected,
        deviceName: deviceName,
        reading: ScaleReading(
          weightMilli: base + wobble,
          unit: WeightUnit.kg,
          isStable: !settling,
        ),
      );
      _ticksSinceChange++;
      await Future<void>.delayed(const Duration(milliseconds: 400));
    }
  }

  @override
  Future<void> tare() async {
    _offsetMilli = rawMilli;
    _ticksSinceChange = 0;
  }

  @override
  Future<void> zero() => tare();
}