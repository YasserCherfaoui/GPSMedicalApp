import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/booking/providers/booking_draft.provider.dart';
import 'package:patient_app/features/booking/screens/booking_flow_screen.dart';

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
      final draft = ref.read(bookingDraftProvider);
      if (draft.doctorId != null) return;
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
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
  });

  Widget wrap(Widget child) {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: child,
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
    expect(find.text('Dr. Karim Benali'), findsOneWidget);
    expect(find.textContaining('expire dans'), findsOneWidget);
    expect(find.text('Honoraires'), findsOneWidget);
    expect(find.text('2500 DZD'), findsOneWidget);
    expect(find.text('En présentiel'), findsOneWidget);
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

    await tester.pumpWidget(wrap(const _BookingFlowHarness()));
    await pumpBooking(tester);

    await tester.tap(find.widgetWithText(PrimaryButton, 'Suivant'));
    await pumpBooking(tester);
    await tester.tap(find.widgetWithText(PrimaryButton, 'Suivant'));
    await pumpBooking(tester);

    expect(
      find.widgetWithText(PrimaryButton, 'Confirmer le rendez-vous'),
      findsOneWidget,
    );
    expect(find.text('Motif de consultation (optionnel)'), findsOneWidget);
    expect(find.text('Patient'), findsOneWidget);
  });
}
