import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/main.dart';

void main() {
  testWidgets('starts on splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appInfoProvider.overrideWithValue(
            const GpsMedicalAppInfo(
              displayName: 'GPS Médical — Spécialiste',
              clientKind: GpsMedicalClientKind.specialist,
            ),
          ),
        ],
        child: const SpecialistApp(),
      ),
    );
    await tester.pump();
    expect(find.text('GPS MÉDICAL'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(find.textContaining('Choisissez votre langue'), findsOneWidget);
  });
}
