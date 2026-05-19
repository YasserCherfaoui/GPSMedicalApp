import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Phone used during forgot / reset password flow.
final recoveryPhoneProvider = StateProvider<String?>((ref) => null);
