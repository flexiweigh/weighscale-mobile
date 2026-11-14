import '../../items/domain/item_enums.dart';
import '../../weighing/domain/receipt.dart';
import '../../weighing/domain/receipt_enums.dart';
import '../../weighing/domain/receipt_line.dart';

class ReceiptView {
  const ReceiptView({required this.receipt, required this.commonUnit});

  final Receipt receipt;
  final WeightUnit? commonUnit;

  ReceiptType get type => receipt.type;

  String get displayNumber => receipt.displayNumber;

  DateTime get time => receipt.displayTime;

  String? get partyName => receipt.hasParty ? receipt.partyName!.trim() : null;

  List<ReceiptLine> get lines => receipt.lines;

  int get lineCount => receipt.lineCount;

  int get totalAmount => receipt.totalAmount;

  int get totalWeightKgMilli => receipt.totalWeightKgMilli;

  bool get hasManualLines => lines.any((line) => line.isManual);

  bool get hasMixedUnits => lines.isNotEmpty && commonUnit == null;
}

ReceiptView buildReceiptView(Receipt receipt) {
  WeightUnit? common;
  if (receipt.lines.isNotEmpty) {
    final first = receipt.lines.first.unit;
    common = receipt.lines.every((line) => line.unit == first) ? first : null;
  }
  return ReceiptView(receipt: receipt, commonUnit: common);
}