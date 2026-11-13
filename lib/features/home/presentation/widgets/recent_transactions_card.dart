import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../../../core/utils/number_format.dart';
import '../state/home_card_states.dart';
import 'app_card.dart';

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({
    super.key,
    required this.state,
    this.onSeeAll,
    this.onTransactionTap,
  });

  final RecentTransactionsState state;
  final VoidCallback? onSeeAll;
  final ValueChanged<TransactionItemState>? onTransactionTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.recentTitle,
          actionLabel: state.isEmpty ? null : l10n.recentSeeAll,
          onAction: onSeeAll,
        ),
        const SizedBox(height: 8),
        if (state.isEmpty)
          const _EmptyTransactions()
        else
          AppCard(
            padding: EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Column(
                children: [
                  for (var i = 0; i < state.items.length; i++) ...[
                    if (i > 0)
                      const Divider(height: 1, color: AppColors.border),
                    _TransactionTile(
                      item: state.items[i],
                      onTap: onTransactionTap == null
                          ? null
                          : () => onTransactionTap!(state.items[i]),
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

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({required this.item, this.onTap});

  final TransactionItemState item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isBuy = item.type == TransactionType.buy;
    final colors = (isBuy ? AppTone.green : AppTone.orange).colors;
    final weightText = l10n.weightKgValue(formatThousands(item.weight, decimals: 1));

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                isBuy ? Icons.south_west : Icons.north_east,
                size: 18,
                color: colors.foreground,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.party} · ${item.item}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '#${item.number} · ${item.time} · $weightText',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  l10n.moneyKs(formatThousands(item.amount)),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  isBuy ? l10n.transactionBuy : l10n.transactionSell,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: colors.foreground,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyTransactions extends StatelessWidget {
  const _EmptyTransactions();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CustomPaint(
      painter: _DashedBorderPainter(color: AppColors.border, radius: 14),
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
                borderRadius: BorderRadius.circular(10),
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

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius)),
      );
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        canvas.drawPath(metric.extractPath(distance, distance + 5), paint);
        distance += 9;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.radius != radius;
}