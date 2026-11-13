enum WeightUnit { kg, g, lb, viss }

enum WeightCheckResult { under, ok, over }

extension WeightUnitFactor on WeightUnit {
  double get gramsPerUnit => switch (this) {
    WeightUnit.kg => 1000.0,
    WeightUnit.g => 1.0,
    WeightUnit.lb => 453.59237,
    WeightUnit.viss => 1632.932532,
  };
}