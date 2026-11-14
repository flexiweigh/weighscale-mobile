// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppL10nEn extends AppL10n {
  AppL10nEn([String locale = 'en']) : super(locale);

  @override
  String get navHome => 'Home';

  @override
  String get navWeigh => 'Weigh';

  @override
  String get navHistory => 'History';

  @override
  String get navItems => 'Items';

  @override
  String get navSettings => 'Settings';

  @override
  String get commonComingSoon => 'Coming soon';

  @override
  String get devicesTitle => 'Connect Scale';

  @override
  String get reportsTitle => 'Reports';

  @override
  String get manualEntryTitle => 'Manual entry';

  @override
  String get transactionDetailTitle => 'Transaction';

  @override
  String get scaleNoScaleConnected => 'No scale connected';

  @override
  String get scalePairHint => 'Pair a Bluetooth scale to start';

  @override
  String get scaleConnecting => 'Connecting...';

  @override
  String scaleBluetoothProfile(String profile) {
    return 'Bluetooth · $profile';
  }

  @override
  String get scaleConnectionLostReconnecting =>
      'Connection lost · reconnecting...';

  @override
  String get statusNotConnected => 'Not connected';

  @override
  String get statusConnecting => 'Connecting';

  @override
  String get statusConnected => 'Connected';

  @override
  String get statusDisconnected => 'Disconnected';

  @override
  String get readingStable => 'STABLE';

  @override
  String get readingUnstable => 'UNSTABLE';

  @override
  String get readingNoSignal => 'NO SIGNAL';

  @override
  String get readingLastReading => 'LAST READING';

  @override
  String get actionTare => 'Tare';

  @override
  String get actionZero => 'Zero';

  @override
  String get actionConnectScale => 'Connect Scale';

  @override
  String get actionConnecting => 'Connecting...';

  @override
  String get actionStartWeighing => 'Start Weighing';

  @override
  String get actionReconnectNow => 'Reconnect Now';

  @override
  String get connectionLostTitle => 'Scale connection lost';

  @override
  String connectionLostBody(int attempt, int maxAttempts) {
    return 'Reconnecting (attempt $attempt of $maxAttempts).\nConfirmed lines are saved.';
  }

  @override
  String get actionManualEntry => 'Manual entry';

  @override
  String get quickBuyTitle => 'Buy';

  @override
  String get quickBuySubtitle => 'Weigh & pay';

  @override
  String get quickSellTitle => 'Sell';

  @override
  String get quickSellSubtitle => 'Weigh & invoice';

  @override
  String get quickPriceListTitle => 'Price List';

  @override
  String get quickPriceListSubtitle => 'Items & rates';

  @override
  String get quickReportsTitle => 'Reports';

  @override
  String get quickReportsSubtitle => 'Daily & monthly';

  @override
  String get todayTitle => 'Today';

  @override
  String get todayFullReport => 'Full report';

  @override
  String get todayTransactions => 'Transactions';

  @override
  String get todayWeightKg => 'Weight (kg)';

  @override
  String get todayAmountKs => 'Amount (Ks)';

  @override
  String get getStartedTitle => 'Get started';

  @override
  String getStartedProgress(int done, int total) {
    return '$done of $total done';
  }

  @override
  String get stepConnectScaleTitle => 'Connect your scale';

  @override
  String get stepConnectScaleSubtitle =>
      'Bluetooth scale, or enter weights manually';

  @override
  String get stepAddItemsTitle => 'Add items & prices';

  @override
  String get stepAddItemsSubtitle => 'Set the price per kg for each material';

  @override
  String get stepFirstWeighingTitle => 'Make your first weighing';

  @override
  String get stepFirstWeighingSubtitle => 'Buy or sell, then print a receipt';

  @override
  String get recentTitle => 'Recent transactions';

  @override
  String get recentSeeAll => 'See all';

  @override
  String get recentEmptyTitle => 'No transactions yet';

  @override
  String get recentEmptyBody =>
      'Your weighings will appear here after your first\npurchase or sale.';

  @override
  String get transactionBuy => 'Buy';

  @override
  String get transactionSell => 'Sell';

  @override
  String moneyKs(String amount) {
    return '$amount Ks';
  }

  @override
  String weightKgValue(String weight) {
    return '$weight kg';
  }

  @override
  String get connectTitle => 'Connect a scale';

  @override
  String get connectSubtitle =>
      'Turn on the scale\'s Bluetooth and keep it nearby.';

  @override
  String get connectRescan => 'Rescan';

  @override
  String connectScanning(int count) {
    return 'Scanning... $count devices found';
  }

  @override
  String connectFinished(int count) {
    return '$count devices found';
  }

  @override
  String get connectNoDevices => 'No devices found';

  @override
  String get connectNoDevicesHint =>
      'Check that the scale is on and nearby, then rescan.';

  @override
  String get connectProfileLabel => 'Scale profile';

  @override
  String get connectCantFind => 'Can\'t find your scale?';

  @override
  String get connectEnterManually => 'Enter weights manually';

  @override
  String get actionConnect => 'Connect';

  @override
  String get deviceUnnamed => 'Unnamed device';

  @override
  String deviceSignal(String signal) {
    return 'Signal: $signal';
  }

  @override
  String deviceService(String service) {
    return 'Service $service';
  }

  @override
  String get signalStrong => 'Strong';

  @override
  String get signalGood => 'Good';

  @override
  String get signalWeak => 'Weak';

  @override
  String get signalUnknown => 'Unknown';

  @override
  String get transportBluetooth => 'Bluetooth';

  @override
  String get transportWifi => 'Wi-Fi';

  @override
  String get transportUsb => 'USB';

  @override
  String unavailableAdapterOff(String transport) {
    return '$transport is off. Turn it on to find scales.';
  }

  @override
  String unavailablePermission(String transport) {
    return 'Permission needed to scan with $transport.';
  }

  @override
  String unavailableUnsupported(String transport) {
    return '$transport scanning isn\'t supported on this device.';
  }

  @override
  String get connectFailedTimeout => 'Connection timed out. Please try again.';

  @override
  String get connectFailedRejected => 'The scale rejected the connection.';

  @override
  String get connectFailedUnsupported =>
      'This scale is not supported by the selected profile.';

  @override
  String get connectFailedUnknown => 'Could not connect. Please try again.';

  @override
  String get accessAllow => 'Allow';

  @override
  String get accessTurnOn => 'Turn on';

  @override
  String get accessOpenSettings => 'Open settings';

  @override
  String get settingsGeneralSection => 'General';

  @override
  String get settingsScaleSection => 'Scale';

  @override
  String get settingsShopName => 'Shop name';

  @override
  String get settingsScaleConnection => 'Scale connection';

  @override
  String get commonSave => 'Save';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get categoryMetal => 'Metal';

  @override
  String get categoryPlastic => 'Plastic';

  @override
  String get categoryPaper => 'Paper';

  @override
  String get categoryRubber => 'Rubber';

  @override
  String get categoryOther => 'Other';

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get itemsAddTooltip => 'Add item';

  @override
  String get itemsSearchHint => 'Search items';

  @override
  String get itemsEmptyTitle => 'No items yet';

  @override
  String get itemsEmptyBody =>
      'Add the materials you buy or sell, with a price per kg. You can change prices any time.';

  @override
  String get itemsAddFirst => 'Add first item';

  @override
  String get itemsQuickAdd => 'Quick add common items';

  @override
  String get itemsNoResultsTitle => 'No items found';

  @override
  String itemsNoResultsBody(String query) {
    return 'Nothing matches “$query”. Try a different name or code.';
  }

  @override
  String get itemsLoadError => 'Could not load items.';

  @override
  String get commonRetry => 'Try again';

  @override
  String itemPriceLine(String buy, String sell, String unit) {
    return 'Buy $buy · Sell $sell Ks/$unit';
  }

  @override
  String get statusActive => 'Active';

  @override
  String get statusInactive => 'Inactive';

  @override
  String get presetCopper => 'Copper';

  @override
  String get presetAluminium => 'Aluminium';

  @override
  String get presetIronScrap => 'Iron scrap';

  @override
  String get presetPlastic => 'Plastic';

  @override
  String get presetPaper => 'Paper';

  @override
  String get presetBrass => 'Brass';

  @override
  String get presetRubber => 'Rubber';

  @override
  String get unitKg => 'kg';

  @override
  String get unitG => 'g';

  @override
  String get unitLb => 'lb';

  @override
  String get unitViss => 'viss';

  @override
  String priceSuffix(String unit) {
    return 'Ks/$unit';
  }

  @override
  String get itemFormAddTitle => 'Add Item';

  @override
  String get itemFormEditTitle => 'Edit Item';

  @override
  String get itemFormSubtitleNew => 'Price List · New material';

  @override
  String get itemFormSubtitleEdit => 'Price List · Edit material';

  @override
  String get sectionBasicInfo => 'Basic info';

  @override
  String get sectionPricing => 'Pricing';

  @override
  String get sectionDefaults => 'Defaults';

  @override
  String get fieldItemName => 'Item name';

  @override
  String get fieldShortCode => 'Short code';

  @override
  String get fieldCategory => 'Category';

  @override
  String get fieldCategoryHint => 'Choose or type';

  @override
  String get fieldWeighingUnit => 'Weighing unit';

  @override
  String get fieldBuyPrice => 'Buy price';

  @override
  String get fieldSellPrice => 'Sell price';

  @override
  String get desiredWeightTitle => 'Desired weight · OK check';

  @override
  String get desiredWeightHint =>
      'Live Weighing shows OK, Under or Over for this item.';

  @override
  String get fieldTargetWeight => 'Target weight';

  @override
  String get fieldTolerance => 'Tolerance ±';

  @override
  String get checkUnder => 'Under';

  @override
  String get checkOk => 'OK';

  @override
  String get checkOver => 'Over';

  @override
  String get toggleShowCheck => 'Show OK / Under / Over';

  @override
  String get toggleAutoCapture => 'Auto-capture when OK and stable';

  @override
  String get fieldDefaultDeduction => 'Default deduction';

  @override
  String get fieldStatus => 'Status';

  @override
  String get fieldNotes => 'Notes (optional)';

  @override
  String get fieldNotesHint => 'e.g. clean bright copper only';

  @override
  String get itemSave => 'Save Item';

  @override
  String get errorRequired => 'This field is required';

  @override
  String get errorInvalidNumber => 'Enter a valid number';

  @override
  String get errorTooLong => 'Too long';

  @override
  String get errorDuplicateName => 'An item with this name already exists';

  @override
  String get errorDuplicateCode => 'This short code is already used';

  @override
  String get errorSaveFailed => 'Could not save. Please try again.';

  @override
  String get errorItemNotFound => 'This item no longer exists.';

  @override
  String get discardTitle => 'Discard changes?';

  @override
  String get discardBody => 'Your changes have not been saved.';

  @override
  String get discardKeep => 'Keep editing';

  @override
  String get discardConfirm => 'Discard';

  @override
  String get itemDeleteTooltip => 'Delete item';

  @override
  String get itemDeleteTitle => 'Delete this item?';

  @override
  String get itemDeleteBody =>
      'It will be removed from your price list. Past transactions keep their records.';

  @override
  String get itemDelete => 'Delete';

  @override
  String get weighingTitle => 'Weighing';

  @override
  String get manualWeightTitle => 'Enter Weight Manually';

  @override
  String weighingReceiptSubtitle(String type, String number) {
    return '$type · Receipt #$number';
  }

  @override
  String get weighingScaleNotConnected => 'Scale not connected';

  @override
  String get weighingItemLabel => 'Item';

  @override
  String get weighingLiveWeight => 'LIVE WEIGHT';

  @override
  String get weighingAutoCapture => 'Auto-capture';

  @override
  String weighingDeductionLabel(String unit) {
    return 'Deduction ($unit)';
  }

  @override
  String weighingPriceLabel(String unit) {
    return 'Price (Ks/$unit)';
  }

  @override
  String weighingGrossLabel(String unit) {
    return 'Gross weight ($unit)';
  }

  @override
  String get weighingNetLabel => 'Net weight';

  @override
  String weighingNetShort(String unit) {
    return 'Net ($unit)';
  }

  @override
  String get weighingAmountLabel => 'Amount';

  @override
  String get weighingConfirm => 'Confirm Weight';

  @override
  String get weighingScaleProblem => 'Scale problem?';

  @override
  String get weighingEnterManually => 'Enter weight manually';

  @override
  String weighingReceiptLines(int count) {
    return 'Receipt lines ($count)';
  }

  @override
  String get weighingNoLines => 'No lines yet. Confirm a weight to add one.';

  @override
  String weighingTotalLines(int count) {
    return 'Total · $count lines';
  }

  @override
  String get weighingFinish => 'Finish';

  @override
  String get weighingManualBadge => 'MANUAL';

  @override
  String weighingLineGross(
    String gross,
    String deduction,
    String net,
    String unit,
  ) {
    return 'Gross $gross − $deduction = $net $unit';
  }

  @override
  String weighingLineRate(String weight, String unit, String price) {
    return '$weight $unit × $price';
  }

  @override
  String get weighingManualNotice =>
      'Manually entered weights are marked MANUAL on the receipt.';

  @override
  String get weighingAddToReceipt => 'Add to Receipt';

  @override
  String get weighingDeductionNone => 'None';

  @override
  String get deductionSack => 'Sack';

  @override
  String get deductionBasket => 'Basket';

  @override
  String get deductionCrate => 'Crate';

  @override
  String get weighingPickItem => 'Choose item';

  @override
  String get weighingNoItemsTitle => 'No items yet';

  @override
  String get weighingNoItemsBody =>
      'Add an item to your price list before weighing.';

  @override
  String get weighingRemoveTitle => 'Remove this line?';

  @override
  String get weighingRemoveBody => 'The receipt total will be recalculated.';

  @override
  String get commonRemove => 'Remove';

  @override
  String weighingFinished(String number) {
    return 'Receipt #$number saved';
  }

  @override
  String get weighingErrLoad => 'Couldn\'t start the receipt.';

  @override
  String get weighingErrNoItem => 'Choose an item first.';

  @override
  String get weighingErrScaleNotReady => 'Wait for a stable reading.';

  @override
  String get weighingErrInvalidWeight =>
      'Weight must be more than the deduction.';

  @override
  String get weighingErrSave => 'Couldn\'t save. Try again.';

  @override
  String get weighingErrEmpty => 'Add at least one line first.';

  @override
  String get weighChooseTitle => 'Buy or sell?';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageMyanmar => 'မြန်မာ';
}
