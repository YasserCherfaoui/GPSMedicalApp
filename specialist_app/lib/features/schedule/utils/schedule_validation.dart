import 'package:gps_medical_shared/gps_medical_shared.dart';

const kValidSlotDurations = [10, 15, 20, 30, 45, 60];

/// Client-side validation mirroring `backend/internal/booking/handler.go`.
class ScheduleValidation {
  const ScheduleValidation._();

  static Map<String, String> validateTemplate({
    required int weekday,
    required String startTime,
    required String endTime,
    required int slotDurationMinutes,
    required String mode,
  }) {
    final errors = <String, String>{};

    if (weekday < 0 || weekday > 6) {
      errors['weekday'] = 'INVALID_WEEKDAY';
    }

    if (!kValidSlotDurations.contains(slotDurationMinutes)) {
      errors['slot_duration_minutes'] = 'INVALID_SLOT_DURATION';
    }

    if (mode != 'in_person' && mode != 'telehealth' && mode != 'both') {
      errors['mode'] = 'INVALID_MODE';
    }

    if (startTime.trim().isEmpty) {
      errors['start_time'] = 'START_TIME_REQUIRED';
    }
    if (endTime.trim().isEmpty) {
      errors['end_time'] = 'END_TIME_REQUIRED';
    }

    final startParts = _parseTime(startTime);
    final endParts = _parseTime(endTime);
    if (startParts == null && startTime.trim().isNotEmpty) {
      errors['start_time'] = 'INVALID_START_TIME';
    }
    if (endParts == null && endTime.trim().isNotEmpty) {
      errors['end_time'] = 'INVALID_END_TIME';
    }

    if (startParts != null && endParts != null) {
      final startMin = startParts[0] * 60 + startParts[1];
      final endMin = endParts[0] * 60 + endParts[1];
      if (endMin <= startMin) {
        errors['end_time'] = 'END_TIME_MUST_EXCEED_START';
      } else if (kValidSlotDurations.contains(slotDurationMinutes)) {
        final diff = endMin - startMin;
        if (diff % slotDurationMinutes != 0) {
          errors['slot_duration_minutes'] = 'INVALID_SLOT_INTERVAL';
        }
      }
    }

    return errors;
  }

  static Map<String, String> validateException({
    required DateTime? startAt,
    required DateTime? endAt,
    required String kind,
    String? note,
  }) {
    final errors = <String, String>{};

    if (startAt == null) {
      errors['start_at'] = 'START_AT_REQUIRED';
    }
    if (endAt == null) {
      errors['end_at'] = 'END_AT_REQUIRED';
    }
    if (startAt != null && endAt != null && !endAt.isAfter(startAt)) {
      errors['end_at'] = 'END_AT_MUST_EXCEED_START';
    }

    const validKinds = {'vacation', 'sick', 'blocked'};
    if (!validKinds.contains(kind)) {
      errors['kind'] = 'INVALID_KIND';
    }

    if (note != null && note.length > 200) {
      errors['note'] = 'NOTE_TOO_LONG';
    }

    return errors;
  }

  static List<int>? _parseTime(String value) {
    final match = RegExp(r'^([0-2][0-9]):([0-5][0-9])$').firstMatch(value.trim());
    if (match == null) return null;
    final hour = int.parse(match.group(1)!);
    final minute = int.parse(match.group(2)!);
    if (hour > 23) return null;
    return [hour, minute];
  }
}

ScheduleTemplateCreateSlotDurationMinutesEnum slotDurationToCreateEnum(int minutes) {
  switch (minutes) {
    case 10:
      return ScheduleTemplateCreateSlotDurationMinutesEnum.number10;
    case 15:
      return ScheduleTemplateCreateSlotDurationMinutesEnum.number15;
    case 20:
      return ScheduleTemplateCreateSlotDurationMinutesEnum.number20;
    case 30:
      return ScheduleTemplateCreateSlotDurationMinutesEnum.number30;
    case 45:
      return ScheduleTemplateCreateSlotDurationMinutesEnum.number45;
    case 60:
      return ScheduleTemplateCreateSlotDurationMinutesEnum.number60;
    default:
      return ScheduleTemplateCreateSlotDurationMinutesEnum.number30;
  }
}

int slotDurationFromTemplate(ScheduleTemplate template) {
  final value = template.slotDurationMinutes;
  if (value == null) return 30;
  return slotDurationFromEnum(value);
}

int slotDurationFromEnum(ScheduleTemplateSlotDurationMinutesEnum value) {
  switch (value) {
    case ScheduleTemplateSlotDurationMinutesEnum.number10:
      return 10;
    case ScheduleTemplateSlotDurationMinutesEnum.number15:
      return 15;
    case ScheduleTemplateSlotDurationMinutesEnum.number20:
      return 20;
    case ScheduleTemplateSlotDurationMinutesEnum.number30:
      return 30;
    case ScheduleTemplateSlotDurationMinutesEnum.number45:
      return 45;
    case ScheduleTemplateSlotDurationMinutesEnum.number60:
      return 60;
    default:
      return 30;
  }
}

ScheduleTemplateCreateModeEnum modeToCreateEnum(String mode) {
  switch (mode) {
    case 'telehealth':
      return ScheduleTemplateCreateModeEnum.telehealth;
    case 'both':
      return ScheduleTemplateCreateModeEnum.both;
    default:
      return ScheduleTemplateCreateModeEnum.inPerson;
  }
}

String modeFromTemplate(ScheduleTemplate template) {
  return template.mode?.name ?? 'both';
}
