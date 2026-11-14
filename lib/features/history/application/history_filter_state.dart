import '../../weighing/domain/receipt_enums.dart';
import '../domain/history_filter.dart';
import 'history_range.dart';

class HistoryFilterState {
  const HistoryFilterState({
    this.type,
    this.query = '',
    this.range = const HistoryRange.all(),
  });

  final ReceiptType? type;
  final String query;
  final HistoryRange range;

  bool get hasActiveFilter =>
      type != null || query.isNotEmpty || !range.isAll;

  HistoryFilter toFilter(DateTime now) {
    final (from, to) = range.bounds(now);
    return HistoryFilter(type: type, query: query, from: from, to: to);
  }

  HistoryFilterState copyWith({
    ReceiptType? type,
    bool clearType = false,
    String? query,
    HistoryRange? range,
  }) {
    return HistoryFilterState(
      type: clearType ? null : (type ?? this.type),
      query: query ?? this.query,
      range: range ?? this.range,
    );
  }
}