import 'package:FlexiWeigh/features/weighing/presentation/weighing_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_header.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../items/presentation/item_l10n.dart';
import '../application/weighing_controller.dart';
import '../application/weighing_providers.dart';
import '../application/weighing_state.dart';
import '../domain/deduction_preset.dart';
import '../domain/receipt_enums.dart';
import '../domain/weight_units.dart';
import 'weighing_navigation.dart';
import 'widgets/deduction_chips.dart';
import 'widgets/item_picker.dart';
import 'widgets/live_weight_card.dart';
import 'widgets/primary_action_button.dart';
import 'widgets/receipt_lines_section.dart';
import 'widgets/results_card.dart';
import 'widgets/synced_value_field.dart';
import 'widgets/weighing_header.dart';

class WeighingScreen extends ConsumerWidget {
  const WeighingScreen({super.key, required this.type});

  final ReceiptType type;

  Future<void> _back(BuildContext context, WeighingController controller) async {
    await controller.discardIfEmpty();
    if (context.mounted) leaveWeighing(context);
  }

  Future<void> _finish(
      BuildContext context,
      WeighingController controller,
      AppL10n l10n,
      ) async {
    final receipt = await controller.finish();
    if (receipt == null || !context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(l10n.weighingFinished(receipt.displayNumber))),
      );
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = weighingControllerProvider(type);
    final state = ref.watch(provider);
    final controller = ref.read(provider.notifier);
    final l10n = context.l10n;
    final presets = ref.watch(deductionPresetsProvider).valueOrNull ??
        const <DeductionPreset>[];

    ref.listen(provider.select((s) => s.failure), (_, failure) {
      if (failure == null) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(failure.message(l10n))));
      controller.clearFailure();
    });

    final showFooter =
        !state.isLoading && state.receipt != null && state.item != null;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back(context, controller);
      },
      child: Scaffold(
        body: Column(
          children: [
            WeighingHeader(
              title: l10n.weighingTitle,
              state: state,
              onBack: () => _back(context, controller),
            ),
            Expanded(
              child: _body(context, ref, state, controller, presets),
            ),
            if (showFooter)
              _Footer(
                state: state,
                onFinish: () => _finish(context, controller, l10n),
              ),
          ],
        ),
      ),
    );
  }

  Widget _body(
      BuildContext context,
      WidgetRef ref,
      WeighingState state,
      WeighingController controller,
      List<DeductionPreset> presets,
      ) {
    final l10n = context.l10n;

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.receipt == null) {
      return _Message(
        icon: Icons.error_outline,
        title: l10n.weighingErrLoad,
        actionLabel: l10n.commonRetry,
        onAction: () => ref.invalidate(weighingControllerProvider(type)),
      );
    }

    final item = state.item;
    if (item == null) {
      return _Message(
        icon: Icons.inventory_2_outlined,
        title: l10n.weighingNoItemsTitle,
        body: l10n.weighingNoItemsBody,
        actionLabel: l10n.itemsAddFirst,
        onAction: () async {
          await context.push(AppRoutes.itemNew);
          if (context.mounted) {
            ref.invalidate(weighingControllerProvider(type));
          }
        },
      );
    }

    final unit = state.unit;
    final unitLabel = unit.label(l10n);
    final decimals = unit.displayDecimals;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ItemPickerField(
          item: item,
          type: type,
          onSelected: controller.selectItem,
        ),
        const SizedBox(height: 12),
        LiveWeightCard(
          state: state,
          onTare: controller.tare,
          onZero: controller.zero,
          onAutoCapture: controller.setAutoCapture,
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SyncedValueField(
                label: l10n.weighingDeductionLabel(unitLabel),
                value: state.deduction,
                onChanged: controller.setDeduction,
                allowDecimal: decimals > 0,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SyncedValueField(
                label: l10n.weighingPriceLabel(unitLabel),
                value: state.price,
                onChanged: controller.setPrice,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        DeductionChips(
          presets: presets,
          unit: unit,
          deductionMilli: state.deductionMilli,
          onPreset: controller.selectPreset,
          onNone: controller.clearDeduction,
        ),
        const SizedBox(height: 8),
        ResultsCard(
          cells: [
            ResultCell(
              label: l10n.weighingNetLabel,
              value:
              '${formatWeightMilli(state.netMilli, decimals: decimals)} $unitLabel',
              color: AppColors.primary,
            ),
            ResultCell(
              label: l10n.weighingAmountLabel,
              value: l10n.moneyKs(formatMoney(state.amount)),
              color: AppColors.success,
            ),
          ],
        ),
        const SizedBox(height: 12),
        PrimaryActionButton(
          label: l10n.weighingConfirm,
          icon: Icons.check,
          isBusy: state.isSaving,
          onPressed: state.canConfirm ? controller.confirmWeight : null,
        ),
        const SizedBox(height: 10),
        Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '${l10n.weighingScaleProblem} ',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => context.push(AppRoutes.manualEntryWith(type.name)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    l10n.weighingEnterManually,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (state.receipt != null)
          ReceiptLinesSection(
            receipt: state.receipt!,
            onRemove: (line) => controller.removeLine(line.id),
          ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.state, required this.onFinish});

  final WeighingState state;
  final VoidCallback onFinish;

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
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.weighingTotalLines(state.lineCount),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n.moneyKs(formatMoney(state.totalAmount)),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              PrimaryActionButton(
                label: l10n.weighingFinish,
                color: AppColors.success,
                height: 46,
                width: 110,
                isBusy: state.isSaving,
                onPressed: state.canFinish ? onFinish : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.icon,
    required this.title,
    required this.actionLabel,
    required this.onAction,
    this.body,
  });

  final IconData icon;
  final String title;
  final String? body;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 36, color: AppColors.textSecondary),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            if (body != null) ...[
              const SizedBox(height: 6),
              Text(
                body!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
            const SizedBox(height: 16),
            FilledButton(onPressed: onAction, child: Text(actionLabel)),
          ],
        ),
      ),
    );
  }
}