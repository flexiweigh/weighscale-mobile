import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_tone.dart';
import '../../domain/device_scanner.dart';
import '../../domain/discovered_device.dart';
import '../../domain/discovery_state.dart';
import '../device_l10n.dart';

class DiscoveryBanner extends StatelessWidget {
  const DiscoveryBanner({
    super.key,
    required this.discovery,
    required this.fixFor,
    required this.onFix,
    this.busy = false,
  });

  final DiscoveryState discovery;
  final AccessFix Function(DeviceTransport, ScannerAvailability) fixFor;
  final ValueChanged<DeviceTransport> onFix;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final count = discovery.devices.length;
    final allUnavailable = discovery.status == DiscoveryStatus.unavailable;
    final colors = (allUnavailable ? AppTone.orange : AppTone.blue).colors;
    final warningColors = AppTone.orange.colors;

    final rows = [
      for (final entry in discovery.unavailable.entries)
        _UnavailableRow(
          message: entry.value.message(l10n, entry.key),
          fixLabel: fixFor(entry.key, entry.value).label(l10n),
          color: allUnavailable ? colors.foreground : warningColors.foreground,
          busy: busy,
          onFix: () => onFix(entry.key),
        ),
    ];

    if (allUnavailable) {
      return Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: rows,
        ),
      );
    }

    final headline = discovery.isScanning
        ? l10n.connectScanning(count)
        : l10n.connectFinished(count);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (discovery.isScanning) ...[
                SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colors.foreground,
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  headline,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: colors.foreground,
                  ),
                ),
              ),
            ],
          ),
        ),
        ...rows,
      ],
    );
  }
}

class _UnavailableRow extends StatelessWidget {
  const _UnavailableRow({
    required this.message,
    required this.fixLabel,
    required this.color,
    required this.busy,
    required this.onFix,
  });

  final String message;
  final String? fixLabel;
  final Color color;
  final bool busy;
  final VoidCallback onFix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 12, height: 1.4, color: color),
            ),
          ),
          if (fixLabel != null)
            TextButton(
              onPressed: busy ? null : onFix,
              style: TextButton.styleFrom(foregroundColor: color),
              child: busy
                  ? SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: color,
                ),
              )
                  : Text(
                fixLabel!,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
        ],
      ),
    );
  }
}