import 'dart:convert';

import 'package:flutter/services.dart';

bool _hasLabel(Object? value) => value is String && value.trim().isNotEmpty;

String? _trimmed(Object? value) =>
    _hasLabel(value) ? (value as String).trim() : null;

/// Zone + structure labels. AR → FR → EN → code (matches the sealed viewer).
class PainLabelCatalog {
  const PainLabelCatalog(
    this._frByCode, [
    this._arByCode = const {},
    this._enByCode = const {},
  ]);

  final Map<String, String> _frByCode;
  final Map<String, String> _arByCode;
  final Map<String, String> _enByCode;

  factory PainLabelCatalog.fromZonesJson(Map<String, dynamic> json) {
    return PainLabelCatalog.fromVocabularies(zones: json);
  }

  factory PainLabelCatalog.fromVocabularies({
    required Map<String, dynamic> zones,
    Map<String, dynamic>? structuresMale,
    Map<String, dynamic>? structuresFemale,
  }) {
    final fr = <String, String>{};
    final ar = <String, String>{};
    final en = <String, String>{};
    _ingestZones(zones, fr: fr, ar: ar);
    if (structuresMale != null) {
      _ingestStructures(structuresMale, fr: fr, ar: ar, en: en);
    }
    if (structuresFemale != null) {
      _ingestStructures(structuresFemale, fr: fr, ar: ar, en: en);
    }
    return PainLabelCatalog(fr, ar, en);
  }

  static Future<PainLabelCatalog> loadFromBundle([AssetBundle? bundle]) async {
    final b = bundle ?? rootBundle;
    final loaded = await Future.wait([
      b.loadString('assets/pain3d/zones.json'),
      b.loadString('assets/pain3d/structures.json'),
      b.loadString('assets/pain3d/structures_female.json'),
    ]);
    return PainLabelCatalog.fromVocabularies(
      zones: jsonDecode(loaded[0]) as Map<String, dynamic>,
      structuresMale: jsonDecode(loaded[1]) as Map<String, dynamic>,
      structuresFemale: jsonDecode(loaded[2]) as Map<String, dynamic>,
    );
  }

  String labelFor(String code, String languageCode) {
    if (languageCode == 'ar') {
      return _arByCode[code] ?? _frByCode[code] ?? _enByCode[code] ?? code;
    }
    return _frByCode[code] ?? _enByCode[code] ?? code;
  }

  static void _ingestZones(
    Map<String, dynamic> json, {
    required Map<String, String> fr,
    required Map<String, String> ar,
  }) {
    final zones = json['zones'];
    if (zones is! Map) return;
    for (final value in zones.values) {
      if (value is! Map) continue;
      final code = value['zone_code'] as String?;
      if (code == null || code.isEmpty) continue;
      final labelFr = _trimmed(value['label_fr']);
      final labelAr = _trimmed(value['label_ar']);
      if (labelFr != null) fr[code] = labelFr;
      if (labelAr != null) ar[code] = labelAr;
    }
  }

  static void _ingestStructures(
    Map<String, dynamic> json, {
    required Map<String, String> fr,
    required Map<String, String> ar,
    required Map<String, String> en,
  }) {
    final structures = json['structures'];
    if (structures is! Map) return;
    for (final value in structures.values) {
      if (value is! Map) continue;
      final code = value['structure_code'] as String?;
      if (code == null || code.isEmpty) continue;
      final labelFr = _trimmed(value['label_fr']);
      final labelAr = _trimmed(value['label_ar']);
      final labelEn = _trimmed(value['label_en']);
      if (labelFr != null) fr[code] = labelFr;
      if (labelAr != null) ar[code] = labelAr;
      if (labelEn != null) en[code] = labelEn;
    }
  }
}

/// Snapshot of AR/FR coverage in a structures vocabulary file.
class StructureLabelAudit {
  const StructureLabelAudit({
    required this.fileName,
    required this.total,
    required this.withAr,
    required this.withFr,
    required this.withEn,
  });

  final String fileName;
  final int total;
  final int withAr;
  final int withFr;
  final int withEn;

  int get missingAr => total - withAr;
  int get missingFr => total - withFr;

  /// Share of rows whose AR is null/empty (viewer falls back FR → EN).
  double get arFallbackRate => total == 0 ? 0 : missingAr / total;

  /// Share of rows whose FR is null/empty (viewer falls back to EN).
  double get frFallbackRate => total == 0 ? 0 : missingFr / total;

  factory StructureLabelAudit.fromDoc(
    String fileName,
    Map<String, dynamic> doc,
  ) {
    final structures = doc['structures'];
    if (structures is! Map) {
      return StructureLabelAudit(
        fileName: fileName,
        total: 0,
        withAr: 0,
        withFr: 0,
        withEn: 0,
      );
    }
    var ar = 0;
    var fr = 0;
    var en = 0;
    for (final value in structures.values) {
      if (value is! Map) continue;
      if (_hasLabel(value['label_ar'])) ar++;
      if (_hasLabel(value['label_fr'])) fr++;
      if (_hasLabel(value['label_en'])) en++;
    }
    return StructureLabelAudit(
      fileName: fileName,
      total: structures.length,
      withAr: ar,
      withFr: fr,
      withEn: en,
    );
  }
}
