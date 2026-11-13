import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_header.dart';
import '../../home/presentation/widgets/app_card.dart';
import '../application/category_labeler.dart';
import '../application/items_list_providers.dart';
import '../domain/item.dart';
import 'item_presets.dart';
import 'widgets/item_list_tile.dart';
import 'widgets/item_search_field.dart';
import 'widgets/items_empty_state.dart';
import 'widgets/quick_add_chips.dart';

class ItemsScreen extends ConsumerWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final countAsync = ref.watch(itemCountProvider);
    final itemsAsync = ref.watch(itemsListProvider);
    final query = ref.watch(itemSearchQueryProvider).trim();
    final labeler = ref.watch(categoryLabelerProvider);

    final total = countAsync.valueOrNull;
    final items = itemsAsync.valueOrNull;
    final hasError = countAsync.hasError || itemsAsync.hasError;

    void addItem() => context.push(AppRoutes.itemNew);

    void addPreset(ItemPreset preset) {
      context.push(
        AppRoutes.itemNewWith(
          name: preset.label(l10n),
          code: preset.code,
          category: preset.categoryKey,
        ),
      );
    }

    void retry() {
      ref.invalidate(itemCountProvider);
      ref.invalidate(itemsListProvider);
    }

    final sections = <Widget>[const ItemSearchField()];
    if (total == null || items == null) {
      sections.add(
        hasError ? _LoadError(onRetry: retry) : const _Loading(),
      );
    } else if (total == 0) {
      sections
        ..add(ItemsEmptyState(onAddFirst: addItem))
        ..add(QuickAddChips(onSelected: addPreset));
    } else if (items.isEmpty) {
      sections.add(_NoResults(query: query));
    } else {
      sections.add(
        _ItemsCard(
          items: items,
          labelFor: (item) =>
          item.category == null ? null : labeler(item.category!),
          onTap: (item) => context.push(AppRoutes.itemEditPath(item.id)),
        ),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(
              title: l10n.quickPriceListTitle,
              subtitle: total == null ? null : l10n.itemsCount(total),
              actions: [
                HeaderIconButton(
                  icon: Icons.add,
                  size: 22,
                  tooltip: l10n.itemsAddTooltip,
                  onPressed: addItem,
                ),
              ],
            ),
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

class _ItemsCard extends StatelessWidget {
  const _ItemsCard({
    required this.items,
    required this.labelFor,
    required this.onTap,
  });

  final List<Item> items;
  final String? Function(Item) labelFor;
  final ValueChanged<Item> onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Column(
          children: [
            for (var i = 0; i < items.length; i++) ...[
              if (i > 0) const Divider(height: 1, color: AppColors.border),
              ItemListTile(
                item: items[i],
                categoryLabel: labelFor(items[i]),
                onTap: () => onTap(items[i]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _NoResults extends StatelessWidget {
  const _NoResults({required this.query});

  final String query;

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
            l10n.itemsNoResultsTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.itemsNoResultsBody(query),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
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
            l10n.itemsLoadError,
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