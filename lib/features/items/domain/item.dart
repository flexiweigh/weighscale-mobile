import 'category.dart';
import 'item_enums.dart';

class Item {
  const Item({
    required this.id,
    required this.name,
    required this.unit,
    required this.buyPrice,
    required this.sellPrice,
    required this.showWeightCheck,
    required this.autoCaptureWhenOk,
    required this.defaultDeductionMilli,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.shortCode,
    this.category,
    this.targetWeightMilli,
    this.toleranceMilli = 0,
    this.notes,
  });

  final String id;
  final String name;
  final String? shortCode;
  final Category? category;
  final WeightUnit unit;
  final int buyPrice;
  final int sellPrice;
  final int? targetWeightMilli;
  final int toleranceMilli;
  final bool showWeightCheck;
  final bool autoCaptureWhenOk;
  final int defaultDeductionMilli;
  final bool isActive;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  String? get categoryId => category?.id;

  bool get hasTarget => targetWeightMilli != null;

  int? get okMinMilli =>
      targetWeightMilli == null ? null : targetWeightMilli! - toleranceMilli;

  int? get okMaxMilli =>
      targetWeightMilli == null ? null : targetWeightMilli! + toleranceMilli;

  WeightCheckResult? checkWeight(int weightMilli) {
    final min = okMinMilli;
    final max = okMaxMilli;
    if (min == null || max == null) return null;
    if (weightMilli < min) return WeightCheckResult.under;
    if (weightMilli > max) return WeightCheckResult.over;
    return WeightCheckResult.ok;
  }
}