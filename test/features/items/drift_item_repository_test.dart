import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../lib/core/database/app_database.dart';
import '../../../lib/features/items/data/drift_category_repository.dart';
import '../../../lib/features/items/data/drift_item_repository.dart';
import '../../../lib/features/items/domain/category.dart';
import '../../../lib/features/items/domain/item_draft.dart';
import '../../../lib/features/items/domain/item_repository.dart';

void main() {
  late AppDatabase db;
  late DriftItemRepository repo;
  late DriftCategoryRepository categories;
  late DateTime now;
  var counter = 0;

  setUp(() {
    counter = 0;
    now = DateTime(2026, 11, 10, 9);
    db = AppDatabase(NativeDatabase.memory());
    categories = DriftCategoryRepository(db);
    repo = DriftItemRepository(
      db,
      clock: () => now,
      idGenerator: () => 'id-${++counter}',
    );
  });

  tearDown(() async {
    await db.close();
  });

  Matcher failsWith(ItemSaveFailure failure) {
    return throwsA(
      isA<ItemSaveException>().having((e) => e.failure, 'failure', failure),
    );
  }

  Future<List<String>> categoryNames() async {
    final all = await categories.watchAll().first;
    return all.map((c) => c.name).toList();
  }

  const defaults = ['Metal', 'Plastic', 'Paper', 'Rubber', 'Other'];

  test('default categories are seeded in order', () async {
    final all = await categories.watchAll().first;
    expect(all.map((c) => c.name), defaults);
    expect(all.every((c) => c.isSystem), isTrue);
    expect(all.first.id, 'category-metal');
  });

  test('create trims the name and upper-cases the short code', () async {
    final item = await repo.create(
      const ItemDraft(
        name: '  Copper ',
        shortCode: ' cu ',
        category: ExistingCategory('category-metal'),
        buyPrice: 4800,
        sellPrice: 5100,
        targetWeightMilli: 25000,
        toleranceMilli: 500,
        showWeightCheck: true,
        notes: '   ',
      ),
    );

    expect(item.id, 'id-1');
    expect(item.name, 'Copper');
    expect(item.shortCode, 'CU');
    expect(item.category?.name, 'Metal');
    expect(item.notes, isNull);
    expect(item.buyPrice, 4800);
    expect(item.targetWeightMilli, 25000);
    expect(item.isActive, isTrue);
  });

  test('a new category name is saved once and then reused', () async {
    final first = await repo.create(
      const ItemDraft(name: 'Bottle', category: NewCategory('  Glass  ')),
    );
    final second = await repo.create(
      const ItemDraft(name: 'Jar', category: NewCategory('glass')),
    );

    expect(first.category?.name, 'Glass');
    expect(first.category?.isSystem, isFalse);
    expect(second.category?.id, first.category?.id);
    expect(await categoryNames(), [...defaults, 'Glass']);
  });

  test('typing a default category name reuses the default', () async {
    final item = await repo.create(
      const ItemDraft(name: 'Copper', category: NewCategory('metal')),
    );

    expect(item.category?.id, 'category-metal');
    expect(await categoryNames(), defaults);
  });

  test('an unknown category id is rejected', () {
    expect(
          () => repo.create(
        const ItemDraft(name: 'Copper', category: ExistingCategory('nope')),
      ),
      failsWith(ItemSaveFailure.categoryNotFound),
    );
  });

  test('a blank new category is invalid', () {
    expect(
          () => repo.create(
        const ItemDraft(name: 'Copper', category: NewCategory('   ')),
      ),
      failsWith(ItemSaveFailure.invalid),
    );
  });

  test('a failed save does not leave a new category behind', () async {
    await repo.create(const ItemDraft(name: 'Copper'));

    await expectLater(
      repo.create(
        const ItemDraft(name: 'Copper', category: NewCategory('Glass')),
      ),
      failsWith(ItemSaveFailure.duplicateName),
    );

    expect(await categoryNames(), defaults);
  });

  test('create rejects an invalid draft', () {
    expect(
          () => repo.create(const ItemDraft(name: '')),
      failsWith(ItemSaveFailure.invalid),
    );
  });

  test('duplicate names and codes are rejected', () async {
    await repo.create(const ItemDraft(name: 'Copper', shortCode: 'CU'));

    expect(
          () => repo.create(const ItemDraft(name: 'copper')),
      failsWith(ItemSaveFailure.duplicateName),
    );
    expect(
          () => repo.create(const ItemDraft(name: 'Brass', shortCode: 'cu')),
      failsWith(ItemSaveFailure.duplicateShortCode),
    );
  });

  test('update changes fields, keeps createdAt and allows its own name',
          () async {
        final created = await repo.create(const ItemDraft(name: 'Copper'));
        now = now.add(const Duration(hours: 1));

        final updated = await repo.update(
          created.id,
          const ItemDraft(name: 'Copper', buyPrice: 5000, sellPrice: 5300),
        );

        expect(updated.buyPrice, 5000);
        expect(updated.createdAt, created.createdAt);
        expect(updated.updatedAt.isAfter(created.updatedAt), isTrue);
      });

  test('update can change and clear the category', () async {
    final created = await repo.create(
      const ItemDraft(
        name: 'Copper',
        category: ExistingCategory('category-metal'),
      ),
    );

    final changed = await repo.update(
      created.id,
      const ItemDraft(name: 'Copper', category: NewCategory('Glass')),
    );
    expect(changed.category?.name, 'Glass');

    final cleared = await repo.update(
      created.id,
      const ItemDraft(name: 'Copper'),
    );
    expect(cleared.category, isNull);
  });

  test('update of a missing item fails', () {
    expect(
          () => repo.update('missing', const ItemDraft(name: 'Copper')),
      failsWith(ItemSaveFailure.notFound),
    );
  });

  test('delete is soft and frees the name', () async {
    final created = await repo.create(const ItemDraft(name: 'Copper'));

    await repo.delete(created.id);

    expect(await repo.findById(created.id), isNull);
    expect(await repo.watchAll().first, isEmpty);
    expect(await repo.watchCount().first, 0);
    final again = await repo.create(const ItemDraft(name: 'Copper'));
    expect(again.id, isNot(created.id));
  });

  test('watchAll searches name and code, and can hide inactive items',
          () async {
        await repo.create(const ItemDraft(name: 'Copper', shortCode: 'CU'));
        await repo.create(const ItemDraft(name: 'Aluminium', shortCode: 'AL'));
        await repo.create(const ItemDraft(name: 'Brass', isActive: false));

        expect((await repo.watchAll().first).map((i) => i.name),
            ['Aluminium', 'Brass', 'Copper']);
        expect((await repo.watchAll(query: 'cu').first).map((i) => i.name),
            ['Copper']);
        expect((await repo.watchAll(query: 'ALU').first).map((i) => i.name),
            ['Aluminium']);
        expect((await repo.watchAll(activeOnly: true).first).length, 2);
        expect(await repo.watchCount().first, 3);
      });
}