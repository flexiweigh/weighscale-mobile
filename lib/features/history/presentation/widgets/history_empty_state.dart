import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/widgets/empty_state.dart';

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return EmptyState(
      icon: Icons.receipt_long_outlined,
      title: l10n.recentEmptyTitle,
      body: l10n.historyEmptyBody,
      actionLabel: l10n.actionStartWeighing,
      actionIcon: Icons.balance,
      onAction: onStart,
    );
  }
}