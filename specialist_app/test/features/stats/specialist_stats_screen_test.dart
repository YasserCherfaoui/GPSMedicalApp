import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/stats/screens/specialist_stats_screen.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockDoctorMe();
    harness.mockEmptyStats();
  });

  testWidgets('stats screen shows overview cards and empty chart', (
    tester,
  ) async {
    await tester.pumpWidget(harness.wrapScreen(const SpecialistStatsScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Terminés'), findsOneWidget);
    expect(find.text('Revenus'), findsWidgets);
    expect(
      find.text('Pas assez de données pour afficher le graphique.'),
      findsOneWidget,
    );
  });
}
