import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/pain_localization/models/pain_selection.dart';
import 'package:patient_app/features/pain_localization/pain_viewer_controller.dart';
import 'package:patient_app/features/pain_localization/providers/pain_localization_flag.provider.dart';
import 'package:patient_app/features/pain_localization/providers/pain_selection.provider.dart';
import 'package:patient_app/features/pain_localization/services/pain_label_catalog.dart';
import 'package:patient_app/features/pain_localization/services/pain_selection_store.dart';
import 'package:patient_app/features/pain_localization/widgets/pain_selection_review_bar.dart';

PainSelection _sel({required String model, required String code}) {
  return PainSelection(
    model: model,
    kind: 'zone',
    code: code,
    selectedAt: DateTime.utc(2026, 8, 27),
  );
}

void main() {
  const labels = PainLabelCatalog(
    {'wrist_l': 'Poignet gauche', 'knee_r': 'Genou droit'},
    {'wrist_l': 'المعصم الأيسر'},
  );

  test('catalog prefers AR then FR then EN then code', () {
    const labels = PainLabelCatalog(
      {'wrist_l': 'Poignet gauche'},
      {'wrist_l': 'المعصم الأيسر'},
      {'l_supinator': 'supinator'},
    );
    expect(labels.labelFor('wrist_l', 'fr'), 'Poignet gauche');
    expect(labels.labelFor('wrist_l', 'ar'), 'المعصم الأيسر');
    expect(labels.labelFor('l_supinator', 'fr'), 'supinator');
    expect(labels.labelFor('l_supinator', 'ar'), 'supinator');
    expect(labels.labelFor('unknown', 'fr'), 'unknown');
  });

  test('catalog loads zone codes from bundled zones.json', () async {
    final catalog = PainLabelCatalog.fromZonesJson({
      'zones': {
        '1,2,3': {'zone_code': 'head', 'label_fr': 'Tête', 'label_ar': 'الرأس'},
      },
    });
    expect(catalog.labelFor('head', 'fr'), 'Tête');
  });

  test('secure-shaped JSON round-trips without labels', () async {
    final store = MemoryPainSelectionStore();
    final original = PainSelection.fromJs({
      'model': 'male',
      'kind': 'zone',
      'code': 'wrist_l',
      'label': 'DROP ME',
      'point': {'x': 1, 'y': 2, 'z': 3},
    }, selectedAt: DateTime.utc(2026, 8, 27, 12));
    await store.write([original]);
    final restored = await store.read();
    expect(restored.single.code, 'wrist_l');
    expect(restored.single.toJson().containsKey('label'), isFalse);
  });

  test('hydrate restores persisted selections', () async {
    final store = MemoryPainSelectionStore();
    await store.write([_sel(model: 'female', code: 'knee_r')]);
    final container = ProviderContainer(
      overrides: [painSelectionStoreProvider.overrideWithValue(store)],
    );
    addTearDown(container.dispose);
    await container.read(painSelectionProvider.notifier).hydrate();
    expect(container.read(painSelectionProvider).single.code, 'knee_r');
  });

  test(
    'PainViewerController restoreSelection is a no-op until ready',
    () async {
      final calls = <String>[];
      final controller = PainViewerController(
        evaluate: (source) async {
          calls.add(source);
          return null;
        },
      );
      await controller.restoreSelection(kind: 'zone', code: 'wrist_l');
      expect(calls, isEmpty);
      controller.markReady();
      await controller.restoreSelection(kind: 'zone', code: 'wrist_l');
      expect(calls.single, contains('restoreSelection'));
      expect(calls.single, contains('wrist_l'));
    },
  );

  testWidgets('review bar shows mixed-body markers, delete, and confirm', (
    tester,
  ) async {
    final removed = <String>[];
    var confirmed = false;
    var cleared = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: PainSelectionReviewBar(
              selections: [
                _sel(model: 'male', code: 'wrist_l'),
                _sel(model: 'female', code: 'knee_r'),
              ],
              languageCode: 'fr',
              labels: labels,
              onRemove: (item) => removed.add(item.code),
              onConfirm: () => confirmed = true,
              onClearAll: () => cleared = true,
            ),
          ),
        ),
      ),
    );

    expect(find.text('♂ Poignet gauche'), findsOneWidget);
    expect(find.text('♀ Genou droit'), findsOneWidget);
    await tester.tap(find.text('Confirmer'));
    expect(confirmed, isTrue);
    await tester.tap(find.text('Tout effacer'));
    expect(cleared, isTrue);
    await tester.tap(find.byTooltip('Retirer').first);
    expect(removed, isNotEmpty);
  });

  testWidgets('pending selection shows add button without committing', (
    tester,
  ) async {
    var added = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: PainSelectionReviewBar(
              selections: const [],
              pendingSelection: _sel(model: 'male', code: 'wrist_l'),
              languageCode: 'fr',
              labels: labels,
              onRemove: (_) {},
              onAddPending: () => added = true,
              onConfirm: () {},
              onClearAll: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('♂ Poignet gauche'), findsOneWidget);
    expect(find.text('Ajouter cette zone'), findsOneWidget);
    expect(find.textContaining('Touchez le modèle'), findsNothing);
    await tester.tap(find.text('Ajouter cette zone'));
    expect(added, isTrue);
  });

  testWidgets('pending duplicate shows already-added copy', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: PainSelectionReviewBar(
              selections: [_sel(model: 'male', code: 'wrist_l')],
              pendingSelection: _sel(model: 'male', code: 'wrist_l'),
              languageCode: 'fr',
              labels: labels,
              onRemove: (_) {},
              onAddPending: () {},
              onConfirm: () {},
              onClearAll: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Cette zone est déjà dans votre liste'), findsOneWidget);
    expect(find.text('Ajouter cette zone'), findsNothing);
  });

  testWidgets('empty review bar disables confirm', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: PainSelectionReviewBar(
              selections: const [],
              languageCode: 'fr',
              labels: labels,
              onRemove: (_) {},
              onConfirm: () {},
              onClearAll: () {},
            ),
          ),
        ),
      ),
    );
    expect(find.textContaining('explorer une zone'), findsOneWidget);
    final button = tester.widget<PrimaryButton>(find.byType(PrimaryButton));
    expect(button.onPressed, isNull);
  });

  testWidgets('Arabic review bar is RTL', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('ar'),
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: PainSelectionReviewBar(
              selections: const [],
              languageCode: 'ar',
              labels: labels,
              onRemove: (_) {},
              onConfirm: () {},
              onClearAll: () {},
            ),
          ),
        ),
      ),
    );
    expect(
      Directionality.of(tester.element(find.byType(PainSelectionReviewBar))),
      TextDirection.rtl,
    );
    expect(find.text('تأكيد'), findsOneWidget);
  });
}
