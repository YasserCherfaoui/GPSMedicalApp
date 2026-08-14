import 'package:gps_medical_api/gps_medical_api.dart';

/// Restricted patient fields stored only on-device for `device_only` residency.
class RestrictedProfileFields {
  const RestrictedProfileFields({
    this.birthDate,
    this.gender,
    this.bloodType,
    this.address,
    this.allergies,
    this.chronicConditions,
    this.insurance,
  });

  static const empty = RestrictedProfileFields();

  final Date? birthDate;
  final PatientGenderEnum? gender;
  final PatientBloodTypeEnum? bloodType;
  final Address? address;
  final List<String>? allergies;
  final List<String>? chronicConditions;
  final PatientAllOfInsurance? insurance;

  RestrictedProfileFields merge(RestrictedProfileFields patch) {
    return RestrictedProfileFields(
      birthDate: patch.birthDate ?? birthDate,
      gender: patch.gender ?? gender,
      bloodType: patch.bloodType ?? bloodType,
      address: patch.address ?? address,
      allergies: patch.allergies ?? allergies,
      chronicConditions: patch.chronicConditions ?? chronicConditions,
      insurance: patch.insurance ?? insurance,
    );
  }

  factory RestrictedProfileFields.fromUpdate(PatientUpdate update) {
    return RestrictedProfileFields(
      birthDate: update.birthDate,
      gender: _genderFromUpdate(update.gender),
      bloodType: _bloodTypeFromUpdate(update.bloodType),
      address: update.address,
      allergies: update.allergies?.toList(),
      chronicConditions: update.chronicConditions?.toList(),
      insurance: _insuranceFromUpdate(update.insurance),
    );
  }

  Map<String, Object?> toJson() {
    return {
      if (birthDate != null) 'birth_date': birthDate.toString(),
      if (gender != null) 'gender': gender!.name,
      if (bloodType != null) 'blood_type': bloodType!.name,
      if (address != null) 'address': _addressToJson(address!),
      if (allergies != null) 'allergies': allergies,
      if (chronicConditions != null) 'chronic_conditions': chronicConditions,
      if (insurance != null)
        'insurance': {
          if (insurance!.provider != null)
            'provider': insurance!.provider!.name,
          if (insurance!.number != null) 'number': insurance!.number,
        },
    };
  }

  factory RestrictedProfileFields.fromJson(Map<String, dynamic> json) {
    final birth = json['birth_date'] as String?;
    final genderName = json['gender'] as String?;
    final bloodName = json['blood_type'] as String?;
    final allergies = json['allergies'];
    final chronic = json['chronic_conditions'];
    final insuranceJson = json['insurance'];
    return RestrictedProfileFields(
      birthDate: birth == null ? null : _parseDate(birth),
      gender: genderName == null ? null : PatientGenderEnum.valueOf(genderName),
      bloodType: bloodName == null
          ? null
          : PatientBloodTypeEnum.valueOf(bloodName),
      address: _addressFromJson(json['address']),
      allergies: allergies is List
          ? allergies.map((e) => e.toString()).toList()
          : null,
      chronicConditions: chronic is List
          ? chronic.map((e) => e.toString()).toList()
          : null,
      insurance: _insuranceFromJson(insuranceJson),
    );
  }

  Patient applyTo(Patient remote) {
    return remote.rebuild((b) {
      if (birthDate != null) b.birthDate = birthDate;
      if (gender != null) b.gender = gender;
      if (bloodType != null) b.bloodType = bloodType;
      if (address != null) b.address.replace(address!);
      if (allergies != null) b.allergies.replace(allergies!);
      if (chronicConditions != null) {
        b.chronicConditions.replace(chronicConditions!);
      }
      if (insurance != null) b.insurance.replace(insurance!);
    });
  }
}

Date? _parseDate(String raw) {
  final parts = raw.split('-');
  if (parts.length != 3) return null;
  final year = int.tryParse(parts[0]);
  final month = int.tryParse(parts[1]);
  final day = int.tryParse(parts[2]);
  if (year == null || month == null || day == null) return null;
  return Date(year, month, day);
}

PatientGenderEnum? _genderFromUpdate(PatientUpdateGenderEnum? gender) {
  return switch (gender) {
    PatientUpdateGenderEnum.male => PatientGenderEnum.male,
    PatientUpdateGenderEnum.female => PatientGenderEnum.female,
    PatientUpdateGenderEnum.other => PatientGenderEnum.other,
    _ => null,
  };
}

PatientBloodTypeEnum? _bloodTypeFromUpdate(PatientUpdateBloodTypeEnum? type) {
  if (type == null) return null;
  return PatientBloodTypeEnum.valueOf(type.name);
}

PatientAllOfInsurance? _insuranceFromUpdate(PatientUpdateInsurance? update) {
  if (update == null) return null;
  return PatientAllOfInsurance((b) {
    if (update.provider != null) {
      b.provider = PatientAllOfInsuranceProviderEnum.valueOf(
        update.provider!.name,
      );
    }
    b.number = update.number;
  });
}

Map<String, dynamic> _addressToJson(Address address) {
  final serialized = standardSerializers.serializeWith(
    Address.serializer,
    address,
  );
  return Map<String, dynamic>.from(serialized as Map);
}

Address? _addressFromJson(Object? json) {
  if (json is! Map) return null;
  return standardSerializers.deserializeWith(
    Address.serializer,
    Map<String, dynamic>.from(json),
  );
}

PatientAllOfInsurance? _insuranceFromJson(Object? json) {
  if (json is! Map) return null;
  final provider = json['provider'] as String?;
  final number = json['number'] as String?;
  if (provider == null && number == null) return null;
  return PatientAllOfInsurance((b) {
    if (provider != null) {
      b.provider = PatientAllOfInsuranceProviderEnum.valueOf(provider);
    }
    b.number = number;
  });
}

PatientUpdate allowedServerPatientUpdate(PatientUpdate update) {
  return PatientUpdate((b) {
    if (update.fullName != null) b.fullName = update.fullName;
    if (update.email != null) b.email = update.email;
  });
}

bool patientUpdateHasAllowedServerFields(PatientUpdate update) {
  return update.fullName != null || update.email != null;
}

bool isDeviceOnlyResidency(Patient patient) {
  return patient.dataResidencyMode == DataResidencyMode.deviceOnly;
}
