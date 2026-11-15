import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';

enum ChipVariant { solid, tinted, outlined }

class SelectableChip extends StatelessWidget {
  const SelectableChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.variant = ChipVariant.solid,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    this.center = false,
    this.trailing,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final ChipVariant variant;
  final EdgeInsetsGeometry padding;
  final bool center;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final Color fill;
    final Color borderColor;
    final Color textColor;
    var borderWidth = 1.0;

    switch (variant) {
      case ChipVariant.solid:
        fill = selected ? AppColors.primary : AppColors.surface;
        borderColor = selected ? AppColors.primary : AppColors.border;
        textColor = selected ? Colors.white : AppColors.textPrimary;
      case ChipVariant.tinted:
        fill = selected ? AppColors.selectedTint : AppColors.surface;
        borderColor = selected ? AppColors.primary : AppColors.border;
        textColor = selected ? AppColors.primary : AppColors.textPrimary;
        if (selected) borderWidth = 1.5;
      case ChipVariant.outlined:
        fill = AppColors.surface;
        borderColor = selected ? AppColors.primary : AppColors.border;
        textColor = selected ? AppColors.primary : AppColors.textPrimary;
    }

    final text = Text(
      label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
    );

    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: fill,
        borderRadius: AppRadius.control,
        child: InkWell(
          borderRadius: AppRadius.control,
          onTap: onTap,
          child: Container(
            alignment: center ? Alignment.center : null,
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: AppRadius.control,
              border: Border.all(color: borderColor, width: borderWidth),
            ),
            child: trailing == null
                ? text
                : Row(
              mainAxisSize: MainAxisSize.min,
              children: [text, const SizedBox(width: 4), trailing!],
            ),
          ),
        ),
      ),
    );
  }
}