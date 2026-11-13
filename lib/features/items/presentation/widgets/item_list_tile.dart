import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../../../core/utils/number_format.dart';
import '../../../home/presentation/widgets/app_card.dart';
import '../../domain/item.dart';
import '../item_l10n.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile({
    super.key,
    required this.item,
    required this.categoryLabel,
    required this.onTap,
  });

  final Item item;
  final String? categoryLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = (item.isActive ? AppTone.blue : AppTone.grey).colors;
    final meta = [
      if (item.shortCode != null) item.shortCode!,
      if (categoryLabel != null) categoryLabel!,
    ].join(' · ');
    final priceLine = l10n.itemPriceLine(
      formatThousands(item.buyPrice),
      formatThousands(item.sellPrice),
      item.unit.label(l10n),
    );

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.inventory_2_outlined,
                size: 20,
                color: colors.foreground,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meta.isEmpty ? item.name : '${item.name} · $meta',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    priceLine,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (!item.isActive) ...[
              const SizedBox(width: 8),
              StatusChip(label: l10n.statusInactive, tone: AppTone.grey),
            ],
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}