import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../application/category_labeler.dart';
import '../../application/item_providers.dart';
import '../../domain/category.dart';
import 'item_text_field.dart';

class CategoryField extends ConsumerWidget {
  const CategoryField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.errorText,
    required this.onTextChanged,
    required this.onSelected,
    required this.onCleared,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? errorText;
  final ValueChanged<String> onTextChanged;
  final ValueChanged<Category> onSelected;
  final VoidCallback onCleared;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final categories =
        ref.watch(categoriesProvider).valueOrNull ?? const <Category>[];
    final labeler = ref.watch(categoryLabelerProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return RawAutocomplete<Category>(
          textEditingController: controller,
          focusNode: focusNode,
          displayStringForOption: labeler,
          optionsBuilder: (value) {
            final text = value.text.trim().toLowerCase();
            if (text.isEmpty) return categories;
            return categories.where(
                  (category) => labeler(category).toLowerCase().contains(text),
            );
          },
          onSelected: onSelected,
          fieldViewBuilder: (context, textController, node, onSubmitted) {
            return ItemTextField(
              controller: textController,
              focusNode: node,
              label: l10n.fieldCategory,
              hintText: l10n.fieldCategoryHint,
              errorText: errorText,
              onChanged: onTextChanged,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                LengthLimitingTextInputFormatter(categoryNameMaxLength),
              ],
              suffixIcon: ListenableBuilder(
                listenable: textController,
                builder: (context, _) {
                  if (textController.text.isEmpty) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: () => node.requestFocus(),
                    );
                  }
                  return IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    onPressed: () {
                      textController.clear();
                      onCleared();
                      node.requestFocus();
                    },
                  );
                },
              ),
            );
          },
          optionsViewBuilder: (context, onOptionSelected, options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Material(
                  elevation: 4,
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(10),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 220,
                      maxWidth: constraints.maxWidth,
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        final option = options.elementAt(index);
                        return InkWell(
                          onTap: () => onOptionSelected(option),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            child: Text(
                              labeler(option),
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}