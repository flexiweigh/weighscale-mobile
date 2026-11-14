import '../../items/domain/item_enums.dart';

int convertWeightMilli(int milli, WeightUnit from, WeightUnit to) {
  if (from == to) return milli;
  return (milli * from.gramsPerUnit / to.gramsPerUnit).round();
}

int parseWeightMilli(String text) {
  var value = text.trim();
  if (value.endsWith('.')) value = value.substring(0, value.length - 1);
  final parsed = double.tryParse(value);
  if (parsed == null || parsed < 0) return 0;
  return (parsed * 1000).round();
}

String formatWeightMilli(int milli, {int decimals = 2}) {
  return (milli / 1000).toStringAsFixed(decimals);
}

String formatMoney(int value) {
  final digits = value.abs().toString();
  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
    buffer.write(digits[i]);
  }
  return value < 0 ? '-$buffer' : buffer.toString();
}

extension WeightUnitDisplay on WeightUnit {
  int get displayDecimals => this == WeightUnit.g ? 0 : 2;
}