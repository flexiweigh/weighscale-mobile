import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/item_limits.dart';
import '../../../core/widgets/app_header.dart';
import '../../../core/widgets/toggle_row.dart';
import '../application/item_form_controller.dart';
import '../application/item_form_request.dart';
import '../application/item_form_state.dart';
import 'item_l10n.dart';
import 'widgets/category_field.dart';
import 'widgets/form_section_label.dart';
import 'widgets/item_text_field.dart';
import 'widgets/unit_selector.dart';
import 'widgets/weight_check_card.dart';

class ItemFormScreen extends ConsumerStatefulWidget {
  const ItemFormScreen({super.key, required this.request});

  final ItemFormRequest request;

  @override
  ConsumerState<ItemFormScreen> createState() => _ItemFormScreenState();
}

class _ItemFormScreenState extends ConsumerState<ItemFormScreen> {
  final _name = TextEditingController();
  final _code = TextEditingController();
  final _category = TextEditingController();
  final _categoryFocus = FocusNode();
  final _buyPrice = TextEditingController();
  final _sellPrice = TextEditingController();
  final _target = TextEditingController();
  final _tolerance = TextEditingController();
  final _deduction = TextEditingController();
  final _notes = TextEditingController();

  late final _provider = itemFormControllerProvider(widget.request);

  @override
  void initState() {
    super.initState();
    final initial = ref.read(_provider);
    if (!initial.isLoading) _seed(initial);
  }

  @override
  void dispose() {
    _name.dispose();
    _code.dispose();
    _category.dispose();
    _categoryFocus.dispose();
    _buyPrice.dispose();
    _sellPrice.dispose();
    _target.dispose();
    _tolerance.dispose();
    _deduction.dispose();
    _notes.dispose();
    super.dispose();
  }

  void _seed(ItemFormState s) {
    _name.text = s.name;
    _code.text = s.shortCode;
    _category.text = s.categoryInput;
    _buyPrice.text = s.buyPrice;
    _sellPrice.text = s.sellPrice;
    _target.text = s.targetWeight;
    _tolerance.text = s.tolerance;
    _deduction.text = s.defaultDeduction;
    _notes.text = s.notes;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _save() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final item = await ref.read(_provider.notifier).save();
    if (item != null && mounted) context.pop();
  }

  Future<void> _confirmDiscard() async {
    final l10n = context.l10n;
    final discard = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.discardTitle),
        content: Text(l10n.discardBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.discardKeep),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.discardConfirm),
          ),
        ],
      ),
    );
    if (discard == true && mounted) context.pop();
  }

  Future<void> _confirmDelete() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.itemDeleteTitle),
        content: Text(l10n.itemDeleteBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            child: Text(l10n.itemDelete),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    final deleted = await ref.read(_provider.notifier).delete();
    if (deleted && mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = ref.watch(_provider);
    final form = ref.read(_provider.notifier);
    final isEdit = widget.request.isEdit;

    ref.listen<ItemFormState>(_provider, (previous, next) {
      if (previous?.isLoading == true && !next.isLoading && !next.notFound) {
        _seed(next);
      }
      if (next.notFound && previous?.notFound != true) {
        _showMessage(context.l10n.errorItemNotFound);
        context.pop();
      }
      if (next.saveFailed && previous?.saveFailed != true) {
        _showMessage(context.l10n.errorSaveFailed);
      }
    });

    final unitLabel = state.unit.label(l10n);
    final priceSuffix = l10n.priceSuffix(unitLabel);
    String? error(ItemFormField field) => itemFieldError(l10n, state, field);

    const gap = SizedBox(height: 12);
    final priceFormatters = [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
      LengthLimitingTextInputFormatter(12),
    ];

    return PopScope(
      canPop: !state.isDirty,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmDiscard();
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Column(
            children: [
              AppHeader(
                title: isEdit ? l10n.itemFormEditTitle : l10n.itemFormAddTitle,
                subtitle: isEdit
                    ? l10n.itemFormSubtitleEdit
                    : l10n.itemFormSubtitleNew,
                onBack: () => Navigator.of(context).maybePop(),
                actions: [
                  if (isEdit && !state.isLoading)
                    HeaderIconButton(
                      icon: Icons.delete_outline,
                      tooltip: l10n.itemDeleteTooltip,
                      onPressed: state.isSaving ? null : _confirmDelete,
                    ),
                ],
              ),
              Expanded(
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    FormSectionLabel(l10n.sectionBasicInfo),
                    ItemTextField(
                      controller: _name,
                      label: '${l10n.fieldItemName} *',
                      errorText: error(ItemFormField.itemName),
                      onChanged: form.setName,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                          itemNameMaxLength,
                        ),
                      ],
                    ),
                    gap,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ItemTextField(
                            controller: _code,
                            label: l10n.fieldShortCode,
                            errorText: error(ItemFormField.shortCode),
                            onChanged: form.setShortCode,
                            textCapitalization:
                            TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(
                                itemShortCodeMaxLength,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CategoryField(
                            controller: _category,
                            focusNode: _categoryFocus,
                            errorText: error(ItemFormField.category),
                            onTextChanged: form.setCategoryText,
                            onSelected: form.selectCategory,
                            onCleared: form.clearCategory,
                          ),
                        ),
                      ],
                    ),
                    gap,
                    UnitSelector(
                      value: state.unit,
                      onChanged: form.setUnit,
                    ),
                    FormSectionLabel(l10n.sectionPricing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ItemTextField(
                            controller: _buyPrice,
                            label: l10n.fieldBuyPrice,
                            suffixText: priceSuffix,
                            errorText: error(ItemFormField.buyPrice),
                            onChanged: form.setBuyPrice,
                            keyboardType: TextInputType.number,
                            inputFormatters: priceFormatters,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ItemTextField(
                            controller: _sellPrice,
                            label: l10n.fieldSellPrice,
                            suffixText: priceSuffix,
                            errorText: error(ItemFormField.sellPrice),
                            onChanged: form.setSellPrice,
                            keyboardType: TextInputType.number,
                            inputFormatters: priceFormatters,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    WeightCheckCard(
                      state: state,
                      unitLabel: unitLabel,
                      targetController: _target,
                      toleranceController: _tolerance,
                      targetError: error(ItemFormField.targetWeight),
                      toleranceError: error(ItemFormField.tolerance),
                      onTargetChanged: form.setTargetWeight,
                      onToleranceChanged: form.setTolerance,
                      onShowCheckChanged: form.setShowWeightCheck,
                      onAutoCaptureChanged: form.setAutoCaptureWhenOk,
                    ),
                    FormSectionLabel(l10n.sectionDefaults),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ItemTextField(
                            controller: _deduction,
                            label: l10n.fieldDefaultDeduction,
                            suffixText: unitLabel,
                            errorText:
                            error(ItemFormField.defaultDeduction),
                            onChanged: form.setDefaultDeduction,
                            keyboardType:
                            const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]'),
                              ),
                              LengthLimitingTextInputFormatter(12),
                            ],
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: InputDecorator(
                            decoration: itemInputDecoration(label: l10n.fieldStatus),
                            child: ToggleRow(
                              compact: true,
                              label: state.isActive ? l10n.statusActive : l10n.statusInactive,
                              value: state.isActive,
                              onChanged: form.setActive,
                            ),
                          ),
                        ),
                      ],
                    ),
                    gap,
                    ItemTextField(
                      controller: _notes,
                      label: l10n.fieldNotes,
                      hintText: l10n.fieldNotesHint,
                      onChanged: form.setNotes,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              _BottomBar(
                saving: state.isSaving,
                enabled: !state.isLoading,
                onCancel: () => Navigator.of(context).maybePop(),
                onSave: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.saving,
    required this.enabled,
    required this.onCancel,
    required this.onSave,
  });

  final bool saving;
  final bool enabled;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: saving ? null : onCancel,
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 48),
                    foregroundColor: AppColors.textPrimary,
                    side: const BorderSide(color: AppColors.border),
                    shape: shape,
                  ),
                  child: Text(l10n.commonCancel),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: enabled && !saving ? onSave : null,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(0, 48),
                    backgroundColor: AppColors.primary,
                    shape: shape,
                  ),
                  icon: saving
                      ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : const Icon(Icons.check, size: 18),
                  label: Text(l10n.itemSave),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}