import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../data/drift_history_repository.dart';
import '../domain/history_filter.dart';
import '../domain/history_repository.dart';
import '../domain/period_totals.dart';
import '../domain/receipt_summary.dart';
import 'history_filter_controller.dart';
import 'history_list.dart';
import 'history_range.dart';

final historyRepositoryProvider = Provider<HistoryRepository>(
      (ref) => DriftHistoryRepository(ref.watch(appDatabaseProvider)),
);

final historyListProvider = StreamProvider.autoDispose<HistoryListData>((ref) {
  final state = ref.watch(historyFilterProvider);
  final filter = state.toFilter(DateTime.now());
  return ref
      .watch(historyRepositoryProvider)
      .watch(filter)
      .map(buildHistoryList);
});

final historyTodayTotalsProvider = StreamProvider.autoDispose<PeriodTotals>((
    ref,
    ) {
  final (from, to) = const HistoryRange(
    HistoryRangePreset.today,
  ).bounds(DateTime.now());
  return ref
      .watch(historyRepositoryProvider)
      .watchTotals(HistoryFilter(from: from, to: to));
});

final historyOverallCountProvider = StreamProvider.autoDispose<int>((ref) {
  return ref
      .watch(historyRepositoryProvider)
      .watchTotals(const HistoryFilter())
      .map((totals) => totals.transactions);
});

final recentReceiptsProvider =
StreamProvider.autoDispose<List<ReceiptSummary>>((ref) {
  return ref
      .watch(historyRepositoryProvider)
      .watch(const HistoryFilter(limit: 4));
});