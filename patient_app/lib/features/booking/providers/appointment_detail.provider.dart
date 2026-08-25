import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../discovery/providers/discovery_repositories.provider.dart';
import 'appointments_history.provider.dart';
import 'appointments_upcoming.provider.dart';
import 'booking_repositories.provider.dart';
import 'doctor_cache.provider.dart';

part 'appointment_detail.provider.g.dart';

class AppointmentDetailState {
  const AppointmentDetailState({
    required this.appointment,
    this.doctor,
    this.clinic,
    this.serviceName,
  });

  final Appointment appointment;
  final Doctor? doctor;
  final Clinic? clinic;
  final String? serviceName;

  bool get isClinicBooking =>
      appointment.origin == AppointmentOriginEnum.clinicService;

  bool get awaitingSpecialistAssignment =>
      isClinicBooking && appointment.doctorId == null;
}

@riverpod
class AppointmentDetail extends _$AppointmentDetail {
  @override
  Future<AppointmentDetailState> build(String appointmentId) async {
    final repo = ref.watch(appointmentRepositoryProvider);
    final appointment = await repo.fetchById(appointmentId);
    return _loadContext(appointment);
  }

  Future<AppointmentDetailState> _loadContext(Appointment appointment) async {
    final isClinic = appointment.origin == AppointmentOriginEnum.clinicService;
    Clinic? clinic;
    String? serviceName;
    Doctor? doctor;

    if (isClinic && appointment.clinicId != null) {
      final clinicRepo = ref.read(clinicRepositoryProvider);
      clinic = await clinicRepo.fetchById(appointment.clinicId!);
      final serviceId = appointment.serviceId;
      if (serviceId != null) {
        final services = await clinicRepo.fetchServices(appointment.clinicId!);
        for (final service in services) {
          if (service.id == serviceId) {
            serviceName = service.name;
            break;
          }
        }
      }
    }

    final doctorId = appointment.doctorId;
    if (doctorId != null) {
      doctor = await ref.read(cachedDoctorProvider(doctorId).future);
    } else if (!isClinic) {
      throw StateError('Appointment missing doctor_id');
    }

    return AppointmentDetailState(
      appointment: appointment,
      doctor: doctor,
      clinic: clinic,
      serviceName: serviceName,
    );
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
    state = AsyncData(await _loadContext(updated));
    ref.invalidate(appointmentsUpcomingProvider);
    ref.invalidate(appointmentsHistoryProvider);
    return updated;
  }
}
