import 'package:intl/intl.dart';

String formatReviewRelativeTime(DateTime createdAt, String languageCode) {
  final locale = languageCode == 'ar' ? 'ar' : 'fr';
  final diff = DateTime.now().difference(createdAt);

  if (diff.inDays >= 30) {
    return DateFormat.yMMMd(locale).format(createdAt);
  }
  if (diff.inDays >= 1) {
    return languageCode == 'ar'
        ? 'منذ ${diff.inDays} يوم'
        : 'Il y a ${diff.inDays} jour${diff.inDays > 1 ? 's' : ''}';
  }
  if (diff.inHours >= 1) {
    return languageCode == 'ar'
        ? 'منذ ${diff.inHours} ساعة'
        : 'Il y a ${diff.inHours} h';
  }
  if (diff.inMinutes >= 1) {
    return languageCode == 'ar'
        ? 'منذ ${diff.inMinutes} دقيقة'
        : 'Il y a ${diff.inMinutes} min';
  }
  return languageCode == 'ar' ? 'الآن' : 'À l\'instant';
}
