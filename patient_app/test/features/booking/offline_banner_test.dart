import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/booking/providers/connectivity.provider.dart';
import 'package:patient_app/features/booking/widgets/offline_banner.dart';

void main() {
  Widget wrap({required bool online}) {
    return ProviderScope(
      overrides: [
        isOnlineProvider.overrideWith((ref) => Stream.value(online)),
      ],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: const Scaffold(body: OfflineBanner()),
      ),
    );
  }

  testWidgets('shows Hors ligne banner when offline', (tester) async {
    await tester.pumpWidget(wrap(online: false));
    await tester.pump();

    expect(find.textContaining('Hors ligne'), findsOneWidget);
    expect(find.byIcon(Icons.cloud_off_outlined), findsOneWidget);
  });

  testWidgets('hides banner when online', (tester) async {
    await tester.pumpWidget(wrap(online: true));
    await tester.pump();

    expect(find.textContaining('Hors ligne'), findsNothing);
  });
}
