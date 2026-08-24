// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicCreateConfirmationPolicyEnum
_$clinicCreateConfirmationPolicyEnum_auto =
    const ClinicCreateConfirmationPolicyEnum._('auto');
const ClinicCreateConfirmationPolicyEnum
_$clinicCreateConfirmationPolicyEnum_manual =
    const ClinicCreateConfirmationPolicyEnum._('manual');

ClinicCreateConfirmationPolicyEnum _$clinicCreateConfirmationPolicyEnumValueOf(
  String name,
) {
  switch (name) {
    case 'auto':
      return _$clinicCreateConfirmationPolicyEnum_auto;
    case 'manual':
      return _$clinicCreateConfirmationPolicyEnum_manual;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicCreateConfirmationPolicyEnum>
_$clinicCreateConfirmationPolicyEnumValues =
    BuiltSet<ClinicCreateConfirmationPolicyEnum>(
      const <ClinicCreateConfirmationPolicyEnum>[
        _$clinicCreateConfirmationPolicyEnum_auto,
        _$clinicCreateConfirmationPolicyEnum_manual,
      ],
    );

Serializer<ClinicCreateConfirmationPolicyEnum>
_$clinicCreateConfirmationPolicyEnumSerializer =
    _$ClinicCreateConfirmationPolicyEnumSerializer();

class _$ClinicCreateConfirmationPolicyEnumSerializer
    implements PrimitiveSerializer<ClinicCreateConfirmationPolicyEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'auto': 'auto',
    'manual': 'manual',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'auto': 'auto',
    'manual': 'manual',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicCreateConfirmationPolicyEnum];
  @override
  final String wireName = 'ClinicCreateConfirmationPolicyEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicCreateConfirmationPolicyEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicCreateConfirmationPolicyEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicCreateConfirmationPolicyEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicCreate extends ClinicCreate {
  @override
  final String name;
  @override
  final String? legalName;
  @override
  final String? description;
  @override
  final String countryCode;
  @override
  final String wilayaCode;
  @override
  final String? communeId;
  @override
  final String addressLine1;
  @override
  final String? addressLine2;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? email;
  @override
  final String? registreCommerce;
  @override
  final String? agrementSante;
  @override
  final ClinicCreateConfirmationPolicyEnum? confirmationPolicy;

  factory _$ClinicCreate([void Function(ClinicCreateBuilder)? updates]) =>
      (ClinicCreateBuilder()..update(updates))._build();

  _$ClinicCreate._({
    required this.name,
    this.legalName,
    this.description,
    required this.countryCode,
    required this.wilayaCode,
    this.communeId,
    required this.addressLine1,
    this.addressLine2,
    required this.latitude,
    required this.longitude,
    this.email,
    this.registreCommerce,
    this.agrementSante,
    this.confirmationPolicy,
  }) : super._();
  @override
  ClinicCreate rebuild(void Function(ClinicCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicCreateBuilder toBuilder() => ClinicCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicCreate &&
        name == other.name &&
        legalName == other.legalName &&
        description == other.description &&
        countryCode == other.countryCode &&
        wilayaCode == other.wilayaCode &&
        communeId == other.communeId &&
        addressLine1 == other.addressLine1 &&
        addressLine2 == other.addressLine2 &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        email == other.email &&
        registreCommerce == other.registreCommerce &&
        agrementSante == other.agrementSante &&
        confirmationPolicy == other.confirmationPolicy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, legalName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, wilayaCode.hashCode);
    _$hash = $jc(_$hash, communeId.hashCode);
    _$hash = $jc(_$hash, addressLine1.hashCode);
    _$hash = $jc(_$hash, addressLine2.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, registreCommerce.hashCode);
    _$hash = $jc(_$hash, agrementSante.hashCode);
    _$hash = $jc(_$hash, confirmationPolicy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicCreate')
          ..add('name', name)
          ..add('legalName', legalName)
          ..add('description', description)
          ..add('countryCode', countryCode)
          ..add('wilayaCode', wilayaCode)
          ..add('communeId', communeId)
          ..add('addressLine1', addressLine1)
          ..add('addressLine2', addressLine2)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('email', email)
          ..add('registreCommerce', registreCommerce)
          ..add('agrementSante', agrementSante)
          ..add('confirmationPolicy', confirmationPolicy))
        .toString();
  }
}

class ClinicCreateBuilder
    implements Builder<ClinicCreate, ClinicCreateBuilder> {
  _$ClinicCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _legalName;
  String? get legalName => _$this._legalName;
  set legalName(String? legalName) => _$this._legalName = legalName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _wilayaCode;
  String? get wilayaCode => _$this._wilayaCode;
  set wilayaCode(String? wilayaCode) => _$this._wilayaCode = wilayaCode;

  String? _communeId;
  String? get communeId => _$this._communeId;
  set communeId(String? communeId) => _$this._communeId = communeId;

  String? _addressLine1;
  String? get addressLine1 => _$this._addressLine1;
  set addressLine1(String? addressLine1) => _$this._addressLine1 = addressLine1;

  String? _addressLine2;
  String? get addressLine2 => _$this._addressLine2;
  set addressLine2(String? addressLine2) => _$this._addressLine2 = addressLine2;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _registreCommerce;
  String? get registreCommerce => _$this._registreCommerce;
  set registreCommerce(String? registreCommerce) =>
      _$this._registreCommerce = registreCommerce;

  String? _agrementSante;
  String? get agrementSante => _$this._agrementSante;
  set agrementSante(String? agrementSante) =>
      _$this._agrementSante = agrementSante;

  ClinicCreateConfirmationPolicyEnum? _confirmationPolicy;
  ClinicCreateConfirmationPolicyEnum? get confirmationPolicy =>
      _$this._confirmationPolicy;
  set confirmationPolicy(
    ClinicCreateConfirmationPolicyEnum? confirmationPolicy,
  ) => _$this._confirmationPolicy = confirmationPolicy;

  ClinicCreateBuilder() {
    ClinicCreate._defaults(this);
  }

  ClinicCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _legalName = $v.legalName;
      _description = $v.description;
      _countryCode = $v.countryCode;
      _wilayaCode = $v.wilayaCode;
      _communeId = $v.communeId;
      _addressLine1 = $v.addressLine1;
      _addressLine2 = $v.addressLine2;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _email = $v.email;
      _registreCommerce = $v.registreCommerce;
      _agrementSante = $v.agrementSante;
      _confirmationPolicy = $v.confirmationPolicy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicCreate other) {
    _$v = other as _$ClinicCreate;
  }

  @override
  void update(void Function(ClinicCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicCreate build() => _build();

  _$ClinicCreate _build() {
    final _$result =
        _$v ??
        _$ClinicCreate._(
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'ClinicCreate',
            'name',
          ),
          legalName: legalName,
          description: description,
          countryCode: BuiltValueNullFieldError.checkNotNull(
            countryCode,
            r'ClinicCreate',
            'countryCode',
          ),
          wilayaCode: BuiltValueNullFieldError.checkNotNull(
            wilayaCode,
            r'ClinicCreate',
            'wilayaCode',
          ),
          communeId: communeId,
          addressLine1: BuiltValueNullFieldError.checkNotNull(
            addressLine1,
            r'ClinicCreate',
            'addressLine1',
          ),
          addressLine2: addressLine2,
          latitude: BuiltValueNullFieldError.checkNotNull(
            latitude,
            r'ClinicCreate',
            'latitude',
          ),
          longitude: BuiltValueNullFieldError.checkNotNull(
            longitude,
            r'ClinicCreate',
            'longitude',
          ),
          email: email,
          registreCommerce: registreCommerce,
          agrementSante: agrementSante,
          confirmationPolicy: confirmationPolicy,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
