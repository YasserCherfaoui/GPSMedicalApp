import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/main.dart';

void main() {
  testWidgets('shows patient bootstrap screen', (WidgetTester tester) async {
    await tester.pumpWidget(const PatientApp());

    expect(find.text('Patient app — Phase 1 scaffolding'), findsOneWidget);
    expect(find.text('GPS Médical — Patient'), findsOneWidget);
  });
}
