import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

Date todayDate() => DateTime.now().toDate();

Date addDays(Date date, int days) {
  return date.toDateTime().add(Duration(days: days)).toDate();
}

Date firstDayOfMonth(DateTime month) => Date(month.year, month.month, 1);

Date lastDayOfMonth(DateTime month) {
  final days = DateUtils.getDaysInMonth(month.year, month.month);
  return Date(month.year, month.month, days);
}

bool isSameCalendarDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
