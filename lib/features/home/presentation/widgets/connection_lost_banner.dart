import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../state/home_card_states.dart';

class ConnectionLostBanner extends StatelessWidget {
  const ConnectionLostBanner({
    super.key,
    required this.state,
    this.onManualEntry,
  });

  final ConnectionLostState state;
  final VoidCallback? onManualEntry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = AppTone.red.colors;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: colors.foreground, size: 26),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.connectionLostTitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: colors.foreground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.connectionLostBody(state.attempt, state.maxAttempts),
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.3,
                    color: colors.foreground,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: onManualEntry,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.textPrimary,
              side: BorderSide(color: colors.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(l10n.actionManualEntry),
          ),
        ],
      ),
    );
  }
}