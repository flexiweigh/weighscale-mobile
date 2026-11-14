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

  static String m0(count) => "${count} ခု တွေ့ပါတယ်";

  static String m1(count) => "ရှာနေပါတယ်... ${count} ခု တွေ့ပါပြီ";

  static String m2(attempt, maxAttempts) =>
      "ပြန်ချိတ်နေပါတယ် (${maxAttempts} ကြိမ်အနက် ${attempt} ကြိမ်မြောက်)။\nအတည်ပြုပြီးသား စာရင်းတွေကို သိမ်းထားပြီးပါပြီ။";

  static String m3(service) => "Service ${service}";

  static String m4(signal) => "လိုင်း: ${signal}";

  static String m5(done, total) => "${total} ခုအနက် ${done} ခု ပြီးပါပြီ";

  static String m6(buy, sell, unit) =>
      "ဝယ် ${buy} · ရောင်း ${sell} ကျပ်/${unit}";

  static String m7(count) =>
      "${Intl.plural(count, other: 'ပစ္စည်း ${count} မျိုး')}";

  static String m8(query) =>
      "“${query}” နဲ့ ကိုက်တာ မရှိပါ။ တခြားနာမည် ဒါမှမဟုတ် ကုဒ်နဲ့ ရှာကြည့်ပါ။";

  static String m9(amount) => "${amount} ကျပ်";

  static String m10(unit) => "ကျပ်/${unit}";

  static String m11(profile) => "ဘလူးတုသ် · ${profile}";

  static String m12(transport) =>
      "${transport} ပိတ်ထားပါတယ်။ ချိန်ခွင်ရှာဖို့ ဖွင့်ပေးပါ။";

  static String m13(transport) =>
      "${transport} နဲ့ ရှာဖို့ ခွင့်ပြုချက် လိုပါတယ်။";

  static String m14(transport) => "ဒီဖုန်းမှာ ${transport} နဲ့ ရှာလို့ မရပါ။";

  static String m15(unit) => "နှုတ် (${unit})";

  static String m16(number) => "ဘောက်ချာ #${number} သိမ်းပြီးပါပြီ";

  static String m17(unit) => "စုစုပေါင်း အလေးချိန် (${unit})";

  static String m18(gross, deduction, net, unit) =>
      "စုစုပေါင်း ${gross} − ${deduction} = ${net} ${unit}";

  static String m19(weight, unit, price) => "${weight} ${unit} × ${price}";

  static String m20(unit) => "အသားတင် (${unit})";

  static String m21(unit) => "စျေးနှုန်း (ကျပ်/${unit})";

  static String m22(count) => "ဘောက်ချာ စာကြောင်းများ (${count})";

  static String m23(type, number) => "${type} · ဘောက်ချာ #${number}";

  static String m24(count) => "စုစုပေါင်း · ${count} ကြောင်း";

  static String m25(weight) => "${weight} ကီလို";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accessAllow": MessageLookupByLibrary.simpleMessage("ခွင့်ပြုမယ်"),
    "accessOpenSettings": MessageLookupByLibrary.simpleMessage(
      "ဖုန်းဆက်တင် ဖွင့်မယ်",
    ),
    "accessTurnOn": MessageLookupByLibrary.simpleMessage("ဖွင့်မယ်"),
    "actionConnect": MessageLookupByLibrary.simpleMessage("ချိတ်မယ်"),
    "actionConnectScale": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင်ချိတ်ရန်",
    ),
    "actionConnecting": MessageLookupByLibrary.simpleMessage("ချိတ်နေပါတယ်..."),
    "actionManualEntry": MessageLookupByLibrary.simpleMessage(
      "ကိုယ်တိုင်ရိုက်ထည့်ရန်",
    ),
    "actionReconnectNow": MessageLookupByLibrary.simpleMessage("ပြန်ချိတ်မယ်"),
    "actionStartWeighing": MessageLookupByLibrary.simpleMessage("ချိန်စတင်မယ်"),
    "actionTare": MessageLookupByLibrary.simpleMessage("−"),
    "actionZero": MessageLookupByLibrary.simpleMessage("0"),
    "categoryMetal": MessageLookupByLibrary.simpleMessage("သတ္တု"),
    "categoryOther": MessageLookupByLibrary.simpleMessage("အခြား"),
    "categoryPaper": MessageLookupByLibrary.simpleMessage("စက္ကူ"),
    "categoryPlastic": MessageLookupByLibrary.simpleMessage("ပလတ်စတစ်"),
    "categoryRubber": MessageLookupByLibrary.simpleMessage("ရော်ဘာ"),
    "checkOk": MessageLookupByLibrary.simpleMessage("OK"),
    "checkOver": MessageLookupByLibrary.simpleMessage("ပိုနေ"),
    "checkUnder": MessageLookupByLibrary.simpleMessage("လိုနေ"),
    "commonCancel": MessageLookupByLibrary.simpleMessage("မလုပ်တော့ဘူး"),
    "commonComingSoon": MessageLookupByLibrary.simpleMessage("မကြာခင် လာပါမယ်"),
    "commonRemove": MessageLookupByLibrary.simpleMessage("ဖယ်မယ်"),
    "commonRetry": MessageLookupByLibrary.simpleMessage("ထပ်ကြိုးစားမယ်"),
    "commonSave": MessageLookupByLibrary.simpleMessage("သိမ်းမယ်"),
    "connectCantFind": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင် ရှာမတွေ့ဘူးလား?",
    ),
    "connectEnterManually": MessageLookupByLibrary.simpleMessage(
      "အလေးချိန်ကို ကိုယ်တိုင်ရိုက်ထည့်မယ်",
    ),
    "connectFailedRejected": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင်က ချိတ်ခွင့် မပေးပါ။",
    ),
    "connectFailedTimeout": MessageLookupByLibrary.simpleMessage(
      "ချိတ်ဖို့ အချိန်ကြာလွန်းလို့ မရပါ။ ထပ်ကြိုးစားကြည့်ပါ။",
    ),
    "connectFailedUnknown": MessageLookupByLibrary.simpleMessage(
      "ချိတ်လို့ မရပါ။ ထပ်ကြိုးစားကြည့်ပါ။",
    ),
    "connectFailedUnsupported": MessageLookupByLibrary.simpleMessage(
      "ရွေးထားတဲ့ အမျိုးအစားက ဒီချိန်ခွင်နဲ့ မကိုက်ပါ။",
    ),
    "connectFinished": m0,
    "connectNoDevices": MessageLookupByLibrary.simpleMessage("ဘာမှ မတွေ့ပါ"),
    "connectNoDevicesHint": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင်ကို ဖွင့်ထားလား၊ အနားမှာ ရှိလား စစ်ပြီး ပြန်ရှာကြည့်ပါ။",
    ),
    "connectProfileLabel": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင် အမျိုးအစား",
    ),
    "connectRescan": MessageLookupByLibrary.simpleMessage("ပြန်ရှာမယ်"),
    "connectScanning": m1,
    "connectSubtitle": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင်ရဲ့ ဘလူးတုသ်ကို ဖွင့်ပြီး အနားမှာ ထားပါ။",
    ),
    "connectTitle": MessageLookupByLibrary.simpleMessage("ချိန်ခွင် ချိတ်ရန်"),
    "connectionLostBody": m2,
    "connectionLostTitle": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင် ချိတ်ဆက်မှု ပြတ်သွားပါတယ်",
    ),
    "deductionBasket": MessageLookupByLibrary.simpleMessage("ခြင်း"),
    "deductionCrate": MessageLookupByLibrary.simpleMessage("သေတ္တာ"),
    "deductionSack": MessageLookupByLibrary.simpleMessage("အိတ်"),
    "desiredWeightHint": MessageLookupByLibrary.simpleMessage(
      "ချိန်နေတုန်း ဒီပစ္စည်းအတွက် OK၊ လိုနေ၊ ပိုနေ ဆိုပြီး ပြပေးပါတယ်။",
    ),
    "desiredWeightTitle": MessageLookupByLibrary.simpleMessage(
      "လိုချင်တဲ့ အလေးချိန် · OK စစ်ရန်",
    ),
    "deviceService": m3,
    "deviceSignal": m4,
    "deviceUnnamed": MessageLookupByLibrary.simpleMessage("နာမည်မရှိတဲ့ စက်"),
    "devicesTitle": MessageLookupByLibrary.simpleMessage("ချိန်ခွင်ချိတ်ရန်"),
    "discardBody": MessageLookupByLibrary.simpleMessage(
      "ပြင်ထားတာတွေကို မသိမ်းရသေးပါ။",
    ),
    "discardConfirm": MessageLookupByLibrary.simpleMessage("ဖျက်လိုက်မယ်"),
    "discardKeep": MessageLookupByLibrary.simpleMessage("ဆက်ပြင်မယ်"),
    "discardTitle": MessageLookupByLibrary.simpleMessage(
      "ပြင်ထားတာတွေ ဖျက်လိုက်မလား?",
    ),
    "errorDuplicateCode": MessageLookupByLibrary.simpleMessage(
      "ဒီအတိုကောက်ကုဒ်ကို သုံးပြီးသားပါ",
    ),
    "errorDuplicateName": MessageLookupByLibrary.simpleMessage(
      "ဒီနာမည်နဲ့ ပစ္စည်း ရှိပြီးသားပါ",
    ),
    "errorInvalidNumber": MessageLookupByLibrary.simpleMessage(
      "ဂဏန်း မှန်မှန်ကန်ကန် ထည့်ပါ",
    ),
    "errorItemNotFound": MessageLookupByLibrary.simpleMessage(
      "ဒီပစ္စည်း မရှိတော့ပါ။",
    ),
    "errorRequired": MessageLookupByLibrary.simpleMessage(
      "ဒီနေရာကို ဖြည့်ပေးပါ",
    ),
    "errorSaveFailed": MessageLookupByLibrary.simpleMessage(
      "သိမ်းလို့ မရပါ။ ထပ်ကြိုးစားကြည့်ပါ။",
    ),
    "errorTooLong": MessageLookupByLibrary.simpleMessage("ရှည်လွန်းနေပါတယ်"),
    "fieldBuyPrice": MessageLookupByLibrary.simpleMessage("ဝယ်စျေး"),
    "fieldCategory": MessageLookupByLibrary.simpleMessage("အမျိုးအစား"),
    "fieldCategoryHint": MessageLookupByLibrary.simpleMessage(
      "ရွေးပါ ဒါမှမဟုတ် ရိုက်ထည့်ပါ",
    ),
    "fieldDefaultDeduction": MessageLookupByLibrary.simpleMessage(
      "အမြဲနုတ်မယ့် အလေးချိန်",
    ),
    "fieldItemName": MessageLookupByLibrary.simpleMessage("ပစ္စည်းနာမည်"),
    "fieldNotes": MessageLookupByLibrary.simpleMessage("မှတ်ချက် (မရေးလည်းရ)"),
    "fieldNotesHint": MessageLookupByLibrary.simpleMessage(
      "ဥပမာ - သန့်တဲ့ ကြေးနီသာ",
    ),
    "fieldSellPrice": MessageLookupByLibrary.simpleMessage("ရောင်းစျေး"),
    "fieldShortCode": MessageLookupByLibrary.simpleMessage("အတိုကောက်ကုဒ်"),
    "fieldStatus": MessageLookupByLibrary.simpleMessage("အခြေအနေ"),
    "fieldTargetWeight": MessageLookupByLibrary.simpleMessage(
      "လိုချင်တဲ့ အလေးချိန်",
    ),
    "fieldTolerance": MessageLookupByLibrary.simpleMessage(
      "လွန်/လိုခွင့်ပြုမှု ±",
    ),
    "fieldWeighingUnit": MessageLookupByLibrary.simpleMessage("ချိန်တဲ့ ယူနစ်"),
    "getStartedProgress": m5,
    "getStartedTitle": MessageLookupByLibrary.simpleMessage("စတင်အသုံးပြုရန်"),
    "itemDelete": MessageLookupByLibrary.simpleMessage("ဖျက်မယ်"),
    "itemDeleteBody": MessageLookupByLibrary.simpleMessage(
      "စျေးနှုန်းစာရင်းထဲက ထွက်သွားပါမယ်။ အရင်ဝယ်/ရောင်းထားတဲ့ မှတ်တမ်းတွေမှာတော့ ဆက်ရှိနေပါမယ်။",
    ),
    "itemDeleteTitle": MessageLookupByLibrary.simpleMessage(
      "ဒီပစ္စည်းကို ဖျက်မလား?",
    ),
    "itemDeleteTooltip": MessageLookupByLibrary.simpleMessage("ပစ္စည်းဖျက်ရန်"),
    "itemFormAddTitle": MessageLookupByLibrary.simpleMessage("ပစ္စည်းထည့်ရန်"),
    "itemFormEditTitle": MessageLookupByLibrary.simpleMessage("ပစ္စည်းပြင်ရန်"),
    "itemFormSubtitleEdit": MessageLookupByLibrary.simpleMessage(
      "စျေးနှုန်းစာရင်း · ပစ္စည်းပြင်နေသည်",
    ),
    "itemFormSubtitleNew": MessageLookupByLibrary.simpleMessage(
      "စျေးနှုန်းစာရင်း · ပစ္စည်းအသစ်",
    ),
    "itemPriceLine": m6,
    "itemSave": MessageLookupByLibrary.simpleMessage("ပစ္စည်းသိမ်းမယ်"),
    "itemsAddFirst": MessageLookupByLibrary.simpleMessage(
      "ပထမဆုံး ပစ္စည်းထည့်မယ်",
    ),
    "itemsAddTooltip": MessageLookupByLibrary.simpleMessage("ပစ္စည်းထည့်ရန်"),
    "itemsCount": m7,
    "itemsEmptyBody": MessageLookupByLibrary.simpleMessage(
      "ဝယ်/ရောင်းတဲ့ ပစ္စည်းတွေကို တစ်ကီလို စျေးနဲ့အတူ ထည့်ပါ။ စျေးကို ဘယ်အချိန်မဆို ပြောင်းလို့ရပါတယ်။",
    ),
    "itemsEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်း မရှိသေးပါ",
    ),
    "itemsLoadError": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်းစာရင်း ဖွင့်လို့ မရပါ။",
    ),
    "itemsNoResultsBody": m8,
    "itemsNoResultsTitle": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်း မတွေ့ပါ",
    ),
    "itemsQuickAdd": MessageLookupByLibrary.simpleMessage(
      "အသုံးများတဲ့ ပစ္စည်းတွေ အမြန်ထည့်မယ်",
    ),
    "itemsSearchHint": MessageLookupByLibrary.simpleMessage("ပစ္စည်းရှာရန်"),
    "languageEnglish": MessageLookupByLibrary.simpleMessage("English"),
    "languageMyanmar": MessageLookupByLibrary.simpleMessage("မြန်မာ"),
    "manualEntryTitle": MessageLookupByLibrary.simpleMessage(
      "ကိုယ်တိုင်ရိုက်ထည့်ရန်",
    ),
    "manualWeightTitle": MessageLookupByLibrary.simpleMessage(
      "အလေးချိန် ကိုယ်တိုင်ထည့်မယ်",
    ),
    "moneyKs": m9,
    "navHistory": MessageLookupByLibrary.simpleMessage("မှတ်တမ်း"),
    "navHome": MessageLookupByLibrary.simpleMessage("ပင်မ"),
    "navItems": MessageLookupByLibrary.simpleMessage("ပစ္စည်းများ"),
    "navSettings": MessageLookupByLibrary.simpleMessage("ပြင်ဆင်ရန်"),
    "navWeigh": MessageLookupByLibrary.simpleMessage("ချိန်မယ်"),
    "presetAluminium": MessageLookupByLibrary.simpleMessage("အလူမီနီယံ"),
    "presetBrass": MessageLookupByLibrary.simpleMessage("ကြေးဝါ"),
    "presetCopper": MessageLookupByLibrary.simpleMessage("ကြေးနီ"),
    "presetIronScrap": MessageLookupByLibrary.simpleMessage("သံဟောင်း"),
    "presetPaper": MessageLookupByLibrary.simpleMessage("စက္ကူ"),
    "presetPlastic": MessageLookupByLibrary.simpleMessage("ပလတ်စတစ်"),
    "presetRubber": MessageLookupByLibrary.simpleMessage("ရော်ဘာ"),
    "priceSuffix": m10,
    "quickBuySubtitle": MessageLookupByLibrary.simpleMessage(
      "ချိန်ပြီး ငွေရှင်း",
    ),
    "quickBuyTitle": MessageLookupByLibrary.simpleMessage("ဝယ်မယ်"),
    "quickPriceListSubtitle": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်းနဲ့ စျေး",
    ),
    "quickPriceListTitle": MessageLookupByLibrary.simpleMessage(
      "စျေးနှုန်းစာရင်း",
    ),
    "quickReportsSubtitle": MessageLookupByLibrary.simpleMessage(
      "နေ့စဉ်၊ လစဉ်",
    ),
    "quickReportsTitle": MessageLookupByLibrary.simpleMessage("စာရင်းချုပ်"),
    "quickSellSubtitle": MessageLookupByLibrary.simpleMessage(
      "ချိန်ပြီး ဘောက်ချာထုတ်",
    ),
    "quickSellTitle": MessageLookupByLibrary.simpleMessage("ရောင်းမယ်"),
    "readingLastReading": MessageLookupByLibrary.simpleMessage(
      "နောက်ဆုံး ချိန်ထားတာ",
    ),
    "readingNoSignal": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင်မှ အချက်အလက် မရပါ",
    ),
    "readingStable": MessageLookupByLibrary.simpleMessage("ငြိမ်ပါပြီ"),
    "readingUnstable": MessageLookupByLibrary.simpleMessage("မငြိမ်သေးပါ"),
    "recentEmptyBody": MessageLookupByLibrary.simpleMessage(
      "ပထမဆုံး ဝယ်ပြီး ဒါမှမဟုတ် ရောင်းပြီးတာနဲ့\nဒီမှာ ပေါ်လာပါမယ်။",
    ),
    "recentEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "ဝယ်/ရောင်း မရှိသေးပါ",
    ),
    "recentSeeAll": MessageLookupByLibrary.simpleMessage("အားလုံးကြည့်ရန်"),
    "recentTitle": MessageLookupByLibrary.simpleMessage(
      "လတ်တလော ဝယ်/ရောင်းထားတာများ",
    ),
    "reportsTitle": MessageLookupByLibrary.simpleMessage("စာရင်းချုပ်"),
    "scaleBluetoothProfile": m11,
    "scaleConnecting": MessageLookupByLibrary.simpleMessage("ချိတ်နေပါတယ်..."),
    "scaleConnectionLostReconnecting": MessageLookupByLibrary.simpleMessage(
      "ချိတ်ဆက်မှု ပြတ်သွားပါတယ် · ပြန်ချိတ်နေပါတယ်...",
    ),
    "scaleNoScaleConnected": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင် မချိတ်ရသေးပါ",
    ),
    "scalePairHint": MessageLookupByLibrary.simpleMessage(
      "စတင်ရန် ဘလူးတုသ်ချိန်ခွင်ကို ချိတ်ပါ",
    ),
    "sectionBasicInfo": MessageLookupByLibrary.simpleMessage("အခြေခံအချက်အလက်"),
    "sectionDefaults": MessageLookupByLibrary.simpleMessage(
      "အမြဲသုံးမယ့် တန်ဖိုးများ",
    ),
    "sectionPricing": MessageLookupByLibrary.simpleMessage("စျေးနှုန်း"),
    "settingsGeneralSection": MessageLookupByLibrary.simpleMessage("အထွေထွေ"),
    "settingsLanguage": MessageLookupByLibrary.simpleMessage("ဘာသာစကား"),
    "settingsScaleConnection": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင် ချိတ်ဆက်မှု",
    ),
    "settingsScaleSection": MessageLookupByLibrary.simpleMessage("ချိန်ခွင်"),
    "settingsShopName": MessageLookupByLibrary.simpleMessage("ဆိုင်နာမည်"),
    "signalGood": MessageLookupByLibrary.simpleMessage("ကောင်းတယ်"),
    "signalStrong": MessageLookupByLibrary.simpleMessage("ကောင်းလွန်းတယ်"),
    "signalUnknown": MessageLookupByLibrary.simpleMessage("မသိရပါ"),
    "signalWeak": MessageLookupByLibrary.simpleMessage("အားနည်းတယ်"),
    "statusActive": MessageLookupByLibrary.simpleMessage("သုံးနေတယ်"),
    "statusConnected": MessageLookupByLibrary.simpleMessage("ချိတ်ပြီးပါပြီ"),
    "statusConnecting": MessageLookupByLibrary.simpleMessage("ချိတ်နေပါတယ်"),
    "statusDisconnected": MessageLookupByLibrary.simpleMessage("ပြတ်သွားပါပြီ"),
    "statusInactive": MessageLookupByLibrary.simpleMessage("ရပ်ထားတယ်"),
    "statusNotConnected": MessageLookupByLibrary.simpleMessage("မချိတ်ရသေးပါ"),
    "stepAddItemsSubtitle": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်းတစ်မျိုးချင်းစီရဲ့ တစ်ကီလို စျေးကို ထည့်ပါ",
    ),
    "stepAddItemsTitle": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်းနဲ့ စျေးထည့်ပါ",
    ),
    "stepConnectScaleSubtitle": MessageLookupByLibrary.simpleMessage(
      "ဘလူးတုသ်ချိန်ခွင် ချိတ်ပါ၊ မရှိရင် အလေးချိန်ကို ကိုယ်တိုင်ရိုက်ထည့်ပါ",
    ),
    "stepConnectScaleTitle": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင် ချိတ်ပါ",
    ),
    "stepFirstWeighingSubtitle": MessageLookupByLibrary.simpleMessage(
      "ဝယ်ပါ၊ ရောင်းပါ၊ ပြီးရင် ဘောက်ချာထုတ်ပါ",
    ),
    "stepFirstWeighingTitle": MessageLookupByLibrary.simpleMessage(
      "ပထမဆုံး ချိန်ကြည့်ပါ",
    ),
    "todayAmountKs": MessageLookupByLibrary.simpleMessage("ငွေ (ကျပ်)"),
    "todayFullReport": MessageLookupByLibrary.simpleMessage("အားလုံးကြည့်ရန်"),
    "todayTitle": MessageLookupByLibrary.simpleMessage("ဒီနေ့"),
    "todayTransactions": MessageLookupByLibrary.simpleMessage(
      "ဝယ်/ရောင်း အကြိမ်",
    ),
    "todayWeightKg": MessageLookupByLibrary.simpleMessage("အလေးချိန် (ကီလို)"),
    "toggleAutoCapture": MessageLookupByLibrary.simpleMessage(
      "OK ဖြစ်ပြီး ငြိမ်သွားရင် အလိုလို မှတ်မယ်",
    ),
    "toggleShowCheck": MessageLookupByLibrary.simpleMessage(
      "OK / လိုနေ / ပိုနေ ပြမယ်",
    ),
    "transactionBuy": MessageLookupByLibrary.simpleMessage("ဝယ်"),
    "transactionDetailTitle": MessageLookupByLibrary.simpleMessage(
      "ဝယ်/ရောင်း အသေးစိတ်",
    ),
    "transactionSell": MessageLookupByLibrary.simpleMessage("ရောင်း"),
    "transportBluetooth": MessageLookupByLibrary.simpleMessage("ဘလူးတုသ်"),
    "transportUsb": MessageLookupByLibrary.simpleMessage("USB"),
    "transportWifi": MessageLookupByLibrary.simpleMessage("ဝိုင်ဖိုင်"),
    "unavailableAdapterOff": m12,
    "unavailablePermission": m13,
    "unavailableUnsupported": m14,
    "unitG": MessageLookupByLibrary.simpleMessage("ဂရမ်"),
    "unitKg": MessageLookupByLibrary.simpleMessage("ကီလို"),
    "unitLb": MessageLookupByLibrary.simpleMessage("ပေါင်"),
    "unitViss": MessageLookupByLibrary.simpleMessage("ပိဿာ"),
    "weighChooseTitle": MessageLookupByLibrary.simpleMessage(
      "ဝယ်မလား ရောင်းမလား?",
    ),
    "weighingAddToReceipt": MessageLookupByLibrary.simpleMessage(
      "ဘောက်ချာထဲ ထည့်မယ်",
    ),
    "weighingAmountLabel": MessageLookupByLibrary.simpleMessage("ကျသင့်ငွေ"),
    "weighingAutoCapture": MessageLookupByLibrary.simpleMessage(
      "အလိုအလျောက်ယူ",
    ),
    "weighingConfirm": MessageLookupByLibrary.simpleMessage(
      "အလေးချိန် အတည်ပြုမယ်",
    ),
    "weighingDeductionLabel": m15,
    "weighingDeductionNone": MessageLookupByLibrary.simpleMessage("မနှုတ်"),
    "weighingEnterManually": MessageLookupByLibrary.simpleMessage(
      "အလေးချိန် ကိုယ်တိုင်ထည့်မယ်",
    ),
    "weighingErrEmpty": MessageLookupByLibrary.simpleMessage(
      "စာကြောင်း အနည်းဆုံး တစ်ကြောင်း ထည့်ပါ။",
    ),
    "weighingErrInvalidWeight": MessageLookupByLibrary.simpleMessage(
      "အလေးချိန်သည် နှုတ်ချိန်ထက် များရပါမည်။",
    ),
    "weighingErrLoad": MessageLookupByLibrary.simpleMessage(
      "ဘောက်ချာ မစနိုင်ပါ။",
    ),
    "weighingErrNoItem": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်း အရင်ရွေးပါ။",
    ),
    "weighingErrSave": MessageLookupByLibrary.simpleMessage(
      "မသိမ်းနိုင်ပါ။ ထပ်ကြိုးစားပါ။",
    ),
    "weighingErrScaleNotReady": MessageLookupByLibrary.simpleMessage(
      "ငြိမ်သည်အထိ စောင့်ပါ။",
    ),
    "weighingFinish": MessageLookupByLibrary.simpleMessage("ပြီးပြီ"),
    "weighingFinished": m16,
    "weighingGrossLabel": m17,
    "weighingItemLabel": MessageLookupByLibrary.simpleMessage("ပစ္စည်း"),
    "weighingLineGross": m18,
    "weighingLineRate": m19,
    "weighingLiveWeight": MessageLookupByLibrary.simpleMessage(
      "လက်ရှိ အလေးချိန်",
    ),
    "weighingManualBadge": MessageLookupByLibrary.simpleMessage("ကိုယ်တိုင်"),
    "weighingManualNotice": MessageLookupByLibrary.simpleMessage(
      "ကိုယ်တိုင်ထည့်ထားသော အလေးချိန်ကို ဘောက်ချာတွင် “ကိုယ်တိုင်” ဟု မှတ်ပါမည်။",
    ),
    "weighingNetLabel": MessageLookupByLibrary.simpleMessage(
      "အသားတင် အလေးချိန်",
    ),
    "weighingNetShort": m20,
    "weighingNoItemsBody": MessageLookupByLibrary.simpleMessage(
      "မချိန်မီ စျေးနှုန်းစာရင်းထဲ ပစ္စည်းအရင်ထည့်ပါ။",
    ),
    "weighingNoItemsTitle": MessageLookupByLibrary.simpleMessage(
      "ပစ္စည်း မရှိသေးပါ",
    ),
    "weighingNoLines": MessageLookupByLibrary.simpleMessage(
      "စာကြောင်း မရှိသေးပါ။ အလေးချိန် အတည်ပြုပြီး ထည့်ပါ။",
    ),
    "weighingPickItem": MessageLookupByLibrary.simpleMessage("ပစ္စည်း ရွေးပါ"),
    "weighingPriceLabel": m21,
    "weighingReceiptLines": m22,
    "weighingReceiptSubtitle": m23,
    "weighingRemoveBody": MessageLookupByLibrary.simpleMessage(
      "စုစုပေါင်းငွေကို ပြန်တွက်ပါမည်။",
    ),
    "weighingRemoveTitle": MessageLookupByLibrary.simpleMessage(
      "ဤစာကြောင်းကို ဖယ်မလား?",
    ),
    "weighingScaleNotConnected": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင် မချိတ်ရသေးပါ",
    ),
    "weighingScaleProblem": MessageLookupByLibrary.simpleMessage(
      "ချိန်ခွင် ပြဿနာရှိလား?",
    ),
    "weighingTitle": MessageLookupByLibrary.simpleMessage("ချိန်ခြင်း"),
    "weighingTotalLines": m24,
    "weightKgValue": m25,
  };
}
