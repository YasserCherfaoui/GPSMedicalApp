import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

String profileGenderLabel(PatientGenderEnum? gender, AppLocalizations l10n) {
  return switch (gender) {
    PatientGenderEnum.male => l10n.profileGenderMale,
    PatientGenderEnum.female => l10n.profileGenderFemale,
    PatientGenderEnum.other => l10n.profileGenderOther,
    _ => l10n.profileNotSet,
  };
}

String profileUpdateGenderLabel(
  PatientUpdateGenderEnum? gender,
  AppLocalizations l10n,
) {
  return switch (gender) {
    PatientUpdateGenderEnum.male => l10n.profileGenderMale,
    PatientUpdateGenderEnum.female => l10n.profileGenderFemale,
    PatientUpdateGenderEnum.other => l10n.profileGenderOther,
    _ => l10n.profileNotSet,
  };
}

const _bloodTypeLabels = {
  'aPlus': 'A+',
  'A_': 'A-',
  'bPlus': 'B+',
  'B_': 'B-',
  'aBPlus': 'AB+',
  'AB_': 'AB-',
  'oPlus': 'O+',
  'O_': 'O-',
};

String profileBloodTypeLabel(PatientBloodTypeEnum? bloodType) {
  if (bloodType == null) return '';
  return profileBloodTypeWireLabel(bloodType.name);
}

String profileBloodTypeWireLabel(String wireName) {
  return _bloodTypeLabels[wireName] ?? wireName;
}

List<PatientUpdateBloodTypeEnum> profileBloodTypeOptions() {
  return PatientUpdateBloodTypeEnum.values.toList();
}

String profileInsuranceProviderLabel(
  PatientAllOfInsuranceProviderEnum? provider,
  AppLocalizations l10n,
) {
  return switch (provider) {
    PatientAllOfInsuranceProviderEnum.cnas => l10n.profileInsuranceCnas,
    PatientAllOfInsuranceProviderEnum.casnos => l10n.profileInsuranceCasnos,
    PatientAllOfInsuranceProviderEnum.none => l10n.profileInsuranceNone,
    PatientAllOfInsuranceProviderEnum.private => l10n.profileInsurancePrivate,
    _ => l10n.profileNotSet,
  };
}

String formatProfileBirthDate(Date? birthDate, String locale) {
  if (birthDate == null) return '';
  final date = DateTime(birthDate.year, birthDate.month, birthDate.day);
  return DateFormat.yMMMMd(locale).format(date);
}

String formatProfileAddress(Address? address, String locale) {
  if (address == null) return '';
  final parts = <String>[
    if (address.line1?.isNotEmpty == true) address.line1!,
    if (address.communeName?.isNotEmpty == true) address.communeName!,
    if (address.wilayaName?.isNotEmpty == true) address.wilayaName!,
    if (address.postalCode?.isNotEmpty == true) address.postalCode!,
  ];
  return parts.join(', ');
}

String joinProfileTags(BuiltList<String>? tags) {
  if (tags == null || tags.isEmpty) return '';
  return tags.join(', ');
}

PatientUpdateGenderEnum? toUpdateGender(PatientGenderEnum? gender) {
  return switch (gender) {
    PatientGenderEnum.male => PatientUpdateGenderEnum.male,
    PatientGenderEnum.female => PatientUpdateGenderEnum.female,
    PatientGenderEnum.other => PatientUpdateGenderEnum.other,
    _ => null,
  };
}

PatientUpdateBloodTypeEnum? toUpdateBloodType(PatientBloodTypeEnum? bloodType) {
  if (bloodType == null) return null;
  return PatientUpdateBloodTypeEnum.valueOf(bloodType.name);
}

PatientGenderEnum? toPatientGender(PatientUpdateGenderEnum? gender) {
  return switch (gender) {
    PatientUpdateGenderEnum.male => PatientGenderEnum.male,
    PatientUpdateGenderEnum.female => PatientGenderEnum.female,
    PatientUpdateGenderEnum.other => PatientGenderEnum.other,
    _ => null,
  };
}

PatientBloodTypeEnum? toPatientBloodType(
  PatientUpdateBloodTypeEnum? bloodType,
) {
  if (bloodType == null) return null;
  return PatientBloodTypeEnum.valueOf(bloodType.name);
}
