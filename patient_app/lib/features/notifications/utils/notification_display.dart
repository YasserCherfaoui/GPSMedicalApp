import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

String? notificationDataField(BuiltMap<String, JsonObject?>? data, String key) {
  final value = data?[key];
  if (value == null) return null;
  if (value.isString) {
    final stringValue = value.asString;
    if (stringValue.isNotEmpty) return stringValue;
  }
  if (value.isNum) return value.asNum.toString();
  return null;
}

IconData notificationTypeIcon(NotificationTypeEnum? type) {
  return switch (type) {
    NotificationTypeEnum.appointmentConfirmed ||
    NotificationTypeEnum.appointmentReminder ||
    NotificationTypeEnum.appointmentCancelled ||
    NotificationTypeEnum.appointmentRescheduled => Icons.event_outlined,
    NotificationTypeEnum.newMessage => Icons.chat_bubble_outline,
    NotificationTypeEnum.prescriptionIssued => Icons.medication_outlined,
    NotificationTypeEnum.paymentSucceeded ||
    NotificationTypeEnum.paymentFailed => Icons.payments_outlined,
    NotificationTypeEnum.reviewRequest => Icons.star_outline,
    NotificationTypeEnum.adminAnnouncement => Icons.campaign_outlined,
    _ => Icons.notifications_outlined,
  };
}

String formatNotificationTimestamp(DateTime? createdAt, String languageCode) {
  if (createdAt == null) return '';
  return formatReviewRelativeTime(createdAt.toLocal(), languageCode);
}

String? notificationDeepLinkRoute(Notification notification) {
  final appointmentId = notificationDataField(
    notification.data,
    'appointment_id',
  );
  if (appointmentId != null && appointmentId.isNotEmpty) {
    return GpsRoutes.appointmentDetail(appointmentId);
  }
  final threadId = notificationDataField(notification.data, 'thread_id');
  if (threadId != null && threadId.isNotEmpty) {
    return GpsRoutes.messagingThreadDetail(threadId);
  }
  return null;
}

void navigateFromNotificationData(
  BuildContext context,
  Map<String, dynamic> data,
) {
  final appointmentId = data['appointment_id']?.toString();
  if (appointmentId != null && appointmentId.isNotEmpty) {
    context.push(GpsRoutes.appointmentDetail(appointmentId));
    return;
  }
  final threadId = data['thread_id']?.toString();
  if (threadId != null && threadId.isNotEmpty) {
    context.push(GpsRoutes.messagingThreadDetail(threadId));
  }
}

int reminderHoursBeforeValue(
  NotificationPreferencesReminderHoursBeforeEnum? value,
) {
  return switch (value) {
    NotificationPreferencesReminderHoursBeforeEnum.number2 => 2,
    NotificationPreferencesReminderHoursBeforeEnum.number6 => 6,
    NotificationPreferencesReminderHoursBeforeEnum.number12 => 12,
    NotificationPreferencesReminderHoursBeforeEnum.number24 => 24,
    _ => 1,
  };
}

NotificationPreferencesReminderHoursBeforeEnum reminderHoursBeforeEnum(
  int hours,
) {
  return switch (hours) {
    2 => NotificationPreferencesReminderHoursBeforeEnum.number2,
    6 => NotificationPreferencesReminderHoursBeforeEnum.number6,
    12 => NotificationPreferencesReminderHoursBeforeEnum.number12,
    24 => NotificationPreferencesReminderHoursBeforeEnum.number24,
    _ => NotificationPreferencesReminderHoursBeforeEnum.number1,
  };
}
