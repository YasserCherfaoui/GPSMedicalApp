class CoachingPlanSummary {
  const CoachingPlanSummary({
    required this.id,
    required this.sessionId,
    required this.hydrationGoalMl,
    required this.createdAt,
    this.targetDate,
  });

  final String id;
  final String sessionId;
  final int hydrationGoalMl;
  final DateTime createdAt;
  final DateTime? targetDate;

  factory CoachingPlanSummary.fromJson(Map<String, dynamic> json) {
    final target = json['target_date'] as String?;
    return CoachingPlanSummary(
      id: json['id'] as String,
      sessionId: json['session_id'] as String,
      hydrationGoalMl: json['hydration_goal_ml'] as int? ?? 2000,
      createdAt: DateTime.parse(json['created_at'] as String),
      targetDate: target != null ? DateTime.tryParse(target) : null,
    );
  }
}

class CoachingExercise {
  const CoachingExercise({
    required this.id,
    required this.protocolId,
    required this.nameFr,
    required this.stepsFr,
    required this.sortOrder,
    this.illustrationUrl,
  });

  final String id;
  final String protocolId;
  final String nameFr;
  final List<String> stepsFr;
  final int sortOrder;
  final String? illustrationUrl;

  factory CoachingExercise.fromJson(Map<String, dynamic> json) {
    final steps = json['steps_fr'] as List<dynamic>? ?? const [];
    return CoachingExercise(
      id: json['id'] as String,
      protocolId: json['protocol_id'] as String,
      nameFr: json['name_fr'] as String? ?? '',
      stepsFr: steps.map((e) => e.toString()).toList(),
      sortOrder: json['sort_order'] as int? ?? 0,
      illustrationUrl: json['illustration_url'] as String?,
    );
  }
}

class CoachingPlanSection {
  const CoachingPlanSection({
    required this.type,
    required this.titleFr,
    required this.bodyFr,
    required this.sourceProtocolId,
    this.exercises = const [],
  });

  final String type;
  final String titleFr;
  final String bodyFr;
  final String sourceProtocolId;
  final List<CoachingExercise> exercises;

  factory CoachingPlanSection.fromJson(Map<String, dynamic> json) {
    final exercises = json['exercises'] as List<dynamic>? ?? const [];
    return CoachingPlanSection(
      type: json['type'] as String? ?? '',
      titleFr: json['title_fr'] as String? ?? '',
      bodyFr: json['body_fr'] as String? ?? '',
      sourceProtocolId: json['source_protocol_id'] as String? ?? '',
      exercises: exercises
          .map(
            (e) => CoachingExercise.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList(),
    );
  }
}

class CoachingPlan {
  const CoachingPlan({
    required this.id,
    required this.sessionId,
    required this.patientId,
    required this.sections,
    required this.hydrationGoalMl,
    required this.disclaimerFr,
    required this.createdAt,
    this.targetDate,
    this.updatedAt,
  });

  final String id;
  final String sessionId;
  final String patientId;
  final List<CoachingPlanSection> sections;
  final int hydrationGoalMl;
  final String disclaimerFr;
  final DateTime createdAt;
  final DateTime? targetDate;
  final DateTime? updatedAt;

  CoachingPlanSection? sectionByType(String type) {
    for (final section in sections) {
      if (section.type == type) return section;
    }
    return null;
  }

  factory CoachingPlan.fromJson(Map<String, dynamic> json) {
    final sections = json['sections'] as List<dynamic>? ?? const [];
    final target = json['target_date'] as String?;
    final updated = json['updated_at'] as String?;
    return CoachingPlan(
      id: json['id'] as String,
      sessionId: json['session_id'] as String,
      patientId: json['patient_id'] as String,
      sections: sections
          .map(
            (e) => CoachingPlanSection.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList(),
      hydrationGoalMl: json['hydration_goal_ml'] as int? ?? 2000,
      disclaimerFr: json['disclaimer_fr'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at'] as String),
      targetDate: target != null ? DateTime.tryParse(target) : null,
      updatedAt: updated != null ? DateTime.tryParse(updated) : null,
    );
  }
}

class CoachingProgress {
  const CoachingProgress({
    required this.planId,
    required this.percent,
    required this.factors,
    required this.hydrationTodayMl,
    required this.hydrationGoalMl,
    required this.sleepDaysLogged7d,
    this.daysUntilAppointment,
  });

  final String planId;
  final int percent;
  final Map<String, double> factors;
  final int hydrationTodayMl;
  final int hydrationGoalMl;
  final int sleepDaysLogged7d;
  final int? daysUntilAppointment;

  factory CoachingProgress.fromJson(Map<String, dynamic> json) {
    final factorsRaw = json['factors'] as Map? ?? const {};
    final factors = <String, double>{};
    for (final entry in factorsRaw.entries) {
      factors[entry.key.toString()] = (entry.value as num?)?.toDouble() ?? 0;
    }
    return CoachingProgress(
      planId: json['plan_id'] as String,
      percent: json['percent'] as int? ?? 0,
      factors: factors,
      hydrationTodayMl: json['hydration_today_ml'] as int? ?? 0,
      hydrationGoalMl: json['hydration_goal_ml'] as int? ?? 2000,
      sleepDaysLogged7d: json['sleep_days_logged_7d'] as int? ?? 0,
      daysUntilAppointment: json['days_until_appointment'] as int?,
    );
  }
}

class CoachingHydrationEntry {
  const CoachingHydrationEntry({
    required this.id,
    required this.planId,
    required this.amountMl,
    required this.loggedAt,
  });

  final String id;
  final String planId;
  final int amountMl;
  final DateTime loggedAt;

  factory CoachingHydrationEntry.fromJson(Map<String, dynamic> json) {
    return CoachingHydrationEntry(
      id: json['id'] as String,
      planId: json['plan_id'] as String,
      amountMl: json['amount_ml'] as int,
      loggedAt: DateTime.parse(json['logged_at'] as String),
    );
  }
}

class CoachingHydrationDay {
  const CoachingHydrationDay({
    required this.date,
    required this.goalMl,
    required this.totalMl,
    required this.entries,
  });

  final String date;
  final int goalMl;
  final int totalMl;
  final List<CoachingHydrationEntry> entries;

  factory CoachingHydrationDay.fromJson(Map<String, dynamic> json) {
    final entries = json['entries'] as List<dynamic>? ?? const [];
    return CoachingHydrationDay(
      date: json['date'] as String,
      goalMl: json['goal_ml'] as int? ?? 2000,
      totalMl: json['total_ml'] as int? ?? 0,
      entries: entries
          .map(
            (e) => CoachingHydrationEntry.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList(),
    );
  }
}

class CoachingSleepEntry {
  const CoachingSleepEntry({
    required this.id,
    required this.planId,
    required this.hours,
    required this.quality,
    required this.loggedOn,
  });

  final String id;
  final String planId;
  final double hours;
  final int quality;
  final String loggedOn;

  factory CoachingSleepEntry.fromJson(Map<String, dynamic> json) {
    return CoachingSleepEntry(
      id: json['id'] as String,
      planId: json['plan_id'] as String,
      hours: (json['hours'] as num).toDouble(),
      quality: json['quality'] as int,
      loggedOn: json['logged_on'] as String,
    );
  }
}
