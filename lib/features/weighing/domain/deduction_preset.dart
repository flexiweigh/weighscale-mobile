class DeductionPreset {
  const DeductionPreset({
    required this.id,
    required this.name,
    required this.weightMilli,
    this.systemKey,
  });

  final String id;
  final String name;
  final int weightMilli;
  final String? systemKey;

  bool get isSystem => systemKey != null;
}

class SystemDeductionPreset {
  const SystemDeductionPreset(this.key, this.name, this.weightMilli, this.sortOrder);

  final String key;
  final String name;
  final int weightMilli;
  final int sortOrder;

  String get id => 'deduction-$key';
}

const systemDeductionPresets = [
  SystemDeductionPreset('sack', 'Sack', 500, 10),
  SystemDeductionPreset('basket', 'Basket', 1200, 20),
  SystemDeductionPreset('crate', 'Crate', 2000, 30),
];