import 'package:drift/drift.dart';

import '../../../items/data/tables/items_table.dart';
import '../../../items/domain/item_enums.dart';
import 'receipts_table.dart';

@DataClassName('ReceiptLineRow')
@TableIndex(name: 'receipt_lines_receipt_idx', columns: {#receiptId})
class ReceiptLines extends Table {
  TextColumn get id => text()();

  TextColumn get receiptId =>
      text().references(Receipts, #id, onDelete: KeyAction.cascade)();

  IntColumn get lineNo => integer()();

  TextColumn get itemId => text()
      .nullable()
      .references(Items, #id, onDelete: KeyAction.setNull)();

  TextColumn get itemName => text().withLength(min: 1, max: 80)();

  TextColumn get unit => textEnum<WeightUnit>()();

  IntColumn get grossWeightMilli => integer()();

  IntColumn get deductionMilli => integer().withDefault(const Constant(0))();

  IntColumn get netWeightMilli => integer()();

  IntColumn get unitPrice => integer()();

  IntColumn get amount => integer()();

  BoolColumn get isManual => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}