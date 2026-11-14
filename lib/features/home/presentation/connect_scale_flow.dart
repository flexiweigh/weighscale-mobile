import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../devices/presentation/connect_scale_sheet.dart';

Future<void> runConnectScaleFlow(BuildContext context, WidgetRef ref) {
  return showConnectScaleSheet(
    context,
    onEnterManually: () => context.push(AppRoutes.manualEntry),
  );
}