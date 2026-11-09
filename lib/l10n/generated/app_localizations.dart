import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_my.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppL10n
/// returned by `AppL10n.of(context)`.
///
/// Applications need to include `AppL10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppL10n.localizationsDelegates,
///   supportedLocales: AppL10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppL10n.supportedLocales
/// property.
abstract class AppL10n {
  AppL10n(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppL10n of(BuildContext context) {
    return Localizations.of<AppL10n>(context, AppL10n)!;
  }

  static const LocalizationsDelegate<AppL10n> delegate = _AppL10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('my'),
  ];

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navWeigh.
  ///
  /// In en, this message translates to:
  /// **'Weigh'**
  String get navWeigh;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get navItems;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @scaleNoScaleConnected.
  ///
  /// In en, this message translates to:
  /// **'No scale connected'**
  String get scaleNoScaleConnected;

  /// No description provided for @scalePairHint.
  ///
  /// In en, this message translates to:
  /// **'Pair a Bluetooth scale to start'**
  String get scalePairHint;

  /// No description provided for @scaleConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get scaleConnecting;

  /// No description provided for @scaleBluetoothProfile.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth · {profile}'**
  String scaleBluetoothProfile(String profile);

  /// No description provided for @scaleConnectionLostReconnecting.
  ///
  /// In en, this message translates to:
  /// **'Connection lost · reconnecting...'**
  String get scaleConnectionLostReconnecting;

  /// No description provided for @statusNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Not connected'**
  String get statusNotConnected;

  /// No description provided for @statusConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting'**
  String get statusConnecting;

  /// No description provided for @statusConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get statusConnected;

  /// No description provided for @statusDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get statusDisconnected;

  /// No description provided for @readingStable.
  ///
  /// In en, this message translates to:
  /// **'STABLE'**
  String get readingStable;

  /// No description provided for @readingUnstable.
  ///
  /// In en, this message translates to:
  /// **'UNSTABLE'**
  String get readingUnstable;

  /// No description provided for @readingNoSignal.
  ///
  /// In en, this message translates to:
  /// **'NO SIGNAL'**
  String get readingNoSignal;

  /// No description provided for @readingLastReading.
  ///
  /// In en, this message translates to:
  /// **'LAST READING'**
  String get readingLastReading;

  /// No description provided for @actionTare.
  ///
  /// In en, this message translates to:
  /// **'Tare'**
  String get actionTare;

  /// No description provided for @actionZero.
  ///
  /// In en, this message translates to:
  /// **'Zero'**
  String get actionZero;

  /// No description provided for @actionConnectScale.
  ///
  /// In en, this message translates to:
  /// **'Connect Scale'**
  String get actionConnectScale;

  /// No description provided for @actionConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get actionConnecting;

  /// No description provided for @actionStartWeighing.
  ///
  /// In en, this message translates to:
  /// **'Start Weighing'**
  String get actionStartWeighing;

  /// No description provided for @actionReconnectNow.
  ///
  /// In en, this message translates to:
  /// **'Reconnect Now'**
  String get actionReconnectNow;

  /// No description provided for @connectionLostTitle.
  ///
  /// In en, this message translates to:
  /// **'Scale connection lost'**
  String get connectionLostTitle;

  /// No description provided for @connectionLostBody.
  ///
  /// In en, this message translates to:
  /// **'Reconnecting (attempt {attempt} of {maxAttempts}).\nConfirmed lines are saved.'**
  String connectionLostBody(int attempt, int maxAttempts);

  /// No description provided for @actionManualEntry.
  ///
  /// In en, this message translates to:
  /// **'Manual entry'**
  String get actionManualEntry;

  /// No description provided for @quickBuyTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get quickBuyTitle;

  /// No description provided for @quickBuySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Weigh & pay'**
  String get quickBuySubtitle;

  /// No description provided for @quickSellTitle.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get quickSellTitle;

  /// No description provided for @quickSellSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Weigh & invoice'**
  String get quickSellSubtitle;

  /// No description provided for @quickPriceListTitle.
  ///
  /// In en, this message translates to:
  /// **'Price List'**
  String get quickPriceListTitle;

  /// No description provided for @quickPriceListSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Items & rates'**
  String get quickPriceListSubtitle;

  /// No description provided for @quickReportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get quickReportsTitle;

  /// No description provided for @quickReportsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Daily & monthly'**
  String get quickReportsSubtitle;

  /// No description provided for @todayTitle.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayTitle;

  /// No description provided for @todayFullReport.
  ///
  /// In en, this message translates to:
  /// **'Full report'**
  String get todayFullReport;

  /// No description provided for @todayTransactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get todayTransactions;

  /// No description provided for @todayWeightKg.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get todayWeightKg;

  /// No description provided for @todayAmountKs.
  ///
  /// In en, this message translates to:
  /// **'Amount (Ks)'**
  String get todayAmountKs;

  /// No description provided for @getStartedTitle.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStartedTitle;

  /// No description provided for @getStartedProgress.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} done'**
  String getStartedProgress(int done, int total);

  /// No description provided for @stepConnectScaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect your scale'**
  String get stepConnectScaleTitle;

  /// No description provided for @stepConnectScaleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth scale, or enter weights manually'**
  String get stepConnectScaleSubtitle;

  /// No description provided for @stepAddItemsTitle.
  ///
  /// In en, this message translates to:
  /// **'Add items & prices'**
  String get stepAddItemsTitle;

  /// No description provided for @stepAddItemsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set the price per kg for each material'**
  String get stepAddItemsSubtitle;

  /// No description provided for @stepFirstWeighingTitle.
  ///
  /// In en, this message translates to:
  /// **'Make your first weighing'**
  String get stepFirstWeighingTitle;

  /// No description provided for @stepFirstWeighingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Buy or sell, then print a receipt'**
  String get stepFirstWeighingSubtitle;

  /// No description provided for @recentTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get recentTitle;

  /// No description provided for @recentSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get recentSeeAll;

  /// No description provided for @recentEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get recentEmptyTitle;

  /// No description provided for @recentEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Your weighings will appear here after your first\npurchase or sale.'**
  String get recentEmptyBody;

  /// No description provided for @transactionBuy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get transactionBuy;

  /// No description provided for @transactionSell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get transactionSell;

  /// No description provided for @moneyKs.
  ///
  /// In en, this message translates to:
  /// **'{amount} Ks'**
  String moneyKs(String amount);

  /// No description provided for @weightKgValue.
  ///
  /// In en, this message translates to:
  /// **'{weight} kg'**
  String weightKgValue(String weight);

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageMyanmar.
  ///
  /// In en, this message translates to:
  /// **'မြန်မာ'**
  String get languageMyanmar;
}

class _AppL10nDelegate extends LocalizationsDelegate<AppL10n> {
  const _AppL10nDelegate();

  @override
  Future<AppL10n> load(Locale locale) {
    return SynchronousFuture<AppL10n>(lookupAppL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'my'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppL10nDelegate old) => false;
}

AppL10n lookupAppL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppL10nEn();
    case 'my':
      return AppL10nMy();
  }

  throw FlutterError(
    'AppL10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
