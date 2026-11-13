import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/item.dart';
import 'item_providers.dart';

final itemSearchQueryProvider =
NotifierProvider<ItemSearchController, String>(ItemSearchController.new);

class ItemSearchController extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String value) => state = value;

  void clear() => state = '';
}

final itemsListProvider = StreamProvider.autoDispose<List<Item>>((ref) {
  final query = ref.watch(itemSearchQueryProvider);
  return ref.watch(itemRepositoryProvider).watchAll(query: query);
});

final itemCountProvider = StreamProvider.autoDispose<int>(
      (ref) => ref.watch(itemRepositoryProvider).watchCount(),
);