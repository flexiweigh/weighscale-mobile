import 'deduction_preset.dart';

abstract class DeductionPresetRepository {
  Stream<List<DeductionPreset>> watchAll();
}