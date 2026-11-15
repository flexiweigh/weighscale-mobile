import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../../../core/utils/number_format.dart';
import '../../../weighing/domain/receipt_enums.dart';
import '../../domain/receipt_summary.dart';
import '../history_l10n.dart';
import '../../../../core/theme/app_dimens.dart';

class ReceiptTile extends StatelessWidget {
  const ReceiptTile({super.key, required this.receipt, this.onTap});

  final ReceiptSummary receipt;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = Localizations.localeOf(context).languageCode;
    final isBuy = receipt.type == ReceiptType.buy;
    final colors = (isBuy ? AppTone.green : AppTone.orange).colors;

    final itemLabel = receipt.extraItemCount > 0
        ? '${receipt.firstItemName} +${receipt.extraItemCount}'
        : receipt.firstItemName;
    final title = receipt.hasParty
        ? '${receipt.partyName!.trim()} · $itemLabel'
        : itemLabel;
    final weightText = l10n.weightKgValue(
      formatThousands(receipt.totalWeightKgMilli / 1000, decimals: 1),
    );
    final time = formatReceiptTime(receipt.completedAt, languageCode);

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
                borderRadius: AppRadius.control,
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
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '#${receipt.displayNumber} · $time · $weightText',
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
                  l10n.moneyKs(formatThousands(receipt.totalAmount)),
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