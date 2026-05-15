/// Identifies which mobile client is running.
enum GpsMedicalClientKind {
  /// Patient-facing application.
  patient,

  /// Specialist (médecin) application.
  specialist,
}

/// Application metadata shared across patient and specialist apps.
class GpsMedicalAppInfo {
  const GpsMedicalAppInfo({
    required this.displayName,
    required this.clientKind,
  });

  final String displayName;
  final GpsMedicalClientKind clientKind;
}
