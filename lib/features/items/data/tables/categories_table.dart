import 'package:drift/drift.dart';

@DataClassName('CategoryRow')
@TableIndex(name: 'categories_name_idx', columns: {#name})
class Categories extends Table {
  TextColumn get id => text()();

  TextColumn get name => text().withLength(min: 1, max: 40)();

  TextColumn get systemKey => text().nullable()();

  IntColumn get sortOrder => integer().withDefault(const Constant(100))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}