import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../application/items_list_providers.dart';

class ItemSearchField extends ConsumerStatefulWidget {
  const ItemSearchField({super.key});

  @override
  ConsumerState<ItemSearchField> createState() => _ItemSearchFieldState();
}

class _ItemSearchFieldState extends ConsumerState<ItemSearchField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: ref.read(itemSearchQueryProvider));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final search = ref.read(itemSearchQueryProvider.notifier);

    OutlineInputBorder border(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
    );

    return TextField(
      controller: _controller,
      onChanged: search.setQuery,
      textInputAction: TextInputAction.search,
      style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: l10n.itemsSearchHint,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 20,
          color: AppColors.textSecondary,
        ),
        suffixIcon: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) {
            if (_controller.text.isEmpty) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.close, size: 18),
              onPressed: () {
                _controller.clear();
                search.clear();
              },
            );
          },
        ),
        filled: true,
        fillColor: AppColors.surface,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: border(AppColors.border),
        enabledBorder: border(AppColors.border),
        focusedBorder: border(AppColors.primary),
      ),
    );
  }
}