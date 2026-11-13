import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/number_format.dart';
import '../state/home_card_states.dart';
import 'app_card.dart';

class TodaySummaryCard extends StatelessWidget {
  const TodaySummaryCard({
    super.key,
    required this.state,
    this.onFullReport,
  });

  final TodaySummaryState state;
  final VoidCallback? onFullReport;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.todayTitle,
          actionLabel: l10n.todayFullReport,
          onAction: onFullReport,
        ),
        const SizedBox(height: 8),
        AppCard(
          padding: EdgeInsets.zero,
          child: IntrinsicHeight(
            child: Row(
              children: [
                _Cell(
                  label: l10n.todayTransactions,
                  value: formatThousands(state.transactions),
                  color: AppColors.primary,
                ),
                const VerticalDivider(width: 1, color: AppColors.border),
                _Cell(
                  label: l10n.todayWeightKg,
                  value: formatThousands(state.weight, decimals: 1),
                  color: const Color(0xFF128A9B),
                ),
                const VerticalDivider(width: 1, color: AppColors.border),
                _Cell(
                  label: l10n.todayAmountKs,
                  value: formatThousands(state.amount),
                  color: AppColors.success,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({required this.label, required this.value, required this.color});

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}