import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/booking/providers/booking_draft.provider.dart';
import 'package:patient_app/features/booking/screens/clinic_availability_calendar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test_api_constants.dart';

class _ClinicCalendarHarness extends ConsumerStatefulWidget {
  const _ClinicCalendarHarness({
    required this.clinicId,
    required this.serviceId,
  });

  final String clinicId;
  final String serviceId;

  @override
  ConsumerState<_ClinicCalendarHarness> createState() =>
      _ClinicCalendarHarnessState();
}

class _ClinicCalendarHarnessState
    extends ConsumerState<_ClinicCalendarHarness> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(bookingDraftProvider.notifier)
          .startClinicBooking(
            clinicId: widget.clinicId,
            clinicName: 'Clinique El Shifa',
            serviceId: widget.serviceId,
            serviceName: 'Consultation générale',
            serviceFeeAmount: 3500,
            offersTelehealth: true,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClinicAvailabilityCalendarScreen(
      clinicId: widget.clinicId,
      serviceId: widget.serviceId,
    );
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

  Widget wrap({required String clinicId, required String serviceId}) {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: _ClinicCalendarHarness(clinicId: clinicId, serviceId: serviceId),
      ),
    );
  }

  testWidgets('shows clinic service header and availability slots', (
    tester,
  ) async {
    const clinicId = 'clinic-cal-1';
    const serviceId = 'svc-cal-1';
    final slotDay = DateTime.now().add(const Duration(days: 2)).toUtc();
    adapter.onGet('/clinics/$clinicId/services/$serviceId/availability', (
      server,
    ) {
      return server.reply(200, [
        {
          'start_at': slotDay.toIso8601String(),
          'end_at': slotDay.add(const Duration(minutes: 30)).toIso8601String(),
          'mode': 'in_person',
          'slot_lock_token': 'lock-clinic-1',
        },
      ]);
    });

    await tester.pumpWidget(wrap(clinicId: clinicId, serviceId: serviceId));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Choisir un créneau'), findsOneWidget);
    expect(find.text('Clinique El Shifa'), findsOneWidget);
    expect(find.text('Consultation générale'), findsOneWidget);
    expect(
      find.text(
        'Vous réservez un service ; la clinique attribue le praticien.',
      ),
      findsOneWidget,
    );
    expect(find.textContaining('créneau'), findsWidgets);
  });
}
