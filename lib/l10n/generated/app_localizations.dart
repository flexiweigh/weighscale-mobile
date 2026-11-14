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

  /// No description provided for @commonComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get commonComingSoon;

  /// No description provided for @devicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect Scale'**
  String get devicesTitle;

  /// No description provided for @reportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportsTitle;

  /// No description provided for @manualEntryTitle.
  ///
  /// In en, this message translates to:
  /// **'Manual entry'**
  String get manualEntryTitle;

  /// No description provided for @transactionDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transactionDetailTitle;

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

  /// No description provided for @connectTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect a scale'**
  String get connectTitle;

  /// No description provided for @connectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Turn on the scale\'s Bluetooth and keep it nearby.'**
  String get connectSubtitle;

  /// No description provided for @connectRescan.
  ///
  /// In en, this message translates to:
  /// **'Rescan'**
  String get connectRescan;

  /// No description provided for @connectScanning.
  ///
  /// In en, this message translates to:
  /// **'Scanning... {count} devices found'**
  String connectScanning(int count);

  /// No description provided for @connectFinished.
  ///
  /// In en, this message translates to:
  /// **'{count} devices found'**
  String connectFinished(int count);

  /// No description provided for @connectNoDevices.
  ///
  /// In en, this message translates to:
  /// **'No devices found'**
  String get connectNoDevices;

  /// No description provided for @connectNoDevicesHint.
  ///
  /// In en, this message translates to:
  /// **'Check that the scale is on and nearby, then rescan.'**
  String get connectNoDevicesHint;

  /// No description provided for @connectProfileLabel.
  ///
  /// In en, this message translates to:
  /// **'Scale profile'**
  String get connectProfileLabel;

  /// No description provided for @connectCantFind.
  ///
  /// In en, this message translates to:
  /// **'Can\'t find your scale?'**
  String get connectCantFind;

  /// No description provided for @connectEnterManually.
  ///
  /// In en, this message translates to:
  /// **'Enter weights manually'**
  String get connectEnterManually;

  /// No description provided for @actionConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get actionConnect;

  /// No description provided for @deviceUnnamed.
  ///
  /// In en, this message translates to:
  /// **'Unnamed device'**
  String get deviceUnnamed;

  /// No description provided for @deviceSignal.
  ///
  /// In en, this message translates to:
  /// **'Signal: {signal}'**
  String deviceSignal(String signal);

  /// No description provided for @deviceService.
  ///
  /// In en, this message translates to:
  /// **'Service {service}'**
  String deviceService(String service);

  /// No description provided for @signalStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get signalStrong;

  /// No description provided for @signalGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get signalGood;

  /// No description provided for @signalWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get signalWeak;

  /// No description provided for @signalUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get signalUnknown;

  /// No description provided for @transportBluetooth.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth'**
  String get transportBluetooth;

  /// No description provided for @transportWifi.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi'**
  String get transportWifi;

  /// No description provided for @transportUsb.
  ///
  /// In en, this message translates to:
  /// **'USB'**
  String get transportUsb;

  /// No description provided for @unavailableAdapterOff.
  ///
  /// In en, this message translates to:
  /// **'{transport} is off. Turn it on to find scales.'**
  String unavailableAdapterOff(String transport);

  /// No description provided for @unavailablePermission.
  ///
  /// In en, this message translates to:
  /// **'Permission needed to scan with {transport}.'**
  String unavailablePermission(String transport);

  /// No description provided for @unavailableUnsupported.
  ///
  /// In en, this message translates to:
  /// **'{transport} scanning isn\'t supported on this device.'**
  String unavailableUnsupported(String transport);

  /// No description provided for @connectFailedTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out. Please try again.'**
  String get connectFailedTimeout;

  /// No description provided for @connectFailedRejected.
  ///
  /// In en, this message translates to:
  /// **'The scale rejected the connection.'**
  String get connectFailedRejected;

  /// No description provided for @connectFailedUnsupported.
  ///
  /// In en, this message translates to:
  /// **'This scale is not supported by the selected profile.'**
  String get connectFailedUnsupported;

  /// No description provided for @connectFailedUnknown.
  ///
  /// In en, this message translates to:
  /// **'Could not connect. Please try again.'**
  String get connectFailedUnknown;

  /// No description provided for @accessAllow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get accessAllow;

  /// No description provided for @accessTurnOn.
  ///
  /// In en, this message translates to:
  /// **'Turn on'**
  String get accessTurnOn;

  /// No description provided for @accessOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get accessOpenSettings;

  /// No description provided for @settingsGeneralSection.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneralSection;

  /// No description provided for @settingsScaleSection.
  ///
  /// In en, this message translates to:
  /// **'Scale'**
  String get settingsScaleSection;

  /// No description provided for @settingsShopName.
  ///
  /// In en, this message translates to:
  /// **'Shop name'**
  String get settingsShopName;

  /// No description provided for @settingsScaleConnection.
  ///
  /// In en, this message translates to:
  /// **'Scale connection'**
  String get settingsScaleConnection;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @categoryMetal.
  ///
  /// In en, this message translates to:
  /// **'Metal'**
  String get categoryMetal;

  /// No description provided for @categoryPlastic.
  ///
  /// In en, this message translates to:
  /// **'Plastic'**
  String get categoryPlastic;

  /// No description provided for @categoryPaper.
  ///
  /// In en, this message translates to:
  /// **'Paper'**
  String get categoryPaper;

  /// No description provided for @categoryRubber.
  ///
  /// In en, this message translates to:
  /// **'Rubber'**
  String get categoryRubber;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String itemsCount(int count);

  /// No description provided for @itemsAddTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add item'**
  String get itemsAddTooltip;

  /// No description provided for @itemsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search items'**
  String get itemsSearchHint;

  /// No description provided for @itemsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No items yet'**
  String get itemsEmptyTitle;

  /// No description provided for @itemsEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Add the materials you buy or sell, with a price per kg. You can change prices any time.'**
  String get itemsEmptyBody;

  /// No description provided for @itemsAddFirst.
  ///
  /// In en, this message translates to:
  /// **'Add first item'**
  String get itemsAddFirst;

  /// No description provided for @itemsQuickAdd.
  ///
  /// In en, this message translates to:
  /// **'Quick add common items'**
  String get itemsQuickAdd;

  /// No description provided for @itemsNoResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get itemsNoResultsTitle;

  /// No description provided for @itemsNoResultsBody.
  ///
  /// In en, this message translates to:
  /// **'Nothing matches “{query}”. Try a different name or code.'**
  String itemsNoResultsBody(String query);

  /// No description provided for @itemsLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load items.'**
  String get itemsLoadError;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonRetry;

  /// No description provided for @itemPriceLine.
  ///
  /// In en, this message translates to:
  /// **'Buy {buy} · Sell {sell} Ks/{unit}'**
  String itemPriceLine(String buy, String sell, String unit);

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

  /// No description provided for @statusInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get statusInactive;

  /// No description provided for @presetCopper.
  ///
  /// In en, this message translates to:
  /// **'Copper'**
  String get presetCopper;

  /// No description provided for @presetAluminium.
  ///
  /// In en, this message translates to:
  /// **'Aluminium'**
  String get presetAluminium;

  /// No description provided for @presetIronScrap.
  ///
  /// In en, this message translates to:
  /// **'Iron scrap'**
  String get presetIronScrap;

  /// No description provided for @presetPlastic.
  ///
  /// In en, this message translates to:
  /// **'Plastic'**
  String get presetPlastic;

  /// No description provided for @presetPaper.
  ///
  /// In en, this message translates to:
  /// **'Paper'**
  String get presetPaper;

  /// No description provided for @presetBrass.
  ///
  /// In en, this message translates to:
  /// **'Brass'**
  String get presetBrass;

  /// No description provided for @presetRubber.
  ///
  /// In en, this message translates to:
  /// **'Rubber'**
  String get presetRubber;

  /// No description provided for @unitKg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get unitKg;

  /// No description provided for @unitG.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get unitG;

  /// No description provided for @unitLb.
  ///
  /// In en, this message translates to:
  /// **'lb'**
  String get unitLb;

  /// No description provided for @unitViss.
  ///
  /// In en, this message translates to:
  /// **'viss'**
  String get unitViss;

  /// No description provided for @priceSuffix.
  ///
  /// In en, this message translates to:
  /// **'Ks/{unit}'**
  String priceSuffix(String unit);

  /// No description provided for @itemFormAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get itemFormAddTitle;

  /// No description provided for @itemFormEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get itemFormEditTitle;

  /// No description provided for @itemFormSubtitleNew.
  ///
  /// In en, this message translates to:
  /// **'Price List · New material'**
  String get itemFormSubtitleNew;

  /// No description provided for @itemFormSubtitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Price List · Edit material'**
  String get itemFormSubtitleEdit;

  /// No description provided for @sectionBasicInfo.
  ///
  /// In en, this message translates to:
  /// **'Basic info'**
  String get sectionBasicInfo;

  /// No description provided for @sectionPricing.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get sectionPricing;

  /// No description provided for @sectionDefaults.
  ///
  /// In en, this message translates to:
  /// **'Defaults'**
  String get sectionDefaults;

  /// No description provided for @fieldItemName.
  ///
  /// In en, this message translates to:
  /// **'Item name'**
  String get fieldItemName;

  /// No description provided for @fieldShortCode.
  ///
  /// In en, this message translates to:
  /// **'Short code'**
  String get fieldShortCode;

  /// No description provided for @fieldCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get fieldCategory;

  /// No description provided for @fieldCategoryHint.
  ///
  /// In en, this message translates to:
  /// **'Choose or type'**
  String get fieldCategoryHint;

  /// No description provided for @fieldWeighingUnit.
  ///
  /// In en, this message translates to:
  /// **'Weighing unit'**
  String get fieldWeighingUnit;

  /// No description provided for @fieldBuyPrice.
  ///
  /// In en, this message translates to:
  /// **'Buy price'**
  String get fieldBuyPrice;

  /// No description provided for @fieldSellPrice.
  ///
  /// In en, this message translates to:
  /// **'Sell price'**
  String get fieldSellPrice;

  /// No description provided for @desiredWeightTitle.
  ///
  /// In en, this message translates to:
  /// **'Desired weight · OK check'**
  String get desiredWeightTitle;

  /// No description provided for @desiredWeightHint.
  ///
  /// In en, this message translates to:
  /// **'Live Weighing shows OK, Under or Over for this item.'**
  String get desiredWeightHint;

  /// No description provided for @fieldTargetWeight.
  ///
  /// In en, this message translates to:
  /// **'Target weight'**
  String get fieldTargetWeight;

  /// No description provided for @fieldTolerance.
  ///
  /// In en, this message translates to:
  /// **'Tolerance ±'**
  String get fieldTolerance;

  /// No description provided for @checkUnder.
  ///
  /// In en, this message translates to:
  /// **'Under'**
  String get checkUnder;

  /// No description provided for @checkOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get checkOk;

  /// No description provided for @checkOver.
  ///
  /// In en, this message translates to:
  /// **'Over'**
  String get checkOver;

  /// No description provided for @toggleShowCheck.
  ///
  /// In en, this message translates to:
  /// **'Show OK / Under / Over'**
  String get toggleShowCheck;

  /// No description provided for @toggleAutoCapture.
  ///
  /// In en, this message translates to:
  /// **'Auto-capture when OK and stable'**
  String get toggleAutoCapture;

  /// No description provided for @fieldDefaultDeduction.
  ///
  /// In en, this message translates to:
  /// **'Default deduction'**
  String get fieldDefaultDeduction;

  /// No description provided for @fieldStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get fieldStatus;

  /// No description provided for @fieldNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get fieldNotes;

  /// No description provided for @fieldNotesHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. clean bright copper only'**
  String get fieldNotesHint;

  /// No description provided for @itemSave.
  ///
  /// In en, this message translates to:
  /// **'Save Item'**
  String get itemSave;

  /// No description provided for @errorRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get errorRequired;

  /// No description provided for @errorInvalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid number'**
  String get errorInvalidNumber;

  /// No description provided for @errorTooLong.
  ///
  /// In en, this message translates to:
  /// **'Too long'**
  String get errorTooLong;

  /// No description provided for @errorDuplicateName.
  ///
  /// In en, this message translates to:
  /// **'An item with this name already exists'**
  String get errorDuplicateName;

  /// No description provided for @errorDuplicateCode.
  ///
  /// In en, this message translates to:
  /// **'This short code is already used'**
  String get errorDuplicateCode;

  /// No description provided for @errorSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save. Please try again.'**
  String get errorSaveFailed;

  /// No description provided for @errorItemNotFound.
  ///
  /// In en, this message translates to:
  /// **'This item no longer exists.'**
  String get errorItemNotFound;

  /// No description provided for @discardTitle.
  ///
  /// In en, this message translates to:
  /// **'Discard changes?'**
  String get discardTitle;

  /// No description provided for @discardBody.
  ///
  /// In en, this message translates to:
  /// **'Your changes have not been saved.'**
  String get discardBody;

  /// No description provided for @discardKeep.
  ///
  /// In en, this message translates to:
  /// **'Keep editing'**
  String get discardKeep;

  /// No description provided for @discardConfirm.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get discardConfirm;

  /// No description provided for @itemDeleteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete item'**
  String get itemDeleteTooltip;

  /// No description provided for @itemDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this item?'**
  String get itemDeleteTitle;

  /// No description provided for @itemDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'It will be removed from your price list. Past transactions keep their records.'**
  String get itemDeleteBody;

  /// No description provided for @itemDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get itemDelete;

  /// No description provided for @weighingTitle.
  ///
  /// In en, this message translates to:
  /// **'Weighing'**
  String get weighingTitle;

  /// No description provided for @manualWeightTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Weight Manually'**
  String get manualWeightTitle;

  /// No description provided for @weighingReceiptSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{type} · Receipt #{number}'**
  String weighingReceiptSubtitle(String type, String number);

  /// No description provided for @weighingScaleNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Scale not connected'**
  String get weighingScaleNotConnected;

  /// No description provided for @weighingItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get weighingItemLabel;

  /// No description provided for @weighingLiveWeight.
  ///
  /// In en, this message translates to:
  /// **'LIVE WEIGHT'**
  String get weighingLiveWeight;

  /// No description provided for @weighingAutoCapture.
  ///
  /// In en, this message translates to:
  /// **'Auto-capture'**
  String get weighingAutoCapture;

  /// No description provided for @weighingDeductionLabel.
  ///
  /// In en, this message translates to:
  /// **'Deduction ({unit})'**
  String weighingDeductionLabel(String unit);

  /// No description provided for @weighingPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price (Ks/{unit})'**
  String weighingPriceLabel(String unit);

  /// No description provided for @weighingGrossLabel.
  ///
  /// In en, this message translates to:
  /// **'Gross weight ({unit})'**
  String weighingGrossLabel(String unit);

  /// No description provided for @weighingNetLabel.
  ///
  /// In en, this message translates to:
  /// **'Net weight'**
  String get weighingNetLabel;

  /// No description provided for @weighingNetShort.
  ///
  /// In en, this message translates to:
  /// **'Net ({unit})'**
  String weighingNetShort(String unit);

  /// No description provided for @weighingAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get weighingAmountLabel;

  /// No description provided for @weighingConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Weight'**
  String get weighingConfirm;

  /// No description provided for @weighingScaleProblem.
  ///
  /// In en, this message translates to:
  /// **'Scale problem?'**
  String get weighingScaleProblem;

  /// No description provided for @weighingEnterManually.
  ///
  /// In en, this message translates to:
  /// **'Enter weight manually'**
  String get weighingEnterManually;

  /// No description provided for @weighingReceiptLines.
  ///
  /// In en, this message translates to:
  /// **'Receipt lines ({count})'**
  String weighingReceiptLines(int count);

  /// No description provided for @weighingNoLines.
  ///
  /// In en, this message translates to:
  /// **'No lines yet. Confirm a weight to add one.'**
  String get weighingNoLines;

  /// No description provided for @weighingTotalLines.
  ///
  /// In en, this message translates to:
  /// **'Total · {count} lines'**
  String weighingTotalLines(int count);

  /// No description provided for @weighingFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get weighingFinish;

  /// No description provided for @weighingManualBadge.
  ///
  /// In en, this message translates to:
  /// **'MANUAL'**
  String get weighingManualBadge;

  /// No description provided for @weighingLineGross.
  ///
  /// In en, this message translates to:
  /// **'Gross {gross} − {deduction} = {net} {unit}'**
  String weighingLineGross(
    String gross,
    String deduction,
    String net,
    String unit,
  );

  /// No description provided for @weighingLineRate.
  ///
  /// In en, this message translates to:
  /// **'{weight} {unit} × {price}'**
  String weighingLineRate(String weight, String unit, String price);

  /// No description provided for @weighingManualNotice.
  ///
  /// In en, this message translates to:
  /// **'Manually entered weights are marked MANUAL on the receipt.'**
  String get weighingManualNotice;

  /// No description provided for @weighingAddToReceipt.
  ///
  /// In en, this message translates to:
  /// **'Add to Receipt'**
  String get weighingAddToReceipt;

  /// No description provided for @weighingDeductionNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get weighingDeductionNone;

  /// No description provided for @deductionSack.
  ///
  /// In en, this message translates to:
  /// **'Sack'**
  String get deductionSack;

  /// No description provided for @deductionBasket.
  ///
  /// In en, this message translates to:
  /// **'Basket'**
  String get deductionBasket;

  /// No description provided for @deductionCrate.
  ///
  /// In en, this message translates to:
  /// **'Crate'**
  String get deductionCrate;

  /// No description provided for @weighingPickItem.
  ///
  /// In en, this message translates to:
  /// **'Choose item'**
  String get weighingPickItem;

  /// No description provided for @weighingNoItemsTitle.
  ///
  /// In en, this message translates to:
  /// **'No items yet'**
  String get weighingNoItemsTitle;

  /// No description provided for @weighingNoItemsBody.
  ///
  /// In en, this message translates to:
  /// **'Add an item to your price list before weighing.'**
  String get weighingNoItemsBody;

  /// No description provided for @weighingRemoveTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove this line?'**
  String get weighingRemoveTitle;

  /// No description provided for @weighingRemoveBody.
  ///
  /// In en, this message translates to:
  /// **'The receipt total will be recalculated.'**
  String get weighingRemoveBody;

  /// No description provided for @commonRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get commonRemove;

  /// No description provided for @weighingFinished.
  ///
  /// In en, this message translates to:
  /// **'Receipt #{number} saved'**
  String weighingFinished(String number);

  /// No description provided for @weighingErrLoad.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t start the receipt.'**
  String get weighingErrLoad;

  /// No description provided for @weighingErrNoItem.
  ///
  /// In en, this message translates to:
  /// **'Choose an item first.'**
  String get weighingErrNoItem;

  /// No description provided for @weighingErrScaleNotReady.
  ///
  /// In en, this message translates to:
  /// **'Wait for a stable reading.'**
  String get weighingErrScaleNotReady;

  /// No description provided for @weighingErrInvalidWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight must be more than the deduction.'**
  String get weighingErrInvalidWeight;

  /// No description provided for @weighingErrSave.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save. Try again.'**
  String get weighingErrSave;

  /// No description provided for @weighingErrEmpty.
  ///
  /// In en, this message translates to:
  /// **'Add at least one line first.'**
  String get weighingErrEmpty;

  /// No description provided for @weighChooseTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy or sell?'**
  String get weighChooseTitle;

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
