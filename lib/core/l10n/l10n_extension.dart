import 'package:flutter/widgets.dart';

import '../../l10n/generated/app_localizations.dart';

extension L10nContext on BuildContext {
  AppL10n get l10n => AppL10n.of(this);
}