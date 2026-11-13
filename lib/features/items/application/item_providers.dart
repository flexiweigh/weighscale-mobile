import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../data/drift_category_repository.dart';
import '../data/drift_item_repository.dart';
import '../domain/category.dart';
import '../domain/category_repository.dart';
import '../domain/item_repository.dart';

final itemRepositoryProvider = Provider<ItemRepository>(
      (ref) => DriftItemRepository(ref.watch(appDatabaseProvider)),
);

final categoryRepositoryProvider = Provider<CategoryRepository>(
      (ref) => DriftCategoryRepository(ref.watch(appDatabaseProvider)),
);

final categoriesProvider = StreamProvider<List<Category>>(
      (ref) => ref.watch(categoryRepositoryProvider).watchAll(),
);