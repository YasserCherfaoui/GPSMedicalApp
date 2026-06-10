import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'specialist_verification_status.dart';

/// Stub: pre-flight defaults to pending so onboarding routes to the status screen.
final specialistVerificationStatusProvider =
    Provider<SpecialistVerificationStatus>(
      (ref) => SpecialistVerificationStatus.pending,
    );
