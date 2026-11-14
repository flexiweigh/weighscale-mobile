import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/widgets/empty_state.dart';

class ItemsEmptyState extends StatelessWidget {
  const ItemsEmptyState({super.key, required this.onAddFirst});

  final VoidCallback onAddFirst;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return EmptyState(
      icon: Icons.sell_outlined,
      title: l10n.itemsEmptyTitle,
      body: l10n.itemsEmptyBody,
      actionLabel: l10n.itemsAddFirst,
      actionIcon: Icons.add,
      onAction: onAddFirst,
    );
  }
}