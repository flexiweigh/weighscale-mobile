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
  String get navWeigh => 'ချိန်';

  @override
  String get navHistory => 'မှတ်တမ်း';

  @override
  String get navItems => 'ပစ္စည်းများ';

  @override
  String get navSettings => 'ဆက်တင်';

  @override
  String get scaleNoScaleConnected => 'ချိန်ခွင် မချိတ်ဆက်ရသေးပါ';

  @override
  String get scalePairHint => 'စတင်ရန် Bluetooth ချိန်ခွင်ကို တွဲချိတ်ပါ';

  @override
  String get scaleConnecting => 'ချိတ်ဆက်နေသည်...';

  @override
  String scaleBluetoothProfile(String profile) {
    return 'Bluetooth · $profile';
  }

  @override
  String get scaleConnectionLostReconnecting =>
      'ချိတ်ဆက်မှု ပြတ်သွားသည် · ပြန်ချိတ်နေသည်...';

  @override
  String get statusNotConnected => 'မချိတ်ရသေး';

  @override
  String get statusConnecting => 'ချိတ်နေသည်';

  @override
  String get statusConnected => 'ချိတ်ဆက်ပြီး';

  @override
  String get statusDisconnected => 'ပြတ်တောက်';

  @override
  String get readingStable => 'တည်ငြိမ်';

  @override
  String get readingUnstable => 'မငြိမ်';

  @override
  String get readingNoSignal => 'အချက်ပြမရှိ';

  @override
  String get readingLastReading => 'နောက်ဆုံးဖတ်ချက်';

  @override
  String get actionTare => 'အလေးနုတ်';

  @override
  String get actionZero => 'သုည';

  @override
  String get actionConnectScale => 'ချိန်ခွင်ချိတ်ရန်';

  @override
  String get actionConnecting => 'ချိတ်နေသည်...';

  @override
  String get actionStartWeighing => 'ချိန်တွယ်စတင်';

  @override
  String get actionReconnectNow => 'ယခုပြန်ချိတ်';

  @override
  String get connectionLostTitle => 'ချိန်ခွင်ချိတ်ဆက်မှု ပြတ်သွားသည်';

  @override
  String connectionLostBody(int attempt, int maxAttempts) {
    return 'ပြန်ချိတ်နေသည် ($maxAttempts ကြိမ်အနက် $attempt ကြိမ်မြောက်)။\nအတည်ပြုပြီးသော စာရင်းများကို သိမ်းဆည်းပြီးဖြစ်သည်။';
  }

  @override
  String get actionManualEntry => 'လက်ဖြင့်ထည့်ရန်';

  @override
  String get quickBuyTitle => 'ဝယ်ယူ';

  @override
  String get quickBuySubtitle => 'ချိန်ပြီး ပေးချေ';

  @override
  String get quickSellTitle => 'ရောင်းချ';

  @override
  String get quickSellSubtitle => 'ချိန်ပြီး ပြေစာထုတ်';

  @override
  String get quickPriceListTitle => 'စျေးနှုန်းစာရင်း';

  @override
  String get quickPriceListSubtitle => 'ပစ္စည်းနှင့် နှုန်းထား';

  @override
  String get quickReportsTitle => 'အစီရင်ခံစာ';

  @override
  String get quickReportsSubtitle => 'နေ့စဉ်နှင့် လစဉ်';

  @override
  String get todayTitle => 'ယနေ့';

  @override
  String get todayFullReport => 'အပြည့်အစုံကြည့်ရန်';

  @override
  String get todayTransactions => 'ရောင်းဝယ်မှု';

  @override
  String get todayWeightKg => 'အလေးချိန် (ကီလို)';

  @override
  String get todayAmountKs => 'ငွေပမာဏ (ကျပ်)';

  @override
  String get getStartedTitle => 'စတင်အသုံးပြုရန်';

  @override
  String getStartedProgress(int done, int total) {
    return '$total ခုအနက် $done ခု ပြီးပြီ';
  }

  @override
  String get stepConnectScaleTitle => 'ချိန်ခွင်ချိတ်ဆက်ပါ';

  @override
  String get stepConnectScaleSubtitle =>
      'Bluetooth ချိန်ခွင် သို့မဟုတ် အလေးချိန်ကို လက်ဖြင့်ထည့်ပါ';

  @override
  String get stepAddItemsTitle => 'ပစ္စည်းနှင့် စျေးနှုန်းထည့်ပါ';

  @override
  String get stepAddItemsSubtitle =>
      'ပစ္စည်းတစ်မျိုးချင်းစီ၏ တစ်ကီလိုစျေးကို သတ်မှတ်ပါ';

  @override
  String get stepFirstWeighingTitle => 'ပထမဆုံးအကြိမ် ချိန်တွယ်ပါ';

  @override
  String get stepFirstWeighingSubtitle =>
      'ဝယ် သို့မဟုတ် ရောင်းပြီး ပြေစာထုတ်ပါ';

  @override
  String get recentTitle => 'မကြာသေးမီ ရောင်းဝယ်မှုများ';

  @override
  String get recentSeeAll => 'အားလုံးကြည့်ရန်';

  @override
  String get recentEmptyTitle => 'ရောင်းဝယ်မှု မရှိသေးပါ';

  @override
  String get recentEmptyBody =>
      'ပထမဆုံး ဝယ်ယူမှု သို့မဟုတ် ရောင်းချမှု ပြီးသည့်အခါ\nဤနေရာတွင် ပေါ်လာပါမည်။';

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
  String get settingsLanguage => 'ဘာသာစကား';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageMyanmar => 'မြန်မာ';
}
