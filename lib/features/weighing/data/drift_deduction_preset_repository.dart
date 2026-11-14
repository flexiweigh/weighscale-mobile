import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/deduction_preset.dart';
import '../domain/deduction_preset_repository.dart';
import 'receipt_mapper.dart';

class DriftDeductionPresetRepository implements DeductionPresetRepository {
  DriftDeductionPresetRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<DeductionPreset>> watchAll() {
    final select = _db.select(_db.deductionPresets)
      ..where((t) => t.deletedAt.isNull())
      ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name.collate(Collate.noCase)),
      ]);

    return select
        .watch()
        .map((rows) => rows.map((row) => row.toDeductionPreset()).toList());
  }
}