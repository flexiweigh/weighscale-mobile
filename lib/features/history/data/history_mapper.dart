import '../../../core/database/app_database.dart';
import '../../items/domain/item_enums.dart';
import '../../weighing/domain/weight_units.dart';
import '../domain/receipt_summary.dart';

extension ReceiptSummaryMapper on ReceiptRow {
  ReceiptSummary toSummary(List<ReceiptLineRow> lines) {
    final names = <String>[];
    var weightKgMilli = 0;
    for (final line in lines) {
      if (!names.contains(line.itemName)) names.add(line.itemName);
      weightKgMilli += convertWeightMilli(
        line.netWeightMilli,
        line.unit,
        WeightUnit.kg,
      );
    }
    return ReceiptSummary(
      id: id,
      number: receiptNumber,
      type: type,
      partyName: partyName,
      itemNames: names,
      lineCount: lines.length,
      totalWeightKgMilli: weightKgMilli,
      totalAmount: totalAmount,
      completedAt: completedAt ?? updatedAt,
    );
  }
}