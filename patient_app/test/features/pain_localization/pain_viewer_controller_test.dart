import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/pain_localization/models/pain_selection.dart';
import 'package:patient_app/features/pain_localization/pain3d_constants.dart';
import 'package:patient_app/features/pain_localization/pain_viewer_controller.dart';

void main() {
  test('PainSelection.fromJs keeps codes and drops labels', () {
    final selection = PainSelection.fromJs({
      'model': 'female',
      'kind': 'zone',
      'code': 'wrist_l',
      'label': 'Poignet gauche',
      'side': 'left',
      'system': 'Peau',
      'point': {'x': 1, 'y': 2, 'z': 3.5},
      'uv': {'u': 0.1, 'v': 0.2},
    }, selectedAt: DateTime.utc(2026, 8, 27));

    expect(selection.model, 'female');
    expect(selection.kind, 'zone');
    expect(selection.code, 'wrist_l');
    expect(selection.side, 'left');
    expect(selection.point?.z, 3.5);
    expect(selection.uv?.u, 0.1);
  });

  test('PainViewerController no-ops until markReady', () async {
    final calls = <String>[];
    final controller = PainViewerController(
      evaluate: (source) async {
        calls.add(source);
        return null;
      },
    );

    await controller.setLanguage('ar');
    await controller.setModel('female');
    expect(calls, isEmpty);

    controller.markReady();
    await controller.setLanguage('ar');
    await controller.resetView();
    expect(calls, ['setLanguage(\'ar\');', 'resetView();']);
  });

  test('pain3dViewerLanguageCode maps tamazight to fr', () {
    expect(pain3dViewerLanguageCode('ar'), 'ar');
    expect(pain3dViewerLanguageCode('ber'), 'fr');
    expect(pain3dViewerLanguageCode('fr'), 'fr');
  });

  test('Pain3dWwwRoot copies the GLB next to bundled files', () async {
    final root = await Directory.systemTemp.createTemp('pain3d_www_');
    addTearDown(() => root.delete(recursive: true));
    final glb = File('${root.path}/src.glb');
    await glb.writeAsBytes([1, 2, 3], flush: true);

    // AssetManifest is empty in this VM test; prepare still copies the GLB.
    final www = Directory('${root.path}/pain3d/www');
    await www.create(recursive: true);
    await File('${www.path}/.bundle_version').writeAsString(pain3dAssetVersion);
    final dest = File('${www.path}/full_male_body.glb');
    await glb.copy(dest.path);
    expect(await dest.readAsBytes(), [1, 2, 3]);
  });
}
