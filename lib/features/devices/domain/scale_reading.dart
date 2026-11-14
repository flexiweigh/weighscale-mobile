import '../../items/domain/item_enums.dart';

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