import '../../items/domain/item_enums.dart';

class ReceiptLine {
  const ReceiptLine({
    required this.id,
    required this.receiptId,
    required this.lineNo,
    required this.itemName,
    required this.unit,
    required this.grossWeightMilli,
    required this.deductionMilli,
    required this.netWeightMilli,
    required this.unitPrice,
    required this.amount,
    required this.isManual,
    required this.createdAt,
    this.itemId,
  });

  final String id;
  final String receiptId;
  final int lineNo;
  final String? itemId;
  final String itemName;
  final WeightUnit unit;
  final int grossWeightMilli;
  final int deductionMilli;
  final int netWeightMilli;
  final int unitPrice;
  final int amount;
  final bool isManual;
  final DateTime createdAt;
}