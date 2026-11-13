import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/l10n/locale_controller.dart';
import '../../../core/theme/app_colors.dart';

Future<void> showLanguageSheet(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    backgroundColor: AppColors.surface,
    builder: (_) => const _LanguageSheet(),
  );
}

class _LanguageSheet extends ConsumerWidget {
  const _LanguageSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final current = ref.watch(localeControllerProvider).languageCode;
    final controller = ref.read(localeControllerProvider.notifier);

    final options = <(String, String, VoidCallback)>[
      ('my', l10n.languageMyanmar, controller.setMyanmar),
      ('en', l10n.languageEnglish, controller.setEnglish),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.settingsLanguage,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            for (final option in options)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(option.$2),
                trailing: option.$1 == current
                    ? const Icon(Icons.check_circle, color: AppColors.primary)
                    : const Icon(
                  Icons.circle_outlined,
                  color: AppColors.border,
                ),
                onTap: () {
                  option.$3();
                  Navigator.of(context).pop();
                },
              ),
          ],
        ),
      ),
    );
  }
}