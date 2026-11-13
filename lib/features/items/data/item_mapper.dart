import '../../../core/database/app_database.dart';
import '../domain/category.dart';
import '../domain/item.dart';

extension CategoryRowMapper on CategoryRow {
  Category toCategory() {
    return Category(id: id, name: name, systemKey: systemKey);
  }
}

extension ItemRowMapper on ItemRow {
  Item toItem(CategoryRow? categoryRow) {
    return Item(
      id: id,
      name: name,
      shortCode: shortCode,
      category: categoryRow?.toCategory(),
      unit: unit,
      buyPrice: buyPrice,
      sellPrice: sellPrice,
      targetWeightMilli: targetWeightMilli,
      toleranceMilli: toleranceMilli,
      showWeightCheck: showWeightCheck,
      autoCaptureWhenOk: autoCaptureWhenOk,
      defaultDeductionMilli: defaultDeductionMilli,
      isActive: isActive,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}