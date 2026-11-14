import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class NumberKeypad extends StatelessWidget {
  const NumberKeypad({
    super.key,
    required this.onKey,
    required this.onBackspace,
    this.allowDecimal = true,
  });

  final ValueChanged<String> onKey;
  final VoidCallback onBackspace;
  final bool allowDecimal;

  static const _rows = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['.', '0', '<'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final row in _rows)
          Expanded(
            child: Row(
              children: [
                for (final key in row)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: _Key(
                        label: key,
                        enabled: key != '.' || allowDecimal,
                        onTap: key == '<' ? onBackspace : () => onKey(key),
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _Key extends StatelessWidget {
  const _Key({
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(10);
    final isBackspace = label == '<';
    return Material(
      color: isBackspace ? const Color(0xFFE6ECF5) : AppColors.surface,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: enabled ? onTap : null,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: AppColors.border),
          ),
          child: isBackspace
              ? const Icon(
            Icons.backspace_outlined,
            size: 22,
            color: AppColors.textSecondary,
          )
              : Text(
            label,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: enabled ? AppColors.textPrimary : AppColors.border,
            ),
          ),
        ),
      ),
    );
  }
}