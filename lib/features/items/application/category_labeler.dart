import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/locale_controller.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../domain/category.dart';

typedef CategoryLabeler = String Function(Category category);

final categoryLabelerProvider = Provider<CategoryLabeler>((ref) {
  final l10n = lookupAppL10n(ref.watch(localeControllerProvider));
  return (category) => switch (category.systemKey) {
    'metal' => l10n.categoryMetal,
    'plastic' => l10n.categoryPlastic,
    'paper' => l10n.categoryPaper,
    'rubber' => l10n.categoryRubber,
    'other' => l10n.categoryOther,
    _ => category.name,
  };
});