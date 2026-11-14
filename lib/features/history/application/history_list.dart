import '../domain/receipt_summary.dart';

class HistoryDayGroup {
  const HistoryDayGroup({required this.day, required this.receipts});

  final DateTime day;
  final List<ReceiptSummary> receipts;

  int get totalAmount =>
      receipts.fold(0, (sum, receipt) => sum + receipt.totalAmount);

  int daysAgo(DateTime now) {
    final today = DateTime.utc(now.year, now.month, now.day);
    final target = DateTime.utc(day.year, day.month, day.day);
    return today.difference(target).inDays;
  }
}

class HistoryListData {
  const HistoryListData(this.groups);

  static const empty = HistoryListData([]);

  final List<HistoryDayGroup> groups;

  bool get isEmpty => groups.isEmpty;

  int get count =>
      groups.fold(0, (sum, group) => sum + group.receipts.length);
}

HistoryListData buildHistoryList(List<ReceiptSummary> receipts) {
  if (receipts.isEmpty) return HistoryListData.empty;

  final groups = <HistoryDayGroup>[];
  var currentDay = _dayOf(receipts.first.completedAt);
  var bucket = <ReceiptSummary>[];

  for (final receipt in receipts) {
    final day = _dayOf(receipt.completedAt);
    if (day != currentDay) {
      groups.add(HistoryDayGroup(day: currentDay, receipts: bucket));
      currentDay = day;
      bucket = <ReceiptSummary>[];
    }
    bucket.add(receipt);
  }
  groups.add(HistoryDayGroup(day: currentDay, receipts: bucket));

  return HistoryListData(groups);
}

DateTime _dayOf(DateTime value) => DateTime(value.year, value.month, value.day);