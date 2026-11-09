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
  String get settingsLanguage => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageMyanmar => 'မြန်မာ';
}
