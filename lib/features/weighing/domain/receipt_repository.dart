import 'receipt.dart';
import 'receipt_enums.dart';
import 'receipt_line_draft.dart';

enum ReceiptFailure {
  invalid,
  notFound,
  notDraft,
  lineNotFound,
  itemNotFound,
  emptyReceipt,
}

class ReceiptException implements Exception {
  const ReceiptException(this.failure, [this.errors = const []]);

  final ReceiptFailure failure;
  final List<ReceiptLineValidationError> errors;
}

abstract class ReceiptRepository {
  Stream<Receipt?> watchById(String id);

  Future<Receipt?> findById(String id);

  Future<Receipt?> findOpenDraft(ReceiptType type);

  Future<Receipt> createDraft(ReceiptType type, {String? partyName});

  Future<Receipt> setPartyName(String receiptId, String? partyName);

  Future<Receipt> addLine(String receiptId, ReceiptLineDraft draft);

  Future<Receipt> updateLine(String lineId, ReceiptLineDraft draft);

  Future<Receipt> removeLine(String lineId);

  Future<Receipt> complete(String receiptId);

  Future<void> discard(String receiptId);
}