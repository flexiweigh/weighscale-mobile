import '../../../l10n/generated/app_localizations.dart';
import '../../items/domain/item.dart';
import '../../items/presentation/item_l10n.dart';
import '../application/weighing_state.dart';
import '../domain/deduction_preset.dart';
import '../domain/receipt_enums.dart';
import '../domain/weight_units.dart';

extension ReceiptTypeL10n on ReceiptType {
  String label(AppL10n l10n) => switch (this) {
    ReceiptType.buy => l10n.transactionBuy,
    ReceiptType.sell => l10n.transactionSell,
  };
}

extension WeighingFailureL10n on WeighingFailure {
  String message(AppL10n l10n) => switch (this) {
    WeighingFailure.loadFailed => l10n.weighingErrLoad,
    WeighingFailure.noItem => l10n.weighingErrNoItem,
    WeighingFailure.scaleNotReady => l10n.weighingErrScaleNotReady,
    WeighingFailure.invalidWeight => l10n.weighingErrInvalidWeight,
    WeighingFailure.saveFailed => l10n.weighingErrSave,
    WeighingFailure.emptyReceipt => l10n.weighingErrEmpty,
  };
}

String deductionPresetLabel(AppL10n l10n, DeductionPreset preset) {
  return switch (preset.systemKey) {
    'sack' => l10n.deductionSack,
    'basket' => l10n.deductionBasket,
    'crate' => l10n.deductionCrate,
    _ => preset.name,
  };
}

String compactWeightMilli(int milli) {
  var text = formatWeightMilli(milli, decimals: 3);
  if (text.contains('.')) {
    text = text.replaceFirst(RegExp(r'0+$'), '');
    text = text.replaceFirst(RegExp(r'\.$'), '');
  }
  return text;
}

String itemRateText(AppL10n l10n, Item item, ReceiptType type) {
  final rate = type == ReceiptType.buy ? item.buyPrice : item.sellPrice;
  return '${formatMoney(rate)} ${l10n.priceSuffix(item.unit.label(l10n))}';
}