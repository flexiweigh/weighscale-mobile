import 'package:flutter/material.dart';

import '../l10n/l10n_extension.dart';
import '../theme/app_colors.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    this.detail,
    this.showBack = false,
  });

  final String title;
  final String? detail;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: showBack,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.construction_outlined,
              size: 40,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.commonComingSoon,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            if (detail != null) ...[
              const SizedBox(height: 4),
              Text(
                detail!,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}