import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../application/history_filter_controller.dart';
import '../../application/history_range.dart';
import '../history_l10n.dart';

Future<void> showHistoryRangeSheet(BuildContext context, WidgetRef ref) async {
  final current = ref.read(historyFilterProvider).range;
  final choice = await showModalBottomSheet<HistoryRangePreset>(
    context: context,
    showDragHandle: true,
    useSafeArea: true,
    backgroundColor: AppColors.surface,
    builder: (_) => _RangeSheet(selected: current.preset),
  );
  if (choice == null || !context.mounted) return;

  final controller = ref.read(historyFilterProvider.notifier);
  if (choice != HistoryRangePreset.custom) {
    controller.setPreset(choice);
    return;
  }

  final now = DateTime.now();
  final from = current.customFrom;
  final to = current.customTo;
  final picked = await showDateRangePicker(
    context: context,
    firstDate: DateTime(now.year - 5),
    lastDate: now,
    initialDateRange:
    from != null && to != null ? DateTimeRange(start: from, end: to) : null,
  );
  if (picked != null) controller.setCustomRange(picked.start, picked.end);
}

class _RangeSheet extends StatelessWidget {
  const _RangeSheet({required this.selected});

  final HistoryRangePreset selected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            l10n.historyRangeTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        for (final preset in HistoryRangePreset.values)
          ListTile(
            title: Text(
              historyPresetLabel(l10n, preset),
              style: const TextStyle(fontSize: 14),
            ),
            trailing: preset == selected
                ? const Icon(Icons.check, color: AppColors.primary, size: 20)
                : preset == HistoryRangePreset.custom
                ? const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.textSecondary,
              size: 20,
            )
                : null,
            onTap: () => Navigator.of(context).pop(preset),
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}