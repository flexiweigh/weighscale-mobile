import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../features/items/data/tables/categories_table.dart';
import '../../features/items/data/tables/items_table.dart';
import '../../features/items/domain/category.dart';
import '../../features/items/domain/item_enums.dart';
import '../../features/weighing/data/tables/deduction_presets_table.dart';
import '../../features/weighing/data/tables/receipt_lines_table.dart';
import '../../features/weighing/data/tables/receipts_table.dart';
import '../../features/weighing/domain/deduction_preset.dart';
import '../../features/weighing/domain/receipt_enums.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Categories, Items, Receipts, ReceiptLines, DeductionPresets],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'flexiweigh'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
      await _seedSystemCategories();
      await _seedSystemDeductionPresets();
    },
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(receipts);
        await migrator.createTable(receiptLines);
        await migrator.createIndex(receiptLinesReceiptIdx);
        await migrator.createTable(deductionPresets);
        await _seedSystemDeductionPresets();
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  Future<void> _seedSystemCategories() async {
    final now = DateTime.now();
    await batch((batch) {
      batch.insertAll(categories, [
        for (final category in systemCategories)
          CategoriesCompanion.insert(
            id: category.id,
            name: category.name,
            createdAt: now,
            updatedAt: now,
            systemKey: Value(category.key),
            sortOrder: Value(category.sortOrder),
          ),
      ]);
    });
  }

  Future<void> _seedSystemDeductionPresets() async {
    final now = DateTime.now();
    await batch((batch) {
      batch.insertAll(deductionPresets, [
        for (final preset in systemDeductionPresets)
          DeductionPresetsCompanion.insert(
            id: preset.id,
            name: preset.name,
            weightMilli: preset.weightMilli,
            createdAt: now,
            updatedAt: now,
            systemKey: Value(preset.key),
            sortOrder: Value(preset.sortOrder),
          ),
      ]);
    });
  }
}