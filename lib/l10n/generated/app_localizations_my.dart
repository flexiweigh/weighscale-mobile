// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppL10nMy extends AppL10n {
  AppL10nMy([String locale = 'my']) : super(locale);

  @override
  String get navHome => 'ပင်မ';

  @override
  String get navWeigh => 'ချိန်မယ်';

  @override
  String get navHistory => 'မှတ်တမ်း';

  @override
  String get navItems => 'ပစ္စည်းများ';

  @override
  String get navSettings => 'ပြင်ဆင်ရန်';

  @override
  String get commonComingSoon => 'မကြာခင် လာပါမယ်';

  @override
  String get devicesTitle => 'ချိန်ခွင်ချိတ်ရန်';

  @override
  String get reportsTitle => 'စာရင်းချုပ်';

  @override
  String get manualEntryTitle => 'ကိုယ်တိုင်ရိုက်ထည့်ရန်';

  @override
  String get transactionDetailTitle => 'ဝယ်/ရောင်း အသေးစိတ်';

  @override
  String get scaleNoScaleConnected => 'ချိန်ခွင် မချိတ်ရသေးပါ';

  @override
  String get scalePairHint => 'စတင်ရန် ဘလူးတုသ်ချိန်ခွင်ကို ချိတ်ပါ';

  @override
  String get scaleConnecting => 'ချိတ်နေပါတယ်...';

  @override
  String scaleBluetoothProfile(String profile) {
    return 'ဘလူးတုသ် · $profile';
  }

  @override
  String get scaleConnectionLostReconnecting =>
      'ချိတ်ဆက်မှု ပြတ်သွားပါတယ် · ပြန်ချိတ်နေပါတယ်...';

  @override
  String get statusNotConnected => 'မချိတ်ရသေးပါ';

  @override
  String get statusConnecting => 'ချိတ်နေပါတယ်';

  @override
  String get statusConnected => 'ချိတ်ပြီးပါပြီ';

  @override
  String get statusDisconnected => 'ပြတ်သွားပါပြီ';

  @override
  String get readingStable => 'ငြိမ်ပါပြီ';

  @override
  String get readingUnstable => 'မငြိမ်သေးပါ';

  @override
  String get readingNoSignal => 'ချိန်ခွင်မှ အချက်အလက် မရပါ';

  @override
  String get readingLastReading => 'နောက်ဆုံး ချိန်ထားတာ';

  @override
  String get actionTare => '−';

  @override
  String get actionZero => '0';

  @override
  String get actionConnectScale => 'ချိန်ခွင်ချိတ်ရန်';

  @override
  String get actionConnecting => 'ချိတ်နေပါတယ်...';

  @override
  String get actionStartWeighing => 'ချိန်စတင်မယ်';

  @override
  String get actionReconnectNow => 'ပြန်ချိတ်မယ်';

  @override
  String get connectionLostTitle => 'ချိန်ခွင် ချိတ်ဆက်မှု ပြတ်သွားပါတယ်';

  @override
  String connectionLostBody(int attempt, int maxAttempts) {
    return 'ပြန်ချိတ်နေပါတယ် ($maxAttempts ကြိမ်အနက် $attempt ကြိမ်မြောက်)။\nအတည်ပြုပြီးသား စာရင်းတွေကို သိမ်းထားပြီးပါပြီ။';
  }

  @override
  String get actionManualEntry => 'ကိုယ်တိုင်ရိုက်ထည့်ရန်';

  @override
  String get quickBuyTitle => 'ဝယ်မယ်';

  @override
  String get quickBuySubtitle => 'ချိန်ပြီး ငွေရှင်း';

  @override
  String get quickSellTitle => 'ရောင်းမယ်';

  @override
  String get quickSellSubtitle => 'ချိန်ပြီး ဘောက်ချာထုတ်';

  @override
  String get quickPriceListTitle => 'စျေးနှုန်းစာရင်း';

  @override
  String get quickPriceListSubtitle => 'ပစ္စည်းနဲ့ စျေး';

  @override
  String get quickReportsTitle => 'စာရင်းချုပ်';

  @override
  String get quickReportsSubtitle => 'နေ့စဉ်၊ လစဉ်';

  @override
  String get todayTitle => 'ဒီနေ့';

  @override
  String get todayFullReport => 'အားလုံးကြည့်ရန်';

  @override
  String get todayTransactions => 'ဝယ်/ရောင်း အကြိမ်';

  @override
  String get todayWeightKg => 'အလေးချိန် (ကီလို)';

  @override
  String get todayAmountKs => 'ငွေ (ကျပ်)';

  @override
  String get getStartedTitle => 'စတင်အသုံးပြုရန်';

  @override
  String getStartedProgress(int done, int total) {
    return '$total ခုအနက် $done ခု ပြီးပါပြီ';
  }

  @override
  String get stepConnectScaleTitle => 'ချိန်ခွင် ချိတ်ပါ';

  @override
  String get stepConnectScaleSubtitle =>
      'ဘလူးတုသ်ချိန်ခွင် ချိတ်ပါ၊ မရှိရင် အလေးချိန်ကို ကိုယ်တိုင်ရိုက်ထည့်ပါ';

  @override
  String get stepAddItemsTitle => 'ပစ္စည်းနဲ့ စျေးထည့်ပါ';

  @override
  String get stepAddItemsSubtitle =>
      'ပစ္စည်းတစ်မျိုးချင်းစီရဲ့ တစ်ကီလို စျေးကို ထည့်ပါ';

  @override
  String get stepFirstWeighingTitle => 'ပထမဆုံး ချိန်ကြည့်ပါ';

  @override
  String get stepFirstWeighingSubtitle =>
      'ဝယ်ပါ၊ ရောင်းပါ၊ ပြီးရင် ဘောက်ချာထုတ်ပါ';

  @override
  String get recentTitle => 'လတ်တလော ဝယ်/ရောင်းထားတာများ';

  @override
  String get recentSeeAll => 'အားလုံးကြည့်ရန်';

  @override
  String get recentEmptyTitle => 'ဝယ်/ရောင်း မရှိသေးပါ';

  @override
  String get recentEmptyBody =>
      'ပထမဆုံး ဝယ်ပြီး ဒါမှမဟုတ် ရောင်းပြီးတာနဲ့\nဒီမှာ ပေါ်လာပါမယ်။';

  @override
  String get transactionBuy => 'ဝယ်';

  @override
  String get transactionSell => 'ရောင်း';

  @override
  String moneyKs(String amount) {
    return '$amount ကျပ်';
  }

  @override
  String weightKgValue(String weight) {
    return '$weight ကီလို';
  }

  @override
  String get connectTitle => 'ချိန်ခွင် ချိတ်ရန်';

  @override
  String get connectSubtitle =>
      'ချိန်ခွင်ရဲ့ ဘလူးတုသ်ကို ဖွင့်ပြီး အနားမှာ ထားပါ။';

  @override
  String get connectRescan => 'ပြန်ရှာမယ်';

  @override
  String connectScanning(int count) {
    return 'ရှာနေပါတယ်... $count ခု တွေ့ပါပြီ';
  }

  @override
  String connectFinished(int count) {
    return '$count ခု တွေ့ပါတယ်';
  }

  @override
  String get connectNoDevices => 'ဘာမှ မတွေ့ပါ';

  @override
  String get connectNoDevicesHint =>
      'ချိန်ခွင်ကို ဖွင့်ထားလား၊ အနားမှာ ရှိလား စစ်ပြီး ပြန်ရှာကြည့်ပါ။';

  @override
  String get connectProfileLabel => 'ချိန်ခွင် အမျိုးအစား';

  @override
  String get connectCantFind => 'ချိန်ခွင် ရှာမတွေ့ဘူးလား?';

  @override
  String get connectEnterManually => 'အလေးချိန်ကို ကိုယ်တိုင်ရိုက်ထည့်မယ်';

  @override
  String get actionConnect => 'ချိတ်မယ်';

  @override
  String get deviceUnnamed => 'နာမည်မရှိတဲ့ စက်';

  @override
  String deviceSignal(String signal) {
    return 'လိုင်း: $signal';
  }

  @override
  String deviceService(String service) {
    return 'Service $service';
  }

  @override
  String get signalStrong => 'ကောင်းလွန်းတယ်';

  @override
  String get signalGood => 'ကောင်းတယ်';

  @override
  String get signalWeak => 'အားနည်းတယ်';

  @override
  String get signalUnknown => 'မသိရပါ';

  @override
  String get transportBluetooth => 'ဘလူးတုသ်';

  @override
  String get transportWifi => 'ဝိုင်ဖိုင်';

  @override
  String get transportUsb => 'USB';

  @override
  String unavailableAdapterOff(String transport) {
    return '$transport ပိတ်ထားပါတယ်။ ချိန်ခွင်ရှာဖို့ ဖွင့်ပေးပါ။';
  }

  @override
  String unavailablePermission(String transport) {
    return '$transport နဲ့ ရှာဖို့ ခွင့်ပြုချက် လိုပါတယ်။';
  }

  @override
  String unavailableUnsupported(String transport) {
    return 'ဒီဖုန်းမှာ $transport နဲ့ ရှာလို့ မရပါ။';
  }

  @override
  String get connectFailedTimeout =>
      'ချိတ်ဖို့ အချိန်ကြာလွန်းလို့ မရပါ။ ထပ်ကြိုးစားကြည့်ပါ။';

  @override
  String get connectFailedRejected => 'ချိန်ခွင်က ချိတ်ခွင့် မပေးပါ။';

  @override
  String get connectFailedUnsupported =>
      'ရွေးထားတဲ့ အမျိုးအစားက ဒီချိန်ခွင်နဲ့ မကိုက်ပါ။';

  @override
  String get connectFailedUnknown => 'ချိတ်လို့ မရပါ။ ထပ်ကြိုးစားကြည့်ပါ။';

  @override
  String get accessAllow => 'ခွင့်ပြုမယ်';

  @override
  String get accessTurnOn => 'ဖွင့်မယ်';

  @override
  String get accessOpenSettings => 'ဖုန်းဆက်တင် ဖွင့်မယ်';

  @override
  String get settingsGeneralSection => 'အထွေထွေ';

  @override
  String get settingsScaleSection => 'ချိန်ခွင်';

  @override
  String get settingsShopName => 'ဆိုင်နာမည်';

  @override
  String get settingsScaleConnection => 'ချိန်ခွင် ချိတ်ဆက်မှု';

  @override
  String get commonSave => 'သိမ်းမယ်';

  @override
  String get commonCancel => 'မလုပ်တော့ဘူး';

  @override
  String get categoryMetal => 'သတ္တု';

  @override
  String get categoryPlastic => 'ပလတ်စတစ်';

  @override
  String get categoryPaper => 'စက္ကူ';

  @override
  String get categoryRubber => 'ရော်ဘာ';

  @override
  String get categoryOther => 'အခြား';

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ပစ္စည်း $count မျိုး',
    );
    return '$_temp0';
  }

  @override
  String get itemsAddTooltip => 'ပစ္စည်းထည့်ရန်';

  @override
  String get itemsSearchHint => 'ပစ္စည်းရှာရန်';

  @override
  String get itemsEmptyTitle => 'ပစ္စည်း မရှိသေးပါ';

  @override
  String get itemsEmptyBody =>
      'ဝယ်/ရောင်းတဲ့ ပစ္စည်းတွေကို တစ်ကီလို စျေးနဲ့အတူ ထည့်ပါ။ စျေးကို ဘယ်အချိန်မဆို ပြောင်းလို့ရပါတယ်။';

  @override
  String get itemsAddFirst => 'ပထမဆုံး ပစ္စည်းထည့်မယ်';

  @override
  String get itemsQuickAdd => 'အသုံးများတဲ့ ပစ္စည်းတွေ အမြန်ထည့်မယ်';

  @override
  String get itemsNoResultsTitle => 'ပစ္စည်း မတွေ့ပါ';

  @override
  String itemsNoResultsBody(String query) {
    return '“$query” နဲ့ ကိုက်တာ မရှိပါ။ တခြားနာမည် ဒါမှမဟုတ် ကုဒ်နဲ့ ရှာကြည့်ပါ။';
  }

  @override
  String get itemsLoadError => 'ပစ္စည်းစာရင်း ဖွင့်လို့ မရပါ။';

  @override
  String get commonRetry => 'ထပ်ကြိုးစားမယ်';

  @override
  String itemPriceLine(String buy, String sell, String unit) {
    return 'ဝယ် $buy · ရောင်း $sell ကျပ်/$unit';
  }

  @override
  String get statusActive => 'သုံးနေတယ်';

  @override
  String get statusInactive => 'ရပ်ထားတယ်';

  @override
  String get presetCopper => 'ကြေးနီ';

  @override
  String get presetAluminium => 'အလူမီနီယံ';

  @override
  String get presetIronScrap => 'သံဟောင်း';

  @override
  String get presetPlastic => 'ပလတ်စတစ်';

  @override
  String get presetPaper => 'စက္ကူ';

  @override
  String get presetBrass => 'ကြေးဝါ';

  @override
  String get presetRubber => 'ရော်ဘာ';

  @override
  String get unitKg => 'ကီလို';

  @override
  String get unitG => 'ဂရမ်';

  @override
  String get unitLb => 'ပေါင်';

  @override
  String get unitViss => 'ပိဿာ';

  @override
  String priceSuffix(String unit) {
    return 'ကျပ်/$unit';
  }

  @override
  String get itemFormAddTitle => 'ပစ္စည်းထည့်ရန်';

  @override
  String get itemFormEditTitle => 'ပစ္စည်းပြင်ရန်';

  @override
  String get itemFormSubtitleNew => 'စျေးနှုန်းစာရင်း · ပစ္စည်းအသစ်';

  @override
  String get itemFormSubtitleEdit => 'စျေးနှုန်းစာရင်း · ပစ္စည်းပြင်နေသည်';

  @override
  String get sectionBasicInfo => 'အခြေခံအချက်အလက်';

  @override
  String get sectionPricing => 'စျေးနှုန်း';

  @override
  String get sectionDefaults => 'အမြဲသုံးမယ့် တန်ဖိုးများ';

  @override
  String get fieldItemName => 'ပစ္စည်းနာမည်';

  @override
  String get fieldShortCode => 'အတိုကောက်ကုဒ်';

  @override
  String get fieldCategory => 'အမျိုးအစား';

  @override
  String get fieldCategoryHint => 'ရွေးပါ ဒါမှမဟုတ် ရိုက်ထည့်ပါ';

  @override
  String get fieldWeighingUnit => 'ချိန်တဲ့ ယူနစ်';

  @override
  String get fieldBuyPrice => 'ဝယ်စျေး';

  @override
  String get fieldSellPrice => 'ရောင်းစျေး';

  @override
  String get desiredWeightTitle => 'လိုချင်တဲ့ အလေးချိန် · OK စစ်ရန်';

  @override
  String get desiredWeightHint =>
      'ချိန်နေတုန်း ဒီပစ္စည်းအတွက် OK၊ လိုနေ၊ ပိုနေ ဆိုပြီး ပြပေးပါတယ်။';

  @override
  String get fieldTargetWeight => 'လိုချင်တဲ့ အလေးချိန်';

  @override
  String get fieldTolerance => 'လွန်/လိုခွင့်ပြုမှု ±';

  @override
  String get checkUnder => 'လိုနေ';

  @override
  String get checkOk => 'OK';

  @override
  String get checkOver => 'ပိုနေ';

  @override
  String get toggleShowCheck => 'OK / လိုနေ / ပိုနေ ပြမယ်';

  @override
  String get toggleAutoCapture => 'OK ဖြစ်ပြီး ငြိမ်သွားရင် အလိုလို မှတ်မယ်';

  @override
  String get fieldDefaultDeduction => 'အမြဲနုတ်မယ့် အလေးချိန်';

  @override
  String get fieldStatus => 'အခြေအနေ';

  @override
  String get fieldNotes => 'မှတ်ချက် (မရေးလည်းရ)';

  @override
  String get fieldNotesHint => 'ဥပမာ - သန့်တဲ့ ကြေးနီသာ';

  @override
  String get itemSave => 'ပစ္စည်းသိမ်းမယ်';

  @override
  String get errorRequired => 'ဒီနေရာကို ဖြည့်ပေးပါ';

  @override
  String get errorInvalidNumber => 'ဂဏန်း မှန်မှန်ကန်ကန် ထည့်ပါ';

  @override
  String get errorTooLong => 'ရှည်လွန်းနေပါတယ်';

  @override
  String get errorDuplicateName => 'ဒီနာမည်နဲ့ ပစ္စည်း ရှိပြီးသားပါ';

  @override
  String get errorDuplicateCode => 'ဒီအတိုကောက်ကုဒ်ကို သုံးပြီးသားပါ';

  @override
  String get errorSaveFailed => 'သိမ်းလို့ မရပါ။ ထပ်ကြိုးစားကြည့်ပါ။';

  @override
  String get errorItemNotFound => 'ဒီပစ္စည်း မရှိတော့ပါ။';

  @override
  String get discardTitle => 'ပြင်ထားတာတွေ ဖျက်လိုက်မလား?';

  @override
  String get discardBody => 'ပြင်ထားတာတွေကို မသိမ်းရသေးပါ။';

  @override
  String get discardKeep => 'ဆက်ပြင်မယ်';

  @override
  String get discardConfirm => 'ဖျက်လိုက်မယ်';

  @override
  String get itemDeleteTooltip => 'ပစ္စည်းဖျက်ရန်';

  @override
  String get itemDeleteTitle => 'ဒီပစ္စည်းကို ဖျက်မလား?';

  @override
  String get itemDeleteBody =>
      'စျေးနှုန်းစာရင်းထဲက ထွက်သွားပါမယ်။ အရင်ဝယ်/ရောင်းထားတဲ့ မှတ်တမ်းတွေမှာတော့ ဆက်ရှိနေပါမယ်။';

  @override
  String get itemDelete => 'ဖျက်မယ်';

  @override
  String get settingsLanguage => 'ဘာသာစကား';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageMyanmar => 'မြန်မာ';
}
