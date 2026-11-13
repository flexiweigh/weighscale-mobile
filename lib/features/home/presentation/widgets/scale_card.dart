import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../state/home_card_states.dart';
import 'app_card.dart';

class ScaleCard extends StatelessWidget {
  const ScaleCard({
    super.key,
    required this.state,
    this.onTare,
    this.onZero,
    this.onPrimaryAction,
  });

  final ScaleCardState state;
  final VoidCallback? onTare;
  final VoidCallback? onZero;
  final VoidCallback? onPrimaryAction;

  @override
  Widget build(BuildContext context) {
    final connected = state.status == ScaleConnectionStatus.connected;
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        children: [
          _Header(state: state),
          const SizedBox(height: 12),
          _WeightDisplay(state: state),
          const SizedBox(height: 12),
          Row(
            children: [
              _SecondaryButton(
                label: l10n.actionTare,
                onPressed: connected ? onTare : null,
              ),
              const SizedBox(width: 8),
              _SecondaryButton(
                label: l10n.actionZero,
                onPressed: connected ? onZero : null,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _PrimaryButton(
                  status: state.status,
                  onPressed: onPrimaryAction,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.state});

  final ScaleCardState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final deviceName = state.deviceName ?? 'Scale';

    final (title, subtitle) = switch (state.status) {
      ScaleConnectionStatus.notConnected => (
      l10n.scaleNoScaleConnected,
      l10n.scalePairHint
      ),
      ScaleConnectionStatus.connecting => (deviceName, l10n.scaleConnecting),
      ScaleConnectionStatus.connected => (
      deviceName,
      l10n.scaleBluetoothProfile(state.profileName ?? '')
      ),
      ScaleConnectionStatus.disconnected => (
      deviceName,
      l10n.scaleConnectionLostReconnecting
      ),
    };

    final (chipLabel, chipTone) = switch (state.status) {
      ScaleConnectionStatus.notConnected => (
      l10n.statusNotConnected,
      AppTone.orange
      ),
      ScaleConnectionStatus.connecting => (l10n.statusConnecting, AppTone.blue),
      ScaleConnectionStatus.connected => (l10n.statusConnected, AppTone.green),
      ScaleConnectionStatus.disconnected => (
      l10n.statusDisconnected,
      AppTone.red
      ),
    };

    final iconTone = switch (state.status) {
      ScaleConnectionStatus.notConnected => AppTone.grey,
      ScaleConnectionStatus.disconnected => AppTone.orange,
      _ => AppTone.blue,
    };
    final iconColors = iconTone.colors;
    final solid = state.status != ScaleConnectionStatus.notConnected;

    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: solid ? iconColors.foreground : iconColors.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.bluetooth,
            size: 18,
            color: solid ? Colors.white : iconColors.foreground,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        StatusChip(label: chipLabel, tone: chipTone),
      ],
    );
  }
}

class _WeightDisplay extends StatelessWidget {
  const _WeightDisplay({required this.state});

  final ScaleCardState state;

  @override
  Widget build(BuildContext context) {
    final live = state.status == ScaleConnectionStatus.connected;
    final textColor = live ? Colors.white : Colors.white.withValues(alpha: 0.35);
    final weightText =
    state.weight == null ? '--.--' : state.weight!.toStringAsFixed(2);

    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.display,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      weightText,
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      state.unit,
                      style: TextStyle(fontSize: 20, color: textColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          _QualityBadge(quality: state.quality),
        ],
      ),
    );
  }
}

class _QualityBadge extends StatelessWidget {
  const _QualityBadge({required this.quality});

  final ReadingQuality quality;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (label, background, foreground) = switch (quality) {
      ReadingQuality.stable => (
      l10n.readingStable,
      AppColors.success,
      Colors.white
      ),
      ReadingQuality.unstable => (
      l10n.readingUnstable,
      AppColors.warning,
      Colors.white
      ),
      ReadingQuality.noSignal => (
      l10n.readingNoSignal,
      Colors.white12,
      Colors.white54
      ),
      ReadingQuality.lastReading => (
      l10n.readingLastReading,
      Colors.white12,
      Colors.white60
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(64, 44),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.status, required this.onPressed});

  final ScaleConnectionStatus status;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (label, icon, enabled) = switch (status) {
      ScaleConnectionStatus.notConnected => (
      l10n.actionConnectScale,
      Icons.bluetooth,
      true
      ),
      ScaleConnectionStatus.connecting => (
      l10n.actionConnecting,
      Icons.bluetooth_searching,
      false
      ),
      ScaleConnectionStatus.connected => (
      l10n.actionStartWeighing,
      Icons.balance,
      true
      ),
      ScaleConnectionStatus.disconnected => (
      l10n.actionReconnectNow,
      Icons.refresh,
      true
      ),
    };

    return FilledButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: Icon(icon, size: 18),
      label: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 44),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}