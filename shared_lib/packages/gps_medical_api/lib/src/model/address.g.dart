// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Address extends Address {
  @override
  final String? line1;
  @override
  final String? line2;
  @override
  final String? communeId;
  @override
  final String? communeName;
  @override
  final String? wilayaCode;
  @override
  final String? wilayaName;
  @override
  final String? postalCode;
  @override
  final double? latitude;
  @override
  final double? longitude;

  factory _$Address([void Function(AddressBuilder)? updates]) =>
      (AddressBuilder()..update(updates))._build();

  _$Address._({
    this.line1,
    this.line2,
    this.communeId,
    this.communeName,
    this.wilayaCode,
    this.wilayaName,
    this.postalCode,
    this.latitude,
    this.longitude,
  }) : super._();
  @override
  Address rebuild(void Function(AddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressBuilder toBuilder() => AddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Address &&
        line1 == other.line1 &&
        line2 == other.line2 &&
        communeId == other.communeId &&
        communeName == other.communeName &&
        wilayaCode == other.wilayaCode &&
        wilayaName == other.wilayaName &&
        postalCode == other.postalCode &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, line1.hashCode);
    _$hash = $jc(_$hash, line2.hashCode);
    _$hash = $jc(_$hash, communeId.hashCode);
    _$hash = $jc(_$hash, communeName.hashCode);
    _$hash = $jc(_$hash, wilayaCode.hashCode);
    _$hash = $jc(_$hash, wilayaName.hashCode);
    _$hash = $jc(_$hash, postalCode.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Address')
          ..add('line1', line1)
          ..add('line2', line2)
          ..add('communeId', communeId)
          ..add('communeName', communeName)
          ..add('wilayaCode', wilayaCode)
          ..add('wilayaName', wilayaName)
          ..add('postalCode', postalCode)
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class AddressBuilder implements Builder<Address, AddressBuilder> {
  _$Address? _$v;

  String? _line1;
  String? get line1 => _$this._line1;
  set line1(String? line1) => _$this._line1 = line1;

  String? _line2;
  String? get line2 => _$this._line2;
  set line2(String? line2) => _$this._line2 = line2;

  String? _communeId;
  String? get communeId => _$this._communeId;
  set communeId(String? communeId) => _$this._communeId = communeId;

  String? _communeName;
  String? get communeName => _$this._communeName;
  set communeName(String? communeName) => _$this._communeName = communeName;

  String? _wilayaCode;
  String? get wilayaCode => _$this._wilayaCode;
  set wilayaCode(String? wilayaCode) => _$this._wilayaCode = wilayaCode;

  String? _wilayaName;
  String? get wilayaName => _$this._wilayaName;
  set wilayaName(String? wilayaName) => _$this._wilayaName = wilayaName;

  String? _postalCode;
  String? get postalCode => _$this._postalCode;
  set postalCode(String? postalCode) => _$this._postalCode = postalCode;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  AddressBuilder() {
    Address._defaults(this);
  }

  AddressBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _line1 = $v.line1;
      _line2 = $v.line2;
      _communeId = $v.communeId;
      _communeName = $v.communeName;
      _wilayaCode = $v.wilayaCode;
      _wilayaName = $v.wilayaName;
      _postalCode = $v.postalCode;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Address other) {
    _$v = other as _$Address;
  }

  @override
  void update(void Function(AddressBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Address build() => _build();

  _$Address _build() {
    final _$result =
        _$v ??
        _$Address._(
          line1: line1,
          line2: line2,
          communeId: communeId,
          communeName: communeName,
          wilayaCode: wilayaCode,
          wilayaName: wilayaName,
          postalCode: postalCode,
          latitude: latitude,
          longitude: longitude,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
