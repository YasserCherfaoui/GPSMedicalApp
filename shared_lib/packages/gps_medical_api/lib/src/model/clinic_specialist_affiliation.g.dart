// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_specialist_affiliation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicSpecialistAffiliation extends ClinicSpecialistAffiliation {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? wilayaCode;
  @override
  final bool? verified;

  factory _$ClinicSpecialistAffiliation([
    void Function(ClinicSpecialistAffiliationBuilder)? updates,
  ]) => (ClinicSpecialistAffiliationBuilder()..update(updates))._build();

  _$ClinicSpecialistAffiliation._({
    this.id,
    this.name,
    this.address,
    this.wilayaCode,
    this.verified,
  }) : super._();
  @override
  ClinicSpecialistAffiliation rebuild(
    void Function(ClinicSpecialistAffiliationBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicSpecialistAffiliationBuilder toBuilder() =>
      ClinicSpecialistAffiliationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicSpecialistAffiliation &&
        id == other.id &&
        name == other.name &&
        address == other.address &&
        wilayaCode == other.wilayaCode &&
        verified == other.verified;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, wilayaCode.hashCode);
    _$hash = $jc(_$hash, verified.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicSpecialistAffiliation')
          ..add('id', id)
          ..add('name', name)
          ..add('address', address)
          ..add('wilayaCode', wilayaCode)
          ..add('verified', verified))
        .toString();
  }
}

class ClinicSpecialistAffiliationBuilder
    implements
        Builder<
          ClinicSpecialistAffiliation,
          ClinicSpecialistAffiliationBuilder
        > {
  _$ClinicSpecialistAffiliation? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _wilayaCode;
  String? get wilayaCode => _$this._wilayaCode;
  set wilayaCode(String? wilayaCode) => _$this._wilayaCode = wilayaCode;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  ClinicSpecialistAffiliationBuilder() {
    ClinicSpecialistAffiliation._defaults(this);
  }

  ClinicSpecialistAffiliationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _address = $v.address;
      _wilayaCode = $v.wilayaCode;
      _verified = $v.verified;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicSpecialistAffiliation other) {
    _$v = other as _$ClinicSpecialistAffiliation;
  }

  @override
  void update(void Function(ClinicSpecialistAffiliationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicSpecialistAffiliation build() => _build();

  _$ClinicSpecialistAffiliation _build() {
    final _$result =
        _$v ??
        _$ClinicSpecialistAffiliation._(
          id: id,
          name: name,
          address: address,
          wilayaCode: wilayaCode,
          verified: verified,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
