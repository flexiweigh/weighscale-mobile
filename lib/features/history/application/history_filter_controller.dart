import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../weighing/domain/receipt_enums.dart';
import 'history_filter_state.dart';
import 'history_range.dart';

final historyFilterProvider =
NotifierProvider<HistoryFilterController, HistoryFilterState>(
  HistoryFilterController.new,
);

class HistoryFilterController extends Notifier<HistoryFilterState> {
  static const _debounce = Duration(milliseconds: 250);

  Timer? _timer;

  @override
  HistoryFilterState build() {
    ref.onDispose(() => _timer?.cancel());
    return const HistoryFilterState();
  }

  void setType(ReceiptType? type) {
    state = state.copyWith(type: type, clearType: type == null);
  }

  void setQuery(String value) {
    _timer?.cancel();
    final text = value.trim();
    if (text == state.query) return;
    _timer = Timer(_debounce, () => state = state.copyWith(query: text));
  }

  void clearQuery() {
    _timer?.cancel();
    if (state.query.isEmpty) return;
    state = state.copyWith(query: '');
  }

  void setPreset(HistoryRangePreset preset) {
    state = state.copyWith(range: HistoryRange(preset));
  }

  void setCustomRange(DateTime from, DateTime to) {
    final start = from.isAfter(to) ? to : from;
    final end = from.isAfter(to) ? from : to;
    state = state.copyWith(
      range: HistoryRange(
        HistoryRangePreset.custom,
        customFrom: start,
        customTo: end,
      ),
    );
  }

  void resetFilters() {
    _timer?.cancel();
    state = const HistoryFilterState();
  }
}