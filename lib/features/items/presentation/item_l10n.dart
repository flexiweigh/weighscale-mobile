import '../../../l10n/generated/app_localizations.dart';
import '../application/item_form_state.dart';
import '../domain/item_enums.dart';

extension WeightUnitL10n on WeightUnit {
  String label(AppL10n l10n) => switch (this) {
    WeightUnit.kg => l10n.unitKg,
    WeightUnit.g => l10n.unitG,
    WeightUnit.lb => l10n.unitLb,
    WeightUnit.viss => l10n.unitViss,
  };
}

String? itemFieldError(
    AppL10n l10n,
    ItemFormState state,
    ItemFormField field,
    ) {
  if (!state.showErrors) return null;
  final error = state.errors[field];
  if (error == null) return null;
  return switch (error) {
    ItemFormError.required => l10n.errorRequired,
    ItemFormError.invalid => l10n.errorInvalidNumber,
    ItemFormError.tooLong => l10n.errorTooLong,
    ItemFormError.duplicate => field == ItemFormField.shortCode
        ? l10n.errorDuplicateCode
        : l10n.errorDuplicateName,
  };
}