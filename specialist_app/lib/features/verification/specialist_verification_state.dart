import '../../routing/specialist_verification_status.dart';

enum VerificationRefreshStatus { idle, loading, completed, failed }

class SpecialistVerificationState {
  const SpecialistVerificationState({
    required this.status,
    this.comment,
    this.hasSubmittedCredentials = false,
    this.isLoading = false,
    this.lastCheckedAt,
    this.refreshStatus = VerificationRefreshStatus.idle,
  });

  final SpecialistVerificationStatus status;
  final String? comment;
  final bool hasSubmittedCredentials;
  final bool isLoading;
  final DateTime? lastCheckedAt;
  final VerificationRefreshStatus refreshStatus;

  static const initial = SpecialistVerificationState(
    status: SpecialistVerificationStatus.pending,
    isLoading: true,
    refreshStatus: VerificationRefreshStatus.loading,
  );

  SpecialistVerificationState copyWith({
    SpecialistVerificationStatus? status,
    String? comment,
    bool? hasSubmittedCredentials,
    bool? isLoading,
    DateTime? lastCheckedAt,
    VerificationRefreshStatus? refreshStatus,
  }) {
    return SpecialistVerificationState(
      status: status ?? this.status,
      comment: comment ?? this.comment,
      hasSubmittedCredentials:
          hasSubmittedCredentials ?? this.hasSubmittedCredentials,
      isLoading: isLoading ?? this.isLoading,
      lastCheckedAt: lastCheckedAt ?? this.lastCheckedAt,
      refreshStatus: refreshStatus ?? this.refreshStatus,
    );
  }
}
