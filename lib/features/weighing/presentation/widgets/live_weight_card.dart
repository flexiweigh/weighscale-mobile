import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../items/domain/item_enums.dart';
import '../../../items/presentation/item_l10n.dart';
import '../../application/weighing_state.dart';
import '../../domain/weight_units.dart';

class LiveWeightCard extends StatelessWidget {
  const LiveWeightCard({
    super.key,
    required this.state,
    required this.onTare,
    required this.onZero,
    required this.onAutoCapture,
  });

  final WeighingState state;
  final VoidCallback onTare;
  final VoidCallback onZero;
  final ValueChanged<bool> onAutoCapture;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final connected = state.scale.isConnected;
    final unit = state.unit;
    final weightText = connected
        ? formatWeightMilli(state.liveGrossMilli, decimals: unit.displayDecimals)
        : '--';

    final Color statusColor;
    final String statusLabel;
    if (!connected) {
      statusColor = const Color(0xFF6B7587);
      statusLabel = l10n.readingNoSignal;
    } else if (state.isStable) {
      statusColor = AppColors.success;
      statusLabel = l10n.readingStable;
    } else {
      statusColor = AppColors.warning;
      statusLabel = l10n.readingUnstable;
    }

    final check = connected && state.item?.showWeightCheck == true
        ? state.weightCheck
        : null;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.display,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.weighingLiveWeight,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ),
              if (check != null) ...[
                _Pill(
                  label: switch (check) {
                    WeightCheckResult.under => l10n.checkUnder,
                    WeightCheckResult.ok => l10n.checkOk,
                    WeightCheckResult.over => l10n.checkOver,
                  },
                  color: switch (check) {
                    WeightCheckResult.ok => AppColors.success,
                    WeightCheckResult.under => AppColors.warning,
                    WeightCheckResult.over => AppColors.danger,
                  },
                ),
                const SizedBox(width: 6),
              ],
              _Pill(label: statusLabel, color: statusColor),
            ],
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  weightText,
                  style: TextStyle(
                    fontSize: 44,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                    color: connected
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.4),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  unit.label(l10n),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _DarkButton(
                label: l10n.actionTare,
                onTap: connected ? onTare : null,
              ),
              const SizedBox(width: 8),
              _DarkButton(
                label: l10n.actionZero,
                onTap: connected ? onZero : null,
              ),
              const Spacer(),
              Text(
                l10n.weighingAutoCapture,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.65),
                ),
              ),
              const SizedBox(width: 4),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: state.autoCapture,
                  onChanged: onAutoCapture,
                  thumbColor: const WidgetStatePropertyAll(Colors.white),
                  trackOutlineColor:
                  const WidgetStatePropertyAll(Colors.transparent),
                  trackColor: WidgetStateProperty.resolveWith(
                        (states) => states.contains(WidgetState.selected)
                        ? AppColors.success
                        : const Color(0xFF2D4A78),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _DarkButton extends StatelessWidget {
  const _DarkButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(10);
    return Opacity(
      opacity: onTap == null ? 0.4 : 1,
      child: Material(
        color: const Color(0xFF1B3358),
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: radius,
              border: Border.all(color: const Color(0xFF2D4A78)),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}