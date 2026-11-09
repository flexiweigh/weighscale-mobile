import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_tone.dart';
import '../../../core/utils/date_format.dart';
import 'controller/home_controller.dart';
import 'state/home_card_states.dart';
import 'widgets/app_bottom_nav.dart';
import 'widgets/connection_lost_banner.dart';
import 'widgets/get_started_card.dart';
import 'widgets/home_header.dart';
import 'widgets/home_preview_sheet.dart';
import 'widgets/quick_action_card.dart';
import 'widgets/recent_transactions_card.dart';
import 'widgets/scale_card.dart';
import 'widgets/today_summary_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, this.shopName = 'Main Shop'});

  final String shopName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);

    final VoidCallback? primaryAction = switch (state.scale.status) {
      ScaleConnectionStatus.notConnected => controller.connectScale,
      ScaleConnectionStatus.disconnected => controller.reconnect,
      _ => null,
    };

    final quickActions = [
      const QuickActionItem(
        title: 'Buy',
        subtitle: 'Weigh & pay',
        icon: Icons.south_west,
        tone: AppTone.green,
      ),
      const QuickActionItem(
        title: 'Sell',
        subtitle: 'Weigh & invoice',
        icon: Icons.north_east,
        tone: AppTone.orange,
      ),
      const QuickActionItem(
        title: 'Price List',
        subtitle: 'Items & rates',
        icon: Icons.format_list_bulleted,
        tone: AppTone.purple,
      ),
      QuickActionItem(
        title: 'Reports',
        subtitle: 'Daily & monthly',
        icon: Icons.bar_chart,
        tone: AppTone.teal,
        enabled: state.hasTransactions,
      ),
    ];

    final sections = <Widget>[
      if (state.connectionLost != null)
        ConnectionLostBanner(state: state.connectionLost!),
      ScaleCard(
        state: state.scale,
        onTare: controller.tare,
        onZero: controller.zero,
        onPrimaryAction: primaryAction,
      ),
      if (!state.getStarted.allDone) GetStartedCard(state: state.getStarted),
      QuickActionsGrid(items: quickActions),
      if (state.hasTransactions) TodaySummaryCard(state: state.today),
      RecentTransactionsCard(state: state.recent),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        bottomNavigationBar: const AppBottomNav(currentIndex: 0),
        body: Column(
          children: [
            HomeHeader(
              title: 'FlexiWeigh',
              subtitle: '${formatHeaderDate(DateTime.now())} · $shopName',
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