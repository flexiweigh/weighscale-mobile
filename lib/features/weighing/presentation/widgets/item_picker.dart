import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../items/domain/item.dart';
import '../../application/weighing_providers.dart';
import '../../domain/receipt_enums.dart';
import '../weighing_l10n.dart';

class ItemPickerField extends StatelessWidget {
  const ItemPickerField({
    super.key,
    required this.item,
    required this.type,
    required this.onSelected,
  });

  final Item item;
  final ReceiptType type;
  final ValueChanged<Item> onSelected;

  Future<void> _pick(BuildContext context) async {
    final picked = await showItemPickerSheet(
      context,
      type: type,
      selectedId: item.id,
    );
    if (picked != null) onSelected(picked);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final radius = BorderRadius.circular(12);
    return Material(
      color: AppColors.surface,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: () => _pick(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.weighingItemLabel,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                itemRateText(l10n, item, type),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Item?> showItemPickerSheet(
    BuildContext context, {
      required ReceiptType type,
      String? selectedId,
    }) {
  return showModalBottomSheet<Item>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    backgroundColor: AppColors.surface,
    builder: (_) => _ItemPickerSheet(type: type, selectedId: selectedId),
  );
}

class _ItemPickerSheet extends ConsumerWidget {
  const _ItemPickerSheet({required this.type, this.selectedId});

  final ReceiptType type;
  final String? selectedId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final items = ref.watch(activeItemsProvider);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              l10n.weighingPickItem,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Flexible(
            child: items.when(
              loading: () => const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (_, __) => Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  l10n.weighingErrLoad,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              data: (list) => ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  final selected = item.id == selectedId;
                  return ListTile(
                    dense: true,
                    title: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      itemRateText(l10n, item, type),
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: selected
                        ? const Icon(
                      Icons.check,
                      size: 20,
                      color: AppColors.primary,
                    )
                        : null,
                    onTap: () => Navigator.of(context).pop(item),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}