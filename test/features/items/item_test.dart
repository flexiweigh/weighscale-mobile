import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/items/domain/category.dart';

import '../../../lib/features/items/domain/item.dart';
import '../../../lib/features/items/domain/item_draft.dart';
import '../../../lib/features/items/domain/item_enums.dart';

Item buildItem({int? target = 25000, int tolerance = 500}) {
  final now = DateTime(2026, 11, 10);
  return Item(
    id: 'a',
    name: 'Copper',
    unit: WeightUnit.kg,
    buyPrice: 4800,
    sellPrice: 5100,
    targetWeightMilli: target,
    toleranceMilli: tolerance,
    showWeightCheck: true,
    autoCaptureWhenOk: false,
    defaultDeductionMilli: 500,
    isActive: true,
    createdAt: now,
    updatedAt: now,
  );
}

void main() {
  group('Item.checkWeight', () {
    test('matches the Under / OK / Over bands from the design', () {
      final item = buildItem();
      expect(item.checkWeight(24499), WeightCheckResult.under);
      expect(item.checkWeight(24500), WeightCheckResult.ok);
      expect(item.checkWeight(25000), WeightCheckResult.ok);
      expect(item.checkWeight(25500), WeightCheckResult.ok);
      expect(item.checkWeight(25501), WeightCheckResult.over);
    });

    test('returns null when the item has no target', () {
      expect(buildItem(target: null).checkWeight(25000), isNull);
    });
  });

  group('ItemDraft.validate', () {
    test('requires a name', () {
      expect(
        const ItemDraft(name: '  ').validate(),
        contains(ItemValidationError.nameRequired),
      );
    });

    test('rejects a blank new category name', () {
      expect(
        const ItemDraft(name: 'Copper', category: NewCategory('  ')).validate(),
        contains(ItemValidationError.categoryInvalid),
      );
    });

    test('requires a target when the OK check is on', () {
      expect(
        const ItemDraft(name: 'Copper', showWeightCheck: true).validate(),
        contains(ItemValidationError.targetRequired),
      );
    });

    test('accepts a complete draft', () {
      const draft = ItemDraft(
        name: 'Copper',
        buyPrice: 4800,
        sellPrice: 5100,
        targetWeightMilli: 25000,
        toleranceMilli: 500,
        showWeightCheck: true,
      );
      expect(draft.isValid, isTrue);
    });
  });
}