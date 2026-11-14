import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_tone.dart';
import '../../../core/utils/date_format.dart';
import '../../devices/application/scale_session_controller.dart';
import '../../devices/domain/scale_session.dart';
import '../../history/application/history_providers.dart';
import '../../settings/application/shop_name_controller.dart';
import 'connect_scale_flow.dart';
import 'controller/home_data_providers.dart';
import 'state/home_card_states.dart';
import 'state/scale_card_mapper.dart';
import 'widgets/connection_lost_banner.dart';
import 'widgets/get_started_card.dart';
import 'widgets/home_header.dart';
import 'widgets/home_preview_sheet.dart';
import 'widgets/quick_action_card.dart';
import 'widgets/recent_transactions_card.dart';
import 'widgets/scale_card.dart';
import 'widgets/today_summary_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(scaleSessionProvider);
    final scaleController = ref.read(scaleSessionProvider.notifier);
    final shopName = ref.watch(shopNameControllerProvider);
    final overall = ref.watch(historyOverallCountProvider).valueOrNull;
    final recent = ref.watch(recentReceiptsProvider).valueOrNull;
    final today = ref.watch(todaySummaryProvider);
    final getStarted = ref.watch(getStartedProvider);
    final l10n = context.l10n;
    final languageCode = Localizations.localeOf(context).languageCode;
    final hasTransactions = (overall ?? 0) > 0;

    final scale = scaleCardStateOf(session, unnamedLabel: l10n.deviceUnnamed);
    final connectionLost = session.status == ScaleStatus.lost
        ? ConnectionLostState(
      attempt: session.reconnectAttempt,
      maxAttempts: ScaleSession.maxReconnectAttempts,
    )
        : null;

    final VoidCallback? primaryAction = switch (scale.status) {
      ScaleConnectionStatus.notConnected =>
          () => runConnectScaleFlow(context, ref),
      ScaleConnectionStatus.disconnected => scaleController.reconnect,
      ScaleConnectionStatus.connected => () => context.go(AppRoutes.weigh),
      ScaleConnectionStatus.connecting => null,
    };

    final quickActions = [
      QuickActionItem(
        title: l10n.quickBuyTitle,
        subtitle: l10n.quickBuySubtitle,
        icon: Icons.south_west,
        tone: AppTone.green,
        onTap: () => context.push(AppRoutes.weighWith('buy')),
      ),
      QuickActionItem(
        title: l10n.quickSellTitle,
        subtitle: l10n.quickSellSubtitle,
        icon: Icons.north_east,
        tone: AppTone.orange,
        onTap: () => context.push(AppRoutes.weighWith('sell')),
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
        enabled: hasTransactions,
        onTap: () => context.push(AppRoutes.reports),
      ),
    ];

    final sections = <Widget>[
      if (connectionLost != null)
        ConnectionLostBanner(
          state: connectionLost,
          onManualEntry: () => context.push(AppRoutes.manualEntry),
        ),
      ScaleCard(
        state: scale,
        onTare: scaleController.tare,
        onZero: scaleController.zero,
        onPrimaryAction: primaryAction,
      ),
      if (getStarted != null && !getStarted.allDone)
        GetStartedCard(
          state: getStarted,
          onStepTap: (id) => switch (id) {
            GetStartedStepId.connectScale => runConnectScaleFlow(context, ref),
            GetStartedStepId.addItems => context.go(AppRoutes.items),
            GetStartedStepId.firstWeighing => context.go(AppRoutes.weigh),
          },
        ),
      QuickActionsGrid(items: quickActions),
      if (hasTransactions)
        TodaySummaryCard(
          state: today,
          onFullReport: () => context.push(AppRoutes.reports),
        ),
      if (recent != null)
        RecentTransactionsCard(
          receipts: recent,
          onSeeAll: () => context.go(AppRoutes.history),
          onTransactionTap: (receipt) =>
              context.push(AppRoutes.transactionDetail(receipt.id)),
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