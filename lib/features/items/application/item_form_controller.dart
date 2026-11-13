import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/milli.dart';
import '../../../core/utils/number_format.dart';
import '../../../core/utils/parse_number.dart';
import '../domain/category.dart';
import '../domain/item.dart';
import '../domain/item_draft.dart';
import '../domain/item_enums.dart';
import '../domain/item_repository.dart';
import 'category_labeler.dart';
import 'item_form_request.dart';
import 'item_form_state.dart';
import 'item_providers.dart';

final itemFormControllerProvider = NotifierProvider.autoDispose
    .family<ItemFormController, ItemFormState, ItemFormRequest>(
  ItemFormController.new,
);

class ItemFormController
    extends AutoDisposeFamilyNotifier<ItemFormState, ItemFormRequest> {
  bool _disposed = false;

  @override
  ItemFormState build(ItemFormRequest arg) {
    ref.onDispose(() => _disposed = true);

    final itemId = arg.itemId;
    if (itemId == null) return _initialForNew(arg);

    Future.microtask(() => _load(itemId));
    return const ItemFormState(isLoading: true);
  }

  ItemFormState _initialForNew(ItemFormRequest request) {
    SystemCategory? system;
    for (final candidate in systemCategories) {
      if (candidate.key == request.categoryKey) system = candidate;
    }

    final label = system == null
        ? ''
        : ref.read(categoryLabelerProvider)(
      Category(id: system.id, name: system.name, systemKey: system.key),
    );

    return ItemFormState(
      name: request.name ?? '',
      shortCode: request.shortCode ?? '',
      categoryInput: label,
      categoryId: system?.id,
    );
  }

  Future<void> _load(String id) async {
    final item = await ref.read(itemRepositoryProvider).findById(id);
    if (_disposed) return;

    if (item == null) {
      state = state.copyWith(isLoading: false, notFound: true);
      return;
    }

    final category = item.category;
    final target = item.targetWeightMilli;
    state = ItemFormState(
      name: item.name,
      shortCode: item.shortCode ?? '',
      categoryInput:
      category == null ? '' : ref.read(categoryLabelerProvider)(category),
      categoryId: category?.id,
      unit: item.unit,
      buyPrice: item.buyPrice == 0 ? '' : formatThousands(item.buyPrice),
      sellPrice: item.sellPrice == 0 ? '' : formatThousands(item.sellPrice),
      targetWeight: target == null ? '' : formatMilli(target),
      tolerance: item.toleranceMilli == 0 && target == null
          ? ''
          : formatMilli(item.toleranceMilli),
      showWeightCheck: item.showWeightCheck,
      autoCaptureWhenOk: item.autoCaptureWhenOk,
      defaultDeduction: item.defaultDeductionMilli == 0
          ? ''
          : formatMilli(item.defaultDeductionMilli),
      isActive: item.isActive,
      notes: item.notes ?? '',
    );
  }

  void setName(String value) =>
      _edit(state.copyWith(name: value), ItemFormField.itemName);

  void setShortCode(String value) =>
      _edit(state.copyWith(shortCode: value), ItemFormField.shortCode);

  void setCategoryText(String value) {
    _edit(
      state.copyWith(categoryInput: value, clearCategoryId: true),
      ItemFormField.category,
    );
  }

  void selectCategory(Category category) {
    final label = ref.read(categoryLabelerProvider)(category);
    _edit(
      state.copyWith(categoryInput: label, categoryId: category.id),
      ItemFormField.category,
    );
  }

  void clearCategory() {
    _edit(
      state.copyWith(categoryInput: '', clearCategoryId: true),
      ItemFormField.category,
    );
  }

  void setUnit(WeightUnit value) => _touch(state.copyWith(unit: value));

  void setBuyPrice(String value) =>
      _edit(state.copyWith(buyPrice: value), ItemFormField.buyPrice);

  void setSellPrice(String value) =>
      _edit(state.copyWith(sellPrice: value), ItemFormField.sellPrice);

  void setTargetWeight(String value) =>
      _edit(state.copyWith(targetWeight: value), ItemFormField.targetWeight);

  void setTolerance(String value) =>
      _edit(state.copyWith(tolerance: value), ItemFormField.tolerance);

  void setShowWeightCheck(bool value) =>
      _touch(state.copyWith(showWeightCheck: value));

  void setAutoCaptureWhenOk(bool value) =>
      _touch(state.copyWith(autoCaptureWhenOk: value));

  void setDefaultDeduction(String value) => _edit(
    state.copyWith(defaultDeduction: value),
    ItemFormField.defaultDeduction,
  );

  void setActive(bool value) => _touch(state.copyWith(isActive: value));

  void setNotes(String value) => _touch(state.copyWith(notes: value));

  Future<Item?> save() async {
    if (state.isSaving || state.isLoading) return null;

    state = state.copyWith(showErrors: true, saveFailed: false);
    if (state.errors.isNotEmpty) return null;

    state = state.copyWith(isSaving: true);
    final repository = ref.read(itemRepositoryProvider);
    try {
      final draft = await _buildDraft();
      final itemId = arg.itemId;
      final item = itemId == null
          ? await repository.create(draft)
          : await repository.update(itemId, draft);
      if (!_disposed) state = state.copyWith(isSaving: false, isDirty: false);
      return item;
    } on ItemSaveException catch (error) {
      if (!_disposed) state = _afterFailure(error);
      return null;
    } catch (_) {
      if (!_disposed) state = state.copyWith(isSaving: false, saveFailed: true);
      return null;
    }
  }

  Future<bool> delete() async {
    final itemId = arg.itemId;
    if (itemId == null || state.isSaving || state.isLoading) return false;

    state = state.copyWith(isSaving: true, saveFailed: false);
    try {
      await ref.read(itemRepositoryProvider).delete(itemId);
      return true;
    } catch (_) {
      if (!_disposed) state = state.copyWith(isSaving: false, saveFailed: true);
      return false;
    }
  }

  void _edit(ItemFormState next, ItemFormField field) {
    final cleared = Map.of(next.serverErrors)..remove(field);
    state = next.copyWith(
      isDirty: true,
      saveFailed: false,
      serverErrors: cleared,
    );
  }

  void _touch(ItemFormState next) {
    state = next.copyWith(isDirty: true, saveFailed: false);
  }

  ItemFormState _afterFailure(ItemSaveException error) {
    final base = state.copyWith(isSaving: false);
    switch (error.failure) {
      case ItemSaveFailure.duplicateName:
        return base.copyWith(
          serverErrors: {
            ...base.serverErrors,
            ItemFormField.itemName: ItemFormError.duplicate,
          },
        );
      case ItemSaveFailure.duplicateShortCode:
        return base.copyWith(
          serverErrors: {
            ...base.serverErrors,
            ItemFormField.shortCode: ItemFormError.duplicate,
          },
        );
      case ItemSaveFailure.categoryNotFound:
        return base.copyWith(clearCategoryId: true, saveFailed: true);
      case ItemSaveFailure.notFound:
        return base.copyWith(notFound: true);
      case ItemSaveFailure.invalid:
        return base.copyWith(saveFailed: true);
    }
  }

  Future<ItemDraft> _buildDraft() async {
    final current = state;
    final code = current.shortCode.trim();
    final notes = current.notes.trim();
    return ItemDraft(
      name: current.name.trim(),
      shortCode: code.isEmpty ? null : code,
      category: await _resolveCategory(current),
      unit: current.unit,
      buyPrice: parseWholeNumber(current.buyPrice) ?? 0,
      sellPrice: parseWholeNumber(current.sellPrice) ?? 0,
      targetWeightMilli: parseMilli(current.targetWeight),
      toleranceMilli: parseMilli(current.tolerance) ?? 0,
      showWeightCheck: current.showWeightCheck,
      autoCaptureWhenOk: current.autoCaptureWhenOk,
      defaultDeductionMilli: parseMilli(current.defaultDeduction) ?? 0,
      isActive: current.isActive,
      notes: notes.isEmpty ? null : notes,
    );
  }

  Future<CategorySelection?> _resolveCategory(ItemFormState current) async {
    final input = current.categoryInput.trim();
    if (input.isEmpty) return null;

    final selectedId = current.categoryId;
    if (selectedId != null) return ExistingCategory(selectedId);

    final categories = await ref.read(categoriesProvider.future);
    final labeler = ref.read(categoryLabelerProvider);
    final wanted = _fold(input);
    for (final category in categories) {
      if (_fold(labeler(category)) == wanted) {
        return ExistingCategory(category.id);
      }
    }
    return NewCategory(input);
  }
}

String _fold(String value) {
  return value.trim().replaceAll(RegExp(r'\s+'), ' ').toLowerCase();
}