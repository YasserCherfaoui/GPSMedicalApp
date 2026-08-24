import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/profile/screens/clinic_memberships_screen.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
  });

  Map<String, dynamic> membershipJson({
    required String id,
    required String clinicName,
    required String status,
    bool visibleOnProfile = true,
  }) => {
    'id': id,
    'clinic_id': 'clinic-$id',
    'specialist_id': '00000000-0000-4000-8000-000000000010',
    'clinic_name': clinicName,
    'status': status,
    'visible_on_profile': visibleOnProfile,
  };

  testWidgets('shows invitations with accept/refuse and active toggle', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    harness.adapter.onGet('/doctors/me/memberships', (server) {
      return server.reply(200, [
        membershipJson(
          id: 'mem-invited',
          clinicName: 'Clinique El Shifa',
          status: 'invited',
          visibleOnProfile: false,
        ),
        membershipJson(
          id: 'mem-active',
          clinicName: 'Clinique Hydra',
          status: 'active',
        ),
      ]);
    });
    harness.adapter.onPost('/doctors/me/memberships/mem-invited/accept', (
      server,
    ) {
      return server.reply(
        200,
        membershipJson(
          id: 'mem-invited',
          clinicName: 'Clinique El Shifa',
          status: 'active',
        ),
      );
    });

    await tester.pumpWidget(
      harness.wrapScreen(const ClinicMembershipsScreen()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Affiliations cliniques'), findsOneWidget);
    expect(find.text('Invitations'), findsOneWidget);
    expect(find.text('Affiliations actives'), findsOneWidget);
    expect(find.text('Clinique El Shifa'), findsOneWidget);
    expect(find.text('Clinique Hydra'), findsOneWidget);
    expect(find.text('Accepter'), findsOneWidget);
    expect(find.text('Refuser'), findsOneWidget);
    expect(find.text('Demander le détachement'), findsOneWidget);
    expect(find.text('Visible sur mon profil public'), findsOneWidget);

    await tester.tap(find.text('Accepter'));
    await tester.pumpAndSettle();

    expect(find.text('Accepter'), findsNothing);
    expect(find.text('Demander le détachement'), findsNWidgets(2));
  });

  testWidgets('shows empty state when there are no memberships', (
    tester,
  ) async {
    harness.adapter.onGet('/doctors/me/memberships', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });

    await tester.pumpWidget(
      harness.wrapScreen(const ClinicMembershipsScreen()),
    );
    await tester.pumpAndSettle();

    expect(
      find.text('Aucune invitation ni affiliation pour le moment.'),
      findsOneWidget,
    );
  });
}
