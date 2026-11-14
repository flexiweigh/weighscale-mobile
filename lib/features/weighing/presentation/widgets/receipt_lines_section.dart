import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../../home/presentation/widgets/app_card.dart';
import '../../../items/presentation/item_l10n.dart';
import '../../domain/receipt.dart';
import '../../domain/receipt_line.dart';
import '../../domain/weight_units.dart';

class ReceiptLinesSection extends StatelessWidget {
  const ReceiptLinesSection({
    super.key,
    required this.receipt,
    required this.onRemove,
  });

  final Receipt receipt;
  final ValueChanged<ReceiptLine> onRemove;

  Future<bool> _confirmRemove(BuildContext context) async {
    final l10n = context.l10n;
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.weighingRemoveTitle),
        content: Text(l10n.weighingRemoveBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.commonRemove),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final lines = receipt.lines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.weighingReceiptLines(lines.length),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        if (lines.isEmpty)
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Text(
              l10n.weighingNoLines,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          )
        else
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                for (var i = 0; i < lines.length; i++) ...[
                  if (i > 0) const Divider(height: 1, color: AppColors.border),
                  Dismissible(
                    key: ValueKey(lines[i].id),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (_) async {
                      if (await _confirmRemove(context)) onRemove(lines[i]);
                      return false;
                    },
                    background: Container(
                      color: AppColors.danger,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                    ),
                    child: _LineRow(line: lines[i]),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

class _LineRow extends StatelessWidget {
  const _LineRow({required this.line});

  final ReceiptLine line;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final decimals = line.unit.displayDecimals;
    final unitLabel = line.unit.label(l10n);
    final detail = line.deductionMilli > 0
        ? l10n.weighingLineGross(
      formatWeightMilli(line.grossWeightMilli, decimals: decimals),
      formatWeightMilli(line.deductionMilli, decimals: decimals),
      formatWeightMilli(line.netWeightMilli, decimals: decimals),
      unitLabel,
    )
        : l10n.weighingLineRate(
      formatWeightMilli(line.netWeightMilli, decimals: decimals),
      unitLabel,
      formatMoney(line.unitPrice),
    );

    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        line.itemName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    if (line.isManual) ...[
                      const SizedBox(width: 8),
                      StatusChip(
                        label: l10n.weighingManualBadge,
                        tone: AppTone.orange,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  detail,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            l10n.moneyKs(formatMoney(line.amount)),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}