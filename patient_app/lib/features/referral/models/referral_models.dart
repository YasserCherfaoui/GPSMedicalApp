class ReferralMatch {
  const ReferralMatch({
    required this.id,
    required this.sessionId,
    required this.specialistId,
    required this.matchScore,
    required this.status,
    required this.rationaleFr,
    required this.createdAt,
    this.specialist,
    this.factors = const [],
  });

  final String id;
  final String sessionId;
  final String specialistId;
  final double matchScore;
  final String status;
  final String rationaleFr;
  final DateTime createdAt;
  final ReferralSpecialistSummary? specialist;
  final List<ReferralMatchFactor> factors;

  factory ReferralMatch.fromJson(Map<String, dynamic> json) {
    final factorsRaw = json['factors'] as List<dynamic>? ?? const [];
    return ReferralMatch(
      id: json['id'] as String,
      sessionId: json['session_id'] as String,
      specialistId: json['specialist_id'] as String,
      matchScore: (json['match_score'] as num?)?.toDouble() ?? 0,
      status: json['status'] as String? ?? 'validated',
      rationaleFr: json['rationale_fr'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at'] as String),
      specialist: json['specialist'] is Map
          ? ReferralSpecialistSummary.fromJson(
              Map<String, dynamic>.from(json['specialist'] as Map),
            )
          : null,
      factors: factorsRaw
          .map(
            (e) => ReferralMatchFactor.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList(),
    );
  }
}

class ReferralMatchFactor {
  const ReferralMatchFactor({
    required this.key,
    required this.weight,
    required this.score,
    required this.detailFr,
  });

  final String key;
  final double weight;
  final double score;
  final String detailFr;

  factory ReferralMatchFactor.fromJson(Map<String, dynamic> json) {
    return ReferralMatchFactor(
      key: json['key'] as String? ?? '',
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      score: (json['score'] as num?)?.toDouble() ?? 0,
      detailFr: json['detail_fr'] as String? ?? '',
    );
  }
}

class ReferralSpecialistSummary {
  const ReferralSpecialistSummary({
    required this.id,
    required this.fullName,
    required this.specialtyCode,
    required this.verified,
    this.consultationFeeDzd,
    this.photoUrl,
    this.ratingAverage,
    this.offersTelehealth = false,
  });

  final String id;
  final String fullName;
  final String specialtyCode;
  final bool verified;
  final int? consultationFeeDzd;
  final String? photoUrl;
  final double? ratingAverage;
  final bool offersTelehealth;

  factory ReferralSpecialistSummary.fromJson(Map<String, dynamic> json) {
    final specialtyName = json['specialty_name'];
    String specialtyLabel = json['specialty_code'] as String? ?? '';
    if (specialtyName is Map && specialtyName['fr'] is String) {
      specialtyLabel = specialtyName['fr'] as String;
    }
    return ReferralSpecialistSummary(
      id: json['id'] as String,
      fullName: json['full_name'] as String? ?? '',
      specialtyCode: specialtyLabel,
      verified: json['verified'] as bool? ?? false,
      consultationFeeDzd: (json['consultation_fee_dzd'] as num?)?.toInt(),
      photoUrl: json['photo_url'] as String?,
      ratingAverage: (json['rating_average'] as num?)?.toDouble(),
      offersTelehealth: json['offers_telehealth'] as bool? ?? false,
    );
  }
}
