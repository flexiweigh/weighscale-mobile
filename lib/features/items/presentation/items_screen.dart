import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_header.dart';
import '../application/category_labeler.dart';
import '../application/items_list_providers.dart';
import '../domain/item.dart';
import 'item_presets.dart';
import 'widgets/item_list_tile.dart';
import 'widgets/item_search_field.dart';
import 'widgets/items_empty_state.dart';
import 'widgets/quick_add_chips.dart';
import '../../../core/widgets/state_views.dart';

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
        hasError
            ? ErrorView(message: l10n.itemsLoadError, onRetry: retry)
            : const LoadingView(),
      );
    } else if (total == 0) {
      sections
        ..add(ItemsEmptyState(onAddFirst: addItem))
        ..add(QuickAddChips(onSelected: addPreset));
    } else if (items.isEmpty) {
      sections.add(
        NoResultsView(
          title: l10n.itemsNoResultsTitle,
          body: l10n.itemsNoResultsBody(query),
        ),
      );
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