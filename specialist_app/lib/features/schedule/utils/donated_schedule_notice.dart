import 'package:shared_preferences/shared_preferences.dart';

const kDonatedScheduleNoticeSeenKey =
    'gps.specialist.donated_schedule_notice_seen';

Future<bool> hasSeenDonatedScheduleNotice() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(kDonatedScheduleNoticeSeenKey) ?? false;
}

Future<void> markDonatedScheduleNoticeSeen() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(kDonatedScheduleNoticeSeenKey, true);
}
