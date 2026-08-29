class IncomingBilanTransmission {
  const IncomingBilanTransmission({
    required this.id,
    required this.bilanId,
    required this.sessionId,
    required this.patientId,
    required this.transmittedAt,
    this.reviewedAt,
  });

  final String id;
  final String bilanId;
  final String sessionId;
  final String patientId;
  final DateTime transmittedAt;
  final DateTime? reviewedAt;

  bool get isOpen => reviewedAt == null;

  factory IncomingBilanTransmission.fromJson(Map<String, dynamic> json) {
    return IncomingBilanTransmission(
      id: json['id'] as String,
      bilanId: json['bilan_id'] as String,
      sessionId: json['session_id'] as String,
      patientId: json['patient_id'] as String,
      transmittedAt: DateTime.parse(json['transmitted_at'] as String),
      reviewedAt: json['reviewed_at'] != null
          ? DateTime.parse(json['reviewed_at'] as String)
          : null,
    );
  }
}

class IncomingBilanDetail {
  const IncomingBilanDetail({
    required this.transmission,
    required this.bilan,
  });

  final IncomingBilanTransmission transmission;
  final Map<String, dynamic> bilan;

  String get summaryFr =>
      (bilan['sections']?['narrative']?['summary_fr'] as String?) ?? '';

  factory IncomingBilanDetail.fromJson(Map<String, dynamic> json) {
    return IncomingBilanDetail(
      transmission: IncomingBilanTransmission.fromJson(
        Map<String, dynamic>.from(json['transmission'] as Map),
      ),
      bilan: Map<String, dynamic>.from(json['bilan'] as Map),
    );
  }
}
