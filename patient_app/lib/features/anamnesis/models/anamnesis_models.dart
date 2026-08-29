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

class AnamnesisAnswerResult {
  const AnamnesisAnswerResult({
    required this.session,
    required this.sessionComplete,
    this.nextQuestion,
  });

  final AnamnesisSession session;
  final bool sessionComplete;
  final AnamnesisQuestion? nextQuestion;

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
