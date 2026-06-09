import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/reviews/screens/review_confirmation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Widget wrap({required Review review}) {
    return ProviderScope(
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: ReviewConfirmationScreen(
          appointmentId: 'appt-review-1',
          review: review,
        ),
      ),
    );
  }

  testWidgets('shows pending moderation confirmation', (tester) async {
    final review = Review(
      (b) => b
        ..id = 'rev-1'
        ..doctorId = 'doc-1'
        ..patientId = 'pat-1'
        ..appointmentId = 'appt-review-1'
        ..rating = 4
        ..comment = 'Très bien'
        ..status = ReviewStatusEnum.pending
        ..createdAt = DateTime.now().subtract(const Duration(days: 1)),
    );

    await tester.pumpWidget(wrap(review: review));
    await tester.pumpAndSettle();

    expect(find.text('Merci pour votre avis'), findsWidgets);
    expect(find.text('En attente de modération'), findsOneWidget);
    expect(find.text('Retour au rendez-vous'), findsOneWidget);
    expect(find.text('Supprimer mon avis'), findsOneWidget);
  });
}
