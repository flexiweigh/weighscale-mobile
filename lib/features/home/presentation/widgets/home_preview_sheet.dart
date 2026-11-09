import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/home_controller.dart';

Future<void> showHomePreviewSheet(BuildContext context, WidgetRef ref) {
  final controller = ref.read(homeControllerProvider.notifier);

  final entries = <(String, VoidCallback)>[
    ('Empty (new user)', controller.showEmpty),
    ('Connecting', controller.showConnecting),
    ('Connected · stable', controller.showConnected),
    ('Connected · unstable', controller.showUnstable),
    ('Connection lost', controller.showConnectionLost),
  ];

  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (sheetContext) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final entry in entries)
              ListTile(
                title: Text(entry.$1),
                onTap: () {
                  entry.$2();
                  Navigator.of(sheetContext).pop();
                },
              ),
          ],
        ),
      );
    },
  );
}