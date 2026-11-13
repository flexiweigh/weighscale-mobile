import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../../../core/widgets/dashed_border.dart';

class ItemsEmptyState extends StatelessWidget {
  const ItemsEmptyState({super.key, required this.onAddFirst});

  final VoidCallback onAddFirst;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DashedBorder(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTone.grey.colors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.sell_outlined,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.itemsEmptyTitle,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.itemsEmptyBody,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onAddFirst,
              icon: const Icon(Icons.add, size: 18),
              label: Text(l10n.itemsAddFirst),
              style: FilledButton.styleFrom(
                minimumSize: const Size(0, 44),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}