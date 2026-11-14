import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text.dart';
import '../theme/app_tone.dart';
import 'dashed_border.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    required this.actionLabel,
    required this.actionIcon,
    required this.onAction,
  });

  final IconData icon;
  final String title;
  final String body;
  final String actionLabel;
  final IconData actionIcon;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
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
                borderRadius: AppRadius.control,
              ),
              child: Icon(icon, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 12),
            Text(title, style: AppText.sectionTitle),
            const SizedBox(height: 4),
            Text(
              body,
              textAlign: TextAlign.center,
              style: AppText.caption.copyWith(height: 1.5),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onAction,
              icon: Icon(actionIcon, size: 18),
              label: Text(actionLabel),
              style: FilledButton.styleFrom(
                minimumSize: const Size(0, 44),
                backgroundColor: AppColors.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.control,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}