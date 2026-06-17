import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/appointment_api_error.dart';

class SpecialistAppointmentRepository {
  SpecialistAppointmentRepository(this._client);

  final GpsMedicalClient _client;

  Future<({List<Appointment> appointments, bool hasMore, int total})> list({
    required String status,
    required int page,
    int pageSize = 20,
    Date? from,
    Date? to,
  }) async {
    try {
      final response = await _client.appointments.appointmentsGet(
        status: status,
        from: from,
        to: to,
        page: page,
        pageSize: pageSize,
      );
      final paginated = response.data;
      final items = paginated?.data?.toList() ?? [];
      final meta = paginated?.meta;
      final total = meta?.total ?? items.length;
      final currentPage = meta?.page ?? page;
      final size = meta?.pageSize ?? pageSize;
      final totalPages = meta?.totalPages;
      final hasMore = totalPages != null
          ? currentPage < totalPages
          : currentPage * size < total;
      return (appointments: items, hasMore: hasMore, total: total);
    } catch (e) {
      rethrowAppointmentApiError(e);
    }
  }

  Future<Appointment> fetchById(String appointmentId) async {
    try {
      final response = await _client.appointments.appointmentsAppointmentIdGet(
        appointmentId: appointmentId,
      );
      final appointment = response.data;
      if (appointment == null) {
        throw StateError('Appointment not found');
      }
      return appointment;
    } catch (e) {
      rethrowAppointmentApiError(e);
    }
  }

  Future<Appointment> confirm(String appointmentId) async {
    try {
      final response = await _client.appointments
          .appointmentsAppointmentIdConfirmPost(appointmentId: appointmentId);
      return _requireAppointment(response.data);
    } catch (e) {
      rethrowAppointmentApiError(e);
    }
  }

  Future<Appointment> cancel({
    required String appointmentId,
    String? reason,
  }) async {
    try {
      final request = reason != null && reason.isNotEmpty
          ? AppointmentsAppointmentIdCancelPostRequest(
              (b) => b..reason = reason,
            )
          : null;
      final response = await _client.appointments
          .appointmentsAppointmentIdCancelPost(
            appointmentId: appointmentId,
            appointmentsAppointmentIdCancelPostRequest: request,
          );
      return _requireAppointment(response.data);
    } catch (e) {
      rethrowAppointmentApiError(e);
    }
  }

  Future<Appointment> markNoShow(String appointmentId) async {
    try {
      final response = await _client.appointments
          .appointmentsAppointmentIdNoShowPost(appointmentId: appointmentId);
      return _requireAppointment(response.data);
    } catch (e) {
      rethrowAppointmentApiError(e);
    }
  }

  Future<Appointment> reschedule({
    required String appointmentId,
    required DateTime startAt,
  }) async {
    try {
      final update = AppointmentUpdate((b) => b..startAt = startAt.toUtc());
      final response = await _client.appointments
          .appointmentsAppointmentIdPatch(
            appointmentId: appointmentId,
            appointmentUpdate: update,
          );
      return _requireAppointment(response.data);
    } catch (e) {
      rethrowAppointmentApiError(e);
    }
  }

  Appointment _requireAppointment(Appointment? appointment) {
    if (appointment == null) {
      throw StateError('Empty appointment response');
    }
    return appointment;
  }
}
