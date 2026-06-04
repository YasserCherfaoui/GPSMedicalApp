import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'appointments_history.provider.dart';
import 'appointments_upcoming.provider.dart';
import 'booking_repositories.provider.dart';
import 'doctor_cache.provider.dart';

part 'appointment_detail.provider.g.dart';

class AppointmentDetailState {
  const AppointmentDetailState({
    required this.appointment,
    required this.doctor,
  });

  final Appointment appointment;
  final Doctor doctor;
}

@riverpod
class AppointmentDetail extends _$AppointmentDetail {
  @override
  Future<AppointmentDetailState> build(String appointmentId) async {
    final repo = ref.watch(appointmentRepositoryProvider);
    final appointment = await repo.fetchById(appointmentId);
    final doctorId = appointment.doctorId;
    if (doctorId == null) {
      throw StateError('Appointment missing doctor_id');
    }
    final doctor = await ref.watch(cachedDoctorProvider(doctorId).future);
    return AppointmentDetailState(appointment: appointment, doctor: doctor);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  Future<Appointment> cancel({String? reason}) async {
    final repo = ref.read(appointmentRepositoryProvider);
    final updated = await repo.cancel(
      appointmentId: appointmentId,
      reason: reason,
    );
    final doctorId = updated.doctorId;
    if (doctorId != null) {
      final doctor = await ref.read(cachedDoctorProvider(doctorId).future);
      state = AsyncData(
        AppointmentDetailState(appointment: updated, doctor: doctor),
      );
    }
    ref.invalidate(appointmentsUpcomingProvider);
    ref.invalidate(appointmentsHistoryProvider);
    return updated;
  }
}
