import '../../weighing/domain/receipt_enums.dart';

class ReceiptSummary {
  const ReceiptSummary({
    required this.id,
    required this.number,
    required this.type,
    required this.itemNames,
    required this.lineCount,
    required this.totalWeightKgMilli,
    required this.totalAmount,
    required this.completedAt,
    this.partyName,
  });

  final String id;
  final int number;
  final ReceiptType type;
  final String? partyName;
  final List<String> itemNames;
  final int lineCount;
  final int totalWeightKgMilli;
  final int totalAmount;
  final DateTime completedAt;

  String get displayNumber => number.toString().padLeft(4, '0');

  String get firstItemName => itemNames.isEmpty ? '' : itemNames.first;

  int get extraItemCount => itemNames.length > 1 ? itemNames.length - 1 : 0;

  bool get hasParty => partyName != null && partyName!.trim().isNotEmpty;
}