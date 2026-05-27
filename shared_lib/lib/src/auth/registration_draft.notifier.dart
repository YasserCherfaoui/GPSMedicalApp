import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'registration_draft.dart';

class RegistrationDraftNotifier extends Notifier<RegistrationDraft> {
  @override
  RegistrationDraft build() => const RegistrationDraft();

  void updateNin(String nin) {
    state = state.copyWith(nin: nin);
  }

  void updatePhone(String phoneE164) {
    state = state.copyWith(phoneE164: phoneE164);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void updateConsents({
    bool? dataProcessing,
    bool? healthData,
    bool? anpdpTerms,
    bool? marketing,
  }) {
    state = state.copyWith(
      consentDataProcessing: dataProcessing,
      consentHealthData: healthData,
      consentAnpdpTerms: anpdpTerms,
      consentMarketing: marketing,
    );
  }

  void markOtpSent() {
    state = state.copyWith(otpSent: true);
  }

  void reset() {
    state = const RegistrationDraft();
  }
}
