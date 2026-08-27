import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/pain_localization/pain3d_constants.dart';
import 'package:patient_app/features/pain_localization/services/pain_label_catalog.dart';

/// Frozen v1.1.0 zone_codes — additive-only. Never rename or remove.
const _frozenZoneCodes = <String>{
  'head',
  'neck',
  'shoulder_l',
  'shoulder_r',
  'arm_upper_l',
  'arm_upper_r',
  'elbow_l',
  'elbow_r',
  'forearm_l',
  'forearm_r',
  'hand_l',
  'hand_r',
  'chest',
  'abdomen',
  'back_upper',
  'back_lower',
  'hip_l',
  'hip_r',
  'thigh_l',
  'thigh_r',
  'knee_l',
  'knee_r',
  'leg_lower_l',
  'leg_lower_r',
  'foot_l',
  'foot_r',
  'genitalia',
  'buttock_l',
  'buttock_r',
  'groin_l',
  'groin_r',
  'wrist_l',
  'wrist_r',
  'ankle_l',
  'ankle_r',
};

void main() {
  final assets = Directory('assets/pain3d');

  Map<String, dynamic> loadJson(String name) {
    final raw = File('${assets.path}/$name').readAsStringSync();
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Set<String> structureCodes(Map<String, dynamic> doc) {
    final structures = doc['structures'] as Map<String, dynamic>;
    return structures.values
        .map(
          (value) =>
              (value as Map<String, dynamic>)['structure_code'] as String,
        )
        .toSet();
  }

  test('zones.json stays on v1.1.0 and keeps frozen zone_codes', () {
    final doc = loadJson('zones.json');
    expect(doc['version'], pain3dAssetVersion);
    final zones = doc['zones'] as Map<String, dynamic>;
    final codes = zones.values
        .map((value) => (value as Map<String, dynamic>)['zone_code'] as String)
        .toSet();
    expect(codes, containsAll(_frozenZoneCodes));
    expect(
      _frozenZoneCodes.difference(codes),
      isEmpty,
      reason: 'zone_codes may be added but never removed or renamed',
    );
  });

  test('structures.json is additive over the frozen male code set', () {
    final doc = loadJson('structures.json');
    expect(doc['count'], greaterThanOrEqualTo(1950));
    final codes = structureCodes(doc);
    final frozen = _loadFrozenCodes('structure_codes_male.txt');
    expect(
      frozen.difference(codes),
      isEmpty,
      reason: 'male structure_codes may be added but never removed or renamed',
    );
  });

  test(
    'structures_female.json is additive over the frozen female code set',
    () {
      final doc = loadJson('structures_female.json');
      expect(doc['count'], greaterThanOrEqualTo(1952));
      final codes = structureCodes(doc);
      final frozen = _loadFrozenCodes('structure_codes_female.txt');
      expect(
        frozen.difference(codes),
        isEmpty,
        reason:
            'female structure_codes may be added but never removed or renamed',
      );
    },
  );

  test('every frozen zone_code has FR and AR labels in zones.json', () {
    final zones = loadJson('zones.json')['zones'] as Map<String, dynamic>;
    final byCode = <String, Map<String, dynamic>>{};
    for (final value in zones.values) {
      final row = Map<String, dynamic>.from(value as Map);
      byCode[row['zone_code'] as String] = row;
    }
    for (final code in _frozenZoneCodes) {
      final row = byCode[code];
      expect(row, isNotNull, reason: code);
      expect(
        row!['label_fr'],
        isA<String>().having((s) => s.trim().isNotEmpty, 'non-empty', true),
        reason: '$code label_fr',
      );
      expect(
        row['label_ar'],
        isA<String>().having((s) => s.trim().isNotEmpty, 'non-empty', true),
        reason: '$code label_ar',
      );
    }
  });

  test('structure AR/FR nulls fall back EN; rates measured per file', () {
    for (final name in ['structures.json', 'structures_female.json']) {
      final audit = StructureLabelAudit.fromDoc(name, loadJson(name));
      expect(audit.withEn, audit.total, reason: '$name must have EN');
      expect(
        audit.arFallbackRate,
        1.0,
        reason:
            '$name v1.0.0 is EN-only; translation task fills AR (rate=$audit)',
      );
      expect(
        audit.frFallbackRate,
        1.0,
        reason: '$name v1.0.0 is EN-only; translation task fills FR',
      );
    }
  });

  test('catalog maps zones and EN structure fallback from bundled JSON', () {
    final catalog = PainLabelCatalog.fromVocabularies(
      zones: loadJson('zones.json'),
      structuresMale: loadJson('structures.json'),
      structuresFemale: loadJson('structures_female.json'),
    );
    expect(catalog.labelFor('wrist_l', 'fr'), 'Poignet gauche');
    expect(catalog.labelFor('wrist_l', 'ar'), 'المعصم الأيسر');
    expect(catalog.labelFor('genitalia', 'fr'), 'Parties génitales');
    expect(catalog.labelFor('l_supinator', 'fr'), 'supinator');
    expect(catalog.labelFor('l_supinator', 'ar'), 'supinator');
  });

  test('painLocalization chrome keys exist in FR and AR arb files', () {
    Map<String, dynamic> loadArb(String name) {
      final file = File('../shared_lib/lib/src/l10n/$name');
      return jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    }

    final fr = loadArb('app_fr.arb');
    final ar = loadArb('app_ar.arb');
    final keys = fr.keys
        .where((key) => key.startsWith('painLocalization'))
        .toList();
    expect(keys, isNotEmpty);
    expect(ar.keys, containsAll(keys));
    for (final key in keys) {
      expect(fr[key], isA<String>().having((s) => s.isNotEmpty, 'copy', true));
      expect(ar[key], isA<String>().having((s) => s.isNotEmpty, 'copy', true));
    }
  });
}

Set<String> _loadFrozenCodes(String fileName) {
  final file = File('test/features/pain_localization/fixtures/$fileName');
  return file
      .readAsLinesSync()
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty)
      .toSet();
}
