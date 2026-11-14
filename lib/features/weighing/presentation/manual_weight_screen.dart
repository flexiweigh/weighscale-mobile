import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_tone.dart';
import '../../items/presentation/item_l10n.dart';
import '../application/weighing_controller.dart';
import '../application/weighing_providers.dart';
import '../application/weighing_state.dart';
import '../domain/deduction_preset.dart';
import '../domain/receipt_enums.dart';
import '../domain/weight_units.dart';
import 'weighing_l10n.dart';
import 'weighing_navigation.dart';
import 'widgets/deduction_chips.dart';
import 'widgets/item_picker.dart';
import 'widgets/number_keypad.dart';
import 'widgets/primary_action_button.dart';
import 'widgets/results_card.dart';
import 'widgets/weighing_header.dart';

class ManualWeightScreen extends ConsumerStatefulWidget {
  const ManualWeightScreen({super.key, required this.type});

  final ReceiptType type;

  @override
  ConsumerState<ManualWeightScreen> createState() => _ManualWeightScreenState();
}

class _ManualWeightScreenState extends ConsumerState<ManualWeightScreen> {
  WeighingController get _controller =>
      ref.read(weighingControllerProvider(widget.type).notifier);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.startManual();
    });
  }

  void _close() {
    _controller.endManual();
    leaveWeighing(context);
  }

  Future<void> _add() async {
    final added = await _controller.addManual();
    if (!added || !mounted) return;
    _close();
  }

  @override
  Widget build(BuildContext context) {
    final provider = weighingControllerProvider(widget.type);
    final state = ref.watch(provider);
    final l10n = context.l10n;
    final presets = ref.watch(deductionPresetsProvider).valueOrNull ??
        const <DeductionPreset>[];

    ref.listen(provider.select((s) => s.failure), (_, failure) {
      if (failure == null) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(failure.message(l10n))));
      _controller.clearFailure();
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _close();
      },
      child: Scaffold(
        body: Column(
          children: [
            WeighingHeader(
              title: l10n.manualWeightTitle,
              state: state,
              onBack: _close,
              scaleInSubtitle: true,
            ),
            Expanded(child: _body(context, state, presets)),
            _ActionBar(
              state: state,
              onCancel: _close,
              onAdd: _add,
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(
      BuildContext context,
      WeighingState state,
      List<DeductionPreset> presets,
      ) {
    final l10n = context.l10n;
    final item = state.item;

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (item == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            l10n.weighingNoItemsBody,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    final unit = state.unit;
    final unitLabel = unit.label(l10n);
    final decimals = unit.displayDecimals;
    final warning = AppTone.orange.colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: warning.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: warning.border),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: warning.foreground, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.weighingManualNotice,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9A5B00),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ItemPickerField(
            item: item,
            type: widget.type,
            onSelected: _controller.selectItem,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _KeypadValueField(
                  label: l10n.weighingGrossLabel(unitLabel),
                  text: state.manualGross,
                  active: state.manualField == ManualField.gross,
                  onTap: () => _controller.focusManual(ManualField.gross),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _KeypadValueField(
                  label: l10n.weighingDeductionLabel(unitLabel),
                  text: state.deduction,
                  active: state.manualField == ManualField.deduction,
                  onTap: () => _controller.focusManual(ManualField.deduction),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          DeductionChips(
            presets: presets,
            unit: unit,
            deductionMilli: state.deductionMilli,
            onPreset: _controller.selectPreset,
            onNone: _controller.clearDeduction,
          ),
          const SizedBox(height: 8),
          ResultsCard(
            valueSize: 16,
            cells: [
              ResultCell(
                label: l10n.weighingNetShort(unitLabel),
                value: formatWeightMilli(state.netMilli, decimals: decimals),
                color: AppColors.primary,
              ),
              ResultCell(
                label: l10n.weighingPriceLabel(unitLabel),
                value: formatMoney(state.priceValue),
                color: AppColors.textPrimary,
              ),
              ResultCell(
                label: l10n.todayAmountKs,
                value: formatMoney(state.amount),
                color: AppColors.success,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(
            child: NumberKeypad(
              allowDecimal: decimals > 0,
              onKey: _controller.keypadPress,
              onBackspace: _controller.keypadDelete,
            ),
          ),
        ],
      ),
    );
  }
}

class _KeypadValueField extends StatelessWidget {
  const _KeypadValueField({
    required this.label,
    required this.text,
    required this.active,
    required this.onTap,
  });

  final String label;
  final String text;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12);
    final empty = text.isEmpty;
    return Material(
      color: AppColors.surface,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: active ? AppColors.primary : AppColors.border,
              width: active ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                  color: active ? AppColors.primary : AppColors.textSecondary,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        empty ? '0' : text,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: empty
                              ? AppColors.textSecondary.withValues(alpha: 0.45)
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  if (active)
                    Container(
                      width: 2,
                      height: 22,
                      margin: const EdgeInsets.only(left: 2),
                      color: AppColors.primary,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.state,
    required this.onCancel,
    required this.onAdd,
  });

  final WeighingState state;
  final VoidCallback onCancel;
  final VoidCallback onAdd;

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
                flex: 2,
                child: SizedBox(
                  height: 46,
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text(l10n.commonCancel),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 5,
                child: PrimaryActionButton(
                  label: l10n.weighingAddToReceipt,
                  icon: Icons.add,
                  isBusy: state.isSaving,
                  onPressed: state.canAddManual ? onAdd : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}