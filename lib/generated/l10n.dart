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

  /// `Coming soon`
  String get commonComingSoon {
    return Intl.message(
      'Coming soon',
      name: 'commonComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Connect Scale`
  String get devicesTitle {
    return Intl.message(
      'Connect Scale',
      name: 'devicesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reportsTitle {
    return Intl.message('Reports', name: 'reportsTitle', desc: '', args: []);
  }

  /// `Manual entry`
  String get manualEntryTitle {
    return Intl.message(
      'Manual entry',
      name: 'manualEntryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get transactionDetailTitle {
    return Intl.message(
      'Transaction',
      name: 'transactionDetailTitle',
      desc: '',
      args: [],
    );
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

  /// `Connect a scale`
  String get connectTitle {
    return Intl.message(
      'Connect a scale',
      name: 'connectTitle',
      desc: '',
      args: [],
    );
  }

  /// `Turn on the scale's Bluetooth and keep it nearby.`
  String get connectSubtitle {
    return Intl.message(
      'Turn on the scale\'s Bluetooth and keep it nearby.',
      name: 'connectSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Rescan`
  String get connectRescan {
    return Intl.message('Rescan', name: 'connectRescan', desc: '', args: []);
  }

  /// `Scanning... {count} devices found`
  String connectScanning(int count) {
    return Intl.message(
      'Scanning... $count devices found',
      name: 'connectScanning',
      desc: '',
      args: [count],
    );
  }

  /// `{count} devices found`
  String connectFinished(int count) {
    return Intl.message(
      '$count devices found',
      name: 'connectFinished',
      desc: '',
      args: [count],
    );
  }

  /// `No devices found`
  String get connectNoDevices {
    return Intl.message(
      'No devices found',
      name: 'connectNoDevices',
      desc: '',
      args: [],
    );
  }

  /// `Check that the scale is on and nearby, then rescan.`
  String get connectNoDevicesHint {
    return Intl.message(
      'Check that the scale is on and nearby, then rescan.',
      name: 'connectNoDevicesHint',
      desc: '',
      args: [],
    );
  }

  /// `Scale profile`
  String get connectProfileLabel {
    return Intl.message(
      'Scale profile',
      name: 'connectProfileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Can't find your scale?`
  String get connectCantFind {
    return Intl.message(
      'Can\'t find your scale?',
      name: 'connectCantFind',
      desc: '',
      args: [],
    );
  }

  /// `Enter weights manually`
  String get connectEnterManually {
    return Intl.message(
      'Enter weights manually',
      name: 'connectEnterManually',
      desc: '',
      args: [],
    );
  }

  /// `Connect`
  String get actionConnect {
    return Intl.message('Connect', name: 'actionConnect', desc: '', args: []);
  }

  /// `Unnamed device`
  String get deviceUnnamed {
    return Intl.message(
      'Unnamed device',
      name: 'deviceUnnamed',
      desc: '',
      args: [],
    );
  }

  /// `Signal: {signal}`
  String deviceSignal(String signal) {
    return Intl.message(
      'Signal: $signal',
      name: 'deviceSignal',
      desc: '',
      args: [signal],
    );
  }

  /// `Service {service}`
  String deviceService(String service) {
    return Intl.message(
      'Service $service',
      name: 'deviceService',
      desc: '',
      args: [service],
    );
  }

  /// `Strong`
  String get signalStrong {
    return Intl.message('Strong', name: 'signalStrong', desc: '', args: []);
  }

  /// `Good`
  String get signalGood {
    return Intl.message('Good', name: 'signalGood', desc: '', args: []);
  }

  /// `Weak`
  String get signalWeak {
    return Intl.message('Weak', name: 'signalWeak', desc: '', args: []);
  }

  /// `Unknown`
  String get signalUnknown {
    return Intl.message('Unknown', name: 'signalUnknown', desc: '', args: []);
  }

  /// `Bluetooth`
  String get transportBluetooth {
    return Intl.message(
      'Bluetooth',
      name: 'transportBluetooth',
      desc: '',
      args: [],
    );
  }

  /// `Wi-Fi`
  String get transportWifi {
    return Intl.message('Wi-Fi', name: 'transportWifi', desc: '', args: []);
  }

  /// `USB`
  String get transportUsb {
    return Intl.message('USB', name: 'transportUsb', desc: '', args: []);
  }

  /// `{transport} is off. Turn it on to find scales.`
  String unavailableAdapterOff(String transport) {
    return Intl.message(
      '$transport is off. Turn it on to find scales.',
      name: 'unavailableAdapterOff',
      desc: '',
      args: [transport],
    );
  }

  /// `Permission needed to scan with {transport}.`
  String unavailablePermission(String transport) {
    return Intl.message(
      'Permission needed to scan with $transport.',
      name: 'unavailablePermission',
      desc: '',
      args: [transport],
    );
  }

  /// `{transport} scanning isn't supported on this device.`
  String unavailableUnsupported(String transport) {
    return Intl.message(
      '$transport scanning isn\'t supported on this device.',
      name: 'unavailableUnsupported',
      desc: '',
      args: [transport],
    );
  }

  /// `Connection timed out. Please try again.`
  String get connectFailedTimeout {
    return Intl.message(
      'Connection timed out. Please try again.',
      name: 'connectFailedTimeout',
      desc: '',
      args: [],
    );
  }

  /// `The scale rejected the connection.`
  String get connectFailedRejected {
    return Intl.message(
      'The scale rejected the connection.',
      name: 'connectFailedRejected',
      desc: '',
      args: [],
    );
  }

  /// `This scale is not supported by the selected profile.`
  String get connectFailedUnsupported {
    return Intl.message(
      'This scale is not supported by the selected profile.',
      name: 'connectFailedUnsupported',
      desc: '',
      args: [],
    );
  }

  /// `Could not connect. Please try again.`
  String get connectFailedUnknown {
    return Intl.message(
      'Could not connect. Please try again.',
      name: 'connectFailedUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Allow`
  String get accessAllow {
    return Intl.message('Allow', name: 'accessAllow', desc: '', args: []);
  }

  /// `Turn on`
  String get accessTurnOn {
    return Intl.message('Turn on', name: 'accessTurnOn', desc: '', args: []);
  }

  /// `Open settings`
  String get accessOpenSettings {
    return Intl.message(
      'Open settings',
      name: 'accessOpenSettings',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get settingsGeneralSection {
    return Intl.message(
      'General',
      name: 'settingsGeneralSection',
      desc: '',
      args: [],
    );
  }

  /// `Scale`
  String get settingsScaleSection {
    return Intl.message(
      'Scale',
      name: 'settingsScaleSection',
      desc: '',
      args: [],
    );
  }

  /// `Shop name`
  String get settingsShopName {
    return Intl.message(
      'Shop name',
      name: 'settingsShopName',
      desc: '',
      args: [],
    );
  }

  /// `Scale connection`
  String get settingsScaleConnection {
    return Intl.message(
      'Scale connection',
      name: 'settingsScaleConnection',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get commonSave {
    return Intl.message('Save', name: 'commonSave', desc: '', args: []);
  }

  /// `Cancel`
  String get commonCancel {
    return Intl.message('Cancel', name: 'commonCancel', desc: '', args: []);
  }

  /// `Metal`
  String get categoryMetal {
    return Intl.message('Metal', name: 'categoryMetal', desc: '', args: []);
  }

  /// `Plastic`
  String get categoryPlastic {
    return Intl.message('Plastic', name: 'categoryPlastic', desc: '', args: []);
  }

  /// `Paper`
  String get categoryPaper {
    return Intl.message('Paper', name: 'categoryPaper', desc: '', args: []);
  }

  /// `Rubber`
  String get categoryRubber {
    return Intl.message('Rubber', name: 'categoryRubber', desc: '', args: []);
  }

  /// `Other`
  String get categoryOther {
    return Intl.message('Other', name: 'categoryOther', desc: '', args: []);
  }

  /// `{count, plural, =1{1 item} other{{count} items}}`
  String itemsCount(int count) {
    return Intl.plural(
      count,
      one: '1 item',
      other: '$count items',
      name: 'itemsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Add item`
  String get itemsAddTooltip {
    return Intl.message(
      'Add item',
      name: 'itemsAddTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Search items`
  String get itemsSearchHint {
    return Intl.message(
      'Search items',
      name: 'itemsSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `No items yet`
  String get itemsEmptyTitle {
    return Intl.message(
      'No items yet',
      name: 'itemsEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add the materials you buy or sell, with a price per kg. You can change prices any time.`
  String get itemsEmptyBody {
    return Intl.message(
      'Add the materials you buy or sell, with a price per kg. You can change prices any time.',
      name: 'itemsEmptyBody',
      desc: '',
      args: [],
    );
  }

  /// `Add first item`
  String get itemsAddFirst {
    return Intl.message(
      'Add first item',
      name: 'itemsAddFirst',
      desc: '',
      args: [],
    );
  }

  /// `Quick add common items`
  String get itemsQuickAdd {
    return Intl.message(
      'Quick add common items',
      name: 'itemsQuickAdd',
      desc: '',
      args: [],
    );
  }

  /// `No items found`
  String get itemsNoResultsTitle {
    return Intl.message(
      'No items found',
      name: 'itemsNoResultsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nothing matches “{query}”. Try a different name or code.`
  String itemsNoResultsBody(String query) {
    return Intl.message(
      'Nothing matches “$query”. Try a different name or code.',
      name: 'itemsNoResultsBody',
      desc: '',
      args: [query],
    );
  }

  /// `Could not load items.`
  String get itemsLoadError {
    return Intl.message(
      'Could not load items.',
      name: 'itemsLoadError',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get commonRetry {
    return Intl.message('Try again', name: 'commonRetry', desc: '', args: []);
  }

  /// `Buy {buy} · Sell {sell} Ks/{unit}`
  String itemPriceLine(String buy, String sell, String unit) {
    return Intl.message(
      'Buy $buy · Sell $sell Ks/$unit',
      name: 'itemPriceLine',
      desc: '',
      args: [buy, sell, unit],
    );
  }

  /// `Active`
  String get statusActive {
    return Intl.message('Active', name: 'statusActive', desc: '', args: []);
  }

  /// `Inactive`
  String get statusInactive {
    return Intl.message('Inactive', name: 'statusInactive', desc: '', args: []);
  }

  /// `Copper`
  String get presetCopper {
    return Intl.message('Copper', name: 'presetCopper', desc: '', args: []);
  }

  /// `Aluminium`
  String get presetAluminium {
    return Intl.message(
      'Aluminium',
      name: 'presetAluminium',
      desc: '',
      args: [],
    );
  }

  /// `Iron scrap`
  String get presetIronScrap {
    return Intl.message(
      'Iron scrap',
      name: 'presetIronScrap',
      desc: '',
      args: [],
    );
  }

  /// `Plastic`
  String get presetPlastic {
    return Intl.message('Plastic', name: 'presetPlastic', desc: '', args: []);
  }

  /// `Paper`
  String get presetPaper {
    return Intl.message('Paper', name: 'presetPaper', desc: '', args: []);
  }

  /// `Brass`
  String get presetBrass {
    return Intl.message('Brass', name: 'presetBrass', desc: '', args: []);
  }

  /// `Rubber`
  String get presetRubber {
    return Intl.message('Rubber', name: 'presetRubber', desc: '', args: []);
  }

  /// `kg`
  String get unitKg {
    return Intl.message('kg', name: 'unitKg', desc: '', args: []);
  }

  /// `g`
  String get unitG {
    return Intl.message('g', name: 'unitG', desc: '', args: []);
  }

  /// `lb`
  String get unitLb {
    return Intl.message('lb', name: 'unitLb', desc: '', args: []);
  }

  /// `viss`
  String get unitViss {
    return Intl.message('viss', name: 'unitViss', desc: '', args: []);
  }

  /// `Ks/{unit}`
  String priceSuffix(String unit) {
    return Intl.message(
      'Ks/$unit',
      name: 'priceSuffix',
      desc: '',
      args: [unit],
    );
  }

  /// `Add Item`
  String get itemFormAddTitle {
    return Intl.message(
      'Add Item',
      name: 'itemFormAddTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Item`
  String get itemFormEditTitle {
    return Intl.message(
      'Edit Item',
      name: 'itemFormEditTitle',
      desc: '',
      args: [],
    );
  }

  /// `Price List · New material`
  String get itemFormSubtitleNew {
    return Intl.message(
      'Price List · New material',
      name: 'itemFormSubtitleNew',
      desc: '',
      args: [],
    );
  }

  /// `Price List · Edit material`
  String get itemFormSubtitleEdit {
    return Intl.message(
      'Price List · Edit material',
      name: 'itemFormSubtitleEdit',
      desc: '',
      args: [],
    );
  }

  /// `Basic info`
  String get sectionBasicInfo {
    return Intl.message(
      'Basic info',
      name: 'sectionBasicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Pricing`
  String get sectionPricing {
    return Intl.message('Pricing', name: 'sectionPricing', desc: '', args: []);
  }

  /// `Defaults`
  String get sectionDefaults {
    return Intl.message(
      'Defaults',
      name: 'sectionDefaults',
      desc: '',
      args: [],
    );
  }

  /// `Item name`
  String get fieldItemName {
    return Intl.message('Item name', name: 'fieldItemName', desc: '', args: []);
  }

  /// `Short code`
  String get fieldShortCode {
    return Intl.message(
      'Short code',
      name: 'fieldShortCode',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get fieldCategory {
    return Intl.message('Category', name: 'fieldCategory', desc: '', args: []);
  }

  /// `Choose or type`
  String get fieldCategoryHint {
    return Intl.message(
      'Choose or type',
      name: 'fieldCategoryHint',
      desc: '',
      args: [],
    );
  }

  /// `Weighing unit`
  String get fieldWeighingUnit {
    return Intl.message(
      'Weighing unit',
      name: 'fieldWeighingUnit',
      desc: '',
      args: [],
    );
  }

  /// `Buy price`
  String get fieldBuyPrice {
    return Intl.message('Buy price', name: 'fieldBuyPrice', desc: '', args: []);
  }

  /// `Sell price`
  String get fieldSellPrice {
    return Intl.message(
      'Sell price',
      name: 'fieldSellPrice',
      desc: '',
      args: [],
    );
  }

  /// `Desired weight · OK check`
  String get desiredWeightTitle {
    return Intl.message(
      'Desired weight · OK check',
      name: 'desiredWeightTitle',
      desc: '',
      args: [],
    );
  }

  /// `Live Weighing shows OK, Under or Over for this item.`
  String get desiredWeightHint {
    return Intl.message(
      'Live Weighing shows OK, Under or Over for this item.',
      name: 'desiredWeightHint',
      desc: '',
      args: [],
    );
  }

  /// `Target weight`
  String get fieldTargetWeight {
    return Intl.message(
      'Target weight',
      name: 'fieldTargetWeight',
      desc: '',
      args: [],
    );
  }

  /// `Tolerance ±`
  String get fieldTolerance {
    return Intl.message(
      'Tolerance ±',
      name: 'fieldTolerance',
      desc: '',
      args: [],
    );
  }

  /// `Under`
  String get checkUnder {
    return Intl.message('Under', name: 'checkUnder', desc: '', args: []);
  }

  /// `OK`
  String get checkOk {
    return Intl.message('OK', name: 'checkOk', desc: '', args: []);
  }

  /// `Over`
  String get checkOver {
    return Intl.message('Over', name: 'checkOver', desc: '', args: []);
  }

  /// `Show OK / Under / Over`
  String get toggleShowCheck {
    return Intl.message(
      'Show OK / Under / Over',
      name: 'toggleShowCheck',
      desc: '',
      args: [],
    );
  }

  /// `Auto-capture when OK and stable`
  String get toggleAutoCapture {
    return Intl.message(
      'Auto-capture when OK and stable',
      name: 'toggleAutoCapture',
      desc: '',
      args: [],
    );
  }

  /// `Default deduction`
  String get fieldDefaultDeduction {
    return Intl.message(
      'Default deduction',
      name: 'fieldDefaultDeduction',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get fieldStatus {
    return Intl.message('Status', name: 'fieldStatus', desc: '', args: []);
  }

  /// `Notes (optional)`
  String get fieldNotes {
    return Intl.message(
      'Notes (optional)',
      name: 'fieldNotes',
      desc: '',
      args: [],
    );
  }

  /// `e.g. clean bright copper only`
  String get fieldNotesHint {
    return Intl.message(
      'e.g. clean bright copper only',
      name: 'fieldNotesHint',
      desc: '',
      args: [],
    );
  }

  /// `Save Item`
  String get itemSave {
    return Intl.message('Save Item', name: 'itemSave', desc: '', args: []);
  }

  /// `This field is required`
  String get errorRequired {
    return Intl.message(
      'This field is required',
      name: 'errorRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid number`
  String get errorInvalidNumber {
    return Intl.message(
      'Enter a valid number',
      name: 'errorInvalidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Too long`
  String get errorTooLong {
    return Intl.message('Too long', name: 'errorTooLong', desc: '', args: []);
  }

  /// `An item with this name already exists`
  String get errorDuplicateName {
    return Intl.message(
      'An item with this name already exists',
      name: 'errorDuplicateName',
      desc: '',
      args: [],
    );
  }

  /// `This short code is already used`
  String get errorDuplicateCode {
    return Intl.message(
      'This short code is already used',
      name: 'errorDuplicateCode',
      desc: '',
      args: [],
    );
  }

  /// `Could not save. Please try again.`
  String get errorSaveFailed {
    return Intl.message(
      'Could not save. Please try again.',
      name: 'errorSaveFailed',
      desc: '',
      args: [],
    );
  }

  /// `This item no longer exists.`
  String get errorItemNotFound {
    return Intl.message(
      'This item no longer exists.',
      name: 'errorItemNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Discard changes?`
  String get discardTitle {
    return Intl.message(
      'Discard changes?',
      name: 'discardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your changes have not been saved.`
  String get discardBody {
    return Intl.message(
      'Your changes have not been saved.',
      name: 'discardBody',
      desc: '',
      args: [],
    );
  }

  /// `Keep editing`
  String get discardKeep {
    return Intl.message(
      'Keep editing',
      name: 'discardKeep',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get discardConfirm {
    return Intl.message('Discard', name: 'discardConfirm', desc: '', args: []);
  }

  /// `Delete item`
  String get itemDeleteTooltip {
    return Intl.message(
      'Delete item',
      name: 'itemDeleteTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Delete this item?`
  String get itemDeleteTitle {
    return Intl.message(
      'Delete this item?',
      name: 'itemDeleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `It will be removed from your price list. Past transactions keep their records.`
  String get itemDeleteBody {
    return Intl.message(
      'It will be removed from your price list. Past transactions keep their records.',
      name: 'itemDeleteBody',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get itemDelete {
    return Intl.message('Delete', name: 'itemDelete', desc: '', args: []);
  }

  /// `Weighing`
  String get weighingTitle {
    return Intl.message('Weighing', name: 'weighingTitle', desc: '', args: []);
  }

  /// `Enter Weight Manually`
  String get manualWeightTitle {
    return Intl.message(
      'Enter Weight Manually',
      name: 'manualWeightTitle',
      desc: '',
      args: [],
    );
  }

  /// `{type} · Receipt #{number}`
  String weighingReceiptSubtitle(String type, String number) {
    return Intl.message(
      '$type · Receipt #$number',
      name: 'weighingReceiptSubtitle',
      desc: '',
      args: [type, number],
    );
  }

  /// `Scale not connected`
  String get weighingScaleNotConnected {
    return Intl.message(
      'Scale not connected',
      name: 'weighingScaleNotConnected',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get weighingItemLabel {
    return Intl.message('Item', name: 'weighingItemLabel', desc: '', args: []);
  }

  /// `LIVE WEIGHT`
  String get weighingLiveWeight {
    return Intl.message(
      'LIVE WEIGHT',
      name: 'weighingLiveWeight',
      desc: '',
      args: [],
    );
  }

  /// `Auto-capture`
  String get weighingAutoCapture {
    return Intl.message(
      'Auto-capture',
      name: 'weighingAutoCapture',
      desc: '',
      args: [],
    );
  }

  /// `Deduction ({unit})`
  String weighingDeductionLabel(String unit) {
    return Intl.message(
      'Deduction ($unit)',
      name: 'weighingDeductionLabel',
      desc: '',
      args: [unit],
    );
  }

  /// `Price (Ks/{unit})`
  String weighingPriceLabel(String unit) {
    return Intl.message(
      'Price (Ks/$unit)',
      name: 'weighingPriceLabel',
      desc: '',
      args: [unit],
    );
  }

  /// `Gross weight ({unit})`
  String weighingGrossLabel(String unit) {
    return Intl.message(
      'Gross weight ($unit)',
      name: 'weighingGrossLabel',
      desc: '',
      args: [unit],
    );
  }

  /// `Net weight`
  String get weighingNetLabel {
    return Intl.message(
      'Net weight',
      name: 'weighingNetLabel',
      desc: '',
      args: [],
    );
  }

  /// `Net ({unit})`
  String weighingNetShort(String unit) {
    return Intl.message(
      'Net ($unit)',
      name: 'weighingNetShort',
      desc: '',
      args: [unit],
    );
  }

  /// `Amount`
  String get weighingAmountLabel {
    return Intl.message(
      'Amount',
      name: 'weighingAmountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Weight`
  String get weighingConfirm {
    return Intl.message(
      'Confirm Weight',
      name: 'weighingConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Scale problem?`
  String get weighingScaleProblem {
    return Intl.message(
      'Scale problem?',
      name: 'weighingScaleProblem',
      desc: '',
      args: [],
    );
  }

  /// `Enter weight manually`
  String get weighingEnterManually {
    return Intl.message(
      'Enter weight manually',
      name: 'weighingEnterManually',
      desc: '',
      args: [],
    );
  }

  /// `Receipt lines ({count})`
  String weighingReceiptLines(int count) {
    return Intl.message(
      'Receipt lines ($count)',
      name: 'weighingReceiptLines',
      desc: '',
      args: [count],
    );
  }

  /// `No lines yet. Confirm a weight to add one.`
  String get weighingNoLines {
    return Intl.message(
      'No lines yet. Confirm a weight to add one.',
      name: 'weighingNoLines',
      desc: '',
      args: [],
    );
  }

  /// `Total · {count} lines`
  String weighingTotalLines(int count) {
    return Intl.message(
      'Total · $count lines',
      name: 'weighingTotalLines',
      desc: '',
      args: [count],
    );
  }

  /// `Finish`
  String get weighingFinish {
    return Intl.message('Finish', name: 'weighingFinish', desc: '', args: []);
  }

  /// `MANUAL`
  String get weighingManualBadge {
    return Intl.message(
      'MANUAL',
      name: 'weighingManualBadge',
      desc: '',
      args: [],
    );
  }

  /// `Gross {gross} − {deduction} = {net} {unit}`
  String weighingLineGross(
    String gross,
    String deduction,
    String net,
    String unit,
  ) {
    return Intl.message(
      'Gross $gross − $deduction = $net $unit',
      name: 'weighingLineGross',
      desc: '',
      args: [gross, deduction, net, unit],
    );
  }

  /// `{weight} {unit} × {price}`
  String weighingLineRate(String weight, String unit, String price) {
    return Intl.message(
      '$weight $unit × $price',
      name: 'weighingLineRate',
      desc: '',
      args: [weight, unit, price],
    );
  }

  /// `Manually entered weights are marked MANUAL on the receipt.`
  String get weighingManualNotice {
    return Intl.message(
      'Manually entered weights are marked MANUAL on the receipt.',
      name: 'weighingManualNotice',
      desc: '',
      args: [],
    );
  }

  /// `Add to Receipt`
  String get weighingAddToReceipt {
    return Intl.message(
      'Add to Receipt',
      name: 'weighingAddToReceipt',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get weighingDeductionNone {
    return Intl.message(
      'None',
      name: 'weighingDeductionNone',
      desc: '',
      args: [],
    );
  }

  /// `Sack`
  String get deductionSack {
    return Intl.message('Sack', name: 'deductionSack', desc: '', args: []);
  }

  /// `Basket`
  String get deductionBasket {
    return Intl.message('Basket', name: 'deductionBasket', desc: '', args: []);
  }

  /// `Crate`
  String get deductionCrate {
    return Intl.message('Crate', name: 'deductionCrate', desc: '', args: []);
  }

  /// `Choose item`
  String get weighingPickItem {
    return Intl.message(
      'Choose item',
      name: 'weighingPickItem',
      desc: '',
      args: [],
    );
  }

  /// `No items yet`
  String get weighingNoItemsTitle {
    return Intl.message(
      'No items yet',
      name: 'weighingNoItemsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add an item to your price list before weighing.`
  String get weighingNoItemsBody {
    return Intl.message(
      'Add an item to your price list before weighing.',
      name: 'weighingNoItemsBody',
      desc: '',
      args: [],
    );
  }

  /// `Remove this line?`
  String get weighingRemoveTitle {
    return Intl.message(
      'Remove this line?',
      name: 'weighingRemoveTitle',
      desc: '',
      args: [],
    );
  }

  /// `The receipt total will be recalculated.`
  String get weighingRemoveBody {
    return Intl.message(
      'The receipt total will be recalculated.',
      name: 'weighingRemoveBody',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get commonRemove {
    return Intl.message('Remove', name: 'commonRemove', desc: '', args: []);
  }

  /// `Receipt #{number} saved`
  String weighingFinished(String number) {
    return Intl.message(
      'Receipt #$number saved',
      name: 'weighingFinished',
      desc: '',
      args: [number],
    );
  }

  /// `Couldn't start the receipt.`
  String get weighingErrLoad {
    return Intl.message(
      'Couldn\'t start the receipt.',
      name: 'weighingErrLoad',
      desc: '',
      args: [],
    );
  }

  /// `Choose an item first.`
  String get weighingErrNoItem {
    return Intl.message(
      'Choose an item first.',
      name: 'weighingErrNoItem',
      desc: '',
      args: [],
    );
  }

  /// `Wait for a stable reading.`
  String get weighingErrScaleNotReady {
    return Intl.message(
      'Wait for a stable reading.',
      name: 'weighingErrScaleNotReady',
      desc: '',
      args: [],
    );
  }

  /// `Weight must be more than the deduction.`
  String get weighingErrInvalidWeight {
    return Intl.message(
      'Weight must be more than the deduction.',
      name: 'weighingErrInvalidWeight',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't save. Try again.`
  String get weighingErrSave {
    return Intl.message(
      'Couldn\'t save. Try again.',
      name: 'weighingErrSave',
      desc: '',
      args: [],
    );
  }

  /// `Add at least one line first.`
  String get weighingErrEmpty {
    return Intl.message(
      'Add at least one line first.',
      name: 'weighingErrEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Buy or sell?`
  String get weighChooseTitle {
    return Intl.message(
      'Buy or sell?',
      name: 'weighChooseTitle',
      desc: '',
      args: [],
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
