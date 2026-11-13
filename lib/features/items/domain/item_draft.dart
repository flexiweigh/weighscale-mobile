import '../../../core/utils/item_limits.dart';
import 'category.dart';
import 'item.dart';
import 'item_enums.dart';

enum ItemValidationError {
  nameRequired,
  nameTooLong,
  shortCodeTooLong,
  categoryInvalid,
  priceInvalid,
  targetRequired,
  toleranceInvalid,
  deductionInvalid,
}

class ItemDraft {
  const ItemDraft({
    required this.name,
    this.shortCode,
    this.category,
    this.unit = WeightUnit.kg,
    this.buyPrice = 0,
    this.sellPrice = 0,
    this.targetWeightMilli,
    this.toleranceMilli = 0,
    this.showWeightCheck = false,
    this.autoCaptureWhenOk = false,
    this.defaultDeductionMilli = 0,
    this.isActive = true,
    this.notes,
  });

  factory ItemDraft.fromItem(Item item) {
    final category = item.category;
    return ItemDraft(
      name: item.name,
      shortCode: item.shortCode,
      category: category == null ? null : ExistingCategory(category.id),
      unit: item.unit,
      buyPrice: item.buyPrice,
      sellPrice: item.sellPrice,
      targetWeightMilli: item.targetWeightMilli,
      toleranceMilli: item.toleranceMilli,
      showWeightCheck: item.showWeightCheck,
      autoCaptureWhenOk: item.autoCaptureWhenOk,
      defaultDeductionMilli: item.defaultDeductionMilli,
      isActive: item.isActive,
      notes: item.notes,
    );
  }

  final String name;
  final String? shortCode;
  final CategorySelection? category;
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

  List<ItemValidationError> validate() {
    final needsTarget = showWeightCheck || autoCaptureWhenOk;
    final target = targetWeightMilli;
    final selection = category;
    return [
      if (name.trim().isEmpty) ItemValidationError.nameRequired,
      if (name.trim().length > itemNameMaxLength)
        ItemValidationError.nameTooLong,
      if ((shortCode?.trim().length ?? 0) > itemShortCodeMaxLength)
        ItemValidationError.shortCodeTooLong,
      if (selection is NewCategory && !_isValidCategoryName(selection.name))
        ItemValidationError.categoryInvalid,
      if (selection is NewCategory && !_isValidCategoryName(selection.name))
        ItemValidationError.categoryInvalid,
      if (buyPrice < 0 || sellPrice < 0) ItemValidationError.priceInvalid,
      if (needsTarget && (target == null || target <= 0))
        ItemValidationError.targetRequired,
      if (toleranceMilli < 0) ItemValidationError.toleranceInvalid,
      if (defaultDeductionMilli < 0) ItemValidationError.deductionInvalid,
    ];
  }

  bool get isValid => validate().isEmpty;

  static bool _isValidCategoryName(String name) {
    final clean = name.trim();
    return clean.isNotEmpty && clean.length <= categoryNameMaxLength;
  }
}