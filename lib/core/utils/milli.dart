int toMilli(double value) => (value * 1000).round();

double fromMilli(int milli) => milli / 1000;

int? parseMilli(String input) {
  final text = input.trim().replaceAll(',', '');
  if (text.isEmpty) return null;
  final match = RegExp(r'^(\d*)(?:\.(\d*))?$').firstMatch(text);
  if (match == null) return null;

  final wholeText = match.group(1)!;
  final fractionText = match.group(2) ?? '';
  if (wholeText.isEmpty && fractionText.isEmpty) return null;
  if (wholeText.length > 9) return null;

  final whole = wholeText.isEmpty ? 0 : int.parse(wholeText);
  final fraction = fractionText.padRight(3, '0');
  var milli = whole * 1000 + int.parse(fraction.substring(0, 3));
  if (fraction.length > 3 && fraction.codeUnitAt(3) >= 53) milli += 1;
  return milli;
}

String formatMilli(int milli) {
  final sign = milli < 0 ? '-' : '';
  final absolute = milli.abs();
  final whole = absolute ~/ 1000;
  final fraction = absolute % 1000;
  final digits = fraction % 10 == 0
      ? (fraction ~/ 10).toString().padLeft(2, '0')
      : fraction.toString().padLeft(3, '0');
  return '$sign$whole.$digits';
}