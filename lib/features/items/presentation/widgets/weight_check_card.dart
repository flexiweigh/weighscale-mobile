import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../../../core/utils/milli.dart';
import '../../../../core/widgets/toggle_row.dart';
import '../../application/item_form_state.dart';
import 'item_text_field.dart';

class WeightCheckCard extends StatelessWidget {
  const WeightCheckCard({
    super.key,
    required this.state,
    required this.unitLabel,
    required this.targetController,
    required this.toleranceController,
    required this.targetError,
    required this.toleranceError,
    required this.onTargetChanged,
    required this.onToleranceChanged,
    required this.onShowCheckChanged,
    required this.onAutoCaptureChanged,
  });

  final ItemFormState state;
  final String unitLabel;
  final TextEditingController targetController;
  final TextEditingController toleranceController;
  final String? targetError;
  final String? toleranceError;
  final ValueChanged<String> onTargetChanged;
  final ValueChanged<String> onToleranceChanged;
  final ValueChanged<bool> onShowCheckChanged;
  final ValueChanged<bool> onAutoCaptureChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final green = AppTone.green.colors;
    final weightFormatters = [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
      LengthLimitingTextInputFormatter(12),
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: green.background.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: green.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.desiredWeightTitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            l10n.desiredWeightHint,
            style: const TextStyle(
              fontSize: 12,
              height: 1.4,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ItemTextField(
                  controller: targetController,
                  label: l10n.fieldTargetWeight,
                  suffixText: unitLabel,
                  accent: green.foreground,
                  errorText: targetError,
                  onChanged: onTargetChanged,
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: weightFormatters,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ItemTextField(
                  controller: toleranceController,
                  label: l10n.fieldTolerance,
                  suffixText: unitLabel,
                  errorText: toleranceError,
                  onChanged: onToleranceChanged,
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: weightFormatters,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _PreviewStrip(preview: state.preview),
          const SizedBox(height: 8),
          ToggleRow(
            label: l10n.toggleShowCheck,
            value: state.showWeightCheck,
            onChanged: onShowCheckChanged,
          ),
          ToggleRow(
            label: l10n.toggleAutoCapture,
            value: state.autoCaptureWhenOk,
            onChanged: onAutoCaptureChanged,
          ),
        ],
      ),
    );
  }
}

class _PreviewStrip extends StatelessWidget {
  const _PreviewStrip({required this.preview});

  final ItemWeightPreview? preview;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final current = preview;
    final minText = current == null ? '–' : formatMilli(current.okMinMilli);
    final maxText = current == null ? '–' : formatMilli(current.okMaxMilli);

    final cells = [
      (l10n.checkUnder, current == null ? '–' : '< $minText', AppTone.orange),
      (
      l10n.checkOk,
      current == null ? '–' : '$minText – $maxText',
      AppTone.green
      ),
      (l10n.checkOver, current == null ? '–' : '> $maxText', AppTone.red),
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          for (final cell in cells)
            Expanded(
              child: _PreviewCell(label: cell.$1, value: cell.$2, tone: cell.$3),
            ),
        ],
      ),
    );
  }
}

class _PreviewCell extends StatelessWidget {
  const _PreviewCell({
    required this.label,
    required this.value,
    required this.tone,
  });

  final String label;
  final String value;
  final AppTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = tone.colors;
    return Container(
      color: colors.background,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: colors.foreground,
            ),
          ),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}