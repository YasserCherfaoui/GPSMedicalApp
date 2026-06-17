import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/schedule_api_error.dart';
import '../utils/schedule_validation.dart';

class ScheduleRepository {
  ScheduleRepository(this._client);

  final GpsMedicalClient _client;

  Future<BuiltList<ScheduleTemplate>> listTemplates() async {
    try {
      final response = await _client.availability.doctorsMeScheduleTemplatesGet();
      return response.data ?? BuiltList<ScheduleTemplate>();
    } catch (e) {
      rethrowScheduleApiError(e);
    }
  }

  Future<ScheduleTemplate> createTemplate({
    required int weekday,
    required String startTime,
    required String endTime,
    required int slotDurationMinutes,
    required String mode,
  }) async {
    try {
      final body = ScheduleTemplateCreate(
        (b) => b
          ..weekday = weekday
          ..startTime = startTime
          ..endTime = endTime
          ..slotDurationMinutes = slotDurationToCreateEnum(slotDurationMinutes)
          ..mode = modeToCreateEnum(mode),
      );
      final response = await _client.availability.doctorsMeScheduleTemplatesPost(
        scheduleTemplateCreate: body,
      );
      final created = response.data;
      if (created == null) {
        throw StateError('Empty schedule template response');
      }
      return created;
    } catch (e) {
      rethrowScheduleApiError(e);
    }
  }

  Future<ScheduleTemplate> updateTemplate({
    required String templateId,
    required int weekday,
    required String startTime,
    required String endTime,
    required int slotDurationMinutes,
    required String mode,
  }) async {
    try {
      final body = ScheduleTemplateCreate(
        (b) => b
          ..weekday = weekday
          ..startTime = startTime
          ..endTime = endTime
          ..slotDurationMinutes = slotDurationToCreateEnum(slotDurationMinutes)
          ..mode = modeToCreateEnum(mode),
      );
      final response =
          await _client.availability.doctorsMeScheduleTemplatesTemplateIdPut(
        templateId: templateId,
        scheduleTemplateCreate: body,
      );
      final updated = response.data;
      if (updated == null) {
        throw StateError('Empty schedule template response');
      }
      return updated;
    } catch (e) {
      rethrowScheduleApiError(e);
    }
  }

  Future<void> deleteTemplate(String templateId) async {
    try {
      await _client.availability.doctorsMeScheduleTemplatesTemplateIdDelete(
        templateId: templateId,
      );
    } catch (e) {
      rethrowScheduleApiError(e);
    }
  }

  Future<BuiltList<ScheduleException>> listExceptions() async {
    try {
      final response =
          await _client.availability.doctorsMeScheduleExceptionsGet();
      return response.data ?? BuiltList<ScheduleException>();
    } catch (e) {
      rethrowScheduleApiError(e);
    }
  }

  Future<ScheduleException> createException({
    required DateTime startAt,
    required DateTime endAt,
    required ScheduleExceptionCreateKindEnum kind,
    String? note,
  }) async {
    try {
      final body = ScheduleExceptionCreate(
        (b) => b
          ..startAt = startAt.toUtc()
          ..endAt = endAt.toUtc()
          ..kind = kind
          ..note = note,
      );
      final response =
          await _client.availability.doctorsMeScheduleExceptionsPost(
        scheduleExceptionCreate: body,
      );
      final created = response.data;
      if (created == null) {
        throw StateError('Empty schedule exception response');
      }
      return created;
    } catch (e) {
      rethrowScheduleApiError(e);
    }
  }

  Future<BuiltList<AvailabilitySlot>> previewAvailability({
    required String doctorId,
    required Date from,
    required Date to,
    String mode = 'both',
  }) async {
    try {
      final response = await _client.availability.doctorsDoctorIdAvailabilityGet(
        doctorId: doctorId,
        from: from,
        to: to,
        mode: mode,
      );
      return response.data ?? BuiltList<AvailabilitySlot>();
    } catch (e) {
      rethrowScheduleApiError(e);
    }
  }
}
