import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/item_enums.dart';
import '../item_l10n.dart';

class UnitSelector extends StatelessWidget {
  const UnitSelector({super.key, required this.value, required this.onChanged});

  final WeightUnit value;
  final ValueChanged<WeightUnit> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const units = WeightUnit.values;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.fieldWeighingUnit,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  for (var i = 0; i < units.length; i++) ...[
                    if (i > 0)
                      const VerticalDivider(width: 1, color: AppColors.border),
                    Expanded(
                      child: _Segment(
                        label: units[i].label(l10n),
                        selected: units[i] == value,
                        onTap: () => onChanged(units[i]),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? AppColors.primary : AppColors.surface,
        child: InkWell(
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 44),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}