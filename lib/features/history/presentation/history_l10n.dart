import 'package:intl/intl.dart';

import '../../../core/utils/date_format.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../application/history_list.dart';
import '../application/history_range.dart';

String historyDayLabel(
    AppL10n l10n,
    HistoryDayGroup group,
    DateTime now,
    String languageCode,
    ) {
  return switch (group.daysAgo(now)) {
    0 => l10n.todayTitle,
    1 => l10n.historyYesterday,
    _ => formatHeaderDate(group.day, languageCode),
  };
}

String historyPresetLabel(AppL10n l10n, HistoryRangePreset preset) {
  return switch (preset) {
    HistoryRangePreset.all => l10n.historyRangeAll,
    HistoryRangePreset.today => l10n.todayTitle,
    HistoryRangePreset.yesterday => l10n.historyYesterday,
    HistoryRangePreset.last7Days => l10n.historyRangeLast7,
    HistoryRangePreset.thisMonth => l10n.historyRangeMonth,
    HistoryRangePreset.custom => l10n.historyRangeCustom,
  };
}

String historyRangeLabel(
    AppL10n l10n,
    HistoryRange range,
    String languageCode,
    ) {
  final from = range.customFrom;
  final to = range.customTo;
  if (range.preset == HistoryRangePreset.custom && from != null && to != null) {
    final format = DateFormat.MMMd(languageCode);
    return '${format.format(from)} – ${format.format(to)}';
  }
  return historyPresetLabel(l10n, range.preset);
}

String formatReceiptTime(DateTime value, String languageCode) {
  return DateFormat.jm(languageCode).format(value);
}

String formatReceiptDate(DateTime value, String languageCode) {
  return DateFormat('d MMM y', languageCode).format(value);
}