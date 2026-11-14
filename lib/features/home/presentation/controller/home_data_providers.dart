import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../devices/application/scale_session_controller.dart';
import '../../../devices/domain/scale_session.dart';
import '../../../history/application/history_providers.dart';
import '../../../history/domain/period_totals.dart';
import '../../../items/application/items_list_providers.dart';
import '../state/home_card_states.dart';

final todaySummaryProvider = Provider.autoDispose<TodaySummaryState>((ref) {
  final totals =
      ref.watch(historyTodayTotalsProvider).valueOrNull ?? PeriodTotals.empty;
  return TodaySummaryState(
    transactions: totals.transactions,
    weight: totals.weightKgMilli / 1000,
    amount: totals.amount,
  );
});

final getStartedProvider = Provider.autoDispose<GetStartedState?>((ref) {
  final scaleStatus = ref.watch(
    scaleSessionProvider.select((s) => s.status),
  );
  final items = ref.watch(itemCountProvider);
  final receipts = ref.watch(historyOverallCountProvider);

  final itemCount = items.valueOrNull;
  final receiptCount = receipts.valueOrNull;
  if (itemCount == null || receiptCount == null) return null;

  return GetStartedState(
    steps: [
      GetStartedStep(
        id: GetStartedStepId.connectScale,
        done: scaleStatus == ScaleStatus.connected ||
            scaleStatus == ScaleStatus.lost,
      ),
      GetStartedStep(id: GetStartedStepId.addItems, done: itemCount > 0),
      GetStartedStep(
        id: GetStartedStepId.firstWeighing,
        done: receiptCount > 0,
      ),
    ],
  );
});