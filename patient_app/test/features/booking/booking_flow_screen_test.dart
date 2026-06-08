import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/booking/providers/booking_draft.provider.dart';
import 'package:patient_app/features/booking/providers/connectivity.provider.dart';
import 'package:patient_app/features/booking/screens/booking_flow_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../test_api_constants.dart';

class _BookingFlowHarness extends ConsumerStatefulWidget {
  const _BookingFlowHarness();

  @override
  ConsumerState<_BookingFlowHarness> createState() => _BookingFlowHarnessState();
}

class _BookingFlowHarnessState extends ConsumerState<_BookingFlowHarness> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookingDraftProvider.notifier).startBooking(
        doctorId: 'doc-flow-1',
        doctor: $Doctor(
          (b) => b
            ..id = 'doc-flow-1'
            ..title = 'Dr.'
            ..fullName = 'Karim Benali'
            ..consultationFeeDzd = 2500,
        ),
      );
      ref.read(bookingDraftProvider.notifier).selectSlot(
        AvailabilitySlot(
          (b) => b
            ..startAt = DateTime.utc(2026, 6, 10, 9)
            ..endAt = DateTime.utc(2026, 6, 10, 9, 30)
            ..mode = AvailabilitySlotModeEnum.inPerson
            ..slotLockToken = 'lock-flow',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BookingFlowScreen();
  }
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
  });

  Widget wrap(
    Widget child, {
    bool online = true,
    List<Override> extraOverrides = const [],
  }) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, __) => child),
        GoRoute(
          path: GpsRoutes.booking,
          builder: (_, __) => const BookingFlowScreen(),
        ),
        GoRoute(
          path: '/doctors/:id/book',
          builder: (_, __) => const SizedBox.shrink(),
        ),
      ],
    );

    return ProviderScope(
      overrides: [
        gpsMedicalClientProvider.overrideWithValue(client),
        isOnlineProvider.overrideWith((ref) => Stream.value(online)),
        ...extraOverrides,
      ],
      child: TickerMode(
        enabled: false,
        child: MaterialApp.router(
          theme: GpsTheme.light(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('fr'),
          routerConfig: router,
        ),
      ),
    );
  }

  /// Bounded pumps for screens with [SlotLockBanner] (avoid pumpAndSettle).
  Future<void> pumpBooking(WidgetTester tester) async {
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
  }

  void mockDependents() {
    adapter.onGet('/patients/me/dependents', (server) {
      return server.reply(200, [
        {
          'id': 'dep-1',
          'full_name': 'Amina Benali',
          'relation': 'child',
        },
      ]);
    });
  }

  testWidgets('step 1 shows doctor slot mode and fee', (tester) async {
    mockDependents();

    await tester.pumpWidget(wrap(const _BookingFlowHarness()));
    await pumpBooking(tester);

    expect(find.text('Confirmer le créneau'), findsWidgets);
    expect(find.text('Dr. Karim Benali'), findsWidgets);
    expect(find.text('Honoraires'), findsWidgets);
    expect(find.text('2500 DZD'), findsWidgets);
    expect(find.text('En présentiel'), findsWidgets);
  });

  testWidgets('advances to patient step with dependents list', (tester) async {
    mockDependents();

    await tester.pumpWidget(wrap(const _BookingFlowHarness()));
    await pumpBooking(tester);

    await tester.tap(find.text('Suivant'));
    await pumpBooking(tester);

    expect(find.text('Pour moi'), findsWidgets);
    expect(find.text('Amina Benali'), findsOneWidget);
  });

  testWidgets('review step shows summary and reason field', (tester) async {
    mockDependents();

    await tester.pumpWidget(wrap(const BookingFlowScreen()));

    final container = ProviderScope.containerOf(
      tester.element(find.byType(BookingFlowScreen)),
    );
    container.read(bookingDraftProvider.notifier).state = BookingDraftState(
      doctorId: 'doc-review',
      doctor: $Doctor(
        (b) => b
          ..id = 'doc-review'
          ..title = 'Dr.'
          ..fullName = 'Karim Benali'
          ..consultationFeeDzd = 2500,
      ),
      selectedSlot: AvailabilitySlot(
        (b) => b
          ..startAt = DateTime.utc(2026, 6, 10, 9)
          ..endAt = DateTime.utc(2026, 6, 10, 9, 30)
          ..mode = AvailabilitySlotModeEnum.inPerson,
      ),
      step: 3,
    );
    await pumpBooking(tester);

    expect(
      find.widgetWithText(PrimaryButton, 'Confirmer le rendez-vous'),
      findsOneWidget,
    );
    expect(find.text('Motif de consultation (optionnel)'), findsOneWidget);
    expect(find.text('Patient'), findsOneWidget);
  });

  testWidgets('shows resume dialog when persisted draft loads', (tester) async {
    mockDependents();
    SharedPreferences.setMockInitialValues({
      'booking_draft_v1': jsonEncode({
        'doctorId': 'doc-resume',
        'doctorTitle': 'Dr.',
        'doctorFullName': 'Karim Benali',
        'doctorConsultationFeeDzd': 2500,
        'slotStartAt': '2026-06-10T09:00:00.000Z',
        'slotEndAt': '2026-06-10T09:30:00.000Z',
        'slotMode': 'in_person',
        'step': 2,
      }),
    });

    await tester.pumpWidget(wrap(const BookingFlowScreen()));
    await pumpBooking(tester);
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('Reprendre votre réservation ?'), findsOneWidget);
    expect(
      find.textContaining('connexion est nécessaire'),
      findsOneWidget,
    );
  });

  testWidgets('blocks submit with offline snackbar on review step', (tester) async {
    mockDependents();

    await tester.pumpWidget(
      wrap(const BookingFlowScreen(), online: false),
    );

    final container = ProviderScope.containerOf(
      tester.element(find.byType(BookingFlowScreen)),
    );
    container.read(bookingDraftProvider.notifier).state = BookingDraftState(
      doctorId: 'doc-offline',
      doctor: $Doctor(
        (b) => b
          ..id = 'doc-offline'
          ..title = 'Dr.'
          ..fullName = 'Karim Benali'
          ..consultationFeeDzd = 2500,
      ),
      selectedSlot: AvailabilitySlot(
        (b) => b
          ..startAt = DateTime.utc(2026, 6, 10, 9)
          ..endAt = DateTime.utc(2026, 6, 10, 9, 30)
          ..mode = AvailabilitySlotModeEnum.inPerson,
      ),
      step: 3,
    );
    await pumpBooking(tester);

    await tester.tap(
      find.widgetWithText(PrimaryButton, 'Confirmer le rendez-vous'),
    );
    await pumpBooking(tester);

    expect(
      find.text('Connexion requise pour confirmer le rendez-vous'),
      findsOneWidget,
    );
  });
}
