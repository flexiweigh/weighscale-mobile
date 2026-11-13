import 'item.dart';
import 'item_draft.dart';

enum ItemSaveFailure {
  invalid,
  duplicateName,
  duplicateShortCode,
  categoryNotFound,
  notFound,
}

class ItemSaveException implements Exception {
  const ItemSaveException(this.failure, [this.errors = const []]);

  final ItemSaveFailure failure;
  final List<ItemValidationError> errors;
}

abstract class ItemRepository {
  Stream<List<Item>> watchAll({String query = '', bool activeOnly = false});

  Stream<int> watchCount();

  Future<Item?> findById(String id);

  Future<Item> create(ItemDraft draft);

  Future<Item> update(String id, ItemDraft draft);

  Future<void> delete(String id);
}