import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final l10nDir = Directory('lib/src/l10n');
  final template = File('${l10nDir.path}/app_fr.arb');
  final locales = ['app_ar.arb', 'app_ber.arb'];

  test('all locale arb files have identical key sets as French template', () {
    final templateKeys = _messageKeys(template);
    expect(templateKeys, isNotEmpty);

    for (final fileName in locales) {
      final keys = _messageKeys(File('${l10nDir.path}/$fileName'));
      expect(
        keys,
        templateKeys,
        reason: '$fileName must match app_fr.arb keys',
      );
    }
  });

  test('Tamazight has at least 80% non-French strings', () {
    final fr = _loadArb(template);
    final ber = _loadArb(File('${l10nDir.path}/app_ber.arb'));
    final keys = fr.keys.where((k) => !k.startsWith('@')).toList();

    var identical = 0;
    for (final key in keys) {
      if (ber[key] == fr[key]) identical++;
    }

    final translatedRatio = (keys.length - identical) / keys.length;
    expect(
      translatedRatio,
      greaterThanOrEqualTo(0.8),
      reason: 'ber translated $translatedRatio (${keys.length - identical}/'
          '${keys.length}); identical keys: $identical',
    );
  });
}

Set<String> _messageKeys(File file) {
  final data = _loadArb(file);
  return data.keys.where((k) => !k.startsWith('@')).toSet();
}

Map<String, dynamic> _loadArb(File file) {
  return jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
}
