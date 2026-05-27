/// In-memory registration data collected across the sign-up flow.
class RegistrationDraft {
  const RegistrationDraft({
    this.nin,
    this.phoneE164,
    this.password,
    this.fullName,
    this.consentDataProcessing = false,
    this.consentHealthData = false,
    this.consentAnpdpTerms = false,
    this.consentMarketing = false,
    this.otpSent = false,
  });

  final String? nin;
  final String? phoneE164;
  final String? password;
  final String? fullName;
  final bool consentDataProcessing;
  final bool consentHealthData;
  final bool consentAnpdpTerms;
  final bool consentMarketing;
  final bool otpSent;

  bool get requiredConsentsGranted =>
      consentDataProcessing && consentHealthData && consentAnpdpTerms;

  bool get readyToRegister {
    final name = fullName?.trim();
    return nin != null &&
        phoneE164 != null &&
        password != null &&
        name != null &&
        name.length >= 2 &&
        requiredConsentsGranted;
  }

  RegistrationDraft copyWith({
    String? nin,
    String? phoneE164,
    String? password,
    String? fullName,
    bool? consentDataProcessing,
    bool? consentHealthData,
    bool? consentAnpdpTerms,
    bool? consentMarketing,
    bool? otpSent,
  }) {
    return RegistrationDraft(
      nin: nin ?? this.nin,
      phoneE164: phoneE164 ?? this.phoneE164,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      consentDataProcessing:
          consentDataProcessing ?? this.consentDataProcessing,
      consentHealthData: consentHealthData ?? this.consentHealthData,
      consentAnpdpTerms: consentAnpdpTerms ?? this.consentAnpdpTerms,
      consentMarketing: consentMarketing ?? this.consentMarketing,
      otpSent: otpSent ?? this.otpSent,
    );
  }
}
