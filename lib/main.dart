import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/database/database_provider.dart';
import 'core/l10n/locale_controller.dart';
import 'core/router/app_router.dart';
import 'core/storage/shared_prefs_provider.dart';
import 'core/theme/app_theme.dart';
import 'l10n/generated/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
  );
  unawaited(
    container.read(appDatabaseProvider).customSelect('SELECT 1').get(),
  );
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const FlexiWeighApp(),
    ),
  );
}

class FlexiWeighApp extends ConsumerWidget {
  const FlexiWeighApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeControllerProvider);
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'FlexiWeigh',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      locale: locale,
      supportedLocales: AppL10n.supportedLocales,
      localizationsDelegates: AppL10n.localizationsDelegates,
      routerConfig: router,
    );
  }
}