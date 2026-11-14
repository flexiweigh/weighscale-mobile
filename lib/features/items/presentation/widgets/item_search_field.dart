import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/widgets/app_search_field.dart';
import '../../application/items_list_providers.dart';

class ItemSearchField extends ConsumerWidget {
  const ItemSearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(itemSearchQueryProvider);
    final search = ref.read(itemSearchQueryProvider.notifier);
    return AppSearchField(
      hint: context.l10n.itemsSearchHint,
      query: query,
      onChanged: search.setQuery,
      onClear: search.clear,
    );
  }
}