import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../domain/discovered_device.dart';
import '../device_l10n.dart';

class DeviceRow extends StatelessWidget {
  const DeviceRow({
    super.key,
    required this.device,
    required this.highlighted,
    required this.isConnecting,
    required this.enabled,
    this.onConnect,
  });

  final DiscoveredDevice device;
  final bool highlighted;
  final bool isConnecting;
  final bool enabled;
  final VoidCallback? onConnect;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final iconColors = (highlighted ? AppTone.blue : AppTone.grey).colors;

    final details = <String>[
      l10n.deviceSignal(device.signal.label(l10n)),
      if (device.detail != null)
        device.transport == DeviceTransport.ble
            ? l10n.deviceService(device.detail!)
            : device.detail!,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: highlighted
                  ? iconColors.foreground
                  : const Color(0xFF8A94A6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(device.transport.icon, size: 18, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.isNamed ? device.name! : l10n.deviceUnnamed,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  details.join(' · '),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _ConnectButton(
            highlighted: highlighted,
            isConnecting: isConnecting,
            onPressed: enabled ? onConnect : null,
          ),
        ],
      ),
    );
  }
}

class _ConnectButton extends StatelessWidget {
  const _ConnectButton({
    required this.highlighted,
    required this.isConnecting,
    required this.onPressed,
  });

  final bool highlighted;
  final bool isConnecting;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
    const size = Size(88, 40);

    final child = isConnecting
        ? SizedBox(
      width: 18,
      height: 18,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: highlighted ? Colors.white : AppColors.primary,
      ),
    )
        : Text(l10n.actionConnect, maxLines: 1, overflow: TextOverflow.ellipsis);

    if (highlighted) {
      return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          minimumSize: size,
          backgroundColor: AppColors.primary,
          disabledBackgroundColor:
          isConnecting ? AppColors.primary : AppColors.border,
          shape: shape,
        ),
        child: child,
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: size,
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.border),
        shape: shape,
      ),
      child: child,
    );
  }
}