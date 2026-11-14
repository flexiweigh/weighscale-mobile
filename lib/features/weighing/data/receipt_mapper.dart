import '../../../core/database/app_database.dart';
import '../domain/deduction_preset.dart';
import '../domain/receipt.dart';
import '../domain/receipt_line.dart';

extension ReceiptLineRowMapper on ReceiptLineRow {
  ReceiptLine toReceiptLine() {
    return ReceiptLine(
      id: id,
      receiptId: receiptId,
      lineNo: lineNo,
      itemId: itemId,
      itemName: itemName,
      unit: unit,
      grossWeightMilli: grossWeightMilli,
      deductionMilli: deductionMilli,
      netWeightMilli: netWeightMilli,
      unitPrice: unitPrice,
      amount: amount,
      isManual: isManual,
      createdAt: createdAt,
    );
  }
}

extension ReceiptRowMapper on ReceiptRow {
  Receipt toReceipt(List<ReceiptLine> lines) {
    return Receipt(
      id: id,
      number: receiptNumber,
      type: type,
      status: status,
      partyName: partyName,
      totalAmount: totalAmount,
      lines: lines,
      createdAt: createdAt,
      updatedAt: updatedAt,
      completedAt: completedAt,
    );
  }
}

extension DeductionPresetRowMapper on DeductionPresetRow {
  DeductionPreset toDeductionPreset() {
    return DeductionPreset(
      id: id,
      name: name,
      weightMilli: weightMilli,
      systemKey: systemKey,
    );
  }
}