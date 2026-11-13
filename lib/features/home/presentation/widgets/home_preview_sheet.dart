import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/l10n/locale_controller.dart';
import '../../../devices/application/device_providers.dart';
import '../../../devices/domain/device_scanner.dart';
import '../controller/home_controller.dart';

Future<void> showHomePreviewSheet(BuildContext context, WidgetRef ref) {
  final controller = ref.read(homeControllerProvider.notifier);
  final locale = ref.read(localeControllerProvider.notifier);
  final fakeBle = ref.read(fakeBleScannerProvider);
  final l10n = context.l10n;

  final stateEntries = <(String, VoidCallback)>[
    ('Empty (new user)', controller.showEmpty),
    ('Connecting', controller.showConnecting),
    ('Connected · stable', controller.showConnected),
    ('Connected · unstable', controller.showUnstable),
    ('Connection lost', controller.showConnectionLost),
  ];

  final languageEntries = <(String, VoidCallback)>[
    (l10n.languageMyanmar, locale.setMyanmar),
    (l10n.languageEnglish, locale.setEnglish),
  ];

  final scannerEntries = <(String, VoidCallback)>[
    (
    'Bluetooth: available',
        () => fakeBle.current = ScannerAvailability.available
    ),
    (
    'Bluetooth: off',
        () => fakeBle.current = ScannerAvailability.adapterOff
    ),
    (
    'Bluetooth: permission denied',
        () => fakeBle.current = ScannerAvailability.permissionDenied
    ),
    (
    'Bluetooth: permanently denied',
        () => fakeBle.current = ScannerAvailability.permissionPermanentlyDenied
    ),
  ];

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
              for (final entry in stateEntries)
                ListTile(
                  title: Text(entry.$1),
                  onTap: () {
                    entry.$2();
                    Navigator.of(sheetContext).pop();
                  },
                ),
              const Divider(height: 1),
              for (final entry in languageEntries)
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(entry.$1),
                  onTap: () {
                    entry.$2();
                    Navigator.of(sheetContext).pop();
                  },
                ),
              const Divider(height: 1),
              for (final entry in scannerEntries)
                ListTile(
                  leading: const Icon(Icons.bluetooth),
                  title: Text(entry.$1),
                  onTap: () {
                    entry.$2();
                    Navigator.of(sheetContext).pop();
                  },
                ),
            ],
          ),
        ),
      );
    },
  );
}