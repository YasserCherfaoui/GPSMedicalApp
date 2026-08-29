class BilanSummary {
  const BilanSummary({
    required this.id,
    required this.sessionId,
    required this.status,
    required this.tier,
    required this.finalScore,
    required this.zoneCode,
    required this.createdAt,
  });

  final String id;
  final String sessionId;
  final String status;
  final String tier;
  final double finalScore;
  final String zoneCode;
  final DateTime createdAt;

  factory BilanSummary.fromJson(Map<String, dynamic> json) {
    return BilanSummary(
      id: json['id'] as String,
      sessionId: json['session_id'] as String,
      status: json['status'] as String? ?? 'final',
      tier: json['tier'] as String? ?? 'detailed',
      finalScore: (json['final_score'] as num?)?.toDouble() ?? 0,
      zoneCode: json['zone_code'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}

class BilanDetail {
  const BilanDetail({
    required this.id,
    required this.sessionId,
    required this.status,
    required this.tier,
    required this.templateVersion,
    required this.disclaimerFr,
    required this.sections,
    required this.createdAt,
    this.pdfDocumentId,
  });

  final String id;
  final String sessionId;
  final String status;
  final String tier;
  final String templateVersion;
  final String disclaimerFr;
  final Map<String, dynamic> sections;
  final DateTime createdAt;
  final String? pdfDocumentId;

  double get finalScore =>
      (sections['score']?['final_score'] as num?)?.toDouble() ?? 0;

  String get summaryFr =>
      sections['narrative']?['summary_fr'] as String? ?? '';

  String get orientationFr =>
      sections['narrative']?['orientation_fr'] as String? ?? '';

  factory BilanDetail.fromJson(Map<String, dynamic> json) {
    return BilanDetail(
      id: json['id'] as String,
      sessionId: json['session_id'] as String,
      status: json['status'] as String? ?? 'final',
      tier: json['tier'] as String? ?? 'detailed',
      templateVersion: json['template_version'] as String? ?? '',
      disclaimerFr: json['disclaimer_fr'] as String? ?? '',
      sections: Map<String, dynamic>.from(
        json['sections'] as Map? ?? const {},
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      pdfDocumentId: json['pdf_document_id'] as String?,
    );
  }
}

class BilanPdfDownload {
  const BilanPdfDownload({required this.downloadUrl, required this.expiresAt});

  final String downloadUrl;
  final DateTime expiresAt;

  factory BilanPdfDownload.fromJson(Map<String, dynamic> json) {
    return BilanPdfDownload(
      downloadUrl: json['download_url'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
    );
  }
}

class BilanTransmission {
  const BilanTransmission({
    required this.id,
    required this.bilanId,
    required this.transmittedAt,
  });

  final String id;
  final String bilanId;
  final DateTime transmittedAt;

  factory BilanTransmission.fromJson(Map<String, dynamic> json) {
    return BilanTransmission(
      id: json['id'] as String,
      bilanId: json['bilan_id'] as String,
      transmittedAt: DateTime.parse(json['transmitted_at'] as String),
    );
  }
}
