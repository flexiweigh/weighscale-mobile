import 'history_filter.dart';
import 'period_totals.dart';
import 'receipt_summary.dart';

abstract class HistoryRepository {
  Stream<List<ReceiptSummary>> watch(HistoryFilter filter);

  Stream<PeriodTotals> watchTotals(HistoryFilter filter);
}