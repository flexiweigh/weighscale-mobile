import '../../items/domain/item_enums.dart';
import 'deduction_preset.dart';
import 'weight_units.dart';

extension DeductionPresetUnit on DeductionPreset {
  int weightMilliIn(WeightUnit unit) {
    return convertWeightMilli(weightMilli, WeightUnit.kg, unit);
  }
}

String? matchingPresetId(
    List<DeductionPreset> presets,
    int deductionMilli,
    WeightUnit unit,
    ) {
  if (deductionMilli <= 0) return null;
  for (final preset in presets) {
    if (preset.weightMilliIn(unit) == deductionMilli) return preset.id;
  }
  return null;
}