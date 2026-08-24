// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class ClinicBuilder {
  void replace(Clinic other);
  void update(void Function(ClinicBuilder) updates);
  String? get id;
  set id(String? id);

  String? get name;
  set name(String? name);

  String? get description;
  set description(String? description);

  AddressBuilder get address;
  set address(AddressBuilder? address);

  String? get countryCode;
  set countryCode(String? countryCode);

  bool? get verified;
  set verified(bool? verified);

  double? get ratingAverage;
  set ratingAverage(double? ratingAverage);

  int? get ratingCount;
  set ratingCount(int? ratingCount);

  bool? get offersTelehealth;
  set offersTelehealth(bool? offersTelehealth);

  ListBuilder<ClinicServiceTeaser> get serviceTeasers;
  set serviceTeasers(ListBuilder<ClinicServiceTeaser>? serviceTeasers);
}

class _$$Clinic extends $Clinic {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final Address? address;
  @override
  final String? countryCode;
  @override
  final bool? verified;
  @override
  final double? ratingAverage;
  @override
  final int? ratingCount;
  @override
  final bool? offersTelehealth;
  @override
  final BuiltList<ClinicServiceTeaser>? serviceTeasers;

  factory _$$Clinic([void Function($ClinicBuilder)? updates]) =>
      ($ClinicBuilder()..update(updates))._build();

  _$$Clinic._({
    this.id,
    this.name,
    this.description,
    this.address,
    this.countryCode,
    this.verified,
    this.ratingAverage,
    this.ratingCount,
    this.offersTelehealth,
    this.serviceTeasers,
  }) : super._();
  @override
  $Clinic rebuild(void Function($ClinicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $ClinicBuilder toBuilder() => $ClinicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $Clinic &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        address == other.address &&
        countryCode == other.countryCode &&
        verified == other.verified &&
        ratingAverage == other.ratingAverage &&
        ratingCount == other.ratingCount &&
        offersTelehealth == other.offersTelehealth &&
        serviceTeasers == other.serviceTeasers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, verified.hashCode);
    _$hash = $jc(_$hash, ratingAverage.hashCode);
    _$hash = $jc(_$hash, ratingCount.hashCode);
    _$hash = $jc(_$hash, offersTelehealth.hashCode);
    _$hash = $jc(_$hash, serviceTeasers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$Clinic')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('address', address)
          ..add('countryCode', countryCode)
          ..add('verified', verified)
          ..add('ratingAverage', ratingAverage)
          ..add('ratingCount', ratingCount)
          ..add('offersTelehealth', offersTelehealth)
          ..add('serviceTeasers', serviceTeasers))
        .toString();
  }
}

class $ClinicBuilder
    implements Builder<$Clinic, $ClinicBuilder>, ClinicBuilder {
  _$$Clinic? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  AddressBuilder? _address;
  AddressBuilder get address => _$this._address ??= AddressBuilder();
  set address(covariant AddressBuilder? address) => _$this._address = address;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(covariant String? countryCode) =>
      _$this._countryCode = countryCode;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(covariant bool? verified) => _$this._verified = verified;

  double? _ratingAverage;
  double? get ratingAverage => _$this._ratingAverage;
  set ratingAverage(covariant double? ratingAverage) =>
      _$this._ratingAverage = ratingAverage;

  int? _ratingCount;
  int? get ratingCount => _$this._ratingCount;
  set ratingCount(covariant int? ratingCount) =>
      _$this._ratingCount = ratingCount;

  bool? _offersTelehealth;
  bool? get offersTelehealth => _$this._offersTelehealth;
  set offersTelehealth(covariant bool? offersTelehealth) =>
      _$this._offersTelehealth = offersTelehealth;

  ListBuilder<ClinicServiceTeaser>? _serviceTeasers;
  ListBuilder<ClinicServiceTeaser> get serviceTeasers =>
      _$this._serviceTeasers ??= ListBuilder<ClinicServiceTeaser>();
  set serviceTeasers(
    covariant ListBuilder<ClinicServiceTeaser>? serviceTeasers,
  ) => _$this._serviceTeasers = serviceTeasers;

  $ClinicBuilder() {
    $Clinic._defaults(this);
  }

  $ClinicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _address = $v.address?.toBuilder();
      _countryCode = $v.countryCode;
      _verified = $v.verified;
      _ratingAverage = $v.ratingAverage;
      _ratingCount = $v.ratingCount;
      _offersTelehealth = $v.offersTelehealth;
      _serviceTeasers = $v.serviceTeasers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $Clinic other) {
    _$v = other as _$$Clinic;
  }

  @override
  void update(void Function($ClinicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $Clinic build() => _build();

  _$$Clinic _build() {
    _$$Clinic _$result;
    try {
      _$result =
          _$v ??
          _$$Clinic._(
            id: id,
            name: name,
            description: description,
            address: _address?.build(),
            countryCode: countryCode,
            verified: verified,
            ratingAverage: ratingAverage,
            ratingCount: ratingCount,
            offersTelehealth: offersTelehealth,
            serviceTeasers: _serviceTeasers?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();

        _$failedField = 'serviceTeasers';
        _serviceTeasers?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'$Clinic',
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
