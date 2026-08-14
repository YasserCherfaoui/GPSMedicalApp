import 'package:gps_medical_api/gps_medical_api.dart';

import '../constants/registration_countries.dart';

/// In-memory registration data collected across the sign-up flow.
class RegistrationDraft {
  const RegistrationDraft({
    this.country,
    this.nin,
    this.phoneE164,
    this.password,
    this.fullName,
    this.consentDataProcessing = false,
    this.consentHealthData = false,
    this.consentAnpdpTerms = false,
    this.consentMarketing = false,
    this.otpSent = false,
    this.ninVerificationStatus,
  });

  final RegistrationCountry? country;
  final String? nin;
  final String? phoneE164;
  final String? password;
  final String? fullName;
  final bool consentDataProcessing;
  final bool consentHealthData;
  final bool consentAnpdpTerms;
  final bool consentMarketing;
  final bool otpSent;

  /// From [RegisterResponse.ninVerificationStatus] — informational per ADR 0005.
  final RegisterResponseNinVerificationStatusEnum? ninVerificationStatus;

  bool get requiredConsentsGranted =>
      consentDataProcessing && consentHealthData && consentAnpdpTerms;

  bool get readyToRegister {
    final selected = country;
    if (selected == null) {
      return false;
    }
    final name = fullName?.trim();
    final ninOk = !selected.requiresNin || nin != null;
    return ninOk &&
        phoneE164 != null &&
        password != null &&
        name != null &&
        name.length >= 2 &&
        requiredConsentsGranted;
  }

  RegistrationDraft copyWith({
    RegistrationCountry? country,
    String? nin,
    String? phoneE164,
    String? password,
    String? fullName,
    bool? consentDataProcessing,
    bool? consentHealthData,
    bool? consentAnpdpTerms,
    bool? consentMarketing,
    bool? otpSent,
    RegisterResponseNinVerificationStatusEnum? ninVerificationStatus,
    bool clearNin = false,
    bool clearPhone = false,
  }) {
    return RegistrationDraft(
      country: country ?? this.country,
      nin: clearNin ? null : (nin ?? this.nin),
      phoneE164: clearPhone ? null : (phoneE164 ?? this.phoneE164),
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      consentDataProcessing:
          consentDataProcessing ?? this.consentDataProcessing,
      consentHealthData: consentHealthData ?? this.consentHealthData,
      consentAnpdpTerms: consentAnpdpTerms ?? this.consentAnpdpTerms,
      consentMarketing: consentMarketing ?? this.consentMarketing,
      otpSent: otpSent ?? this.otpSent,
      ninVerificationStatus:
          ninVerificationStatus ?? this.ninVerificationStatus,
    );
  }
}
