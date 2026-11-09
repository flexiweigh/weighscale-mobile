// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a my locale. All the
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
  String get localeName => 'my';

  static String m0(attempt, maxAttempts) =>
      "ပြန်ချိတ်နေသည် (${maxAttempts} ကြိမ်အနက် ${attempt} ကြိမ်မြောက်)။\nအတည်ပြုပြီးသော စာရင်းများကို သိမ်းဆည်းပြီးဖြစ်သည်။";

  static String m1(done, total) => "${total} ခုအနက် ${done} ခု ပြီးပြီ";

  static String m2(amount) => "${amount} ကျပ်";

  static String m3(profile) => "Bluetooth · ${profile}";

  static String m4(weight) => "${weight} ကီလို";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "actionConnectScale": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင်ချိတ်ရန်",
    ),
    "actionConnecting": MessageLookupByLibrary.simpleMessage("ချိတ်နေသည်..."),
    "actionManualEntry": MessageLookupByLibrary.simpleMessage(
      "လက်ဖြင့်ထည့်ရန်",
    ),
    "actionReconnectNow": MessageLookupByLibrary.simpleMessage("ယခုပြန်ချိတ်"),
    "actionStartWeighing": MessageLookupByLibrary.simpleMessage(
      "ချိန်တွယ်စတင်",
    ),
    "actionTare": MessageLookupByLibrary.simpleMessage("အလေးနုတ်"),
    "actionZero": MessageLookupByLibrary.simpleMessage("သုည"),
    "connectionLostBody": m0,
    "connectionLostTitle": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင်ချိတ်ဆက်မှု ပြတ်သွားသည်",
    ),
    "getStartedProgress": m1,
    "getStartedTitle": MessageLookupByLibrary.simpleMessage("စတင်အသုံးပြုရန်"),
    "languageEnglish": MessageLookupByLibrary.simpleMessage("English"),
    "languageMyanmar": MessageLookupByLibrary.simpleMessage("မြန်မာ"),
    "moneyKs": m2,
    "navHistory": MessageLookupByLibrary.simpleMessage("မှတ်တမ်း"),
    "navHome": MessageLookupByLibrary.simpleMessage("ပင်မ"),
    "navItems": MessageLookupByLibrary.simpleMessage("ပစ္စည်းများ"),
    "navSettings": MessageLookupByLibrary.simpleMessage("ဆက်တင်"),
    "navWeigh": MessageLookupByLibrary.simpleMessage("ချိန်"),
    "quickBuySubtitle": MessageLookupByLibrary.simpleMessage(
      "ချိန်ပြီး ပေးချေ",
    ),
    "quickBuyTitle": MessageLookupByLibrary.simpleMessage("ဝယ်ယူ"),
    "quickPriceListSubtitle": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်းနှင့် နှုန်းထား",
    ),
    "quickPriceListTitle": MessageLookupByLibrary.simpleMessage(
      "စျေးနှုန်းစာရင်း",
    ),
    "quickReportsSubtitle": MessageLookupByLibrary.simpleMessage(
      "နေ့စဉ်နှင့် လစဉ်",
    ),
    "quickReportsTitle": MessageLookupByLibrary.simpleMessage("အစီရင်ခံစာ"),
    "quickSellSubtitle": MessageLookupByLibrary.simpleMessage(
      "ချိန်ပြီး ပြေစာထုတ်",
    ),
    "quickSellTitle": MessageLookupByLibrary.simpleMessage("ရောင်းချ"),
    "readingLastReading": MessageLookupByLibrary.simpleMessage(
      "နောက်ဆုံးဖတ်ချက်",
    ),
    "readingNoSignal": MessageLookupByLibrary.simpleMessage("အချက်ပြမရှိ"),
    "readingStable": MessageLookupByLibrary.simpleMessage("တည်ငြိမ်"),
    "readingUnstable": MessageLookupByLibrary.simpleMessage("မငြိမ်"),
    "recentEmptyBody": MessageLookupByLibrary.simpleMessage(
      "ပထမဆုံး ဝယ်ယူမှု သို့မဟုတ် ရောင်းချမှု ပြီးသည့်အခါ\nဤနေရာတွင် ပေါ်လာပါမည်။",
    ),
    "recentEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "ရောင်းဝယ်မှု မရှိသေးပါ",
    ),
    "recentSeeAll": MessageLookupByLibrary.simpleMessage("အားလုံးကြည့်ရန်"),
    "recentTitle": MessageLookupByLibrary.simpleMessage(
      "မကြာသေးမီ ရောင်းဝယ်မှုများ",
    ),
    "scaleBluetoothProfile": m3,
    "scaleConnecting": MessageLookupByLibrary.simpleMessage("ချိတ်ဆက်နေသည်..."),
    "scaleConnectionLostReconnecting": MessageLookupByLibrary.simpleMessage(
      "ချိတ်ဆက်မှု ပြတ်သွားသည် · ပြန်ချိတ်နေသည်...",
    ),
    "scaleNoScaleConnected": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင် မချိတ်ဆက်ရသေးပါ",
    ),
    "scalePairHint": MessageLookupByLibrary.simpleMessage(
      "စတင်ရန် Bluetooth ချိန်ခွင်ကို တွဲချိတ်ပါ",
    ),
    "settingsLanguage": MessageLookupByLibrary.simpleMessage("ဘာသာစကား"),
    "statusConnected": MessageLookupByLibrary.simpleMessage("ချိတ်ဆက်ပြီး"),
    "statusConnecting": MessageLookupByLibrary.simpleMessage("ချိတ်နေသည်"),
    "statusDisconnected": MessageLookupByLibrary.simpleMessage("ပြတ်တောက်"),
    "statusNotConnected": MessageLookupByLibrary.simpleMessage("မချိတ်ရသေး"),
    "stepAddItemsSubtitle": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်းတစ်မျိုးချင်းစီ၏ တစ်ကီလိုစျေးကို သတ်မှတ်ပါ",
    ),
    "stepAddItemsTitle": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်းနှင့် စျေးနှုန်းထည့်ပါ",
    ),
    "stepConnectScaleSubtitle": MessageLookupByLibrary.simpleMessage(
      "Bluetooth ချိန်ခွင် သို့မဟုတ် အလေးချိန်ကို လက်ဖြင့်ထည့်ပါ",
    ),
    "stepConnectScaleTitle": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင်ချိတ်ဆက်ပါ",
    ),
    "stepFirstWeighingSubtitle": MessageLookupByLibrary.simpleMessage(
      "ဝယ် သို့မဟုတ် ရောင်းပြီး ပြေစာထုတ်ပါ",
    ),
    "stepFirstWeighingTitle": MessageLookupByLibrary.simpleMessage(
      "ပထမဆုံးအကြိမ် ချိန်တွယ်ပါ",
    ),
    "todayAmountKs": MessageLookupByLibrary.simpleMessage("ငွေပမာဏ (ကျပ်)"),
    "todayFullReport": MessageLookupByLibrary.simpleMessage(
      "အပြည့်အစုံကြည့်ရန်",
    ),
    "todayTitle": MessageLookupByLibrary.simpleMessage("ယနေ့"),
    "todayTransactions": MessageLookupByLibrary.simpleMessage("ရောင်းဝယ်မှု"),
    "todayWeightKg": MessageLookupByLibrary.simpleMessage("အလေးချိန် (ကီလို)"),
    "transactionBuy": MessageLookupByLibrary.simpleMessage("ဝယ်"),
    "transactionSell": MessageLookupByLibrary.simpleMessage("ရောင်း"),
    "weightKgValue": m4,
  };
}
