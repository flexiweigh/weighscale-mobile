// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(attempt, maxAttempts) =>
      "Reconnecting (attempt ${attempt} of ${maxAttempts}).\nConfirmed lines are saved.";

  static String m1(done, total) => "${done} of ${total} done";

  static String m2(amount) => "${amount} Ks";

  static String m3(profile) => "Bluetooth · ${profile}";

  static String m4(weight) => "${weight} kg";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "actionConnectScale": MessageLookupByLibrary.simpleMessage("Connect Scale"),
    "actionConnecting": MessageLookupByLibrary.simpleMessage("Connecting..."),
    "actionManualEntry": MessageLookupByLibrary.simpleMessage("Manual entry"),
    "actionReconnectNow": MessageLookupByLibrary.simpleMessage("Reconnect Now"),
    "actionStartWeighing": MessageLookupByLibrary.simpleMessage(
      "Start Weighing",
    ),
    "actionTare": MessageLookupByLibrary.simpleMessage("Tare"),
    "actionZero": MessageLookupByLibrary.simpleMessage("Zero"),
    "connectionLostBody": m0,
    "connectionLostTitle": MessageLookupByLibrary.simpleMessage(
      "Scale connection lost",
    ),
    "getStartedProgress": m1,
    "getStartedTitle": MessageLookupByLibrary.simpleMessage("Get started"),
    "languageEnglish": MessageLookupByLibrary.simpleMessage("English"),
    "languageMyanmar": MessageLookupByLibrary.simpleMessage("မြန်မာ"),
    "moneyKs": m2,
    "navHistory": MessageLookupByLibrary.simpleMessage("History"),
    "navHome": MessageLookupByLibrary.simpleMessage("Home"),
    "navItems": MessageLookupByLibrary.simpleMessage("Items"),
    "navSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "navWeigh": MessageLookupByLibrary.simpleMessage("Weigh"),
    "quickBuySubtitle": MessageLookupByLibrary.simpleMessage("Weigh & pay"),
    "quickBuyTitle": MessageLookupByLibrary.simpleMessage("Buy"),
    "quickPriceListSubtitle": MessageLookupByLibrary.simpleMessage(
      "Items & rates",
    ),
    "quickPriceListTitle": MessageLookupByLibrary.simpleMessage("Price List"),
    "quickReportsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Daily & monthly",
    ),
    "quickReportsTitle": MessageLookupByLibrary.simpleMessage("Reports"),
    "quickSellSubtitle": MessageLookupByLibrary.simpleMessage(
      "Weigh & invoice",
    ),
    "quickSellTitle": MessageLookupByLibrary.simpleMessage("Sell"),
    "readingLastReading": MessageLookupByLibrary.simpleMessage("LAST READING"),
    "readingNoSignal": MessageLookupByLibrary.simpleMessage("NO SIGNAL"),
    "readingStable": MessageLookupByLibrary.simpleMessage("STABLE"),
    "readingUnstable": MessageLookupByLibrary.simpleMessage("UNSTABLE"),
    "recentEmptyBody": MessageLookupByLibrary.simpleMessage(
      "Your weighings will appear here after your first\npurchase or sale.",
    ),
    "recentEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "No transactions yet",
    ),
    "recentSeeAll": MessageLookupByLibrary.simpleMessage("See all"),
    "recentTitle": MessageLookupByLibrary.simpleMessage("Recent transactions"),
    "scaleBluetoothProfile": m3,
    "scaleConnecting": MessageLookupByLibrary.simpleMessage("Connecting..."),
    "scaleConnectionLostReconnecting": MessageLookupByLibrary.simpleMessage(
      "Connection lost · reconnecting...",
    ),
    "scaleNoScaleConnected": MessageLookupByLibrary.simpleMessage(
      "No scale connected",
    ),
    "scalePairHint": MessageLookupByLibrary.simpleMessage(
      "Pair a Bluetooth scale to start",
    ),
    "settingsLanguage": MessageLookupByLibrary.simpleMessage("Language"),
    "statusConnected": MessageLookupByLibrary.simpleMessage("Connected"),
    "statusConnecting": MessageLookupByLibrary.simpleMessage("Connecting"),
    "statusDisconnected": MessageLookupByLibrary.simpleMessage("Disconnected"),
    "statusNotConnected": MessageLookupByLibrary.simpleMessage("Not connected"),
    "stepAddItemsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Set the price per kg for each material",
    ),
    "stepAddItemsTitle": MessageLookupByLibrary.simpleMessage(
      "Add items & prices",
    ),
    "stepConnectScaleSubtitle": MessageLookupByLibrary.simpleMessage(
      "Bluetooth scale, or enter weights manually",
    ),
    "stepConnectScaleTitle": MessageLookupByLibrary.simpleMessage(
      "Connect your scale",
    ),
    "stepFirstWeighingSubtitle": MessageLookupByLibrary.simpleMessage(
      "Buy or sell, then print a receipt",
    ),
    "stepFirstWeighingTitle": MessageLookupByLibrary.simpleMessage(
      "Make your first weighing",
    ),
    "todayAmountKs": MessageLookupByLibrary.simpleMessage("Amount (Ks)"),
    "todayFullReport": MessageLookupByLibrary.simpleMessage("Full report"),
    "todayTitle": MessageLookupByLibrary.simpleMessage("Today"),
    "todayTransactions": MessageLookupByLibrary.simpleMessage("Transactions"),
    "todayWeightKg": MessageLookupByLibrary.simpleMessage("Weight (kg)"),
    "transactionBuy": MessageLookupByLibrary.simpleMessage("Buy"),
    "transactionSell": MessageLookupByLibrary.simpleMessage("Sell"),
    "weightKgValue": m4,
  };
}
