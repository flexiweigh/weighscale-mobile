enum HistoryRangePreset { all, today, yesterday, last7Days, thisMonth, custom }

class HistoryRange {
  const HistoryRange(this.preset, {this.customFrom, this.customTo});

  const HistoryRange.all()
      : preset = HistoryRangePreset.all,
        customFrom = null,
        customTo = null;

  final HistoryRangePreset preset;
  final DateTime? customFrom;
  final DateTime? customTo;

  bool get isAll => preset == HistoryRangePreset.all;

  (DateTime?, DateTime?) bounds(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    switch (preset) {
      case HistoryRangePreset.all:
        return (null, null);
      case HistoryRangePreset.today:
        return (today, DateTime(now.year, now.month, now.day + 1));
      case HistoryRangePreset.yesterday:
        return (DateTime(now.year, now.month, now.day - 1), today);
      case HistoryRangePreset.last7Days:
        return (
        DateTime(now.year, now.month, now.day - 6),
        DateTime(now.year, now.month, now.day + 1),
        );
      case HistoryRangePreset.thisMonth:
        return (
        DateTime(now.year, now.month, 1),
        DateTime(now.year, now.month + 1, 1),
        );
      case HistoryRangePreset.custom:
        final from = customFrom;
        final to = customTo;
        if (from == null || to == null) return (null, null);
        return (
        DateTime(from.year, from.month, from.day),
        DateTime(to.year, to.month, to.day + 1),
        );
    }
  }
}