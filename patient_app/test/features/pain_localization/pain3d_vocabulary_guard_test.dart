import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/pain_localization/pain3d_constants.dart';

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
}

Set<String> _loadFrozenCodes(String fileName) {
  final file = File('test/features/pain_localization/fixtures/$fileName');
  return file
      .readAsLinesSync()
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty)
      .toSet();
}
