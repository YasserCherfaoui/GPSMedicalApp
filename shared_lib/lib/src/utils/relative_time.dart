import 'package:intl/intl.dart';

import '../l10n/generated/app_localizations.dart';

/// Relative timestamp for reviews, messaging threads, and notifications.
String formatReviewRelativeTime(
  DateTime createdAt,
  AppLocalizations l10n, {
  String? languageCode,
}) {
  final localeTag = languageCode ?? l10n.localeName;
  // intl has no ber data — fall back to French for absolute dates.
  final dateLocale = localeTag == 'ber' ? 'fr' : localeTag;
  final diff = DateTime.now().difference(createdAt);

  if (diff.inDays >= 30) {
    return DateFormat.yMMMd(dateLocale).format(createdAt);
  }
  if (diff.inDays >= 1) {
    return l10n.relativeTimeDays(diff.inDays);
  }
  if (diff.inHours >= 1) {
    return l10n.relativeTimeHours(diff.inHours);
  }
  if (diff.inMinutes >= 1) {
    return l10n.relativeTimeMinutes(diff.inMinutes);
  }
  return l10n.relativeTimeJustNow;
}
