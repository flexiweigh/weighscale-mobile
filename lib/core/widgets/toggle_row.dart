import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ToggleRow extends StatelessWidget {
  const ToggleRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.compact = false,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          materialTapTargetSize: compact
              ? MaterialTapTargetSize.shrinkWrap
              : MaterialTapTargetSize.padded,
          thumbColor: const WidgetStatePropertyAll(Colors.white),
          trackColor: WidgetStateProperty.resolveWith(
                (states) => states.contains(WidgetState.selected)
                ? AppColors.success
                : AppColors.border,
          ),
          trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
      ],
    );
  }
}