import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/widgets/toggle_row.dart';
import 'item_text_field.dart';

class StatusField extends StatelessWidget {
  const StatusField({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onChanged(!value),
      child: InputDecorator(
        decoration: itemInputDecoration(
          label: l10n.fieldStatus,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: AppSwitch(value: value, onChanged: onChanged, compact: true),
          ),
          suffixIconConstraints: const BoxConstraints(),
        ),
        child: Text(
          value ? l10n.statusActive : l10n.statusInactive,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: itemFieldTextStyle,
        ),
      ),
    );
  }
}