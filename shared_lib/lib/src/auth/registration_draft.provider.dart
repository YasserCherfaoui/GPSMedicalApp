import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'registration_draft.dart';
import 'registration_draft.notifier.dart';

final registrationDraftProvider =
    NotifierProvider<RegistrationDraftNotifier, RegistrationDraft>(
      RegistrationDraftNotifier.new,
    );
