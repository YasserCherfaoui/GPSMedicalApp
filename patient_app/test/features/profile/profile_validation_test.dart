import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/profile/utils/profile_validation.dart';

void main() {
  test('rejects short full name and invalid email', () {
    final l10n = lookupAppLocalizations(const Locale('fr'));
    final errors = validateProfileForm(
      fullName: 'A',
      email: 'not-an-email',
      birthDate: null,
      l10n: l10n,
    );

    expect(errors['full_name'], isNotNull);
    expect(errors['email'], isNotNull);
  });

  test('rejects future birth date', () {
    final l10n = lookupAppLocalizations(const Locale('fr'));
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final errors = validateProfileForm(
      fullName: 'Amina Benali',
      email: '',
      birthDate: Date(tomorrow.year, tomorrow.month, tomorrow.day),
      l10n: l10n,
    );

    expect(errors['birth_date'], l10n.profileInvalidBirthDate);
  });

  test('accepts valid profile form input', () {
    final l10n = lookupAppLocalizations(const Locale('fr'));
    final errors = validateProfileForm(
      fullName: 'Amina Benali',
      email: 'amina@example.dz',
      birthDate: Date(1990, 5, 12),
      l10n: l10n,
    );

    expect(errors, isEmpty);
  });
}
