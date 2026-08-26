import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:specialist_app/features/profile/screens/clinic_memberships_screen.dart';
import 'package:specialist_app/features/schedule/screens/schedule_editor_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    SharedPreferences.setMockInitialValues({
      'gps.specialist.donated_schedule_notice_seen': true,
    });
    harness = SpecialistTestHarness()..setUpClient();
    harness.adapter.onGet('/doctors/me/schedule/templates', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });
    harness.adapter.onGet('/doctors/me/schedule/exceptions', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });
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
    expect(find.text('Aucun créneau donné'), findsOneWidget);
    expect(find.text('Gérer les créneaux donnés'), findsOneWidget);
    expect(find.text('Accepter'), findsOneWidget);
    expect(find.text('Refuser'), findsOneWidget);
    expect(find.text('Demander le détachement'), findsOneWidget);
    expect(find.text('Visible sur mon profil public'), findsOneWidget);

    await tester.tap(find.text('Accepter'));
    await tester.pumpAndSettle();

    expect(find.text('Accepter'), findsNothing);
    expect(find.text('Demander le détachement'), findsNWidgets(2));
  });

  testWidgets('shows donated hours and opens filtered schedule editor', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    harness.adapter.onGet('/doctors/me/memberships', (server) {
      return server.reply(200, [
        membershipJson(
          id: 'mem-active',
          clinicName: 'Clinique Hydra',
          status: 'active',
        ),
      ]);
    });
    harness.adapter.onGet('/doctors/me/schedule/templates', (server) {
      return server.reply(200, [
        {
          'id': '00000000-0000-4000-8000-000000000200',
          'weekday': 1,
          'start_time': '09:00',
          'end_time': '12:00',
          'slot_duration_minutes': 30,
          'mode': 'both',
          'active': true,
          'clinic_id': 'clinic-mem-active',
        },
      ]);
    });

    await tester.pumpWidget(
      harness.wrapWithRouter(
        const ClinicMembershipsScreen(),
        extraRoutes: [
          GoRoute(
            path: SpecialistRoutes.scheduleEdit,
            builder: (context, state) {
              final clinicId = state.uri.queryParameters['clinicId'];
              return ScheduleEditorScreen(filterClinicId: clinicId);
            },
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('3 h / semaine données'), findsOneWidget);
    await tester.tap(find.text('Gérer les créneaux donnés'));
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Affichage des créneaux donnés à Clinique Hydra'),
      findsOneWidget,
    );
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
