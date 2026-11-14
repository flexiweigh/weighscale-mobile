import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_tone.dart';
import '../../../core/widgets/app_header.dart';

class WeighTabScreen extends StatelessWidget {
  const WeighTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Column(
        children: [
          AppHeader(title: l10n.navWeigh, subtitle: l10n.weighChooseTitle),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _ChoiceCard(
                  title: l10n.quickBuyTitle,
                  subtitle: l10n.quickBuySubtitle,
                  icon: Icons.south_west,
                  tone: AppTone.green,
                  onTap: () => context.push(AppRoutes.weighWith('buy')),
                ),
                const SizedBox(height: 14),
                _ChoiceCard(
                  title: l10n.quickSellTitle,
                  subtitle: l10n.quickSellSubtitle,
                  icon: Icons.north_east,
                  tone: AppTone.orange,
                  onTap: () => context.push(AppRoutes.weighWith('sell')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChoiceCard extends StatelessWidget {
  const _ChoiceCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tone,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final AppTone tone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = tone.colors;
    final radius = BorderRadius.circular(16);
    return Material(
      color: AppColors.surface,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: colors.foreground, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}