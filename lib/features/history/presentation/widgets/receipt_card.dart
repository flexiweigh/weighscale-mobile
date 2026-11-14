import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../../../core/utils/number_format.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../items/presentation/item_l10n.dart';
import '../../../weighing/domain/receipt_enums.dart';
import '../../../weighing/domain/receipt_line.dart';
import '../../../weighing/domain/weight_units.dart';
import '../../application/receipt_view.dart';

const _netWidth = 72.0;
const _priceWidth = 64.0;
const _amountWidth = 84.0;

class ReceiptCard extends StatelessWidget {
  const ReceiptCard({super.key, required this.view, required this.shopName});

  final ReceiptView view;
  final String shopName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final unit = view.commonUnit;
    final isBuy = view.type == ReceiptType.buy;
    final netLabel = unit == null
        ? l10n.receiptColNetPlain
        : l10n.receiptColNet(unit.label(l10n));
    final totalWeight = l10n.weightKgValue(
      formatThousands(view.totalWeightKgMilli / 1000, decimals: 2),
    );

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            shopName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            isBuy ? l10n.receiptPurchaseTitle : l10n.receiptSaleTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: 10),
          _HeaderRow(netLabel: netLabel),
          const SizedBox(height: 8),
          const Divider(height: 1, color: AppColors.border),
          for (final line in view.lines)
            _LineRow(line: line, showUnit: unit == null),
          const SizedBox(height: 4),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.receiptTotal,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Text(
                l10n.moneyKs(formatThousands(view.totalAmount)),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${l10n.receiptLinesCount(view.lineCount)} · $totalWeight',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          if (view.hasManualLines) ...[
            const SizedBox(height: 4),
            Text(
              l10n.receiptManualLegend,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({required this.netLabel});

  final String netLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const style = TextStyle(fontSize: 12, color: AppColors.textSecondary);
    return Row(
      children: [
        Expanded(child: Text(l10n.receiptColItem, style: style)),
        _NumberCell(width: _netWidth, child: Text(netLabel, style: style)),
        _NumberCell(
          width: _priceWidth,
          child: Text(l10n.receiptColPrice, style: style),
        ),
        _NumberCell(
          width: _amountWidth,
          child: Text(l10n.receiptColAmount, style: style),
        ),
      ],
    );
  }
}

class _LineRow extends StatelessWidget {
  const _LineRow({required this.line, required this.showUnit});

  final ReceiptLine line;
  final bool showUnit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final weight = formatWeightMilli(
      line.netWeightMilli,
      decimals: line.unit.displayDecimals,
    );
    final weightText = showUnit ? '$weight ${line.unit.label(l10n)}' : weight;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  line.itemName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (line.isManual) ...[
                  const SizedBox(height: 4),
                  _ManualBadge(label: l10n.weighingManualBadge),
                ],
              ],
            ),
          ),
          _NumberCell(
            width: _netWidth,
            child: Text(
              weightText,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          _NumberCell(
            width: _priceWidth,
            child: Text(
              formatThousands(line.unitPrice),
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          _NumberCell(
            width: _amountWidth,
            child: Text(
              formatThousands(line.amount),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NumberCell extends StatelessWidget {
  const _NumberCell({required this.width, required this.child});

  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerRight,
        child: FittedBox(fit: BoxFit.scaleDown, child: child),
      ),
    );
  }
}

class _ManualBadge extends StatelessWidget {
  const _ManualBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = AppTone.orange.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: colors.foreground,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}