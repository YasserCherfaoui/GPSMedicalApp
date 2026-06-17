import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

String scheduleModeLabel(AppLocalizations l10n, String mode) {
  switch (mode) {
    case 'in_person':
      return l10n.specialistScheduleModeInPerson;
    case 'telehealth':
      return l10n.specialistScheduleModeTelehealth;
    default:
      return l10n.specialistScheduleModeBoth;
  }
}

String scheduleExceptionKindLabel(
  AppLocalizations l10n,
  ScheduleExceptionKindEnum? kind,
) {
  switch (kind) {
    case ScheduleExceptionKindEnum.vacation:
      return l10n.specialistScheduleExceptionVacation;
    case ScheduleExceptionKindEnum.sick:
      return l10n.specialistScheduleExceptionSick;
    case ScheduleExceptionKindEnum.blocked:
      return l10n.specialistScheduleExceptionBlocked;
    case ScheduleExceptionKindEnum.extra:
      return l10n.specialistScheduleExceptionExtra;
    default:
      return l10n.specialistScheduleExceptionBlocked;
  }
}

String validationErrorMessage(AppLocalizations l10n, String code) {
  switch (code) {
    case 'INVALID_WEEKDAY':
      return l10n.specialistScheduleErrorWeekday;
    case 'INVALID_SLOT_DURATION':
    case 'INVALID_SLOT_INTERVAL':
      return l10n.specialistScheduleErrorSlotDuration;
    case 'INVALID_MODE':
      return l10n.specialistScheduleErrorMode;
    case 'START_TIME_REQUIRED':
    case 'INVALID_START_TIME':
      return l10n.specialistScheduleErrorStartTime;
    case 'END_TIME_REQUIRED':
    case 'INVALID_END_TIME':
    case 'END_TIME_MUST_EXCEED_START':
      return l10n.specialistScheduleErrorEndTime;
    case 'START_AT_REQUIRED':
    case 'INVALID_START_AT':
      return l10n.specialistScheduleErrorStartDate;
    case 'END_AT_REQUIRED':
    case 'INVALID_END_AT':
    case 'END_AT_MUST_EXCEED_START':
      return l10n.specialistScheduleErrorEndDate;
    case 'INVALID_KIND':
      return l10n.specialistScheduleErrorKind;
    case 'NOTE_TOO_LONG':
      return l10n.specialistScheduleErrorNote;
    default:
      return l10n.specialistScheduleLoadError;
  }
}

Color exceptionKindColor(BuildContext context, ScheduleExceptionKindEnum? kind) {
  final scheme = Theme.of(context).colorScheme;
  switch (kind) {
    case ScheduleExceptionKindEnum.vacation:
      return scheme.tertiary;
    case ScheduleExceptionKindEnum.sick:
      return scheme.error;
    case ScheduleExceptionKindEnum.extra:
      return scheme.primary;
    default:
      return scheme.outline;
  }
}
