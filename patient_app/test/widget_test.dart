import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/main.dart';

void main() {
  testWidgets('starts on splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appInfoProvider.overrideWithValue(
            const GpsMedicalAppInfo(
              displayName: 'GPS Médical — Patient',
              clientKind: GpsMedicalClientKind.patient,
            ),
          ),
        ],
        child: const PatientApp(),
      ),
    );
    await tester.pump();
    expect(find.text('GPS MÉDICAL'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(find.textContaining('Choisissez votre langue'), findsOneWidget);
  });
}
