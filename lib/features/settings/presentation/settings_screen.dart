import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_info.dart';
import '../../../core/l10n/l10n_extension.dart';
import '../../../core/l10n/locale_controller.dart';
import '../../../core/theme/app_dimens.dart';
import '../../../core/theme/app_tone.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_header.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../devices/application/scale_session_controller.dart';
import '../../home/presentation/connect_scale_flow.dart';
import '../../home/presentation/state/home_card_states.dart';
import '../../home/presentation/state/scale_card_mapper.dart';
import '../application/receipt_footer_controller.dart';
import '../application/shop_name_controller.dart';
import 'language_sheet.dart';
import 'text_input_dialog.dart';
import 'widgets/settings_section.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = ref.watch(localeControllerProvider);
    final shopName = ref.watch(shopNameControllerProvider);
    final footer = ref.watch(receiptFooterControllerProvider);
    final scale = scaleCardStateOf(
      ref.watch(scaleSessionProvider),
      unnamedLabel: l10n.deviceUnnamed,
    );

    final languageName = locale.languageCode == 'my'
        ? l10n.languageMyanmar
        : l10n.languageEnglish;

    final scaleChip = switch (scale.status) {
      ScaleConnectionStatus.connected => StatusChip(
        label: scale.deviceName ?? l10n.statusConnected,
        tone: AppTone.green,
      ),
      ScaleConnectionStatus.connecting => StatusChip(
        label: l10n.statusConnecting,
        tone: AppTone.blue,
      ),
      ScaleConnectionStatus.disconnected => StatusChip(
        label: l10n.statusDisconnected,
        tone: AppTone.red,
      ),
      ScaleConnectionStatus.notConnected => StatusChip(
        label: l10n.statusNotConnected,
        tone: AppTone.orange,
      ),
    };

    void comingSoon() => showAppSnackBar(context, l10n.commonComingSoon);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(title: l10n.navSettings),
            Expanded(
              child: ListView(
                padding: AppSpacing.screen,
                children: [
                  SettingsSection(
                    title: l10n.settingsGeneralSection,
                    tiles: [
                      SettingsTile(
                        title: l10n.settingsLanguage,
                        value: languageName,
                        onTap: () => showLanguageSheet(context, ref),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.section),
                  SettingsSection(
                    title: l10n.settingsShopSection,
                    tiles: [
                      SettingsTile(
                        title: l10n.settingsShopName,
                        value: shopName,
                        onTap: () async {
                          final name = await showTextInputDialog(
                            context,
                            title: l10n.settingsShopName,
                            initial: shopName,
                          );
                          if (name != null) {
                            await ref
                                .read(shopNameControllerProvider.notifier)
                                .setName(name);
                          }
                        },
                      ),
                      SettingsTile(
                        title: l10n.settingsCurrency,
                        value: l10n.currencyKyat,
                      ),
                      SettingsTile(
                        title: l10n.settingsReceiptFooter,
                        value: footer.isEmpty ? '—' : footer,
                        onTap: () async {
                          final text = await showTextInputDialog(
                            context,
                            title: l10n.settingsReceiptFooter,
                            initial: footer,
                            maxLength: 60,
                            allowEmpty: true,
                          );
                          if (text != null) {
                            await ref
                                .read(receiptFooterControllerProvider.notifier)
                                .setText(text);
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.section),
                  SettingsSection(
                    title: l10n.settingsScaleSection,
                    tiles: [
                      SettingsTile(
                        title: l10n.settingsScaleConnection,
                        chip: scaleChip,
                        onTap: () => runConnectScaleFlow(context, ref),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.section),
                  SettingsSection(
                    title: l10n.settingsPrinterSection,
                    tiles: [
                      SettingsTile(
                        title: l10n.settingsPrinter,
                        chip: StatusChip(
                          label: l10n.statusNotConnected,
                          tone: AppTone.orange,
                        ),
                        onTap: comingSoon,
                      ),
                      SettingsTile(
                        title: l10n.settingsPaperWidth,
                        value: '58 mm',
                        onTap: comingSoon,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.section),
                  SettingsSection(
                    title: l10n.settingsDataSection,
                    tiles: [
                      SettingsTile(
                        title: l10n.settingsBackupExport,
                        onTap: comingSoon,
                      ),
                      SettingsTile(
                        title: l10n.settingsAbout,
                        value: 'v$appVersion',
                        onTap: () => showAboutDialog(
                          context: context,
                          applicationName: 'FlexiWeigh',
                          applicationVersion: appVersion,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}