import '../../../core/utils/item_limits.dart';
import '../../../core/utils/milli.dart';
import '../../../core/utils/parse_number.dart';
import '../domain/category.dart';
import '../domain/item_enums.dart';

enum ItemFormField {
  itemName,
  shortCode,
  category,
  buyPrice,
  sellPrice,
  targetWeight,
  tolerance,
  defaultDeduction,
}

enum ItemFormError { required, invalid, tooLong, duplicate }

class ItemWeightPreview {
  const ItemWeightPreview({required this.okMinMilli, required this.okMaxMilli});

  final int okMinMilli;
  final int okMaxMilli;
}

class ItemFormState {
  const ItemFormState({
    this.name = '',
    this.shortCode = '',
    this.categoryInput = '',
    this.categoryId,
    this.unit = WeightUnit.kg,
    this.buyPrice = '',
    this.sellPrice = '',
    this.targetWeight = '',
    this.tolerance = '',
    this.showWeightCheck = false,
    this.autoCaptureWhenOk = false,
    this.defaultDeduction = '',
    this.isActive = true,
    this.notes = '',
    this.showErrors = false,
    this.isLoading = false,
    this.isSaving = false,
    this.isDirty = false,
    this.notFound = false,
    this.saveFailed = false,
    this.serverErrors = const {},
  });

  final String name;
  final String shortCode;
  final String categoryInput;
  final String? categoryId;
  final WeightUnit unit;
  final String buyPrice;
  final String sellPrice;
  final String targetWeight;
  final String tolerance;
  final bool showWeightCheck;
  final bool autoCaptureWhenOk;
  final String defaultDeduction;
  final bool isActive;
  final String notes;
  final bool showErrors;
  final bool isLoading;
  final bool isSaving;
  final bool isDirty;
  final bool notFound;
  final bool saveFailed;
  final Map<ItemFormField, ItemFormError> serverErrors;

  Map<ItemFormField, ItemFormError> get errors {
    final result = <ItemFormField, ItemFormError>{};

    final nameLength = name.trim().length;
    if (nameLength == 0) {
      result[ItemFormField.itemName] = ItemFormError.required;
    } else if (nameLength > itemNameMaxLength) {
      result[ItemFormField.itemName] = ItemFormError.tooLong;
    }

    if (shortCode.trim().length > itemShortCodeMaxLength) {
      result[ItemFormField.shortCode] = ItemFormError.tooLong;
    }

    if (categoryInput.trim().length > categoryNameMaxLength) {
      result[ItemFormField.category] = ItemFormError.tooLong;
    }

    if (_badWhole(buyPrice)) {
      result[ItemFormField.buyPrice] = ItemFormError.invalid;
    }
    if (_badWhole(sellPrice)) {
      result[ItemFormField.sellPrice] = ItemFormError.invalid;
    }

    final target = targetWeight.trim();
    if (target.isEmpty) {
      if (showWeightCheck || autoCaptureWhenOk) {
        result[ItemFormField.targetWeight] = ItemFormError.required;
      }
    } else {
      final milli = parseMilli(target);
      if (milli == null || milli <= 0) {
        result[ItemFormField.targetWeight] = ItemFormError.invalid;
      }
    }

    if (_badDecimal(tolerance)) {
      result[ItemFormField.tolerance] = ItemFormError.invalid;
    }
    if (_badDecimal(defaultDeduction)) {
      result[ItemFormField.defaultDeduction] = ItemFormError.invalid;
    }

    return {...result, ...serverErrors};
  }

  ItemWeightPreview? get preview {
    final target = parseMilli(targetWeight);
    if (target == null || target <= 0) return null;
    final spread = tolerance.trim().isEmpty ? 0 : parseMilli(tolerance);
    if (spread == null) return null;
    final min = target - spread;
    return ItemWeightPreview(
      okMinMilli: min < 0 ? 0 : min,
      okMaxMilli: target + spread,
    );
  }

  ItemFormState copyWith({
    String? name,
    String? shortCode,
    String? categoryInput,
    String? categoryId,
    bool clearCategoryId = false,
    WeightUnit? unit,
    String? buyPrice,
    String? sellPrice,
    String? targetWeight,
    String? tolerance,
    bool? showWeightCheck,
    bool? autoCaptureWhenOk,
    String? defaultDeduction,
    bool? isActive,
    String? notes,
    bool? showErrors,
    bool? isLoading,
    bool? isSaving,
    bool? isDirty,
    bool? notFound,
    bool? saveFailed,
    Map<ItemFormField, ItemFormError>? serverErrors,
  }) {
    return ItemFormState(
      name: name ?? this.name,
      shortCode: shortCode ?? this.shortCode,
      categoryInput: categoryInput ?? this.categoryInput,
      categoryId: clearCategoryId ? null : (categoryId ?? this.categoryId),
      unit: unit ?? this.unit,
      buyPrice: buyPrice ?? this.buyPrice,
      sellPrice: sellPrice ?? this.sellPrice,
      targetWeight: targetWeight ?? this.targetWeight,
      tolerance: tolerance ?? this.tolerance,
      showWeightCheck: showWeightCheck ?? this.showWeightCheck,
      autoCaptureWhenOk: autoCaptureWhenOk ?? this.autoCaptureWhenOk,
      defaultDeduction: defaultDeduction ?? this.defaultDeduction,
      isActive: isActive ?? this.isActive,
      notes: notes ?? this.notes,
      showErrors: showErrors ?? this.showErrors,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      isDirty: isDirty ?? this.isDirty,
      notFound: notFound ?? this.notFound,
      saveFailed: saveFailed ?? this.saveFailed,
      serverErrors: serverErrors ?? this.serverErrors,
    );
  }

  static bool _badWhole(String text) {
    return text.trim().isNotEmpty && parseWholeNumber(text) == null;
  }

  static bool _badDecimal(String text) {
    return text.trim().isNotEmpty && parseMilli(text) == null;
  }
}