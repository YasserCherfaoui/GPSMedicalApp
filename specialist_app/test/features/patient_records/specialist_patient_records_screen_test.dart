import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/patient_records/screens/specialist_patient_records_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;
  const appointmentId = '00000000-0000-4000-8000-000000000099';
  const patientId = '00000000-0000-4000-8000-000000000050';

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.adapter.onGet('/appointments/$appointmentId', (server) {
      return server.reply(
        200,
        minimalAppointmentJson(
          id: appointmentId,
          status: 'confirmed',
          patientId: patientId,
        ),
      );
    });
    harness.adapter.onGet('/medical-records', (server) {
      return server.reply(200, emptyPaginated());
    });
  });

  testWidgets('patient records shows empty shared documents', (tester) async {
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistPatientRecordsScreen(appointmentId: appointmentId),
        extraRoutes: [
          GoRoute(
            path: '/specialist/medical-records/:id',
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.shell,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Dossier du patient'), findsOneWidget);
    expect(find.text('Aucun document partagé'), findsOneWidget);
  });

  testWidgets('patient records lists shared documents', (tester) async {
    harness.adapter.onGet('/medical-records', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': '00000000-0000-4000-8000-000000000070',
            'owner_patient_id': patientId,
            'type': 'lab_result',
            'title': 'Bilan sanguin',
            'created_at': '2026-06-01T00:00:00Z',
          },
          {
            'id': '00000000-0000-4000-8000-000000000071',
            'owner_patient_id': patientId,
            'type': 'imaging',
            'title': 'Radio thorax',
            'created_at': '2026-06-02T00:00:00Z',
          },
        ],
        'meta': {'page': 1, 'page_size': 20, 'total': 2, 'total_pages': 1},
      });
    });

    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistPatientRecordsScreen(appointmentId: appointmentId),
        extraRoutes: [
          GoRoute(
            path: '/specialist/medical-records/:id',
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.shell,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Bilan sanguin'), findsOneWidget);
    expect(find.text('Radio thorax'), findsOneWidget);
  });
}
