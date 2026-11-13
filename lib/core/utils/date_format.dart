import 'package:intl/intl.dart';

String formatHeaderDate(DateTime date, String languageCode) {
  final weekday = DateFormat.E(languageCode).format(date);
  final month = DateFormat.MMM(languageCode).format(date);
  return '$weekday, ${date.day} $month ${date.year}';
}