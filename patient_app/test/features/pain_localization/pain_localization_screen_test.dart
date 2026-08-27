import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/pain_localization/models/pain3d_body.dart';
import 'package:patient_app/features/pain_localization/models/pain3d_download_progress.dart';
import 'package:patient_app/features/pain_localization/models/pain_selection.dart';
import 'package:patient_app/features/pain_localization/pain3d_constants.dart';
import 'package:patient_app/features/pain_localization/providers/pain_localization_flag.provider.dart';
import 'package:patient_app/features/pain_localization/providers/pain_selection.provider.dart';
import 'package:patient_app/features/pain_localization/screens/pain_localization_screen.dart';
import 'package:patient_app/features/pain_localization/services/asset_download_service.dart';
import 'package:patient_app/features/pain_localization/services/pain3d_analytics.dart';
import 'package:patient_app/features/pain_localization/services/pain_label_catalog.dart';
import 'package:patient_app/features/pain_localization/services/pain_selection_store.dart';

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

class _FileStore implements Pain3dGlbStore {
  _FileStore(this.file);

  final File file;

  @override
  Future<File?> verifiedFile(Pain3dBody body, {String? expectedSha256}) {
    return Future<File?>.value(file);
  }

  @override
  Stream<Pain3dDownloadProgress> ensureBody(Pain3dBody body) {
    return const Stream.empty();
  }
}

PainSelection _sel({required String model, required String code}) {
  return PainSelection(
    model: model,
    kind: 'zone',
    code: code,
    selectedAt: DateTime.utc(2026, 8, 27),
  );
}

Future<void> _pumpUntilReady(WidgetTester tester) async {
  await tester.pump();
  for (var i = 0; i < 12; i++) {
    if (find.text('viewer-ready').evaluate().isNotEmpty) return;
    await tester.pump();
  }
}

void main() {
  Widget app({required Widget home, List<Override> overrides = const []}) {
    return ProviderScope(
      overrides: [
        painSelectionStoreProvider.overrideWithValue(
          MemoryPainSelectionStore(),
        ),
        painLabelCatalogProvider.overrideWith(
          (ref) => const PainLabelCatalog({}),
        ),
        ...overrides,
      ],
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

  test('PainSelectionNotifier dedupes by code+model', () async {
    final store = MemoryPainSelectionStore();
    final container = ProviderContainer(
      overrides: [painSelectionStoreProvider.overrideWithValue(store)],
    );
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
    notifier.add(_sel(model: 'female', code: 'wrist_l'));
    expect(container.read(painSelectionProvider), hasLength(2));
    await Future<void>.delayed(Duration.zero);
    expect(await store.read(), hasLength(2));
  });

  test('PainSelectionNotifier confirm persists and logs locally', () async {
    final store = MemoryPainSelectionStore();
    final analytics = Pain3dAnalytics();
    final container = ProviderContainer(
      overrides: [
        painSelectionStoreProvider.overrideWithValue(store),
        pain3dAnalyticsProvider.overrideWithValue(analytics),
      ],
    );
    addTearDown(container.dispose);
    final notifier = container.read(painSelectionProvider.notifier);
    notifier.add(_sel(model: 'male', code: 'wrist_l'));
    await notifier.confirm();
    expect(await store.read(), hasLength(1));
    expect(analytics.events.single.name, Pain3dAnalytics.selectionConfirmed);
    expect(analytics.events.single.properties['count'], 1);
  });

  test('pinned version is 1.1.0', () {
    expect(pain3dAssetVersion, '1.1.0');
  });

  testWidgets('ready screen hydrates chips and clear-all dialog', (
    tester,
  ) async {
    final glb = File(
      '${Directory.systemTemp.path}/pain3d_a201_${DateTime.now().microsecondsSinceEpoch}.glb',
    );
    glb.writeAsBytesSync(const [1, 2, 3]);
    addTearDown(() {
      if (glb.existsSync()) glb.deleteSync();
    });

    const labels = PainLabelCatalog({'wrist_l': 'Poignet gauche'});
    final selStore = MemoryPainSelectionStore()
      ..items = [_sel(model: 'male', code: 'wrist_l')];

    await tester.pumpWidget(
      app(
        overrides: [
          painSelectionStoreProvider.overrideWithValue(selStore),
          painLabelCatalogProvider.overrideWith((ref) => labels),
        ],
        home: PainLocalizationScreen(
          hostWebView: false,
          store: _FileStore(glb),
          forceOnline: true,
        ),
      ),
    );
    await _pumpUntilReady(tester);
    expect(find.text('Poignet gauche'), findsOneWidget);
    expect(find.text('viewer-ready'), findsOneWidget);

    await tester.tap(find.text('Tout effacer'));
    await tester.pump();
    expect(find.text('Effacer les sélections ?'), findsOneWidget);
    await tester.tap(find.text('Annuler'));
    await tester.pump();
    expect(find.text('Poignet gauche'), findsOneWidget);

    await tester.tap(find.text('Tout effacer'));
    await tester.pump();
    await tester.tap(find.widgetWithText(FilledButton, 'Tout effacer'));
    await tester.pump();
    expect(find.text('Poignet gauche'), findsNothing);
    expect(find.textContaining('Touchez le modèle'), findsOneWidget);
    expect(await selStore.read(), isEmpty);
  });
}
