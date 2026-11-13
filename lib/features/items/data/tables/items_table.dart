import 'package:drift/drift.dart';

import '../../domain/item_enums.dart';
import 'categories_table.dart';

@DataClassName('ItemRow')
@TableIndex(name: 'items_name_idx', columns: {#name})
class Items extends Table {
  TextColumn get id => text()();

  TextColumn get name => text().withLength(min: 1, max: 80)();

  TextColumn get shortCode => text().withLength(max: 12).nullable()();

  TextColumn get categoryId => text()
      .nullable()
      .references(Categories, #id, onDelete: KeyAction.setNull)();

  TextColumn get unit => textEnum<WeightUnit>()();

  IntColumn get buyPrice => integer().withDefault(const Constant(0))();

  IntColumn get sellPrice => integer().withDefault(const Constant(0))();

  IntColumn get targetWeightMilli => integer().nullable()();

  IntColumn get toleranceMilli => integer().withDefault(const Constant(0))();

  BoolColumn get showWeightCheck =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get autoCaptureWhenOk =>
      boolean().withDefault(const Constant(false))();

  IntColumn get defaultDeductionMilli =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}