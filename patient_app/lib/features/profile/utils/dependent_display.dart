import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

int dependentAgeYears(Date? birthDate) {
  if (birthDate == null) return 0;
  final today = DateTime.now();
  var age = today.year - birthDate.year;
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }
  return age < 0 ? 0 : age;
}

IconData dependentGenderIcon(DependentGenderEnum? gender) {
  if (gender == DependentGenderEnum.male) return Icons.male;
  if (gender == DependentGenderEnum.female) return Icons.female;
  return Icons.person_outline;
}

String dependentRelationLabel(
  DependentRelationEnum? relation,
  AppLocalizations l10n,
) {
  if (relation == DependentRelationEnum.child) return l10n.dependentRelationChild;
  if (relation == DependentRelationEnum.spouse) {
    return l10n.dependentRelationSpouse;
  }
  if (relation == DependentRelationEnum.parent) {
    return l10n.dependentRelationParent;
  }
  if (relation == DependentRelationEnum.other) return l10n.dependentRelationOther;
  return l10n.profileNotSet;
}

String dependentCreateRelationLabel(
  DependentCreateRelationEnum relation,
  AppLocalizations l10n,
) {
  if (relation == DependentCreateRelationEnum.child) {
    return l10n.dependentRelationChild;
  }
  if (relation == DependentCreateRelationEnum.spouse) {
    return l10n.dependentRelationSpouse;
  }
  if (relation == DependentCreateRelationEnum.parent) {
    return l10n.dependentRelationParent;
  }
  return l10n.dependentRelationOther;
}

String dependentGenderLabel(
  DependentGenderEnum? gender,
  AppLocalizations l10n,
) {
  if (gender == DependentGenderEnum.male) return l10n.profileGenderMale;
  if (gender == DependentGenderEnum.female) return l10n.profileGenderFemale;
  return l10n.profileNotSet;
}

String formatDependentBirthDate(Date? birthDate, String locale) {
  if (birthDate == null) return '';
  final date = DateTime(birthDate.year, birthDate.month, birthDate.day);
  return DateFormat.yMMMMd(locale).format(date);
}

DependentCreateRelationEnum toCreateRelation(DependentRelationEnum? relation) {
  if (relation == DependentRelationEnum.child) {
    return DependentCreateRelationEnum.child;
  }
  if (relation == DependentRelationEnum.spouse) {
    return DependentCreateRelationEnum.spouse;
  }
  if (relation == DependentRelationEnum.parent) {
    return DependentCreateRelationEnum.parent;
  }
  return DependentCreateRelationEnum.other;
}

DependentCreateGenderEnum toCreateGender(DependentGenderEnum? gender) {
  if (gender == DependentGenderEnum.female) {
    return DependentCreateGenderEnum.female;
  }
  return DependentCreateGenderEnum.male;
}

Map<String, String> validateDependentForm({
  required String fullName,
  required Date? birthDate,
  required AppLocalizations l10n,
}) {
  final errors = <String, String>{};
  final trimmed = fullName.trim();
  if (trimmed.length < 2 || trimmed.length > 120) {
    errors['full_name'] = l10n.invalidFullName;
  }
  if (birthDate == null) {
    errors['birth_date'] = l10n.profileNotSet;
  } else {
    final today = DateTime.now();
    final picked = DateTime(birthDate.year, birthDate.month, birthDate.day);
    final now = DateTime(today.year, today.month, today.day);
    if (picked.isAfter(now)) {
      errors['birth_date'] = l10n.profileInvalidBirthDate;
    }
  }
  return errors;
}
