// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PatientRoleEnum _$patientRoleEnum_patient = const PatientRoleEnum._(
  'patient',
);
const PatientRoleEnum _$patientRoleEnum_specialist = const PatientRoleEnum._(
  'specialist',
);
const PatientRoleEnum _$patientRoleEnum_concierge = const PatientRoleEnum._(
  'concierge',
);
const PatientRoleEnum _$patientRoleEnum_admin = const PatientRoleEnum._(
  'admin',
);
const PatientRoleEnum _$patientRoleEnum_moderator = const PatientRoleEnum._(
  'moderator',
);

PatientRoleEnum _$patientRoleEnumValueOf(String name) {
  switch (name) {
    case 'patient':
      return _$patientRoleEnum_patient;
    case 'specialist':
      return _$patientRoleEnum_specialist;
    case 'concierge':
      return _$patientRoleEnum_concierge;
    case 'admin':
      return _$patientRoleEnum_admin;
    case 'moderator':
      return _$patientRoleEnum_moderator;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PatientRoleEnum> _$patientRoleEnumValues =
    BuiltSet<PatientRoleEnum>(const <PatientRoleEnum>[
      _$patientRoleEnum_patient,
      _$patientRoleEnum_specialist,
      _$patientRoleEnum_concierge,
      _$patientRoleEnum_admin,
      _$patientRoleEnum_moderator,
    ]);

const PatientStatusEnum _$patientStatusEnum_pendingVerification =
    const PatientStatusEnum._('pendingVerification');
const PatientStatusEnum _$patientStatusEnum_active = const PatientStatusEnum._(
  'active',
);
const PatientStatusEnum _$patientStatusEnum_suspended =
    const PatientStatusEnum._('suspended');
const PatientStatusEnum _$patientStatusEnum_deleted = const PatientStatusEnum._(
  'deleted',
);

PatientStatusEnum _$patientStatusEnumValueOf(String name) {
  switch (name) {
    case 'pendingVerification':
      return _$patientStatusEnum_pendingVerification;
    case 'active':
      return _$patientStatusEnum_active;
    case 'suspended':
      return _$patientStatusEnum_suspended;
    case 'deleted':
      return _$patientStatusEnum_deleted;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PatientStatusEnum> _$patientStatusEnumValues =
    BuiltSet<PatientStatusEnum>(const <PatientStatusEnum>[
      _$patientStatusEnum_pendingVerification,
      _$patientStatusEnum_active,
      _$patientStatusEnum_suspended,
      _$patientStatusEnum_deleted,
    ]);

const PatientGenderEnum _$patientGenderEnum_male = const PatientGenderEnum._(
  'male',
);
const PatientGenderEnum _$patientGenderEnum_female = const PatientGenderEnum._(
  'female',
);
const PatientGenderEnum _$patientGenderEnum_other = const PatientGenderEnum._(
  'other',
);

PatientGenderEnum _$patientGenderEnumValueOf(String name) {
  switch (name) {
    case 'male':
      return _$patientGenderEnum_male;
    case 'female':
      return _$patientGenderEnum_female;
    case 'other':
      return _$patientGenderEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PatientGenderEnum> _$patientGenderEnumValues =
    BuiltSet<PatientGenderEnum>(const <PatientGenderEnum>[
      _$patientGenderEnum_male,
      _$patientGenderEnum_female,
      _$patientGenderEnum_other,
    ]);

const PatientBloodTypeEnum _$patientBloodTypeEnum_aPlus =
    const PatientBloodTypeEnum._('aPlus');
const PatientBloodTypeEnum _$patientBloodTypeEnum_A_ =
    const PatientBloodTypeEnum._('A_');
const PatientBloodTypeEnum _$patientBloodTypeEnum_bPlus =
    const PatientBloodTypeEnum._('bPlus');
const PatientBloodTypeEnum _$patientBloodTypeEnum_B_ =
    const PatientBloodTypeEnum._('B_');
const PatientBloodTypeEnum _$patientBloodTypeEnum_aBPlus =
    const PatientBloodTypeEnum._('aBPlus');
const PatientBloodTypeEnum _$patientBloodTypeEnum_AB_ =
    const PatientBloodTypeEnum._('AB_');
const PatientBloodTypeEnum _$patientBloodTypeEnum_oPlus =
    const PatientBloodTypeEnum._('oPlus');
const PatientBloodTypeEnum _$patientBloodTypeEnum_O_ =
    const PatientBloodTypeEnum._('O_');

PatientBloodTypeEnum _$patientBloodTypeEnumValueOf(String name) {
  switch (name) {
    case 'aPlus':
      return _$patientBloodTypeEnum_aPlus;
    case 'A_':
      return _$patientBloodTypeEnum_A_;
    case 'bPlus':
      return _$patientBloodTypeEnum_bPlus;
    case 'B_':
      return _$patientBloodTypeEnum_B_;
    case 'aBPlus':
      return _$patientBloodTypeEnum_aBPlus;
    case 'AB_':
      return _$patientBloodTypeEnum_AB_;
    case 'oPlus':
      return _$patientBloodTypeEnum_oPlus;
    case 'O_':
      return _$patientBloodTypeEnum_O_;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PatientBloodTypeEnum> _$patientBloodTypeEnumValues =
    BuiltSet<PatientBloodTypeEnum>(const <PatientBloodTypeEnum>[
      _$patientBloodTypeEnum_aPlus,
      _$patientBloodTypeEnum_A_,
      _$patientBloodTypeEnum_bPlus,
      _$patientBloodTypeEnum_B_,
      _$patientBloodTypeEnum_aBPlus,
      _$patientBloodTypeEnum_AB_,
      _$patientBloodTypeEnum_oPlus,
      _$patientBloodTypeEnum_O_,
    ]);

Serializer<PatientRoleEnum> _$patientRoleEnumSerializer =
    _$PatientRoleEnumSerializer();
Serializer<PatientStatusEnum> _$patientStatusEnumSerializer =
    _$PatientStatusEnumSerializer();
Serializer<PatientGenderEnum> _$patientGenderEnumSerializer =
    _$PatientGenderEnumSerializer();
Serializer<PatientBloodTypeEnum> _$patientBloodTypeEnumSerializer =
    _$PatientBloodTypeEnumSerializer();

class _$PatientRoleEnumSerializer
    implements PrimitiveSerializer<PatientRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'patient': 'patient',
    'specialist': 'specialist',
    'concierge': 'concierge',
    'admin': 'admin',
    'moderator': 'moderator',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'patient': 'patient',
    'specialist': 'specialist',
    'concierge': 'concierge',
    'admin': 'admin',
    'moderator': 'moderator',
  };

  @override
  final Iterable<Type> types = const <Type>[PatientRoleEnum];
  @override
  final String wireName = 'PatientRoleEnum';

  @override
  Object serialize(
    Serializers serializers,
    PatientRoleEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PatientRoleEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PatientRoleEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PatientStatusEnumSerializer
    implements PrimitiveSerializer<PatientStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pendingVerification': 'pending_verification',
    'active': 'active',
    'suspended': 'suspended',
    'deleted': 'deleted',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending_verification': 'pendingVerification',
    'active': 'active',
    'suspended': 'suspended',
    'deleted': 'deleted',
  };

  @override
  final Iterable<Type> types = const <Type>[PatientStatusEnum];
  @override
  final String wireName = 'PatientStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    PatientStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PatientStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PatientStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PatientGenderEnumSerializer
    implements PrimitiveSerializer<PatientGenderEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'male': 'male',
    'female': 'female',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'male': 'male',
    'female': 'female',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[PatientGenderEnum];
  @override
  final String wireName = 'PatientGenderEnum';

  @override
  Object serialize(
    Serializers serializers,
    PatientGenderEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PatientGenderEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PatientGenderEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PatientBloodTypeEnumSerializer
    implements PrimitiveSerializer<PatientBloodTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'aPlus': 'A+',
    'A_': 'A-',
    'bPlus': 'B+',
    'B_': 'B-',
    'aBPlus': 'AB+',
    'AB_': 'AB-',
    'oPlus': 'O+',
    'O_': 'O-',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'A+': 'aPlus',
    'A-': 'A_',
    'B+': 'bPlus',
    'B-': 'B_',
    'AB+': 'aBPlus',
    'AB-': 'AB_',
    'O+': 'oPlus',
    'O-': 'O_',
  };

  @override
  final Iterable<Type> types = const <Type>[PatientBloodTypeEnum];
  @override
  final String wireName = 'PatientBloodTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    PatientBloodTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PatientBloodTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PatientBloodTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$Patient extends Patient {
  @override
  final BuiltList<String>? allergies;
  @override
  final PatientAllOfInsurance? insurance;
  @override
  final Address? address;
  @override
  final PatientGenderEnum? gender;
  @override
  final PatientBloodTypeEnum? bloodType;
  @override
  final Date? birthDate;
  @override
  final BuiltList<String>? chronicConditions;
  @override
  final String? id;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final UserRoleEnum? role;
  @override
  final String? fullName;
  @override
  final UserStatusEnum? status;
  @override
  final DateTime? createdAt;

  factory _$Patient([void Function(PatientBuilder)? updates]) =>
      (PatientBuilder()..update(updates))._build();

  _$Patient._({
    this.allergies,
    this.insurance,
    this.address,
    this.gender,
    this.bloodType,
    this.birthDate,
    this.chronicConditions,
    this.id,
    this.phone,
    this.email,
    this.role,
    this.fullName,
    this.status,
    this.createdAt,
  }) : super._();
  @override
  Patient rebuild(void Function(PatientBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientBuilder toBuilder() => PatientBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Patient &&
        allergies == other.allergies &&
        insurance == other.insurance &&
        address == other.address &&
        gender == other.gender &&
        bloodType == other.bloodType &&
        birthDate == other.birthDate &&
        chronicConditions == other.chronicConditions &&
        id == other.id &&
        phone == other.phone &&
        email == other.email &&
        role == other.role &&
        fullName == other.fullName &&
        status == other.status &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, allergies.hashCode);
    _$hash = $jc(_$hash, insurance.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, bloodType.hashCode);
    _$hash = $jc(_$hash, birthDate.hashCode);
    _$hash = $jc(_$hash, chronicConditions.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Patient')
          ..add('allergies', allergies)
          ..add('insurance', insurance)
          ..add('address', address)
          ..add('gender', gender)
          ..add('bloodType', bloodType)
          ..add('birthDate', birthDate)
          ..add('chronicConditions', chronicConditions)
          ..add('id', id)
          ..add('phone', phone)
          ..add('email', email)
          ..add('role', role)
          ..add('fullName', fullName)
          ..add('status', status)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class PatientBuilder implements Builder<Patient, PatientBuilder>, UserBuilder {
  _$Patient? _$v;

  ListBuilder<String>? _allergies;
  ListBuilder<String> get allergies =>
      _$this._allergies ??= ListBuilder<String>();
  set allergies(covariant ListBuilder<String>? allergies) =>
      _$this._allergies = allergies;

  PatientAllOfInsuranceBuilder? _insurance;
  PatientAllOfInsuranceBuilder get insurance =>
      _$this._insurance ??= PatientAllOfInsuranceBuilder();
  set insurance(covariant PatientAllOfInsuranceBuilder? insurance) =>
      _$this._insurance = insurance;

  AddressBuilder? _address;
  AddressBuilder get address => _$this._address ??= AddressBuilder();
  set address(covariant AddressBuilder? address) => _$this._address = address;

  PatientGenderEnum? _gender;
  PatientGenderEnum? get gender => _$this._gender;
  set gender(covariant PatientGenderEnum? gender) => _$this._gender = gender;

  PatientBloodTypeEnum? _bloodType;
  PatientBloodTypeEnum? get bloodType => _$this._bloodType;
  set bloodType(covariant PatientBloodTypeEnum? bloodType) =>
      _$this._bloodType = bloodType;

  Date? _birthDate;
  Date? get birthDate => _$this._birthDate;
  set birthDate(covariant Date? birthDate) => _$this._birthDate = birthDate;

  ListBuilder<String>? _chronicConditions;
  ListBuilder<String> get chronicConditions =>
      _$this._chronicConditions ??= ListBuilder<String>();
  set chronicConditions(covariant ListBuilder<String>? chronicConditions) =>
      _$this._chronicConditions = chronicConditions;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(covariant String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(covariant String? email) => _$this._email = email;

  UserRoleEnum? _role;
  UserRoleEnum? get role => _$this._role;
  set role(covariant UserRoleEnum? role) => _$this._role = role;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(covariant String? fullName) => _$this._fullName = fullName;

  UserStatusEnum? _status;
  UserStatusEnum? get status => _$this._status;
  set status(covariant UserStatusEnum? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(covariant DateTime? createdAt) => _$this._createdAt = createdAt;

  PatientBuilder() {
    Patient._defaults(this);
  }

  PatientBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _allergies = $v.allergies?.toBuilder();
      _insurance = $v.insurance?.toBuilder();
      _address = $v.address?.toBuilder();
      _gender = $v.gender;
      _bloodType = $v.bloodType;
      _birthDate = $v.birthDate;
      _chronicConditions = $v.chronicConditions?.toBuilder();
      _id = $v.id;
      _phone = $v.phone;
      _email = $v.email;
      _role = $v.role;
      _fullName = $v.fullName;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Patient other) {
    _$v = other as _$Patient;
  }

  @override
  void update(void Function(PatientBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Patient build() => _build();

  _$Patient _build() {
    _$Patient _$result;
    try {
      _$result =
          _$v ??
          _$Patient._(
            allergies: _allergies?.build(),
            insurance: _insurance?.build(),
            address: _address?.build(),
            gender: gender,
            bloodType: bloodType,
            birthDate: birthDate,
            chronicConditions: _chronicConditions?.build(),
            id: id,
            phone: phone,
            email: email,
            role: role,
            fullName: fullName,
            status: status,
            createdAt: createdAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'allergies';
        _allergies?.build();
        _$failedField = 'insurance';
        _insurance?.build();
        _$failedField = 'address';
        _address?.build();

        _$failedField = 'chronicConditions';
        _chronicConditions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'Patient',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
