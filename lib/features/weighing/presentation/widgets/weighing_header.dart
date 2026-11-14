import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/widgets/app_header.dart';
import '../../application/weighing_state.dart';
import '../weighing_l10n.dart';

class WeighingHeader extends StatelessWidget {
  const WeighingHeader({
    super.key,
    required this.title,
    required this.state,
    required this.onBack,
    this.scaleInSubtitle = false,
  });

  final String title;
  final WeighingState state;
  final VoidCallback onBack;
  final bool scaleInSubtitle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final typeLabel = state.type.label(l10n);
    final number = state.receipt?.displayNumber;
    final base = number == null
        ? typeLabel
        : l10n.weighingReceiptSubtitle(typeLabel, number);
    final subtitle = scaleInSubtitle && !state.scale.isConnected
        ? '$base · ${l10n.weighingScaleNotConnected}'
        : base;

    return AppHeader(
      title: title,
      subtitle: subtitle,
      onBack: onBack,
      actions: [
        if (!scaleInSubtitle) _ScaleChip(state: state),
      ],
    );
  }
}

class _ScaleChip extends StatelessWidget {
  const _ScaleChip({required this.state});

  final WeighingState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final connected = state.scale.isConnected;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: connected
                  ? const Color(0xFF5BE38F)
                  : Colors.white.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            connected
                ? (state.scale.deviceName ?? l10n.statusConnected)
                : l10n.statusNotConnected,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}