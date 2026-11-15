import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/selectable_chip.dart';
import '../../../weighing/domain/receipt_enums.dart';
import '../../application/history_filter_controller.dart';
import '../history_l10n.dart';
import 'history_range_sheet.dart';

class HistoryFilterBar extends ConsumerWidget {
  const HistoryFilterBar({super.key, this.showRange = true});

  final bool showRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final languageCode = Localizations.localeOf(context).languageCode;
    final filter = ref.watch(historyFilterProvider);
    final controller = ref.read(historyFilterProvider.notifier);
    final rangeActive = !filter.range.isAll;

    return Row(
      children: [
        SelectableChip(
          label: l10n.historyFilterAll,
          selected: filter.type == null,
          onTap: () => controller.setType(null),
        ),
        const SizedBox(width: 8),
        SelectableChip(
          label: l10n.transactionBuy,
          selected: filter.type == ReceiptType.buy,
          onTap: () => controller.setType(ReceiptType.buy),
        ),
        const SizedBox(width: 8),
        SelectableChip(
          label: l10n.transactionSell,
          selected: filter.type == ReceiptType.sell,
          onTap: () => controller.setType(ReceiptType.sell),
        ),
        const Spacer(),
        if (showRange)
          SelectableChip(
            label: historyRangeLabel(l10n, filter.range, languageCode),
            selected: rangeActive,
            variant: ChipVariant.outlined,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            trailing: Icon(
              Icons.chevron_right,
              size: 16,
              color: rangeActive ? AppColors.primary : AppColors.textSecondary,
            ),
            onTap: () => showHistoryRangeSheet(context, ref),
          ),
      ],
    );
  }
}