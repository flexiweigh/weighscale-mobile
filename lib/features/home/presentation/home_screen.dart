import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_tone.dart';
import '../../../core/utils/date_format.dart';
import '../../settings/application/shop_name_controller.dart';
import 'connect_scale_flow.dart';
import 'controller/home_controller.dart';
import 'state/home_card_states.dart';
import 'widgets/connection_lost_banner.dart';
import 'widgets/get_started_card.dart';
import 'widgets/home_header.dart';
import 'widgets/home_preview_sheet.dart';
import 'widgets/quick_action_card.dart';
import 'widgets/recent_transactions_card.dart';
import 'widgets/scale_card.dart';
import 'widgets/today_summary_card.dart';
import '../../devices/presentation/connect_scale_sheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, this.shopName = 'Main Shop'});

  final String shopName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);
    final shopName = ref.watch(shopNameControllerProvider);
    final l10n = context.l10n;
    final languageCode = Localizations.localeOf(context).languageCode;

    final VoidCallback? primaryAction = switch (state.scale.status) {
      ScaleConnectionStatus.notConnected => () =>runConnectScaleFlow(context, ref),
      ScaleConnectionStatus.disconnected => controller.reconnect,
      ScaleConnectionStatus.connected => () => context.go(AppRoutes.weigh),
      ScaleConnectionStatus.connecting => null,
    };

    final quickActions = [
      QuickActionItem(
        title: l10n.quickBuyTitle,
        subtitle: l10n.quickBuySubtitle,
        icon: Icons.south_west,
        tone: AppTone.green,
        onTap: () => context.go(AppRoutes.weighWith('buy')),
      ),
      QuickActionItem(
        title: l10n.quickSellTitle,
        subtitle: l10n.quickSellSubtitle,
        icon: Icons.north_east,
        tone: AppTone.orange,
        onTap: () => context.go(AppRoutes.weighWith('sell')),
      ),
      QuickActionItem(
        title: l10n.quickPriceListTitle,
        subtitle: l10n.quickPriceListSubtitle,
        icon: Icons.format_list_bulleted,
        tone: AppTone.purple,
        onTap: () => context.go(AppRoutes.items),
      ),
      QuickActionItem(
        title: l10n.quickReportsTitle,
        subtitle: l10n.quickReportsSubtitle,
        icon: Icons.bar_chart,
        tone: AppTone.teal,
        enabled: state.hasTransactions,
        onTap: () => context.push(AppRoutes.reports),
      ),
    ];

    final sections = <Widget>[
      if (state.connectionLost != null)
        ConnectionLostBanner(
          state: state.connectionLost!,
          onManualEntry: () => context.push(AppRoutes.manualEntry),
        ),
      ScaleCard(
        state: state.scale,
        onTare: controller.tare,
        onZero: controller.zero,
        onPrimaryAction: primaryAction,
      ),
      if (!state.getStarted.allDone)
        GetStartedCard(
          state: state.getStarted,
          onStepTap: (id) => switch (id) {
            GetStartedStepId.connectScale => runConnectScaleFlow(context, ref),
            GetStartedStepId.addItems => context.go(AppRoutes.items),
            GetStartedStepId.firstWeighing => context.go(AppRoutes.weigh),
          },
        ),
      QuickActionsGrid(items: quickActions),
      if (state.hasTransactions)
        TodaySummaryCard(
          state: state.today,
          onFullReport: () => context.push(AppRoutes.reports),
        ),
      RecentTransactionsCard(
        state: state.recent,
        onSeeAll: () => context.go(AppRoutes.history),
        onTransactionTap: (item) =>
            context.push(AppRoutes.transactionDetail(item.id)),
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            HomeHeader(
              title: 'FlexiWeigh',
              subtitle:
              '${formatHeaderDate(DateTime.now(), languageCode)} · $shopName',
              onNotifications: () {},
              onSettings: () => context.go(AppRoutes.settings),
              onTitleLongPress:
              kDebugMode ? () => showHomePreviewSheet(context, ref) : null,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: sections.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (_, index) => sections[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}