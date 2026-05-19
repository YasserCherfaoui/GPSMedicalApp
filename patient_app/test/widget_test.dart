import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/main.dart';

void main() {
  testWidgets('shows patient bootstrap with design system', (tester) async {
    await tester.pumpWidget(const PatientApp());

    expect(find.text('Patient app — Phase 1 scaffolding'), findsOneWidget);
    expect(find.text('GPS Médical — Patient'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });

  test('GpsTheme is applied', () {
    expect(GpsTheme.light().colorScheme.primary, GpsColors.primary);
  });
}
