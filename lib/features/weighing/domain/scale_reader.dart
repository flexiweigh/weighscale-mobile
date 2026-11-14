import 'scale_reading.dart';

abstract class ScaleReader {
  Stream<ScaleState> watch();

  Future<void> tare();

  Future<void> zero();
}