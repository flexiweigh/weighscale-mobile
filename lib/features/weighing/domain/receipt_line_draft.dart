enum ReceiptLineValidationError {
  itemRequired,
  grossInvalid,
  deductionInvalid,
  deductionTooLarge,
  priceInvalid,
}

class ReceiptLineDraft {
  const ReceiptLineDraft({
    required this.itemId,
    required this.grossWeightMilli,
    required this.unitPrice,
    this.deductionMilli = 0,
    this.isManual = false,
  });

  final String itemId;
  final int grossWeightMilli;
  final int deductionMilli;
  final int unitPrice;
  final bool isManual;

  int get netWeightMilli => grossWeightMilli - deductionMilli;

  int get amount => computeAmount(netWeightMilli, unitPrice);

  static int computeAmount(int netWeightMilli, int unitPrice) {
    if (netWeightMilli <= 0 || unitPrice <= 0) return 0;
    return (netWeightMilli * unitPrice + 500) ~/ 1000;
  }

  List<ReceiptLineValidationError> validate() {
    return [
      if (itemId.trim().isEmpty) ReceiptLineValidationError.itemRequired,
      if (grossWeightMilli <= 0) ReceiptLineValidationError.grossInvalid,
      if (deductionMilli < 0) ReceiptLineValidationError.deductionInvalid,
      if (deductionMilli >= 0 &&
          grossWeightMilli > 0 &&
          deductionMilli >= grossWeightMilli)
        ReceiptLineValidationError.deductionTooLarge,
      if (unitPrice < 0) ReceiptLineValidationError.priceInvalid,
    ];
  }

  bool get isValid => validate().isEmpty;
}