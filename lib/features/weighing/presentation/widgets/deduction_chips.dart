import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../items/domain/item_enums.dart';
import '../../domain/deduction_preset.dart';
import '../../domain/deduction_preset_unit.dart';
import '../weighing_l10n.dart';

class DeductionChips extends StatelessWidget {
  const DeductionChips({
    super.key,
    required this.presets,
    required this.unit,
    required this.deductionMilli,
    required this.onPreset,
    required this.onNone,
  });

  final List<DeductionPreset> presets;
  final WeightUnit unit;
  final int deductionMilli;
  final ValueChanged<DeductionPreset> onPreset;
  final VoidCallback onNone;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selectedId = matchingPresetId(presets, deductionMilli, unit);

    final chips = <Widget>[
      for (final preset in presets)
        _Chip(
          label:
          '${deductionPresetLabel(l10n, preset)} ${compactWeightMilli(preset.weightMilliIn(unit))}',
          selected: preset.id == selectedId,
          onTap: () => onPreset(preset),
        ),
      _Chip(
        label: l10n.weighingDeductionNone,
        selected: deductionMilli <= 0,
        onTap: onNone,
      ),
    ];

    if (chips.length <= 4) {
      return Row(
        children: [
          for (var i = 0; i < chips.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(child: chips[i]),
          ],
        ],
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < chips.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            chips[i],
          ],
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(10);
    return Material(
      color: selected ? const Color(0xFFE6EEFC) : AppColors.surface,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: selected ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}