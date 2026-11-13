import '../../../l10n/generated/app_localizations.dart';

class ItemPreset {
  const ItemPreset(this.key, this.code, this.categoryKey);

  final String key;
  final String code;
  final String categoryKey;

  String label(AppL10n l10n) => switch (key) {
    'copper' => l10n.presetCopper,
    'aluminium' => l10n.presetAluminium,
    'ironScrap' => l10n.presetIronScrap,
    'plastic' => l10n.presetPlastic,
    'paper' => l10n.presetPaper,
    'brass' => l10n.presetBrass,
    'rubber' => l10n.presetRubber,
    _ => key,
  };
}

const itemPresets = [
  ItemPreset('copper', 'CU', 'metal'),
  ItemPreset('aluminium', 'AL', 'metal'),
  ItemPreset('ironScrap', 'FE', 'metal'),
  ItemPreset('plastic', 'PL', 'plastic'),
  ItemPreset('paper', 'PA', 'paper'),
  ItemPreset('brass', 'BR', 'metal'),
  ItemPreset('rubber', 'RB', 'rubber'),
];