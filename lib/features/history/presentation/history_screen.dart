import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_header.dart';
import '../application/history_filter_controller.dart';
import '../application/history_providers.dart';
import 'history_l10n.dart';
import 'widgets/history_day_section.dart';
import 'widgets/history_empty_state.dart';
import 'widgets/history_filter_bar.dart';
import 'widgets/history_search_field.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final languageCode = Localizations.localeOf(context).languageCode;
    final listAsync = ref.watch(historyListProvider);
    final overallAsync = ref.watch(historyOverallCountProvider);
    final todayAsync = ref.watch(historyTodayTotalsProvider);

    final data = listAsync.valueOrNull;
    final overall = overallAsync.valueOrNull;
    final hasError = listAsync.hasError || overallAsync.hasError;
    final now = DateTime.now();

    String? subtitle;
    if (overall != null) {
      subtitle = overall == 0
          ? l10n.recentEmptyTitle
          : l10n.historySubtitle(todayAsync.valueOrNull?.transactions ?? 0);
    }

    void retry() {
      ref.invalidate(historyListProvider);
      ref.invalidate(historyOverallCountProvider);
    }

    final sections = <Widget>[
      const HistorySearchField(),
      HistoryFilterBar(showRange: (overall ?? 0) > 0),
    ];

    if (overall == null || data == null) {
      sections.add(hasError ? _LoadError(onRetry: retry) : const _Loading());
    } else if (overall == 0) {
      sections.add(
        HistoryEmptyState(onStart: () => context.go(AppRoutes.weigh)),
      );
    } else if (data.isEmpty) {
      sections.add(
        _NoResults(onClear: ref.read(historyFilterProvider.notifier).resetFilters),
      );
    } else {
      for (final group in data.groups) {
        sections.add(
          HistoryDaySection(
            group: group,
            label: historyDayLabel(l10n, group, now, languageCode),
            onTap: (receipt) =>
                context.push(AppRoutes.transactionDetail(receipt.id)),
          ),
        );
      }
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(title: l10n.navHistory, subtitle: subtitle),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
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

class _NoResults extends StatelessWidget {
  const _NoResults({required this.onClear});

  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          const Icon(
            Icons.search_off,
            size: 36,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.historyNoResultsTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.historyNoResultsBody,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: onClear,
            child: Text(l10n.historyClearFilters),
          ),
        ],
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 48),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _LoadError extends StatelessWidget {
  const _LoadError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Text(
            l10n.historyLoadError,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: onRetry, child: Text(l10n.commonRetry)),
        ],
      ),
    );
  }
}