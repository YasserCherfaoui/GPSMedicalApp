import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/notifications/utils/specialist_notification_display.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

void main() {
  test('notificationDataField reads string and num', () {
    final data = BuiltMap<String, JsonObject?>({
      'appointment_id': JsonObject('appt-1'),
      'count': JsonObject(3),
      'empty': JsonObject(''),
    });
    expect(notificationDataField(data, 'appointment_id'), 'appt-1');
    expect(notificationDataField(data, 'count'), '3');
    expect(notificationDataField(data, 'empty'), isNull);
    expect(notificationDataField(data, 'missing'), isNull);
    expect(notificationDataField(null, 'x'), isNull);
  });

  test('specialistNotificationTypeIcon maps types', () {
    expect(
      specialistNotificationTypeIcon(NotificationTypeEnum.appointmentConfirmed),
      Icons.event_outlined,
    );
    expect(
      specialistNotificationTypeIcon(NotificationTypeEnum.newMessage),
      Icons.chat_bubble_outline,
    );
    expect(
      specialistNotificationTypeIcon(NotificationTypeEnum.prescriptionIssued),
      Icons.medication_outlined,
    );
    expect(
      specialistNotificationTypeIcon(NotificationTypeEnum.reviewRequest),
      Icons.star_outline,
    );
    expect(
      specialistNotificationTypeIcon(NotificationTypeEnum.adminAnnouncement),
      Icons.campaign_outlined,
    );
    expect(specialistNotificationTypeIcon(null), Icons.notifications_outlined);
  });

  test('formatSpecialistNotificationTimestamp handles null', () {
    expect(formatSpecialistNotificationTimestamp(null, 'fr'), '');
    expect(
      formatSpecialistNotificationTimestamp(DateTime.now(), 'fr'),
      isNotEmpty,
    );
  });

  test('specialistNotificationDeepLinkRoute prefers appointment then thread', () {
    final withAppt = Notification(
      (b) => b
        ..id = 'n1'
        ..data = BuiltMap<String, JsonObject?>({
          'appointment_id': JsonObject('a1'),
          'thread_id': JsonObject('t1'),
        }).toBuilder(),
    );
    expect(
      specialistNotificationDeepLinkRoute(withAppt),
      SpecialistRoutes.appointmentDetail('a1'),
    );

    final withThread = Notification(
      (b) => b
        ..id = 'n2'
        ..data = BuiltMap<String, JsonObject?>({
          'thread_id': JsonObject('t1'),
        }).toBuilder(),
    );
    expect(
      specialistNotificationDeepLinkRoute(withThread),
      SpecialistRoutes.messagingThread('t1'),
    );

    final empty = Notification((b) => b..id = 'n3');
    expect(specialistNotificationDeepLinkRoute(empty), isNull);
  });

  testWidgets('navigateSpecialistFromNotificationData pushes routes', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (_, __) => const SizedBox.shrink()),
        GoRoute(
          path: '/specialist/appointments/:id',
          builder: (_, __) => const Scaffold(body: Text('appt')),
        ),
        GoRoute(
          path: '/specialist/messages/:id',
          builder: (_, __) => const Scaffold(body: Text('thread')),
        ),
        GoRoute(
          path: SpecialistRoutes.verificationPending,
          builder: (_, __) => const Scaffold(body: Text('verify')),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp.router(routerConfig: router),
    );

    navigateSpecialistFromNotificationData(
      tester.element(find.byType(SizedBox)),
      {'appointment_id': 'a1'},
    );
    await tester.pumpAndSettle();
    expect(find.text('appt'), findsOneWidget);

    router.go('/');
    await tester.pumpAndSettle();
    navigateSpecialistFromNotificationData(
      tester.element(find.byType(SizedBox)),
      {'thread_id': 't1'},
    );
    await tester.pumpAndSettle();
    expect(find.text('thread'), findsOneWidget);

    router.go('/');
    await tester.pumpAndSettle();
    navigateSpecialistFromNotificationData(
      tester.element(find.byType(SizedBox)),
      {'type': 'verification_decision'},
    );
    await tester.pumpAndSettle();
    expect(find.text('verify'), findsOneWidget);
  });

  test('notificationDataFieldFromMap', () {
    expect(notificationDataFieldFromMap({'a': 'x'}, 'a'), 'x');
    expect(notificationDataFieldFromMap({'a': ''}, 'a'), isNull);
    expect(notificationDataFieldFromMap({}, 'a'), isNull);
  });
}
