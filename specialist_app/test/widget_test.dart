import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/main.dart';

void main() {
  testWidgets('shows specialist bootstrap with design system', (tester) async {
    await tester.pumpWidget(const SpecialistApp());

    expect(find.text('Specialist app — Phase 1 scaffolding'), findsOneWidget);
    expect(find.text('GPS Médical — Spécialiste'), findsOneWidget);
    expect(find.text('Accéder à l’agenda'), findsOneWidget);
  });

  test('GpsTheme is applied', () {
    expect(GpsTheme.light().colorScheme.primary, GpsColors.primary);
  });
}
