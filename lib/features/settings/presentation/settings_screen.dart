import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/l10n/locale_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_tone.dart';
import '../../home/presentation/connect_scale_flow.dart';
import '../../home/presentation/controller/home_controller.dart';
import '../../home/presentation/state/home_card_states.dart';
import '../application/shop_name_controller.dart';
import 'language_sheet.dart';
import 'shop_name_dialog.dart';
import 'widgets/settings_section.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = ref.watch(localeControllerProvider);
    final shopName = ref.watch(shopNameControllerProvider);
    final scale = ref.watch(homeControllerProvider.select((s) => s.scale));

    final languageName = locale.languageCode == 'my'
        ? l10n.languageMyanmar
        : l10n.languageEnglish;

    final scaleValue = switch (scale.status) {
      ScaleConnectionStatus.connected => scale.deviceName ?? '',
      ScaleConnectionStatus.connecting => l10n.statusConnecting,
      ScaleConnectionStatus.disconnected =>
      '${scale.deviceName ?? ''} · ${l10n.statusDisconnected}',
      ScaleConnectionStatus.notConnected => l10n.statusNotConnected,
    };

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          title: Text(
            l10n.navSettings,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SettingsSection(
              title: l10n.settingsGeneralSection,
              tiles: [
                SettingsTile(
                  icon: Icons.language,
                  tone: AppTone.blue,
                  title: l10n.settingsLanguage,
                  value: languageName,
                  onTap: () => showLanguageSheet(context, ref),
                ),
                SettingsTile(
                  icon: Icons.storefront_outlined,
                  tone: AppTone.purple,
                  title: l10n.settingsShopName,
                  value: shopName,
                  onTap: () async {
                    final name = await showShopNameDialog(context, shopName);
                    if (name != null) {
                      await ref
                          .read(shopNameControllerProvider.notifier)
                          .setName(name);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 14),
            SettingsSection(
              title: l10n.settingsScaleSection,
              tiles: [
                SettingsTile(
                  icon: Icons.bluetooth,
                  tone: AppTone.teal,
                  title: l10n.settingsScaleConnection,
                  value: scaleValue,
                  onTap: () => runConnectScaleFlow(context, ref),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}