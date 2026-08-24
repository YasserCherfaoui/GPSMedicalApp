// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_admin_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicAdminUpdateConfirmationPolicyEnum
_$clinicAdminUpdateConfirmationPolicyEnum_auto =
    const ClinicAdminUpdateConfirmationPolicyEnum._('auto');
const ClinicAdminUpdateConfirmationPolicyEnum
_$clinicAdminUpdateConfirmationPolicyEnum_manual =
    const ClinicAdminUpdateConfirmationPolicyEnum._('manual');

ClinicAdminUpdateConfirmationPolicyEnum
_$clinicAdminUpdateConfirmationPolicyEnumValueOf(String name) {
  switch (name) {
    case 'auto':
      return _$clinicAdminUpdateConfirmationPolicyEnum_auto;
    case 'manual':
      return _$clinicAdminUpdateConfirmationPolicyEnum_manual;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicAdminUpdateConfirmationPolicyEnum>
_$clinicAdminUpdateConfirmationPolicyEnumValues =
    BuiltSet<ClinicAdminUpdateConfirmationPolicyEnum>(
      const <ClinicAdminUpdateConfirmationPolicyEnum>[
        _$clinicAdminUpdateConfirmationPolicyEnum_auto,
        _$clinicAdminUpdateConfirmationPolicyEnum_manual,
      ],
    );

Serializer<ClinicAdminUpdateConfirmationPolicyEnum>
_$clinicAdminUpdateConfirmationPolicyEnumSerializer =
    _$ClinicAdminUpdateConfirmationPolicyEnumSerializer();

class _$ClinicAdminUpdateConfirmationPolicyEnumSerializer
    implements PrimitiveSerializer<ClinicAdminUpdateConfirmationPolicyEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'auto': 'auto',
    'manual': 'manual',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'auto': 'auto',
    'manual': 'manual',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ClinicAdminUpdateConfirmationPolicyEnum,
  ];
  @override
  final String wireName = 'ClinicAdminUpdateConfirmationPolicyEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicAdminUpdateConfirmationPolicyEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicAdminUpdateConfirmationPolicyEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicAdminUpdateConfirmationPolicyEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicAdminUpdate extends ClinicAdminUpdate {
  @override
  final ClinicStatus? status;
  @override
  final String? name;
  @override
  final String? legalName;
  @override
  final String? description;
  @override
  final String? addressLine1;
  @override
  final String? addressLine2;
  @override
  final String? communeId;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? email;
  @override
  final String? registreCommerce;
  @override
  final String? agrementSante;
  @override
  final ClinicUpdateConfirmationPolicyEnum? confirmationPolicy;
  @override
  final int? bookingWindowDays;

  factory _$ClinicAdminUpdate([
    void Function(ClinicAdminUpdateBuilder)? updates,
  ]) => (ClinicAdminUpdateBuilder()..update(updates))._build();

  _$ClinicAdminUpdate._({
    this.status,
    this.name,
    this.legalName,
    this.description,
    this.addressLine1,
    this.addressLine2,
    this.communeId,
    this.latitude,
    this.longitude,
    this.email,
    this.registreCommerce,
    this.agrementSante,
    this.confirmationPolicy,
    this.bookingWindowDays,
  }) : super._();
  @override
  ClinicAdminUpdate rebuild(void Function(ClinicAdminUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicAdminUpdateBuilder toBuilder() =>
      ClinicAdminUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicAdminUpdate &&
        status == other.status &&
        name == other.name &&
        legalName == other.legalName &&
        description == other.description &&
        addressLine1 == other.addressLine1 &&
        addressLine2 == other.addressLine2 &&
        communeId == other.communeId &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        email == other.email &&
        registreCommerce == other.registreCommerce &&
        agrementSante == other.agrementSante &&
        confirmationPolicy == other.confirmationPolicy &&
        bookingWindowDays == other.bookingWindowDays;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, legalName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, addressLine1.hashCode);
    _$hash = $jc(_$hash, addressLine2.hashCode);
    _$hash = $jc(_$hash, communeId.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, registreCommerce.hashCode);
    _$hash = $jc(_$hash, agrementSante.hashCode);
    _$hash = $jc(_$hash, confirmationPolicy.hashCode);
    _$hash = $jc(_$hash, bookingWindowDays.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicAdminUpdate')
          ..add('status', status)
          ..add('name', name)
          ..add('legalName', legalName)
          ..add('description', description)
          ..add('addressLine1', addressLine1)
          ..add('addressLine2', addressLine2)
          ..add('communeId', communeId)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('email', email)
          ..add('registreCommerce', registreCommerce)
          ..add('agrementSante', agrementSante)
          ..add('confirmationPolicy', confirmationPolicy)
          ..add('bookingWindowDays', bookingWindowDays))
        .toString();
  }
}

class ClinicAdminUpdateBuilder
    implements
        Builder<ClinicAdminUpdate, ClinicAdminUpdateBuilder>,
        ClinicUpdateBuilder {
  _$ClinicAdminUpdate? _$v;

  ClinicStatus? _status;
  ClinicStatus? get status => _$this._status;
  set status(covariant ClinicStatus? status) => _$this._status = status;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _legalName;
  String? get legalName => _$this._legalName;
  set legalName(covariant String? legalName) => _$this._legalName = legalName;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  String? _addressLine1;
  String? get addressLine1 => _$this._addressLine1;
  set addressLine1(covariant String? addressLine1) =>
      _$this._addressLine1 = addressLine1;

  String? _addressLine2;
  String? get addressLine2 => _$this._addressLine2;
  set addressLine2(covariant String? addressLine2) =>
      _$this._addressLine2 = addressLine2;

  String? _communeId;
  String? get communeId => _$this._communeId;
  set communeId(covariant String? communeId) => _$this._communeId = communeId;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(covariant double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(covariant double? longitude) => _$this._longitude = longitude;

  String? _email;
  String? get email => _$this._email;
  set email(covariant String? email) => _$this._email = email;

  String? _registreCommerce;
  String? get registreCommerce => _$this._registreCommerce;
  set registreCommerce(covariant String? registreCommerce) =>
      _$this._registreCommerce = registreCommerce;

  String? _agrementSante;
  String? get agrementSante => _$this._agrementSante;
  set agrementSante(covariant String? agrementSante) =>
      _$this._agrementSante = agrementSante;

  ClinicUpdateConfirmationPolicyEnum? _confirmationPolicy;
  ClinicUpdateConfirmationPolicyEnum? get confirmationPolicy =>
      _$this._confirmationPolicy;
  set confirmationPolicy(
    covariant ClinicUpdateConfirmationPolicyEnum? confirmationPolicy,
  ) => _$this._confirmationPolicy = confirmationPolicy;

  int? _bookingWindowDays;
  int? get bookingWindowDays => _$this._bookingWindowDays;
  set bookingWindowDays(covariant int? bookingWindowDays) =>
      _$this._bookingWindowDays = bookingWindowDays;

  ClinicAdminUpdateBuilder() {
    ClinicAdminUpdate._defaults(this);
  }

  ClinicAdminUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _name = $v.name;
      _legalName = $v.legalName;
      _description = $v.description;
      _addressLine1 = $v.addressLine1;
      _addressLine2 = $v.addressLine2;
      _communeId = $v.communeId;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _email = $v.email;
      _registreCommerce = $v.registreCommerce;
      _agrementSante = $v.agrementSante;
      _confirmationPolicy = $v.confirmationPolicy;
      _bookingWindowDays = $v.bookingWindowDays;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ClinicAdminUpdate other) {
    _$v = other as _$ClinicAdminUpdate;
  }

  @override
  void update(void Function(ClinicAdminUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicAdminUpdate build() => _build();

  _$ClinicAdminUpdate _build() {
    final _$result =
        _$v ??
        _$ClinicAdminUpdate._(
          status: status,
          name: name,
          legalName: legalName,
          description: description,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          communeId: communeId,
          latitude: latitude,
          longitude: longitude,
          email: email,
          registreCommerce: registreCommerce,
          agrementSante: agrementSante,
          confirmationPolicy: confirmationPolicy,
          bookingWindowDays: bookingWindowDays,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
