import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/main.dart';

void main() {
  testWidgets('shows specialist bootstrap screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SpecialistApp());

    expect(find.text('Specialist app — Phase 1 scaffolding'), findsOneWidget);
    expect(find.text('GPS Médical — Spécialiste'), findsOneWidget);
    expect(
      find.textContaining('Shared model: HealthCheck.status'),
      findsOneWidget,
    );
    expect(find.textContaining('http://localhost:8080/v1'), findsOneWidget);
  });

  test('HealthCheck model is shared via gps_medical_shared', () {
    expect(HealthCheckStatusEnum.ok.name, 'ok');
  });
}
