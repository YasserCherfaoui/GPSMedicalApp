import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/main.dart';

void main() {
  testWidgets('shows specialist bootstrap screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SpecialistApp());

    expect(find.text('Specialist app — Phase 1 scaffolding'), findsOneWidget);
    expect(find.text('GPS Médical — Spécialiste'), findsOneWidget);
  });
}
