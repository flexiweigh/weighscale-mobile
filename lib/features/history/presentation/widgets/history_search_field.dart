import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/widgets/app_search_field.dart';
import '../../application/history_filter_controller.dart';

class HistorySearchField extends ConsumerWidget {
  const HistorySearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(historyFilterProvider.select((s) => s.query));
    final filter = ref.read(historyFilterProvider.notifier);
    return AppSearchField(
      hint: context.l10n.historySearchHint,
      query: query,
      onChanged: filter.setQuery,
      onClear: filter.clearQuery,
    );
  }
}