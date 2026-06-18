import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../routing/specialist_routes.dart';

String? notificationDataField(
  BuiltMap<String, JsonObject?>? data,
  String key,
) {
  final value = data?[key];
  if (value == null) return null;
  if (value.isString) {
    final stringValue = value.asString;
    if (stringValue.isNotEmpty) return stringValue;
  }
  if (value.isNum) return value.asNum.toString();
  return null;
}

IconData specialistNotificationTypeIcon(NotificationTypeEnum? type) {
  return switch (type) {
    NotificationTypeEnum.appointmentConfirmed ||
    NotificationTypeEnum.appointmentReminder ||
    NotificationTypeEnum.appointmentCancelled ||
    NotificationTypeEnum.appointmentRescheduled => Icons.event_outlined,
    NotificationTypeEnum.newMessage => Icons.chat_bubble_outline,
    NotificationTypeEnum.prescriptionIssued => Icons.medication_outlined,
    NotificationTypeEnum.reviewRequest => Icons.star_outline,
    NotificationTypeEnum.adminAnnouncement => Icons.campaign_outlined,
    _ => Icons.notifications_outlined,
  };
}

String formatSpecialistNotificationTimestamp(
  DateTime? createdAt,
  String languageCode,
) {
  if (createdAt == null) return '';
  return formatReviewRelativeTime(createdAt.toLocal(), languageCode);
}

String? specialistNotificationDeepLinkRoute(Notification notification) {
  final appointmentId = notificationDataField(
    notification.data,
    'appointment_id',
  );
  if (appointmentId != null && appointmentId.isNotEmpty) {
    return SpecialistRoutes.appointmentDetail(appointmentId);
  }
  final threadId = notificationDataField(notification.data, 'thread_id');
  if (threadId != null && threadId.isNotEmpty) {
    return SpecialistRoutes.messagingThread(threadId);
  }
  return null;
}

void navigateSpecialistFromNotificationData(
  BuildContext context,
  Map<String, dynamic> data,
) {
  final appointmentId = data['appointment_id']?.toString();
  if (appointmentId != null && appointmentId.isNotEmpty) {
    context.push(SpecialistRoutes.appointmentDetail(appointmentId));
    return;
  }
  final threadId = data['thread_id']?.toString();
  if (threadId != null && threadId.isNotEmpty) {
    context.push(SpecialistRoutes.messagingThread(threadId));
    return;
  }
  if (data['type']?.toString() == 'verification_decision') {
    context.push(SpecialistRoutes.verificationPending);
  }
}

String? notificationDataFieldFromMap(Map<String, dynamic> data, String key) {
  final value = data[key];
  if (value == null) return null;
  final stringValue = value.toString();
  return stringValue.isEmpty ? null : stringValue;
}
