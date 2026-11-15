import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../items/domain/item_enums.dart';
import '../../application/weighing_state.dart';
import 'primary_action_button.dart';

class ConfirmWeightButton extends StatelessWidget {
  const ConfirmWeightButton({
    super.key,
    required this.state,
    required this.onConfirm,
  });

  final WeighingState state;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final connected = state.scale.isConnected;
    final check = connected && state.item?.showWeightCheck == true
        ? state.weightCheck
        : null;
    final waiting = connected && !state.isStable;
    final outOfRange =
        check == WeightCheckResult.under || check == WeightCheckResult.over;

    final String label;
    if (waiting) {
      label = l10n.weighingWaitingStable;
    } else if (outOfRange && state.canConfirm) {
      label = l10n.weighingConfirmAnyway;
    } else {
      label = l10n.weighingConfirm;
    }

    final color = switch (check) {
      WeightCheckResult.over => AppColors.danger,
      WeightCheckResult.under => AppColors.warning,
      _ => AppColors.primary,
    };

    return PrimaryActionButton(
      label: label,
      icon: waiting ? null : Icons.check,
      color: color,
      isBusy: state.isSaving,
      onPressed: state.canConfirm ? onConfirm : null,
    );
  }
}