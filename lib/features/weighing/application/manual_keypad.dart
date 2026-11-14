const keypadMaxIntegerDigits = 6;

String keypadAppend(
    String current,
    String key, {
      required int maxDecimals,
    }) {
  if (key == '.') {
    if (maxDecimals == 0 || current.contains('.')) return current;
    return current.isEmpty ? '0.' : '$current.';
  }

  final dot = current.indexOf('.');
  if (dot >= 0) {
    if (current.length - dot - 1 >= maxDecimals) return current;
    return '$current$key';
  }

  if (current.length >= keypadMaxIntegerDigits) return current;
  if (current == '0') return key;
  return '$current$key';
}

String keypadBackspace(String current) {
  return current.isEmpty ? current : current.substring(0, current.length - 1);
}