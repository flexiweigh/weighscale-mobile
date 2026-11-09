// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get navHome {
    return Intl.message('Home', name: 'navHome', desc: '', args: []);
  }

  /// `Weigh`
  String get navWeigh {
    return Intl.message('Weigh', name: 'navWeigh', desc: '', args: []);
  }

  /// `History`
  String get navHistory {
    return Intl.message('History', name: 'navHistory', desc: '', args: []);
  }

  /// `Items`
  String get navItems {
    return Intl.message('Items', name: 'navItems', desc: '', args: []);
  }

  /// `Settings`
  String get navSettings {
    return Intl.message('Settings', name: 'navSettings', desc: '', args: []);
  }

  /// `No scale connected`
  String get scaleNoScaleConnected {
    return Intl.message(
      'No scale connected',
      name: 'scaleNoScaleConnected',
      desc: '',
      args: [],
    );
  }

  /// `Pair a Bluetooth scale to start`
  String get scalePairHint {
    return Intl.message(
      'Pair a Bluetooth scale to start',
      name: 'scalePairHint',
      desc: '',
      args: [],
    );
  }

  /// `Connecting...`
  String get scaleConnecting {
    return Intl.message(
      'Connecting...',
      name: 'scaleConnecting',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth · {profile}`
  String scaleBluetoothProfile(String profile) {
    return Intl.message(
      'Bluetooth · $profile',
      name: 'scaleBluetoothProfile',
      desc: '',
      args: [profile],
    );
  }

  /// `Connection lost · reconnecting...`
  String get scaleConnectionLostReconnecting {
    return Intl.message(
      'Connection lost · reconnecting...',
      name: 'scaleConnectionLostReconnecting',
      desc: '',
      args: [],
    );
  }

  /// `Not connected`
  String get statusNotConnected {
    return Intl.message(
      'Not connected',
      name: 'statusNotConnected',
      desc: '',
      args: [],
    );
  }

  /// `Connecting`
  String get statusConnecting {
    return Intl.message(
      'Connecting',
      name: 'statusConnecting',
      desc: '',
      args: [],
    );
  }

  /// `Connected`
  String get statusConnected {
    return Intl.message(
      'Connected',
      name: 'statusConnected',
      desc: '',
      args: [],
    );
  }

  /// `Disconnected`
  String get statusDisconnected {
    return Intl.message(
      'Disconnected',
      name: 'statusDisconnected',
      desc: '',
      args: [],
    );
  }

  /// `STABLE`
  String get readingStable {
    return Intl.message('STABLE', name: 'readingStable', desc: '', args: []);
  }

  /// `UNSTABLE`
  String get readingUnstable {
    return Intl.message(
      'UNSTABLE',
      name: 'readingUnstable',
      desc: '',
      args: [],
    );
  }

  /// `NO SIGNAL`
  String get readingNoSignal {
    return Intl.message(
      'NO SIGNAL',
      name: 'readingNoSignal',
      desc: '',
      args: [],
    );
  }

  /// `LAST READING`
  String get readingLastReading {
    return Intl.message(
      'LAST READING',
      name: 'readingLastReading',
      desc: '',
      args: [],
    );
  }

  /// `Tare`
  String get actionTare {
    return Intl.message('Tare', name: 'actionTare', desc: '', args: []);
  }

  /// `Zero`
  String get actionZero {
    return Intl.message('Zero', name: 'actionZero', desc: '', args: []);
  }

  /// `Connect Scale`
  String get actionConnectScale {
    return Intl.message(
      'Connect Scale',
      name: 'actionConnectScale',
      desc: '',
      args: [],
    );
  }

  /// `Connecting...`
  String get actionConnecting {
    return Intl.message(
      'Connecting...',
      name: 'actionConnecting',
      desc: '',
      args: [],
    );
  }

  /// `Start Weighing`
  String get actionStartWeighing {
    return Intl.message(
      'Start Weighing',
      name: 'actionStartWeighing',
      desc: '',
      args: [],
    );
  }

  /// `Reconnect Now`
  String get actionReconnectNow {
    return Intl.message(
      'Reconnect Now',
      name: 'actionReconnectNow',
      desc: '',
      args: [],
    );
  }

  /// `Scale connection lost`
  String get connectionLostTitle {
    return Intl.message(
      'Scale connection lost',
      name: 'connectionLostTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reconnecting (attempt {attempt} of {maxAttempts}).\nConfirmed lines are saved.`
  String connectionLostBody(int attempt, int maxAttempts) {
    return Intl.message(
      'Reconnecting (attempt $attempt of $maxAttempts).\nConfirmed lines are saved.',
      name: 'connectionLostBody',
      desc: '',
      args: [attempt, maxAttempts],
    );
  }

  /// `Manual entry`
  String get actionManualEntry {
    return Intl.message(
      'Manual entry',
      name: 'actionManualEntry',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get quickBuyTitle {
    return Intl.message('Buy', name: 'quickBuyTitle', desc: '', args: []);
  }

  /// `Weigh & pay`
  String get quickBuySubtitle {
    return Intl.message(
      'Weigh & pay',
      name: 'quickBuySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sell`
  String get quickSellTitle {
    return Intl.message('Sell', name: 'quickSellTitle', desc: '', args: []);
  }

  /// `Weigh & invoice`
  String get quickSellSubtitle {
    return Intl.message(
      'Weigh & invoice',
      name: 'quickSellSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Price List`
  String get quickPriceListTitle {
    return Intl.message(
      'Price List',
      name: 'quickPriceListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Items & rates`
  String get quickPriceListSubtitle {
    return Intl.message(
      'Items & rates',
      name: 'quickPriceListSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get quickReportsTitle {
    return Intl.message(
      'Reports',
      name: 'quickReportsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Daily & monthly`
  String get quickReportsSubtitle {
    return Intl.message(
      'Daily & monthly',
      name: 'quickReportsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get todayTitle {
    return Intl.message('Today', name: 'todayTitle', desc: '', args: []);
  }

  /// `Full report`
  String get todayFullReport {
    return Intl.message(
      'Full report',
      name: 'todayFullReport',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get todayTransactions {
    return Intl.message(
      'Transactions',
      name: 'todayTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Weight (kg)`
  String get todayWeightKg {
    return Intl.message(
      'Weight (kg)',
      name: 'todayWeightKg',
      desc: '',
      args: [],
    );
  }

  /// `Amount (Ks)`
  String get todayAmountKs {
    return Intl.message(
      'Amount (Ks)',
      name: 'todayAmountKs',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get getStartedTitle {
    return Intl.message(
      'Get started',
      name: 'getStartedTitle',
      desc: '',
      args: [],
    );
  }

  /// `{done} of {total} done`
  String getStartedProgress(int done, int total) {
    return Intl.message(
      '$done of $total done',
      name: 'getStartedProgress',
      desc: '',
      args: [done, total],
    );
  }

  /// `Connect your scale`
  String get stepConnectScaleTitle {
    return Intl.message(
      'Connect your scale',
      name: 'stepConnectScaleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth scale, or enter weights manually`
  String get stepConnectScaleSubtitle {
    return Intl.message(
      'Bluetooth scale, or enter weights manually',
      name: 'stepConnectScaleSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Add items & prices`
  String get stepAddItemsTitle {
    return Intl.message(
      'Add items & prices',
      name: 'stepAddItemsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Set the price per kg for each material`
  String get stepAddItemsSubtitle {
    return Intl.message(
      'Set the price per kg for each material',
      name: 'stepAddItemsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Make your first weighing`
  String get stepFirstWeighingTitle {
    return Intl.message(
      'Make your first weighing',
      name: 'stepFirstWeighingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Buy or sell, then print a receipt`
  String get stepFirstWeighingSubtitle {
    return Intl.message(
      'Buy or sell, then print a receipt',
      name: 'stepFirstWeighingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Recent transactions`
  String get recentTitle {
    return Intl.message(
      'Recent transactions',
      name: 'recentTitle',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get recentSeeAll {
    return Intl.message('See all', name: 'recentSeeAll', desc: '', args: []);
  }

  /// `No transactions yet`
  String get recentEmptyTitle {
    return Intl.message(
      'No transactions yet',
      name: 'recentEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your weighings will appear here after your first\npurchase or sale.`
  String get recentEmptyBody {
    return Intl.message(
      'Your weighings will appear here after your first\npurchase or sale.',
      name: 'recentEmptyBody',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get transactionBuy {
    return Intl.message('Buy', name: 'transactionBuy', desc: '', args: []);
  }

  /// `Sell`
  String get transactionSell {
    return Intl.message('Sell', name: 'transactionSell', desc: '', args: []);
  }

  /// `{amount} Ks`
  String moneyKs(String amount) {
    return Intl.message(
      '$amount Ks',
      name: 'moneyKs',
      desc: '',
      args: [amount],
    );
  }

  /// `{weight} kg`
  String weightKgValue(String weight) {
    return Intl.message(
      '$weight kg',
      name: 'weightKgValue',
      desc: '',
      args: [weight],
    );
  }

  /// `Language`
  String get settingsLanguage {
    return Intl.message(
      'Language',
      name: 'settingsLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get languageEnglish {
    return Intl.message('English', name: 'languageEnglish', desc: '', args: []);
  }

  /// `မြန်မာ`
  String get languageMyanmar {
    return Intl.message('မြန်မာ', name: 'languageMyanmar', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'my'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
