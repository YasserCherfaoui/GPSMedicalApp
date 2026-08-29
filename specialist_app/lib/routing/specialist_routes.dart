/// Specialist-app route paths (post-auth shell).
abstract final class SpecialistRoutes {
  static const verificationPending = '/specialist/verification-pending';
  static const credentials = '/specialist/credentials';
  static const profileEdit = '/specialist/profile/edit';
  static const scheduleEdit = '/specialist/schedule/edit';
  static const shell = '/specialist/shell';
  static const notifications = '/specialist/notifications';
  static const clinicMemberships = '/specialist/clinic-memberships';

  /// Schedule editor filtered to donated blocks for [clinicId].
  static String scheduleEditForClinic(String clinicId) =>
      '$scheduleEdit?clinicId=${Uri.encodeComponent(clinicId)}';

  static String incomingBilanDetail(String transmissionId) =>
      '/specialist/incoming-bilans/$transmissionId';

  static String appointmentDetail(String id) => '/specialist/appointments/$id';
  static String appointmentReschedule(String id) =>
      '/specialist/appointments/$id/reschedule';
  static String patientRecords(String appointmentId) =>
      '/specialist/appointments/$appointmentId/records';
  static String prescriptionCompose(String appointmentId) =>
      '/specialist/appointments/$appointmentId/prescription';
  static String messagingThread(String threadId) =>
      '/specialist/messages/$threadId';
  static String teleconsultation(String appointmentId) =>
      '/specialist/appointments/$appointmentId/teleconsultation';
  static String medicalRecordViewer(String documentId, {String? title}) {
    final base = '/specialist/medical-records/$documentId';
    if (title == null || title.isEmpty) return base;
    return '$base?title=${Uri.encodeComponent(title)}';
  }
}
