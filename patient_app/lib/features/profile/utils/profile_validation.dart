import 'package:gps_medical_shared/gps_medical_shared.dart';

Map<String, String> validateProfileForm({
  required String fullName,
  required String email,
  required Date? birthDate,
  required AppLocalizations l10n,
}) {
  final errors = <String, String>{};
  final trimmedName = fullName.trim();
  if (trimmedName.length < 2 || trimmedName.length > 120) {
    errors['full_name'] = l10n.invalidFullName;
  }
  final trimmedEmail = email.trim();
  if (trimmedEmail.isNotEmpty && !_isValidEmail(trimmedEmail)) {
    errors['email'] = l10n.profileInvalidEmail;
  }
  if (birthDate != null) {
    final today = DateTime.now();
    final picked = DateTime(birthDate.year, birthDate.month, birthDate.day);
    final now = DateTime(today.year, today.month, today.day);
    if (picked.isAfter(now)) {
      errors['birth_date'] = l10n.profileInvalidBirthDate;
    }
  }
  return errors;
}

bool _isValidEmail(String value) {
  return RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value);
}
