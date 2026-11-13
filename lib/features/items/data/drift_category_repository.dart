import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/category.dart';
import '../domain/category_repository.dart';
import 'item_mapper.dart';

class DriftCategoryRepository implements CategoryRepository {
  DriftCategoryRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<Category>> watchAll() {
    final select = _db.select(_db.categories)
      ..where((t) => t.deletedAt.isNull())
      ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name.collate(Collate.noCase)),
      ]);

    return select
        .watch()
        .map((rows) => rows.map((row) => row.toCategory()).toList());
  }
}