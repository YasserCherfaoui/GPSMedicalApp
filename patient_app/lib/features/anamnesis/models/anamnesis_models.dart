import '../../pain_localization/models/pain_selection.dart';

class AnamnesisProgress {
  const AnamnesisProgress({
    required this.answeredCount,
    this.estimatedTotal,
  });

  final int answeredCount;
  final int? estimatedTotal;

  factory AnamnesisProgress.fromJson(Map<String, dynamic> json) {
    return AnamnesisProgress(
      answeredCount: json['answered_count'] as int? ?? 0,
      estimatedTotal: json['estimated_total'] as int?,
    );
  }
}

class AnamnesisSession {
  const AnamnesisSession({
    required this.id,
    required this.status,
    required this.zoneCode,
    required this.bodyModel,
    required this.treeId,
    required this.treeVersion,
    required this.progress,
  });

  final String id;
  final String status;
  final String zoneCode;
  final String bodyModel;
  final String treeId;
  final String treeVersion;
  final AnamnesisProgress progress;

  factory AnamnesisSession.fromJson(Map<String, dynamic> json) {
    return AnamnesisSession(
      id: json['id'] as String,
      status: json['status'] as String,
      zoneCode: json['zone_code'] as String,
      bodyModel: json['body_model'] as String,
      treeId: json['tree_id'] as String,
      treeVersion: json['tree_version'] as String,
      progress: AnamnesisProgress.fromJson(
        Map<String, dynamic>.from(json['progress'] as Map),
      ),
    );
  }
}

class AnamnesisQuestionOption {
  const AnamnesisQuestionOption({required this.id, required this.labelFr});

  final String id;
  final String labelFr;

  factory AnamnesisQuestionOption.fromJson(Map<String, dynamic> json) {
    return AnamnesisQuestionOption(
      id: json['id'] as String,
      labelFr: json['label_fr'] as String,
    );
  }
}

class AnamnesisScaleConfig {
  const AnamnesisScaleConfig({
    required this.min,
    required this.max,
    this.step = 1,
    this.minLabelFr,
    this.maxLabelFr,
  });

  final int min;
  final int max;
  final int step;
  final String? minLabelFr;
  final String? maxLabelFr;

  factory AnamnesisScaleConfig.fromJson(Map<String, dynamic> json) {
    return AnamnesisScaleConfig(
      min: json['min'] as int,
      max: json['max'] as int,
      step: json['step'] as int? ?? 1,
      minLabelFr: json['min_label_fr'] as String?,
      maxLabelFr: json['max_label_fr'] as String?,
    );
  }
}

class AnamnesisDurationConfig {
  const AnamnesisDurationConfig({required this.allowedUnits});

  final List<String> allowedUnits;

  factory AnamnesisDurationConfig.fromJson(Map<String, dynamic> json) {
    return AnamnesisDurationConfig(
      allowedUnits: (json['allowed_units'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }
}

class AnamnesisQuestion {
  const AnamnesisQuestion({
    required this.id,
    required this.type,
    required this.promptFr,
    required this.required,
    this.options = const [],
    this.scale,
    this.duration,
    this.helpFr,
  });

  final String id;
  final String type;
  final String promptFr;
  final bool required;
  final List<AnamnesisQuestionOption> options;
  final AnamnesisScaleConfig? scale;
  final AnamnesisDurationConfig? duration;
  final String? helpFr;

  factory AnamnesisQuestion.fromJson(Map<String, dynamic> json) {
    return AnamnesisQuestion(
      id: json['id'] as String,
      type: json['type'] as String,
      promptFr: json['prompt_fr'] as String,
      required: json['required'] as bool? ?? true,
      helpFr: json['help_fr'] as String?,
      options: (json['options'] as List<dynamic>? ?? const [])
          .map((e) => AnamnesisQuestionOption.fromJson(
                Map<String, dynamic>.from(e as Map),
              ))
          .toList(),
      scale: json['scale'] == null
          ? null
          : AnamnesisScaleConfig.fromJson(
              Map<String, dynamic>.from(json['scale'] as Map),
            ),
      duration: json['duration'] == null
          ? null
          : AnamnesisDurationConfig.fromJson(
              Map<String, dynamic>.from(json['duration'] as Map),
            ),
    );
  }
}

class AnamnesisSessionScore {
  const AnamnesisSessionScore({
    required this.finalScore,
    required this.deterministicScore,
    required this.llmAdjustment,
    required this.rationaleFr,
    required this.legalBannerFr,
  });

  final double finalScore;
  final double deterministicScore;
  final double llmAdjustment;
  final String rationaleFr;
  final String legalBannerFr;

  factory AnamnesisSessionScore.fromJson(Map<String, dynamic> json) {
    double numField(String key) {
      final v = json[key];
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0;
      return 0;
    }

    return AnamnesisSessionScore(
      finalScore: numField('final_score'),
      deterministicScore: numField('deterministic_score'),
      llmAdjustment: numField('llm_adjustment'),
      rationaleFr: json['rationale_fr'] as String? ?? '',
      legalBannerFr: json['legal_banner_fr'] as String? ?? '',
    );
  }
}

class AnamnesisFollowUpNext {
  const AnamnesisFollowUpNext({
    required this.question,
    required this.index,
    required this.maxQuestions,
  });

  final AnamnesisQuestion question;
  final int index;
  final int maxQuestions;

  factory AnamnesisFollowUpNext.fromJson(Map<String, dynamic> json) {
    return AnamnesisFollowUpNext(
      question: AnamnesisQuestion.fromJson(
        Map<String, dynamic>.from(json['question'] as Map),
      ),
      index: json['index'] as int? ?? 1,
      maxQuestions: json['max_questions'] as int? ?? 3,
    );
  }
}

class AnamnesisFollowUpAnswerResult {
  const AnamnesisFollowUpAnswerResult({
    required this.followUpComplete,
    required this.answeredCount,
    this.nextQuestion,
    this.score,
  });

  final bool followUpComplete;
  final int answeredCount;
  final AnamnesisQuestion? nextQuestion;
  final AnamnesisSessionScore? score;

  factory AnamnesisFollowUpAnswerResult.fromJson(Map<String, dynamic> json) {
    return AnamnesisFollowUpAnswerResult(
      followUpComplete: json['follow_up_complete'] as bool? ?? true,
      answeredCount: json['answered_count'] as int? ?? 0,
      nextQuestion: json['next_question'] == null
          ? null
          : AnamnesisQuestion.fromJson(
              Map<String, dynamic>.from(json['next_question'] as Map),
            ),
      score: json['score'] == null
          ? null
          : AnamnesisSessionScore.fromJson(
              Map<String, dynamic>.from(json['score'] as Map),
            ),
    );
  }
}

class AnamnesisAnswerResult {
  const AnamnesisAnswerResult({
    required this.session,
    required this.sessionComplete,
    this.nextQuestion,
    this.score,
  });

  final AnamnesisSession session;
  final bool sessionComplete;
  final AnamnesisQuestion? nextQuestion;
  final AnamnesisSessionScore? score;

  factory AnamnesisAnswerResult.fromJson(Map<String, dynamic> json) {
    return AnamnesisAnswerResult(
      session: AnamnesisSession.fromJson(
        Map<String, dynamic>.from(json['session'] as Map),
      ),
      sessionComplete: json['session_complete'] as bool? ?? false,
      nextQuestion: json['next_question'] == null
          ? null
          : AnamnesisQuestion.fromJson(
              Map<String, dynamic>.from(json['next_question'] as Map),
            ),
      score: json['score'] == null
          ? null
          : AnamnesisSessionScore.fromJson(
              Map<String, dynamic>.from(json['score'] as Map),
            ),
    );
  }
}

Map<String, dynamic> painSelectionToApi(PainSelection selection) {
  return {
    'body_model': selection.model,
    'kind': selection.kind,
    'code': selection.code,
    if (selection.side != null) 'side': selection.side,
    if (selection.system != null) 'system': selection.system,
    if (selection.point != null) 'point': selection.point!.toJson(),
    if (selection.uv != null) 'uv': selection.uv!.toJson(),
    'selected_at': selection.selectedAt.toUtc().toIso8601String(),
  };
}

Map<String, dynamic> buildAnswerValue({
  required String type,
  String? optionId,
  List<String>? optionIds,
  num? number,
  int? durationValue,
  String? durationUnit,
}) {
  return switch (type) {
    'single_choice' => {'type': type, 'option_id': optionId},
    'multi_choice' => {'type': type, 'option_ids': optionIds},
    'scale' => {'type': type, 'number': number},
    'duration' => {
        'type': type,
        'duration': {'value': durationValue, 'unit': durationUnit},
      },
    _ => {'type': type},
  };
}

class AnamnesisSessionDocument {
  const AnamnesisSessionDocument({
    required this.documentId,
    required this.sessionId,
    required this.extractionStatus,
    required this.attachedAt,
    this.mimeType,
    this.title,
  });

  final String documentId;
  final String sessionId;
  final String extractionStatus;
  final DateTime attachedAt;
  final String? mimeType;
  final String? title;

  factory AnamnesisSessionDocument.fromJson(Map<String, dynamic> json) {
    return AnamnesisSessionDocument(
      documentId: json['document_id'] as String,
      sessionId: json['session_id'] as String,
      extractionStatus: json['extraction_status'] as String? ?? 'queued',
      attachedAt: DateTime.parse(json['attached_at'] as String),
      mimeType: json['mime_type'] as String?,
      title: json['title'] as String?,
    );
  }

  bool get isTerminal =>
      extractionStatus == 'extracted' || extractionStatus == 'failed';
}

class AnamnesisStructuredExtraction {
  const AnamnesisStructuredExtraction({
    this.examType,
    this.examDate,
    this.bodyRegion,
    this.keyFindings = const [],
    this.facility,
  });

  final String? examType;
  final String? examDate;
  final String? bodyRegion;
  final List<String> keyFindings;
  final String? facility;

  factory AnamnesisStructuredExtraction.fromJson(Map<String, dynamic> json) {
    return AnamnesisStructuredExtraction(
      examType: json['exam_type'] as String?,
      examDate: json['exam_date'] as String?,
      bodyRegion: json['body_region'] as String?,
      keyFindings: (json['key_findings'] as List<dynamic>? ?? const [])
          .map((e) => e as String)
          .toList(),
      facility: json['facility'] as String?,
    );
  }
}

class AnamnesisDocumentExtraction {
  const AnamnesisDocumentExtraction({
    required this.documentId,
    required this.status,
    this.rawOcrText,
    this.structured,
    this.corrections,
    this.errorMessage,
    this.updatedAt,
  });

  final String documentId;
  final String status;
  final String? rawOcrText;
  final AnamnesisStructuredExtraction? structured;
  final Map<String, dynamic>? corrections;
  final String? errorMessage;
  final DateTime? updatedAt;

  factory AnamnesisDocumentExtraction.fromJson(Map<String, dynamic> json) {
    return AnamnesisDocumentExtraction(
      documentId: json['document_id'] as String,
      status: json['status'] as String? ?? 'queued',
      rawOcrText: json['raw_ocr_text'] as String?,
      structured: json['structured'] == null
          ? null
          : AnamnesisStructuredExtraction.fromJson(
              Map<String, dynamic>.from(json['structured'] as Map),
            ),
      corrections: json['corrections'] == null
          ? null
          : Map<String, dynamic>.from(json['corrections'] as Map),
      errorMessage: json['error_message'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.tryParse(json['updated_at'] as String),
    );
  }
}
