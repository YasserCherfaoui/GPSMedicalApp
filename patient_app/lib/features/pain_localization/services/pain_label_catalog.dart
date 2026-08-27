import 'dart:convert';

import 'package:flutter/services.dart';

/// Zone labels from bundled `zones.json`. Structure codes fall back to [code].
class PainLabelCatalog {
  const PainLabelCatalog(this._frByCode, [this._arByCode = const {}]);

  final Map<String, String> _frByCode;
  final Map<String, String> _arByCode;

  factory PainLabelCatalog.fromZonesJson(Map<String, dynamic> json) {
    final zones = json['zones'];
    final fr = <String, String>{};
    final ar = <String, String>{};
    if (zones is Map) {
      for (final value in zones.values) {
        if (value is! Map) continue;
        final code = value['zone_code'] as String?;
        if (code == null || code.isEmpty) continue;
        final labelFr = value['label_fr'] as String?;
        final labelAr = value['label_ar'] as String?;
        if (labelFr != null && labelFr.isNotEmpty) fr[code] = labelFr;
        if (labelAr != null && labelAr.isNotEmpty) ar[code] = labelAr;
      }
    }
    return PainLabelCatalog(fr, ar);
  }

  static Future<PainLabelCatalog> loadFromBundle([AssetBundle? bundle]) async {
    final source = await (bundle ?? rootBundle).loadString(
      'assets/pain3d/zones.json',
    );
    return PainLabelCatalog.fromZonesJson(
      jsonDecode(source) as Map<String, dynamic>,
    );
  }

  String labelFor(String code, String languageCode) {
    if (languageCode == 'ar') {
      return _arByCode[code] ?? _frByCode[code] ?? code;
    }
    return _frByCode[code] ?? code;
  }
}
