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

  static String m0(count) => "${count} devices found";

  static String m1(count) => "Scanning... ${count} devices found";

  static String m2(attempt, maxAttempts) =>
      "Reconnecting (attempt ${attempt} of ${maxAttempts}).\nConfirmed lines are saved.";

  static String m3(service) => "Service ${service}";

  static String m4(signal) => "Signal: ${signal}";

  static String m5(done, total) => "${done} of ${total} done";

  static String m6(buy, sell, unit) => "Buy ${buy} · Sell ${sell} Ks/${unit}";

  static String m7(count) =>
      "${Intl.plural(count, one: '1 item', other: '${count} items')}";

  static String m8(query) =>
      "Nothing matches “${query}”. Try a different name or code.";

  static String m9(amount) => "${amount} Ks";

  static String m10(unit) => "Ks/${unit}";

  static String m11(profile) => "Bluetooth · ${profile}";

  static String m12(transport) =>
      "${transport} is off. Turn it on to find scales.";

  static String m13(transport) =>
      "Permission needed to scan with ${transport}.";

  static String m14(transport) =>
      "${transport} scanning isn\'t supported on this device.";

  static String m15(weight) => "${weight} kg";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accessAllow": MessageLookupByLibrary.simpleMessage("Allow"),
    "accessOpenSettings": MessageLookupByLibrary.simpleMessage("Open settings"),
    "accessTurnOn": MessageLookupByLibrary.simpleMessage("Turn on"),
    "actionConnect": MessageLookupByLibrary.simpleMessage("Connect"),
    "actionConnectScale": MessageLookupByLibrary.simpleMessage("Connect Scale"),
    "actionConnecting": MessageLookupByLibrary.simpleMessage("Connecting..."),
    "actionManualEntry": MessageLookupByLibrary.simpleMessage("Manual entry"),
    "actionReconnectNow": MessageLookupByLibrary.simpleMessage("Reconnect Now"),
    "actionStartWeighing": MessageLookupByLibrary.simpleMessage(
      "Start Weighing",
    ),
    "actionTare": MessageLookupByLibrary.simpleMessage("Tare"),
    "actionZero": MessageLookupByLibrary.simpleMessage("Zero"),
    "categoryMetal": MessageLookupByLibrary.simpleMessage("Metal"),
    "categoryOther": MessageLookupByLibrary.simpleMessage("Other"),
    "categoryPaper": MessageLookupByLibrary.simpleMessage("Paper"),
    "categoryPlastic": MessageLookupByLibrary.simpleMessage("Plastic"),
    "categoryRubber": MessageLookupByLibrary.simpleMessage("Rubber"),
    "checkOk": MessageLookupByLibrary.simpleMessage("OK"),
    "checkOver": MessageLookupByLibrary.simpleMessage("Over"),
    "checkUnder": MessageLookupByLibrary.simpleMessage("Under"),
    "commonCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "commonComingSoon": MessageLookupByLibrary.simpleMessage("Coming soon"),
    "commonRetry": MessageLookupByLibrary.simpleMessage("Try again"),
    "commonSave": MessageLookupByLibrary.simpleMessage("Save"),
    "connectCantFind": MessageLookupByLibrary.simpleMessage(
      "Can\'t find your scale?",
    ),
    "connectEnterManually": MessageLookupByLibrary.simpleMessage(
      "Enter weights manually",
    ),
    "connectFailedRejected": MessageLookupByLibrary.simpleMessage(
      "The scale rejected the connection.",
    ),
    "connectFailedTimeout": MessageLookupByLibrary.simpleMessage(
      "Connection timed out. Please try again.",
    ),
    "connectFailedUnknown": MessageLookupByLibrary.simpleMessage(
      "Could not connect. Please try again.",
    ),
    "connectFailedUnsupported": MessageLookupByLibrary.simpleMessage(
      "This scale is not supported by the selected profile.",
    ),
    "connectFinished": m0,
    "connectNoDevices": MessageLookupByLibrary.simpleMessage(
      "No devices found",
    ),
    "connectNoDevicesHint": MessageLookupByLibrary.simpleMessage(
      "Check that the scale is on and nearby, then rescan.",
    ),
    "connectProfileLabel": MessageLookupByLibrary.simpleMessage(
      "Scale profile",
    ),
    "connectRescan": MessageLookupByLibrary.simpleMessage("Rescan"),
    "connectScanning": m1,
    "connectSubtitle": MessageLookupByLibrary.simpleMessage(
      "Turn on the scale\'s Bluetooth and keep it nearby.",
    ),
    "connectTitle": MessageLookupByLibrary.simpleMessage("Connect a scale"),
    "connectionLostBody": m2,
    "connectionLostTitle": MessageLookupByLibrary.simpleMessage(
      "Scale connection lost",
    ),
    "desiredWeightHint": MessageLookupByLibrary.simpleMessage(
      "Live Weighing shows OK, Under or Over for this item.",
    ),
    "desiredWeightTitle": MessageLookupByLibrary.simpleMessage(
      "Desired weight · OK check",
    ),
    "deviceService": m3,
    "deviceSignal": m4,
    "deviceUnnamed": MessageLookupByLibrary.simpleMessage("Unnamed device"),
    "devicesTitle": MessageLookupByLibrary.simpleMessage("Connect Scale"),
    "discardBody": MessageLookupByLibrary.simpleMessage(
      "Your changes have not been saved.",
    ),
    "discardConfirm": MessageLookupByLibrary.simpleMessage("Discard"),
    "discardKeep": MessageLookupByLibrary.simpleMessage("Keep editing"),
    "discardTitle": MessageLookupByLibrary.simpleMessage("Discard changes?"),
    "errorDuplicateCode": MessageLookupByLibrary.simpleMessage(
      "This short code is already used",
    ),
    "errorDuplicateName": MessageLookupByLibrary.simpleMessage(
      "An item with this name already exists",
    ),
    "errorInvalidNumber": MessageLookupByLibrary.simpleMessage(
      "Enter a valid number",
    ),
    "errorItemNotFound": MessageLookupByLibrary.simpleMessage(
      "This item no longer exists.",
    ),
    "errorRequired": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "errorSaveFailed": MessageLookupByLibrary.simpleMessage(
      "Could not save. Please try again.",
    ),
    "errorTooLong": MessageLookupByLibrary.simpleMessage("Too long"),
    "fieldBuyPrice": MessageLookupByLibrary.simpleMessage("Buy price"),
    "fieldCategory": MessageLookupByLibrary.simpleMessage("Category"),
    "fieldCategoryHint": MessageLookupByLibrary.simpleMessage("Choose or type"),
    "fieldDefaultDeduction": MessageLookupByLibrary.simpleMessage(
      "Default deduction",
    ),
    "fieldItemName": MessageLookupByLibrary.simpleMessage("Item name"),
    "fieldNotes": MessageLookupByLibrary.simpleMessage("Notes (optional)"),
    "fieldNotesHint": MessageLookupByLibrary.simpleMessage(
      "e.g. clean bright copper only",
    ),
    "fieldSellPrice": MessageLookupByLibrary.simpleMessage("Sell price"),
    "fieldShortCode": MessageLookupByLibrary.simpleMessage("Short code"),
    "fieldStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "fieldTargetWeight": MessageLookupByLibrary.simpleMessage("Target weight"),
    "fieldTolerance": MessageLookupByLibrary.simpleMessage("Tolerance ±"),
    "fieldWeighingUnit": MessageLookupByLibrary.simpleMessage("Weighing unit"),
    "getStartedProgress": m5,
    "getStartedTitle": MessageLookupByLibrary.simpleMessage("Get started"),
    "itemDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "itemDeleteBody": MessageLookupByLibrary.simpleMessage(
      "It will be removed from your price list. Past transactions keep their records.",
    ),
    "itemDeleteTitle": MessageLookupByLibrary.simpleMessage(
      "Delete this item?",
    ),
    "itemDeleteTooltip": MessageLookupByLibrary.simpleMessage("Delete item"),
    "itemFormAddTitle": MessageLookupByLibrary.simpleMessage("Add Item"),
    "itemFormEditTitle": MessageLookupByLibrary.simpleMessage("Edit Item"),
    "itemFormSubtitleEdit": MessageLookupByLibrary.simpleMessage(
      "Price List · Edit material",
    ),
    "itemFormSubtitleNew": MessageLookupByLibrary.simpleMessage(
      "Price List · New material",
    ),
    "itemPriceLine": m6,
    "itemSave": MessageLookupByLibrary.simpleMessage("Save Item"),
    "itemsAddFirst": MessageLookupByLibrary.simpleMessage("Add first item"),
    "itemsAddTooltip": MessageLookupByLibrary.simpleMessage("Add item"),
    "itemsCount": m7,
    "itemsEmptyBody": MessageLookupByLibrary.simpleMessage(
      "Add the materials you buy or sell, with a price per kg. You can change prices any time.",
    ),
    "itemsEmptyTitle": MessageLookupByLibrary.simpleMessage("No items yet"),
    "itemsLoadError": MessageLookupByLibrary.simpleMessage(
      "Could not load items.",
    ),
    "itemsNoResultsBody": m8,
    "itemsNoResultsTitle": MessageLookupByLibrary.simpleMessage(
      "No items found",
    ),
    "itemsQuickAdd": MessageLookupByLibrary.simpleMessage(
      "Quick add common items",
    ),
    "itemsSearchHint": MessageLookupByLibrary.simpleMessage("Search items"),
    "languageEnglish": MessageLookupByLibrary.simpleMessage("English"),
    "languageMyanmar": MessageLookupByLibrary.simpleMessage("မြန်မာ"),
    "manualEntryTitle": MessageLookupByLibrary.simpleMessage("Manual entry"),
    "moneyKs": m9,
    "navHistory": MessageLookupByLibrary.simpleMessage("History"),
    "navHome": MessageLookupByLibrary.simpleMessage("Home"),
    "navItems": MessageLookupByLibrary.simpleMessage("Items"),
    "navSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "navWeigh": MessageLookupByLibrary.simpleMessage("Weigh"),
    "presetAluminium": MessageLookupByLibrary.simpleMessage("Aluminium"),
    "presetBrass": MessageLookupByLibrary.simpleMessage("Brass"),
    "presetCopper": MessageLookupByLibrary.simpleMessage("Copper"),
    "presetIronScrap": MessageLookupByLibrary.simpleMessage("Iron scrap"),
    "presetPaper": MessageLookupByLibrary.simpleMessage("Paper"),
    "presetPlastic": MessageLookupByLibrary.simpleMessage("Plastic"),
    "presetRubber": MessageLookupByLibrary.simpleMessage("Rubber"),
    "priceSuffix": m10,
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
    "reportsTitle": MessageLookupByLibrary.simpleMessage("Reports"),
    "scaleBluetoothProfile": m11,
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
    "sectionBasicInfo": MessageLookupByLibrary.simpleMessage("Basic info"),
    "sectionDefaults": MessageLookupByLibrary.simpleMessage("Defaults"),
    "sectionPricing": MessageLookupByLibrary.simpleMessage("Pricing"),
    "settingsGeneralSection": MessageLookupByLibrary.simpleMessage("General"),
    "settingsLanguage": MessageLookupByLibrary.simpleMessage("Language"),
    "settingsScaleConnection": MessageLookupByLibrary.simpleMessage(
      "Scale connection",
    ),
    "settingsScaleSection": MessageLookupByLibrary.simpleMessage("Scale"),
    "settingsShopName": MessageLookupByLibrary.simpleMessage("Shop name"),
    "signalGood": MessageLookupByLibrary.simpleMessage("Good"),
    "signalStrong": MessageLookupByLibrary.simpleMessage("Strong"),
    "signalUnknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "signalWeak": MessageLookupByLibrary.simpleMessage("Weak"),
    "statusActive": MessageLookupByLibrary.simpleMessage("Active"),
    "statusConnected": MessageLookupByLibrary.simpleMessage("Connected"),
    "statusConnecting": MessageLookupByLibrary.simpleMessage("Connecting"),
    "statusDisconnected": MessageLookupByLibrary.simpleMessage("Disconnected"),
    "statusInactive": MessageLookupByLibrary.simpleMessage("Inactive"),
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
    "toggleAutoCapture": MessageLookupByLibrary.simpleMessage(
      "Auto-capture when OK and stable",
    ),
    "toggleShowCheck": MessageLookupByLibrary.simpleMessage(
      "Show OK / Under / Over",
    ),
    "transactionBuy": MessageLookupByLibrary.simpleMessage("Buy"),
    "transactionDetailTitle": MessageLookupByLibrary.simpleMessage(
      "Transaction",
    ),
    "transactionSell": MessageLookupByLibrary.simpleMessage("Sell"),
    "transportBluetooth": MessageLookupByLibrary.simpleMessage("Bluetooth"),
    "transportUsb": MessageLookupByLibrary.simpleMessage("USB"),
    "transportWifi": MessageLookupByLibrary.simpleMessage("Wi-Fi"),
    "unavailableAdapterOff": m12,
    "unavailablePermission": m13,
    "unavailableUnsupported": m14,
    "unitG": MessageLookupByLibrary.simpleMessage("g"),
    "unitKg": MessageLookupByLibrary.simpleMessage("kg"),
    "unitLb": MessageLookupByLibrary.simpleMessage("lb"),
    "unitViss": MessageLookupByLibrary.simpleMessage("viss"),
    "weightKgValue": m15,
  };
}
