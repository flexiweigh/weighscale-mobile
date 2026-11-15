import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_text.dart';
import '../../../../core/widgets/segmented_choice.dart';
import '../../domain/item_enums.dart';
import '../item_l10n.dart';

class UnitSelector extends StatelessWidget {
  const UnitSelector({super.key, required this.value, required this.onChanged});

  final WeightUnit value;
  final ValueChanged<WeightUnit> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.fieldWeighingUnit, style: AppText.caption),
        const SizedBox(height: 6),
        SegmentedChoice<WeightUnit>(
          values: WeightUnit.values,
          value: value,
          labelOf: (unit) => unit.label(l10n),
          onChanged: onChanged,
        ),
      ],
    );
  }
}