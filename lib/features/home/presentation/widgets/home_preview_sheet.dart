import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/l10n/locale_controller.dart';
import '../../../devices/application/device_providers.dart';
import '../../../devices/application/scale_session_controller.dart';
import '../../../devices/domain/device_scanner.dart';

Future<void> showHomePreviewSheet(BuildContext context, WidgetRef ref) {
  final locale = ref.read(localeControllerProvider.notifier);
  final fakeBle = ref.read(fakeBleScannerProvider);
  final fakeConnector = ref.read(fakeScaleConnectorProvider);
  final session = ref.read(scaleSessionProvider.notifier);
  final l10n = context.l10n;

  final scaleEntries = <(String, VoidCallback)>[
    (
    'Scale: simulate connection lost',
        () => fakeConnector.lastLink?.simulateLoss(),
    ),
    ('Scale: refuse connections', () => fakeConnector.rejectConnections = true),
    ('Scale: accept connections', () => fakeConnector.rejectConnections = false),
    ('Scale: disconnect', () => session.disconnect()),
  ];

  final languageEntries = <(String, VoidCallback)>[
    (l10n.languageMyanmar, locale.setMyanmar),
    (l10n.languageEnglish, locale.setEnglish),
  ];

  final scannerEntries = <(String, VoidCallback)>[
    (
    'Bluetooth: available',
        () => fakeBle.current = ScannerAvailability.available,
    ),
    (
    'Bluetooth: off',
        () => fakeBle.current = ScannerAvailability.adapterOff,
    ),
    (
    'Bluetooth: permission denied',
        () => fakeBle.current = ScannerAvailability.permissionDenied,
    ),
    (
    'Bluetooth: permanently denied',
        () => fakeBle.current = ScannerAvailability.permissionPermanentlyDenied,
    ),
  ];

  Widget group(
      BuildContext sheetContext,
      IconData icon,
      List<(String, VoidCallback)> entries,
      ) {
    return Column(
      children: [
        for (final entry in entries)
          ListTile(
            leading: Icon(icon),
            title: Text(entry.$1),
            onTap: () {
              entry.$2();
              Navigator.of(sheetContext).pop();
            },
          ),
      ],
    );
  }

  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (sheetContext) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              group(sheetContext, Icons.monitor_weight_outlined, scaleEntries),
              const Divider(height: 1),
              group(sheetContext, Icons.language, languageEntries),
              const Divider(height: 1),
              group(sheetContext, Icons.bluetooth, scannerEntries),
            ],
          ),
        ),
      );
    },
  );
}