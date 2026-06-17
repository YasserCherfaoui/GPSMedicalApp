import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/appointments.provider.dart';
import '../repositories/specialist_appointment_repository.dart';
import '../utils/appointment_dates.dart';

final specialistCalendarAppointmentsProvider = FutureProvider.family<
    List<Appointment>,
    ({Date from, Date to})
>((ref, range) async {
  final repo = ref.read(specialistAppointmentRepositoryProvider);
  final result = await repo.list(
    status: 'confirmed',
    page: 1,
    pageSize: 100,
    from: range.from,
    to: range.to,
  );
  final sorted = result.appointments.toList()
    ..sort((a, b) {
      final sa = a.startAt;
      final sb = b.startAt;
      if (sa == null || sb == null) return 0;
      return sa.compareTo(sb);
    });
  return sorted;
});

List<Appointment> appointmentsOnDay(List<Appointment> appointments, DateTime day) {
  return appointments.where((appointment) {
    final start = appointment.startAt?.toLocal();
    if (start == null) return false;
    return isSameCalendarDay(start, day);
  }).toList();
}
