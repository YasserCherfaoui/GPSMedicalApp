import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/pain_localization/models/pain3d_body.dart';
import 'package:patient_app/features/pain_localization/models/pain3d_download_progress.dart';
import 'package:patient_app/features/pain_localization/models/pain_selection.dart';
import 'package:patient_app/features/pain_localization/pain3d_constants.dart';
import 'package:patient_app/features/pain_localization/providers/pain_selection.provider.dart';
import 'package:patient_app/features/pain_localization/screens/pain_localization_screen.dart';
import 'package:patient_app/features/pain_localization/services/asset_download_service.dart';

class _EmptyStore implements Pain3dGlbStore {
  @override
  Future<File?> verifiedFile(Pain3dBody body, {String? expectedSha256}) {
    return Future<File?>.value(null);
  }

  @override
  Stream<Pain3dDownloadProgress> ensureBody(Pain3dBody body) {
    return const Stream.empty();
  }
}

void main() {
  Widget app({required Widget home}) {
    return ProviderScope(
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: home,
      ),
    );
  }

  testWidgets('offline without a cached GLB shows retry copy', (tester) async {
    await tester.pumpWidget(
      app(
        home: PainLocalizationScreen(
          hostWebView: false,
          store: _EmptyStore(),
          forceOnline: false,
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(find.text('Modèle indisponible hors ligne'), findsOneWidget);
    expect(find.text('Réessayer'), findsOneWidget);
  });

  testWidgets('download view shows percent', (tester) async {
    await tester.pumpWidget(
      app(
        home: const Scaffold(
          body: PainLocalizationDownloadView(
            progress: Pain3dDownloadProgress(
              phase: Pain3dDownloadPhase.downloading,
              receivedBytes: 50,
              totalBytes: 100,
            ),
          ),
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    expect(find.text('Téléchargement du modèle (50%)'), findsOneWidget);
  });

  test('PainSelectionNotifier dedupes by code+model', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final notifier = container.read(painSelectionProvider.notifier);
    final first = PainSelection(
      model: 'male',
      kind: 'zone',
      code: 'wrist_l',
      selectedAt: DateTime.utc(2026, 8, 27),
    );
    notifier.add(first);
    notifier.add(first);
    expect(container.read(painSelectionProvider), hasLength(1));
  });

  test('pinned version is 1.1.0', () {
    expect(pain3dAssetVersion, '1.1.0');
  });
}
