// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicUpdateConfirmationPolicyEnum
_$clinicUpdateConfirmationPolicyEnum_auto =
    const ClinicUpdateConfirmationPolicyEnum._('auto');
const ClinicUpdateConfirmationPolicyEnum
_$clinicUpdateConfirmationPolicyEnum_manual =
    const ClinicUpdateConfirmationPolicyEnum._('manual');

ClinicUpdateConfirmationPolicyEnum _$clinicUpdateConfirmationPolicyEnumValueOf(
  String name,
) {
  switch (name) {
    case 'auto':
      return _$clinicUpdateConfirmationPolicyEnum_auto;
    case 'manual':
      return _$clinicUpdateConfirmationPolicyEnum_manual;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicUpdateConfirmationPolicyEnum>
_$clinicUpdateConfirmationPolicyEnumValues =
    BuiltSet<ClinicUpdateConfirmationPolicyEnum>(
      const <ClinicUpdateConfirmationPolicyEnum>[
        _$clinicUpdateConfirmationPolicyEnum_auto,
        _$clinicUpdateConfirmationPolicyEnum_manual,
      ],
    );

Serializer<ClinicUpdateConfirmationPolicyEnum>
_$clinicUpdateConfirmationPolicyEnumSerializer =
    _$ClinicUpdateConfirmationPolicyEnumSerializer();

class _$ClinicUpdateConfirmationPolicyEnumSerializer
    implements PrimitiveSerializer<ClinicUpdateConfirmationPolicyEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'auto': 'auto',
    'manual': 'manual',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'auto': 'auto',
    'manual': 'manual',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicUpdateConfirmationPolicyEnum];
  @override
  final String wireName = 'ClinicUpdateConfirmationPolicyEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicUpdateConfirmationPolicyEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicUpdateConfirmationPolicyEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicUpdateConfirmationPolicyEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

abstract mixin class ClinicUpdateBuilder {
  void replace(ClinicUpdate other);
  void update(void Function(ClinicUpdateBuilder) updates);
  String? get name;
  set name(String? name);

  String? get legalName;
  set legalName(String? legalName);

  String? get description;
  set description(String? description);

  String? get addressLine1;
  set addressLine1(String? addressLine1);

  String? get addressLine2;
  set addressLine2(String? addressLine2);

  String? get communeId;
  set communeId(String? communeId);

  double? get latitude;
  set latitude(double? latitude);

  double? get longitude;
  set longitude(double? longitude);

  String? get email;
  set email(String? email);

  String? get registreCommerce;
  set registreCommerce(String? registreCommerce);

  String? get agrementSante;
  set agrementSante(String? agrementSante);

  ClinicUpdateConfirmationPolicyEnum? get confirmationPolicy;
  set confirmationPolicy(
    ClinicUpdateConfirmationPolicyEnum? confirmationPolicy,
  );

  int? get bookingWindowDays;
  set bookingWindowDays(int? bookingWindowDays);
}

class _$$ClinicUpdate extends $ClinicUpdate {
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

  factory _$$ClinicUpdate([void Function($ClinicUpdateBuilder)? updates]) =>
      ($ClinicUpdateBuilder()..update(updates))._build();

  _$$ClinicUpdate._({
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
  $ClinicUpdate rebuild(void Function($ClinicUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $ClinicUpdateBuilder toBuilder() => $ClinicUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $ClinicUpdate &&
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
    return (newBuiltValueToStringHelper(r'$ClinicUpdate')
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

class $ClinicUpdateBuilder
    implements
        Builder<$ClinicUpdate, $ClinicUpdateBuilder>,
        ClinicUpdateBuilder {
  _$$ClinicUpdate? _$v;

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

  $ClinicUpdateBuilder() {
    $ClinicUpdate._defaults(this);
  }

  $ClinicUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(covariant $ClinicUpdate other) {
    _$v = other as _$$ClinicUpdate;
  }

  @override
  void update(void Function($ClinicUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $ClinicUpdate build() => _build();

  _$$ClinicUpdate _build() {
    final _$result =
        _$v ??
        _$$ClinicUpdate._(
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
