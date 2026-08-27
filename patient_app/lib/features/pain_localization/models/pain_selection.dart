class PainPoint {
  const PainPoint({required this.x, required this.y, required this.z});

  final double x;
  final double y;
  final double z;

  factory PainPoint.fromJson(Map<String, dynamic> json) {
    return PainPoint(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {'x': x, 'y': y, 'z': z};
}

class PainUv {
  const PainUv({required this.u, required this.v});

  final double u;
  final double v;

  factory PainUv.fromJson(Map<String, dynamic> json) {
    return PainUv(
      u: (json['u'] as num).toDouble(),
      v: (json['v'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {'u': u, 'v': v};
}

/// A tap from the sealed viewer. Persist [code] + [model], never [label].
class PainSelection {
  const PainSelection({
    required this.model,
    required this.kind,
    required this.code,
    this.side,
    this.system,
    this.point,
    this.uv,
    required this.selectedAt,
  });

  final String model;
  final String kind;
  final String code;
  final String? side;
  final String? system;
  final PainPoint? point;
  final PainUv? uv;
  final DateTime selectedAt;

  factory PainSelection.fromJs(Object? raw, {DateTime? selectedAt}) {
    if (raw is! Map) {
      throw const FormatException('zoneSelected payload is not a map');
    }
    final json = Map<String, dynamic>.from(raw);
    final model = json['model'] as String?;
    final kind = json['kind'] as String?;
    final code = json['code'] as String?;
    if (model == null ||
        model.isEmpty ||
        kind == null ||
        kind.isEmpty ||
        code == null ||
        code.isEmpty) {
      throw const FormatException('zoneSelected missing model/kind/code');
    }
    final pointRaw = json['point'];
    final uvRaw = json['uv'];
    return PainSelection(
      model: model,
      kind: kind,
      code: code,
      side: json['side'] as String?,
      system: json['system'] as String?,
      point: pointRaw is Map
          ? PainPoint.fromJson(Map<String, dynamic>.from(pointRaw))
          : null,
      uv: uvRaw is Map
          ? PainUv.fromJson(Map<String, dynamic>.from(uvRaw))
          : null,
      selectedAt: selectedAt ?? DateTime.now().toUtc(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'kind': kind,
      'code': code,
      if (side != null) 'side': side,
      if (system != null) 'system': system,
      if (point != null) 'point': point!.toJson(),
      if (uv != null) 'uv': uv!.toJson(),
      'selectedAt': selectedAt.toUtc().toIso8601String(),
    };
  }

  factory PainSelection.fromPersisted(Map<String, dynamic> json) {
    return PainSelection.fromJs(
      json,
      selectedAt: DateTime.parse(json['selectedAt'] as String).toUtc(),
    );
  }
}
