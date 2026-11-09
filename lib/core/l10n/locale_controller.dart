import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/generated/app_localizations.dart';
import '../storage/shared_prefs_provider.dart';

final localeControllerProvider =
NotifierProvider<LocaleController, Locale>(LocaleController.new);

class LocaleController extends Notifier<Locale> {
  static const _storageKey = 'app_locale';
  static const defaultLocale = Locale('my');

  @override
  Locale build() {
    final code = ref.read(sharedPreferencesProvider).getString(_storageKey);
    return AppL10n.supportedLocales.firstWhere(
          (locale) => locale.languageCode == code,
      orElse: () => defaultLocale,
    );
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await ref
        .read(sharedPreferencesProvider)
        .setString(_storageKey, locale.languageCode);
  }

  Future<void> setEnglish() => setLocale(const Locale('en'));

  Future<void> setMyanmar() => setLocale(const Locale('my'));
}