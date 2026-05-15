// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PatientUpdateGenderEnum _$patientUpdateGenderEnum_male =
    const PatientUpdateGenderEnum._('male');
const PatientUpdateGenderEnum _$patientUpdateGenderEnum_female =
    const PatientUpdateGenderEnum._('female');
const PatientUpdateGenderEnum _$patientUpdateGenderEnum_other =
    const PatientUpdateGenderEnum._('other');

PatientUpdateGenderEnum _$patientUpdateGenderEnumValueOf(String name) {
  switch (name) {
    case 'male':
      return _$patientUpdateGenderEnum_male;
    case 'female':
      return _$patientUpdateGenderEnum_female;
    case 'other':
      return _$patientUpdateGenderEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PatientUpdateGenderEnum> _$patientUpdateGenderEnumValues =
    BuiltSet<PatientUpdateGenderEnum>(const <PatientUpdateGenderEnum>[
      _$patientUpdateGenderEnum_male,
      _$patientUpdateGenderEnum_female,
      _$patientUpdateGenderEnum_other,
    ]);

const PatientUpdateBloodTypeEnum _$patientUpdateBloodTypeEnum_aPlus =
    const PatientUpdateBloodTypeEnum._('aPlus');
const PatientUpdateBloodTypeEnum _$patientUpdateBloodTypeEnum_A_ =
    const PatientUpdateBloodTypeEnum._('A_');
const PatientUpdateBloodTypeEnum _$patientUpdateBloodTypeEnum_bPlus =
    const PatientUpdateBloodTypeEnum._('bPlus');
const PatientUpdateBloodTypeEnum _$patientUpdateBloodTypeEnum_B_ =
    const PatientUpdateBloodTypeEnum._('B_');
const PatientUpdateBloodTypeEnum _$patientUpdateBloodTypeEnum_aBPlus =
    const PatientUpdateBloodTypeEnum._('aBPlus');
const PatientUpdateBloodTypeEnum _$patientUpdateBloodTypeEnum_AB_ =
    const PatientUpdateBloodTypeEnum._('AB_');
const PatientUpdateBloodTypeEnum _$patientUpdateBloodTypeEnum_oPlus =
    const PatientUpdateBloodTypeEnum._('oPlus');
const PatientUpdateBloodTypeEnum _$patientUpdateBloodTypeEnum_O_ =
    const PatientUpdateBloodTypeEnum._('O_');

PatientUpdateBloodTypeEnum _$patientUpdateBloodTypeEnumValueOf(String name) {
  switch (name) {
    case 'aPlus':
      return _$patientUpdateBloodTypeEnum_aPlus;
    case 'A_':
      return _$patientUpdateBloodTypeEnum_A_;
    case 'bPlus':
      return _$patientUpdateBloodTypeEnum_bPlus;
    case 'B_':
      return _$patientUpdateBloodTypeEnum_B_;
    case 'aBPlus':
      return _$patientUpdateBloodTypeEnum_aBPlus;
    case 'AB_':
      return _$patientUpdateBloodTypeEnum_AB_;
    case 'oPlus':
      return _$patientUpdateBloodTypeEnum_oPlus;
    case 'O_':
      return _$patientUpdateBloodTypeEnum_O_;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PatientUpdateBloodTypeEnum> _$patientUpdateBloodTypeEnumValues =
    BuiltSet<PatientUpdateBloodTypeEnum>(const <PatientUpdateBloodTypeEnum>[
      _$patientUpdateBloodTypeEnum_aPlus,
      _$patientUpdateBloodTypeEnum_A_,
      _$patientUpdateBloodTypeEnum_bPlus,
      _$patientUpdateBloodTypeEnum_B_,
      _$patientUpdateBloodTypeEnum_aBPlus,
      _$patientUpdateBloodTypeEnum_AB_,
      _$patientUpdateBloodTypeEnum_oPlus,
      _$patientUpdateBloodTypeEnum_O_,
    ]);

Serializer<PatientUpdateGenderEnum> _$patientUpdateGenderEnumSerializer =
    _$PatientUpdateGenderEnumSerializer();
Serializer<PatientUpdateBloodTypeEnum> _$patientUpdateBloodTypeEnumSerializer =
    _$PatientUpdateBloodTypeEnumSerializer();

class _$PatientUpdateGenderEnumSerializer
    implements PrimitiveSerializer<PatientUpdateGenderEnum> {
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
  final Iterable<Type> types = const <Type>[PatientUpdateGenderEnum];
  @override
  final String wireName = 'PatientUpdateGenderEnum';

  @override
  Object serialize(
    Serializers serializers,
    PatientUpdateGenderEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PatientUpdateGenderEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PatientUpdateGenderEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PatientUpdateBloodTypeEnumSerializer
    implements PrimitiveSerializer<PatientUpdateBloodTypeEnum> {
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
  final Iterable<Type> types = const <Type>[PatientUpdateBloodTypeEnum];
  @override
  final String wireName = 'PatientUpdateBloodTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    PatientUpdateBloodTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PatientUpdateBloodTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PatientUpdateBloodTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PatientUpdate extends PatientUpdate {
  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final Date? birthDate;
  @override
  final PatientUpdateGenderEnum? gender;
  @override
  final PatientUpdateBloodTypeEnum? bloodType;
  @override
  final Address? address;
  @override
  final BuiltList<String>? allergies;
  @override
  final BuiltList<String>? chronicConditions;

  factory _$PatientUpdate([void Function(PatientUpdateBuilder)? updates]) =>
      (PatientUpdateBuilder()..update(updates))._build();

  _$PatientUpdate._({
    this.fullName,
    this.email,
    this.birthDate,
    this.gender,
    this.bloodType,
    this.address,
    this.allergies,
    this.chronicConditions,
  }) : super._();
  @override
  PatientUpdate rebuild(void Function(PatientUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientUpdateBuilder toBuilder() => PatientUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientUpdate &&
        fullName == other.fullName &&
        email == other.email &&
        birthDate == other.birthDate &&
        gender == other.gender &&
        bloodType == other.bloodType &&
        address == other.address &&
        allergies == other.allergies &&
        chronicConditions == other.chronicConditions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, birthDate.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, bloodType.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, allergies.hashCode);
    _$hash = $jc(_$hash, chronicConditions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientUpdate')
          ..add('fullName', fullName)
          ..add('email', email)
          ..add('birthDate', birthDate)
          ..add('gender', gender)
          ..add('bloodType', bloodType)
          ..add('address', address)
          ..add('allergies', allergies)
          ..add('chronicConditions', chronicConditions))
        .toString();
  }
}

class PatientUpdateBuilder
    implements Builder<PatientUpdate, PatientUpdateBuilder> {
  _$PatientUpdate? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  Date? _birthDate;
  Date? get birthDate => _$this._birthDate;
  set birthDate(Date? birthDate) => _$this._birthDate = birthDate;

  PatientUpdateGenderEnum? _gender;
  PatientUpdateGenderEnum? get gender => _$this._gender;
  set gender(PatientUpdateGenderEnum? gender) => _$this._gender = gender;

  PatientUpdateBloodTypeEnum? _bloodType;
  PatientUpdateBloodTypeEnum? get bloodType => _$this._bloodType;
  set bloodType(PatientUpdateBloodTypeEnum? bloodType) =>
      _$this._bloodType = bloodType;

  AddressBuilder? _address;
  AddressBuilder get address => _$this._address ??= AddressBuilder();
  set address(AddressBuilder? address) => _$this._address = address;

  ListBuilder<String>? _allergies;
  ListBuilder<String> get allergies =>
      _$this._allergies ??= ListBuilder<String>();
  set allergies(ListBuilder<String>? allergies) =>
      _$this._allergies = allergies;

  ListBuilder<String>? _chronicConditions;
  ListBuilder<String> get chronicConditions =>
      _$this._chronicConditions ??= ListBuilder<String>();
  set chronicConditions(ListBuilder<String>? chronicConditions) =>
      _$this._chronicConditions = chronicConditions;

  PatientUpdateBuilder() {
    PatientUpdate._defaults(this);
  }

  PatientUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _email = $v.email;
      _birthDate = $v.birthDate;
      _gender = $v.gender;
      _bloodType = $v.bloodType;
      _address = $v.address?.toBuilder();
      _allergies = $v.allergies?.toBuilder();
      _chronicConditions = $v.chronicConditions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientUpdate other) {
    _$v = other as _$PatientUpdate;
  }

  @override
  void update(void Function(PatientUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientUpdate build() => _build();

  _$PatientUpdate _build() {
    _$PatientUpdate _$result;
    try {
      _$result =
          _$v ??
          _$PatientUpdate._(
            fullName: fullName,
            email: email,
            birthDate: birthDate,
            gender: gender,
            bloodType: bloodType,
            address: _address?.build(),
            allergies: _allergies?.build(),
            chronicConditions: _chronicConditions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();
        _$failedField = 'allergies';
        _allergies?.build();
        _$failedField = 'chronicConditions';
        _chronicConditions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PatientUpdate',
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
