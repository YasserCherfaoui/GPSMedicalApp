import '../../routing/specialist_verification_status.dart';

class SpecialistVerificationState {
  const SpecialistVerificationState({
    required this.status,
    this.comment,
    this.hasSubmittedCredentials = false,
    this.isLoading = false,
  });

  final SpecialistVerificationStatus status;
  final String? comment;
  final bool hasSubmittedCredentials;
  final bool isLoading;

  static const initial = SpecialistVerificationState(
    status: SpecialistVerificationStatus.pending,
    isLoading: true,
  );

  SpecialistVerificationState copyWith({
    SpecialistVerificationStatus? status,
    String? comment,
    bool? hasSubmittedCredentials,
    bool? isLoading,
  }) {
    return SpecialistVerificationState(
      status: status ?? this.status,
      comment: comment ?? this.comment,
      hasSubmittedCredentials:
          hasSubmittedCredentials ?? this.hasSubmittedCredentials,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
