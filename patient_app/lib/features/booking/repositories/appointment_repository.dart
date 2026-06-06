import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/booking_api_error.dart';

class AppointmentRepository {
  AppointmentRepository(this._client);

  final GpsMedicalClient _client;

  Future<({List<Appointment> appointments, bool hasMore})> list({
    required String status,
    required int page,
    int pageSize = 20,
  }) async {
    try {
      final response = await _client.appointments.appointmentsGet(
        status: status,
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
      return (appointments: items, hasMore: hasMore);
    } catch (e) {
      rethrowBookingApiError(e);
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
      rethrowBookingApiError(e);
    }
  }

  Future<Appointment> create(AppointmentCreate body) async {
    try {
      final response = await _client.appointments.appointmentsPost(
        appointmentCreate: body,
      );
      final appointment = response.data;
      if (appointment == null) {
        throw StateError('Empty appointment response');
      }
      return appointment;
    } catch (e) {
      rethrowBookingApiError(e);
    }
  }

  Future<Appointment> reschedule({
    required String appointmentId,
    required String startAtRfc3339,
  }) async {
    try {
      final update = AppointmentUpdate(
        (b) => b..startAt = DateTime.parse(startAtRfc3339),
      );
      final response = await _client.appointments
          .appointmentsAppointmentIdPatch(
            appointmentId: appointmentId,
            appointmentUpdate: update,
          );
      final appointment = response.data;
      if (appointment == null) {
        throw StateError('Empty appointment response');
      }
      return appointment;
    } catch (e) {
      rethrowBookingApiError(e);
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
      final appointment = response.data;
      if (appointment == null) {
        throw StateError('Empty appointment response');
      }
      return appointment;
    } catch (e) {
      rethrowBookingApiError(e);
    }
  }
}
