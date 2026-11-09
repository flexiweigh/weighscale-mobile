import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Today',
          actionLabel: 'Full report',
          onAction: onFullReport,
        ),
        const SizedBox(height: 8),
        AppCard(
          padding: EdgeInsets.zero,
          child: IntrinsicHeight(
            child: Row(
              children: [
                _Cell(
                  label: 'Transactions',
                  value: formatThousands(state.transactions),
                  color: AppColors.primary,
                ),
                const VerticalDivider(width: 1, color: AppColors.border),
                _Cell(
                  label: 'Weight (kg)',
                  value: formatThousands(state.weight, decimals: 1),
                  color: const Color(0xFF128A9B),
                ),
                const VerticalDivider(width: 1, color: AppColors.border),
                _Cell(
                  label: 'Amount (Ks)',
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