import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/dashed_border.dart';
import '../../../history/domain/receipt_summary.dart';
import '../../../history/presentation/widgets/receipt_tile.dart';
import '../../../../core/theme/app_dimens.dart';

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({
    super.key,
    required this.receipts,
    this.onSeeAll,
    this.onTransactionTap,
  });

  final List<ReceiptSummary> receipts;
  final VoidCallback? onSeeAll;
  final ValueChanged<ReceiptSummary>? onTransactionTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.recentTitle,
          actionLabel: receipts.isEmpty ? null : l10n.recentSeeAll,
          onAction: onSeeAll,
        ),
        const SizedBox(height: 8),
        if (receipts.isEmpty)
          const _EmptyTransactions()
        else
          AppCard(
            padding: EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: AppRadius.control,
              child: Column(
                children: [
                  for (var i = 0; i < receipts.length; i++) ...[
                    if (i > 0) const Divider(height: 1, color: AppColors.border),
                    ReceiptTile(
                      receipt: receipts[i],
                      onTap: onTransactionTap == null
                          ? null
                          : () => onTransactionTap!(receipts[i]),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _EmptyTransactions extends StatelessWidget {
  const _EmptyTransactions();

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
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppTone.grey.colors.background,
                borderRadius: AppRadius.control,
              ),
              child: const Icon(
                Icons.receipt_long_outlined,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.recentEmptyTitle,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.recentEmptyBody,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}