import 'package:drift/drift.dart';

import '../../domain/receipt_enums.dart';

@DataClassName('ReceiptRow')
class Receipts extends Table {
  TextColumn get id => text()();

  IntColumn get receiptNumber => integer().unique()();

  TextColumn get type => textEnum<ReceiptType>()();

  TextColumn get status => textEnum<ReceiptStatus>()();

  TextColumn get partyName => text().withLength(max: 80).nullable()();

  IntColumn get totalAmount => integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}