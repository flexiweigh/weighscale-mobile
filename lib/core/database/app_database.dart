import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../features/items/data/tables/categories_table.dart';
import '../../features/items/data/tables/items_table.dart';
import '../../features/items/domain/category.dart';
import '../../features/items/domain/item_enums.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Categories, Items])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'flexiweigh'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
      await _seedSystemCategories();
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
}