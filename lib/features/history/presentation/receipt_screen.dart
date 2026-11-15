import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/widgets/app_header.dart';
import '../../settings/application/shop_name_controller.dart';
import '../../weighing/application/weighing_providers.dart';
import '../../weighing/presentation/weighing_l10n.dart';
import '../../weighing/presentation/widgets/primary_action_button.dart';
import '../application/receipt_view.dart';
import '../application/receipt_view_providers.dart';
import 'history_l10n.dart';
import 'widgets/receipt_card.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/bottom_action_bar.dart';
import '../../../core/widgets/secondary_action_button.dart';
import '../../../core/widgets/state_views.dart';

class ReceiptScreen extends ConsumerWidget {
  const ReceiptScreen({super.key, required this.receiptId, this.isFresh = false});

  final String receiptId;
  final bool isFresh;

  void _back(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final languageCode = Localizations.localeOf(context).languageCode;
    final shopName = ref.watch(shopNameControllerProvider);
    final async = ref.watch(receiptViewProvider(receiptId));
    final view = async.valueOrNull;

    final title = view == null ? l10n.receiptHeading : l10n.receiptTitle(view.displayNumber);
    final subtitle = view == null
        ? null
        : l10n.receiptSubtitle(
            view.type.label(l10n),
            formatReceiptDate(view.time, languageCode),
            formatReceiptTime(view.time, languageCode),
          );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(title: title, subtitle: subtitle, onBack: () => _back(context)),
            Expanded(
              child: async.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, _) => CenteredMessage(
                  title: l10n.receiptLoadError,
                  actionLabel: l10n.commonRetry,
                  onAction: () => ref.invalidate(receiptByIdProvider(receiptId)),
                ),
                data: (data) => data == null ? CenteredMessage(title: l10n.receiptNotFound) : _Content(view: data, shopName: shopName),
              ),
            ),
            if (view != null)
              _ActionBar(
                isFresh: isFresh,
                onPrint: () => showAppSnackBar(context, l10n.commonComingSoon),
                onDone: () => isFresh ? context.go(AppRoutes.home) : _back(context),
              ),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.view, required this.shopName});

  final ReceiptView view;
  final String shopName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: ReceiptCard(view: view, shopName: shopName),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.isFresh,
    required this.onPrint,
    required this.onDone,
  });

  final bool isFresh;
  final VoidCallback onPrint;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomActionBar(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SecondaryActionButton(
              label: l10n.receiptPrint,
              icon: Icons.print,
              onPressed: onPrint,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: PrimaryActionButton(
              label: isFresh ? l10n.receiptSaveDone : l10n.receiptDone,
              icon: Icons.check,
              onPressed: onDone,
            ),
          ),
        ],
      ),
    );
  }
}