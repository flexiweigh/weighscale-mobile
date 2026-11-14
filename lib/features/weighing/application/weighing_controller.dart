import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../items/application/item_providers.dart';
import '../../items/domain/item.dart';
import '../../items/domain/item_enums.dart';
import '../domain/deduction_preset.dart';
import '../domain/deduction_preset_unit.dart';
import '../domain/receipt.dart';
import '../domain/receipt_enums.dart';
import '../domain/receipt_line_draft.dart';
import '../domain/receipt_repository.dart';
import '../domain/scale_reading.dart';
import '../domain/weight_units.dart';
import 'manual_keypad.dart';
import 'weighing_providers.dart';
import 'weighing_state.dart';

final weighingControllerProvider = NotifierProvider.autoDispose
    .family<WeighingController, WeighingState, ReceiptType>(
  WeighingController.new,
);

class WeighingController
    extends AutoDisposeFamilyNotifier<WeighingState, ReceiptType> {
  bool _disposed = false;
  bool _armed = true;
  StreamSubscription<ScaleState>? _scaleSubscription;

  @override
  WeighingState build(ReceiptType arg) {
    ref.onDispose(() {
      _disposed = true;
      _scaleSubscription?.cancel();
    });

    Future.microtask(_init);
    return WeighingState(type: arg, isLoading: true);
  }

  Future<void> _init() async {
    try {
      final receipts = ref.read(receiptRepositoryProvider);
      final receipt =
          await receipts.findOpenDraft(arg) ?? await receipts.createDraft(arg);

      final itemRepository = ref.read(itemRepositoryProvider);
      final items = await itemRepository.watchAll(activeOnly: true).first;

      final lastItemId = receipt.lines.isEmpty ? null : receipt.lines.last.itemId;
      final lastItem =
      lastItemId == null ? null : await itemRepository.findById(lastItemId);
      final initial = lastItem ?? items.firstOrNull;

      if (_disposed) return;
      state = state.copyWith(receipt: receipt, isLoading: false);
      if (initial != null) selectItem(initial);
      _listenToScale();
    } catch (_) {
      if (_disposed) return;
      state = state.copyWith(
        isLoading: false,
        failure: WeighingFailure.loadFailed,
      );
    }
  }

  void _listenToScale() {
    _scaleSubscription = ref.read(scaleReaderProvider).watch().listen((scale) {
      if (_disposed) return;
      state = state.copyWith(scale: scale);
      _maybeAutoCapture();
    });
  }

  void selectItem(Item item) {
    final current = state;
    final deductionMilli = item.defaultDeductionMilli > 0
        ? item.defaultDeductionMilli
        : convertWeightMilli(current.deductionMilli, current.unit, item.unit);
    final price = arg == ReceiptType.buy ? item.buyPrice : item.sellPrice;

    _armed = true;
    state = current.copyWith(
      item: item,
      price: formatMoney(price),
      deduction: formatWeightMilli(
        deductionMilli,
        decimals: item.unit.displayDecimals,
      ),
      autoCapture: item.autoCaptureWhenOk,
    );
  }

  void setPrice(String value) => state = state.copyWith(price: value);

  void setDeduction(String value) => state = state.copyWith(deduction: value);

  void selectPreset(DeductionPreset preset) {
    final unit = state.unit;
    state = state.copyWith(
      deduction: formatWeightMilli(
        preset.weightMilliIn(unit),
        decimals: unit.displayDecimals,
      ),
    );
  }

  void clearDeduction() {
    state = state.copyWith(
      deduction: formatWeightMilli(0, decimals: state.unit.displayDecimals),
    );
  }

  void setAutoCapture(bool value) {
    _armed = true;
    state = state.copyWith(autoCapture: value);
  }

  Future<void> tare() async {
    if (!state.scale.isConnected) return;
    await ref.read(scaleReaderProvider).tare();
  }

  Future<void> zero() async {
    if (!state.scale.isConnected) return;
    await ref.read(scaleReaderProvider).zero();
  }

  void _maybeAutoCapture() {
    final current = state;
    if (current.liveGrossMilli <= 0) {
      _armed = true;
      return;
    }
    if (!current.autoCapture || !_armed || !current.canConfirm) return;

    final check = current.item?.checkWeight(current.liveGrossMilli);
    if (check != null && check != WeightCheckResult.ok) return;

    _armed = false;
    unawaited(confirmWeight());
  }

  Future<bool> confirmWeight() async {
    final current = state;
    if (current.isSaving || current.isLoading) return false;
    if (current.item == null) return _fail(WeighingFailure.noItem);
    if (!current.isStable) return _fail(WeighingFailure.scaleNotReady);
    if (current.liveGrossMilli <= current.deductionMilli) {
      return _fail(WeighingFailure.invalidWeight);
    }
    return _addLine(grossMilli: current.liveGrossMilli, isManual: false);
  }

  void startManual() {
    state = state.copyWith(
      isManual: true,
      manualGross: '',
      manualField: ManualField.gross,
      replaceOnType: false,
      clearFailure: true,
    );
  }

  void endManual() {
    _armed = true;
    state = state.copyWith(isManual: false, manualGross: '', replaceOnType: false);
  }

  void focusManual(ManualField field) {
    final text = field == ManualField.gross ? state.manualGross : state.deduction;
    state = state.copyWith(
      manualField: field,
      replaceOnType: text.isNotEmpty,
    );
  }

  void keypadPress(String key) {
    final current = state;
    final base = current.replaceOnType ? '' : current.activeManualText;
    final next = keypadAppend(
      base,
      key,
      maxDecimals: current.unit.displayDecimals,
    );
    _writeActiveText(next);
  }

  void keypadDelete() {
    _writeActiveText(keypadBackspace(state.activeManualText));
  }

  void _writeActiveText(String text) {
    final current = state;
    state = current.manualField == ManualField.gross
        ? current.copyWith(manualGross: text, replaceOnType: false)
        : current.copyWith(deduction: text, replaceOnType: false);
  }

  Future<bool> addManual() async {
    final current = state;
    if (current.isSaving || current.isLoading) return false;
    if (current.item == null) return _fail(WeighingFailure.noItem);
    if (current.grossMilli <= current.deductionMilli) {
      return _fail(WeighingFailure.invalidWeight);
    }

    final added = await _addLine(grossMilli: current.grossMilli, isManual: true);
    if (added && !_disposed) {
      state = state.copyWith(manualGross: '', manualField: ManualField.gross);
    }
    return added;
  }

  Future<bool> _addLine({
    required int grossMilli,
    required bool isManual,
  }) async {
    final current = state;
    final item = current.item;
    final receipt = current.receipt;
    if (item == null || receipt == null) return false;

    state = current.copyWith(isSaving: true, clearFailure: true);
    try {
      final updated = await ref.read(receiptRepositoryProvider).addLine(
        receipt.id,
        ReceiptLineDraft(
          itemId: item.id,
          grossWeightMilli: grossMilli,
          deductionMilli: current.deductionMilli,
          unitPrice: current.priceValue,
          isManual: isManual,
        ),
      );
      if (_disposed) return true;
      state = state.copyWith(receipt: updated, isSaving: false);
      return true;
    } catch (error) {
      if (!_disposed) {
        state = state.copyWith(isSaving: false, failure: _failureOf(error));
      }
      return false;
    }
  }

  Future<void> removeLine(String lineId) async {
    if (state.isSaving) return;
    state = state.copyWith(isSaving: true, clearFailure: true);
    try {
      final updated = await ref.read(receiptRepositoryProvider).removeLine(lineId);
      if (_disposed) return;
      state = state.copyWith(receipt: updated, isSaving: false);
    } catch (error) {
      if (_disposed) return;
      state = state.copyWith(isSaving: false, failure: _failureOf(error));
    }
  }

  Future<Receipt?> finish() async {
    final receipt = state.receipt;
    if (receipt == null || state.isSaving) return null;
    if (receipt.lines.isEmpty) {
      _fail(WeighingFailure.emptyReceipt);
      return null;
    }

    state = state.copyWith(isSaving: true, clearFailure: true);
    try {
      final completed =
      await ref.read(receiptRepositoryProvider).complete(receipt.id);
      if (!_disposed) {
        state = state.copyWith(
          receipt: completed,
          isSaving: false,
          isFinished: true,
        );
      }
      return completed;
    } catch (error) {
      if (!_disposed) {
        state = state.copyWith(isSaving: false, failure: _failureOf(error));
      }
      return null;
    }
  }

  Future<void> discardIfEmpty() async {
    final receipt = state.receipt;
    if (receipt == null || !receipt.isDraft || receipt.lines.isNotEmpty) return;
    try {
      await ref.read(receiptRepositoryProvider).discard(receipt.id);
    } catch (_) {
      return;
    }
  }

  void clearFailure() => state = state.copyWith(clearFailure: true);

  bool _fail(WeighingFailure failure) {
    state = state.copyWith(failure: failure);
    return false;
  }

  WeighingFailure _failureOf(Object error) {
    if (error is ReceiptException) {
      return switch (error.failure) {
        ReceiptFailure.invalid => WeighingFailure.invalidWeight,
        ReceiptFailure.itemNotFound => WeighingFailure.noItem,
        ReceiptFailure.emptyReceipt => WeighingFailure.emptyReceipt,
        _ => WeighingFailure.saveFailed,
      };
    }
    return WeighingFailure.saveFailed;
  }
}