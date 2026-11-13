int? parseWholeNumber(String input) {
  final text = input.replaceAll(RegExp(r'[,\s]'), '');
  if (text.isEmpty || text.length > 12) return null;
  return RegExp(r'^\d+$').hasMatch(text) ? int.parse(text) : null;
}