import 'package:intl/intl.dart';

/// Localised date/time for the verification status last-check label.
String formatVerificationLastChecked(DateTime at, String languageCode) {
  final locale = languageCode == 'ar' ? 'ar' : 'fr';
  return DateFormat.yMMMd(locale).add_Hm().format(at);
}
