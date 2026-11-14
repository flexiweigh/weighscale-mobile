import 'dart:math' as math;

import '../../items/domain/item.dart';
import '../../items/domain/item_enums.dart';
import '../domain/receipt.dart';
import '../domain/receipt_enums.dart';
import '../domain/receipt_line_draft.dart';
import '../domain/scale_reading.dart';
import '../domain/weight_units.dart';

enum WeighingFailure {
  loadFailed,
  noItem,
  scaleNotReady,
  invalidWeight,
  saveFailed,
  emptyReceipt,
}

enum ManualField { gross, deduction }

class WeighingState {
  const WeighingState({
    required this.type,
    this.receipt,
    this.item,
    this.price = '',
    this.deduction = '',
    this.scale = const ScaleState.disconnected(),
    this.autoCapture = false,
    this.isManual = false,
    this.manualGross = '',
    this.manualField = ManualField.gross,
    this.replaceOnType = false,
    this.isLoading = false,
    this.isSaving = false,
    this.isFinished = false,
    this.failure,
  });

  final ReceiptType type;
  final Receipt? receipt;
  final Item? item;
  final String price;
  final String deduction;
  final ScaleState scale;
  final bool autoCapture;
  final bool isManual;
  final String manualGross;
  final ManualField manualField;
  final bool replaceOnType;
  final bool isLoading;
  final bool isSaving;
  final bool isFinished;
  final WeighingFailure? failure;

  WeightUnit get unit => item?.unit ?? WeightUnit.kg;

  int get priceValue => int.tryParse(price.replaceAll(',', '').trim()) ?? 0;

  int get deductionMilli => parseWeightMilli(deduction);

  int get liveGrossMilli {
    final reading = scale.reading;
    if (!scale.isConnected || reading == null) return 0;
    final converted = convertWeightMilli(
      reading.weightMilli,
      reading.unit,
      unit,
    );
    return math.max(0, converted);
  }

  bool get isStable => scale.isConnected && scale.reading?.isStable == true;

  int get grossMilli => isManual ? parseWeightMilli(manualGross) : liveGrossMilli;

  int get netMilli => math.max(0, grossMilli - deductionMilli);

  int get amount => ReceiptLineDraft.computeAmount(netMilli, priceValue);

  WeightCheckResult? get weightCheck => item?.checkWeight(grossMilli);

  String get activeManualText =>
      manualField == ManualField.gross ? manualGross : deduction;

  int get lineCount => receipt?.lineCount ?? 0;

  int get totalAmount => receipt?.totalAmount ?? 0;

  bool get _ready => item != null && receipt != null && !isLoading && !isSaving;

  bool get canConfirm =>
      _ready && !isManual && isStable && liveGrossMilli > deductionMilli;

  bool get canAddManual => _ready && grossMilli > deductionMilli;

  bool get canFinish => receipt != null && lineCount > 0 && !isSaving;

  WeighingState copyWith({
    Receipt? receipt,
    Item? item,
    String? price,
    String? deduction,
    ScaleState? scale,
    bool? autoCapture,
    bool? isManual,
    String? manualGross,
    ManualField? manualField,
    bool? replaceOnType,
    bool? isLoading,
    bool? isSaving,
    bool? isFinished,
    WeighingFailure? failure,
    bool clearFailure = false,
  }) {
    return WeighingState(
      type: type,
      receipt: receipt ?? this.receipt,
      item: item ?? this.item,
      price: price ?? this.price,
      deduction: deduction ?? this.deduction,
      scale: scale ?? this.scale,
      autoCapture: autoCapture ?? this.autoCapture,
      isManual: isManual ?? this.isManual,
      manualGross: manualGross ?? this.manualGross,
      manualField: manualField ?? this.manualField,
      replaceOnType: replaceOnType ?? this.replaceOnType,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      isFinished: isFinished ?? this.isFinished,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }
}