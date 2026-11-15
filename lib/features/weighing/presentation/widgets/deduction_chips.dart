import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/widgets/selectable_chip.dart';
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

    Widget chip(String label, bool selected, VoidCallback onTap) {
      return SelectableChip(
        label: label,
        selected: selected,
        onTap: onTap,
        variant: ChipVariant.tinted,
        center: true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
    }

    final chips = <Widget>[
      for (final preset in presets)
        chip(
          '${deductionPresetLabel(l10n, preset)} ${compactWeightMilli(preset.weightMilliIn(unit))}',
          preset.id == selectedId,
              () => onPreset(preset),
        ),
      chip(l10n.weighingDeductionNone, deductionMilli <= 0, onNone),
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