import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../domain/category.dart';
import '../domain/item.dart';
import '../domain/item_draft.dart';
import '../domain/item_repository.dart';
import 'item_mapper.dart';

class DriftItemRepository implements ItemRepository {
  DriftItemRepository(
      this._db, {
        DateTime Function()? clock,
        String Function()? idGenerator,
      })  : _clock = clock ?? DateTime.now,
        _newId = idGenerator ?? const Uuid().v4;

  final AppDatabase _db;
  final DateTime Function() _clock;
  final String Function() _newId;

  JoinedSelectStatement<HasResultSet, dynamic> _itemQuery() {
    return _db.select(_db.items).join([
      leftOuterJoin(
        _db.categories,
        _db.categories.id.equalsExp(_db.items.categoryId),
      ),
    ]);
  }

  Item _toItem(TypedResult row) {
    return row.readTable(_db.items).toItem(row.readTableOrNull(_db.categories));
  }

  Future<Item?> _loadItem(String id) async {
    final query = _itemQuery()
      ..where(_db.items.id.equals(id) & _db.items.deletedAt.isNull());
    final row = await query.getSingleOrNull();
    return row == null ? null : _toItem(row);
  }

  @override
  Stream<List<Item>> watchAll({String query = '', bool activeOnly = false}) {
    final text = query.trim();
    final items = _db.items;

    final conditions = <Expression<bool>>[items.deletedAt.isNull()];
    if (activeOnly) conditions.add(items.isActive.equals(true));
    if (text.isNotEmpty) {
      conditions.add(
        items.name.contains(text) |
        items.shortCode.contains(text),
      );
    }

    final select = _itemQuery()
      ..where(conditions.reduce((a, b) => a & b))
      ..orderBy([OrderingTerm.asc(items.name.collate(Collate.noCase))]);

    return select.watch().map((rows) => rows.map(_toItem).toList());
  }

  @override
  Stream<int> watchCount() {
    final count = _db.items.id.count();
    final query = _db.selectOnly(_db.items)
      ..addColumns([count])
      ..where(_db.items.deletedAt.isNull());
    return query.watchSingle().map((row) => row.read(count) ?? 0);
  }

  @override
  Future<Item?> findById(String id) => _loadItem(id);

  @override
  Future<Item> create(ItemDraft draft) {
    return _db.transaction(() async {
      _ensureValid(draft);
      final name = draft.name.trim();
      final code = _normalizeCode(draft.shortCode);
      await _ensureUnique(name: name, code: code);

      final now = _clock();
      final categoryId = await _resolveCategoryId(draft.category, now);
      final id = _newId();

      await _db.into(_db.items).insert(
        ItemsCompanion.insert(
          id: id,
          name: name,
          unit: draft.unit,
          createdAt: now,
          updatedAt: now,
          shortCode: Value(code),
          categoryId: Value(categoryId),
          buyPrice: Value(draft.buyPrice),
          sellPrice: Value(draft.sellPrice),
          targetWeightMilli: Value(draft.targetWeightMilli),
          toleranceMilli: Value(draft.toleranceMilli),
          showWeightCheck: Value(draft.showWeightCheck),
          autoCaptureWhenOk: Value(draft.autoCaptureWhenOk),
          defaultDeductionMilli: Value(draft.defaultDeductionMilli),
          isActive: Value(draft.isActive),
          notes: Value(_normalizeNotes(draft.notes)),
        ),
      );

      return (await _loadItem(id))!;
    });
  }

  @override
  Future<Item> update(String id, ItemDraft draft) {
    return _db.transaction(() async {
      _ensureValid(draft);
      if (await _loadItem(id) == null) {
        throw const ItemSaveException(ItemSaveFailure.notFound);
      }

      final name = draft.name.trim();
      final code = _normalizeCode(draft.shortCode);
      await _ensureUnique(name: name, code: code, excludeId: id);

      final now = _clock();
      final categoryId = await _resolveCategoryId(draft.category, now);

      await (_db.update(_db.items)..where((t) => t.id.equals(id))).write(
        ItemsCompanion(
          name: Value(name),
          shortCode: Value(code),
          categoryId: Value(categoryId),
          unit: Value(draft.unit),
          buyPrice: Value(draft.buyPrice),
          sellPrice: Value(draft.sellPrice),
          targetWeightMilli: Value(draft.targetWeightMilli),
          toleranceMilli: Value(draft.toleranceMilli),
          showWeightCheck: Value(draft.showWeightCheck),
          autoCaptureWhenOk: Value(draft.autoCaptureWhenOk),
          defaultDeductionMilli: Value(draft.defaultDeductionMilli),
          isActive: Value(draft.isActive),
          notes: Value(_normalizeNotes(draft.notes)),
          updatedAt: Value(now),
        ),
      );

      return (await _loadItem(id))!;
    });
  }

  @override
  Future<void> delete(String id) async {
    final now = _clock();
    await (_db.update(_db.items)
      ..where((t) => t.id.equals(id) & t.deletedAt.isNull()))
        .write(
      ItemsCompanion(deletedAt: Value(now), updatedAt: Value(now)),
    );
  }

  Future<String?> _resolveCategoryId(
      CategorySelection? selection,
      DateTime now,
      ) async {
    switch (selection) {
      case null:
        return null;
      case ExistingCategory(:final id):
        final row = await (_db.select(_db.categories)
          ..where((t) => t.id.equals(id) & t.deletedAt.isNull()))
            .getSingleOrNull();
        if (row == null) {
          throw const ItemSaveException(ItemSaveFailure.categoryNotFound);
        }
        return row.id;
      case NewCategory(:final name):
        final clean = _normalizeCategoryName(name);
        final matches = await (_db.select(_db.categories)
          ..where(
                (t) =>
            t.deletedAt.isNull() &
            t.name.lower().equalsExp(Variable<String>(clean).lower()),
          ))
            .get();
        if (matches.isNotEmpty) return matches.first.id;

        final newId = _newId();
        await _db.into(_db.categories).insert(
          CategoriesCompanion.insert(
            id: newId,
            name: clean,
            createdAt: now,
            updatedAt: now,
            sortOrder: const Value(customCategorySortOrder),
          ),
        );
        return newId;
    }
  }

  void _ensureValid(ItemDraft draft) {
    final errors = draft.validate();
    if (errors.isNotEmpty) {
      throw ItemSaveException(ItemSaveFailure.invalid, errors);
    }
  }

  Future<void> _ensureUnique({
    required String name,
    required String? code,
    String? excludeId,
  }) async {
    final nameQuery = _db.select(_db.items)
      ..where(
            (t) =>
        t.deletedAt.isNull() &
        t.name.lower().equalsExp(Variable<String>(name).lower()),
      );
    if (excludeId != null) {
      nameQuery.where((t) => t.id.isNotValue(excludeId));
    }
    if ((await nameQuery.get()).isNotEmpty) {
      throw const ItemSaveException(ItemSaveFailure.duplicateName);
    }

    if (code == null) return;

    final codeQuery = _db.select(_db.items)
      ..where(
            (t) =>
        t.deletedAt.isNull() &
        t.shortCode.lower().equalsExp(Variable<String>(code).lower()),
      );
    if (excludeId != null) {
      codeQuery.where((t) => t.id.isNotValue(excludeId));
    }
    if ((await codeQuery.get()).isNotEmpty) {
      throw const ItemSaveException(ItemSaveFailure.duplicateShortCode);
    }
  }

  String _normalizeCategoryName(String value) {
    return value.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  String? _normalizeCode(String? value) {
    final code = value?.trim().toUpperCase();
    return code == null || code.isEmpty ? null : code;
  }

  String? _normalizeNotes(String? value) {
    final notes = value?.trim();
    return notes == null || notes.isEmpty ? null : notes;
  }
}