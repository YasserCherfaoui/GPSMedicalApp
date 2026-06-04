import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/booking_dates.dart';
import 'availability_slots.provider.dart';

part 'availability_window.provider.g.dart';

class AvailabilityWindow {
  const AvailabilityWindow({required this.from, required this.to});

  final Date from;
  final Date to;
}

@riverpod
class AvailabilityWindowNotifier extends _$AvailabilityWindowNotifier {
  @override
  AvailabilityWindow build(String doctorId) {
    final from = todayDate();
    final to = addDays(from, kAvailabilityDefaultRangeDays);
    return AvailabilityWindow(from: from, to: to);
  }

  void nextWeek(String mode) {
    final capEnd = addDays(todayDate(), kBookingWindowDays);
    var newFrom = addDays(state.from, 7);
    if (newFrom.compareTo(capEnd) > 0) return;
    var newTo = addDays(state.to, 7);
    if (newTo.compareTo(capEnd) > 0) {
      newTo = capEnd;
    }
    if (newTo.compareTo(newFrom) < 0) return;
    state = AvailabilityWindow(from: newFrom, to: newTo);
    ref.invalidate(availabilitySlotsProvider(doctorId, mode));
  }

  void previousWeek(String mode) {
    final today = todayDate();
    var newFrom = addDays(state.from, -7);
    if (newFrom.compareTo(today) < 0) {
      newFrom = today;
    }
    var newTo = addDays(state.to, -7);
    if (newTo.compareTo(newFrom) < 0) {
      newTo = addDays(newFrom, kAvailabilityDefaultRangeDays);
    }
    state = AvailabilityWindow(from: newFrom, to: newTo);
    ref.invalidate(availabilitySlotsProvider(doctorId, mode));
  }
}
