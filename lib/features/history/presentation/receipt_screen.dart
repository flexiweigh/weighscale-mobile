import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_header.dart';
import '../../settings/application/shop_name_controller.dart';
import '../../weighing/application/weighing_providers.dart';
import '../../weighing/presentation/weighing_l10n.dart';
import '../../weighing/presentation/widgets/primary_action_button.dart';
import '../application/receipt_view.dart';
import '../application/receipt_view_providers.dart';
import 'history_l10n.dart';
import 'widgets/receipt_card.dart';

class ReceiptScreen extends ConsumerWidget {
  const ReceiptScreen({
    super.key,
    required this.receiptId,
    this.isFresh = false,
  });

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

    final title = view == null
        ? l10n.receiptHeading
        : l10n.receiptTitle(view.displayNumber);
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
            AppHeader(
              title: title,
              subtitle: subtitle,
              onBack: () => _back(context),
            ),
            Expanded(
              child: async.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) => _Message(
                  text: l10n.receiptLoadError,
                  actionLabel: l10n.commonRetry,
                  onAction: () =>
                      ref.invalidate(receiptByIdProvider(receiptId)),
                ),
                data: (data) => data == null
                    ? _Message(text: l10n.receiptNotFound)
                    : _Content(view: data, shopName: shopName),
              ),
            ),
            if (view != null)
              _ActionBar(
                isFresh: isFresh,
                onPrint: () => ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text(l10n.commonComingSoon)),
                  ),
                onDone: () =>
                isFresh ? context.go(AppRoutes.home) : _back(context),
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
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 52,
                  child: OutlinedButton.icon(
                    onPressed: onPrint,
                    icon: const Icon(Icons.print, size: 20),
                    label: Text(l10n.receiptPrint, overflow: TextOverflow.ellipsis),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
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
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({required this.text, this.actionLabel, this.onAction});

  final String text;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            if (actionLabel != null) ...[
              const SizedBox(height: 12),
              OutlinedButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}