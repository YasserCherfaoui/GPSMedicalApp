import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/booking/providers/booking_draft.provider.dart';
import 'package:patient_app/features/booking/providers/connectivity.provider.dart';
import 'package:patient_app/features/booking/widgets/booking_draft_resume_listener.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('prompts to resume draft when connectivity returns', (
    tester,
  ) async {
    final connectivity = StreamController<bool>.broadcast();
    addTearDown(connectivity.close);

    final navKey = GlobalKey<NavigatorState>();
    final router = GoRouter(
      navigatorKey: navKey,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const Scaffold(body: Text('Accueil')),
        ),
        GoRoute(
          path: GpsRoutes.booking,
          builder: (_, __) => const Scaffold(body: Text('Réservation')),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          isOnlineProvider.overrideWith((ref) => connectivity.stream),
        ],
        child: MaterialApp.router(
          theme: GpsTheme.light(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('fr'),
          routerConfig: router,
          builder: (context, child) => BookingDraftResumeListener(
            navigatorKey: navKey,
            child: child ?? const SizedBox.shrink(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final container = ProviderScope.containerOf(
      tester.element(find.text('Accueil')),
    );
    final notifier = container.read(bookingDraftProvider.notifier);
    notifier.startBooking(
      doctorId: 'doc-resume-listener',
      doctor: $Doctor(
        (b) => b
          ..id = 'doc-resume-listener'
          ..title = 'Dr.'
          ..fullName = 'Karim Benali'
          ..consultationFeeDzd = 2500,
      ),
    );
    notifier.selectSlotDraftOnly(
      AvailabilitySlot(
        (b) => b
          ..startAt = DateTime.utc(2026, 6, 10, 9)
          ..endAt = DateTime.utc(2026, 6, 10, 9, 30)
          ..mode = AvailabilitySlotModeEnum.inPerson,
      ),
    );
    notifier.setStep(2);
    expect(container.read(bookingDraftProvider).hasRestorableDraft, isTrue);

    connectivity.add(false);
    await tester.pump();
    connectivity.add(true);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Reprendre'), findsOneWidget);
    expect(find.textContaining('réservation en cours'), findsOneWidget);
  });
}
