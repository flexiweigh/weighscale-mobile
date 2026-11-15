import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/number_format.dart';
import '../../../../core/widgets/app_card.dart';
import '../../application/history_list.dart';
import '../../domain/receipt_summary.dart';
import 'receipt_tile.dart';
import '../../../../core/theme/app_dimens.dart';

class HistoryDaySection extends StatelessWidget {
  const HistoryDaySection({
    super.key,
    required this.group,
    required this.label,
    required this.onTap,
  });

  final HistoryDayGroup group;
  final String label;
  final ValueChanged<ReceiptSummary> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final receipts = group.receipts;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: label,
          trailingText: l10n.moneyKs(formatThousands(group.totalAmount)),
        ),
        const SizedBox(height: 8),
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
                    onTap: () => onTap(receipts[i]),
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