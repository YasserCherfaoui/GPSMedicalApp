// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wilaya.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Wilaya extends Wilaya {
  @override
  final String code;
  @override
  final String nameFr;
  @override
  final String nameAr;
  @override
  final double latitude;
  @override
  final double longitude;

  factory _$Wilaya([void Function(WilayaBuilder)? updates]) =>
      (WilayaBuilder()..update(updates))._build();

  _$Wilaya._({
    required this.code,
    required this.nameFr,
    required this.nameAr,
    required this.latitude,
    required this.longitude,
  }) : super._();
  @override
  Wilaya rebuild(void Function(WilayaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WilayaBuilder toBuilder() => WilayaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Wilaya &&
        code == other.code &&
        nameFr == other.nameFr &&
        nameAr == other.nameAr &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, nameFr.hashCode);
    _$hash = $jc(_$hash, nameAr.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Wilaya')
          ..add('code', code)
          ..add('nameFr', nameFr)
          ..add('nameAr', nameAr)
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class WilayaBuilder implements Builder<Wilaya, WilayaBuilder> {
  _$Wilaya? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _nameFr;
  String? get nameFr => _$this._nameFr;
  set nameFr(String? nameFr) => _$this._nameFr = nameFr;

  String? _nameAr;
  String? get nameAr => _$this._nameAr;
  set nameAr(String? nameAr) => _$this._nameAr = nameAr;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  WilayaBuilder() {
    Wilaya._defaults(this);
  }

  WilayaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _nameFr = $v.nameFr;
      _nameAr = $v.nameAr;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Wilaya other) {
    _$v = other as _$Wilaya;
  }

  @override
  void update(void Function(WilayaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Wilaya build() => _build();

  _$Wilaya _build() {
    final _$result =
        _$v ??
        _$Wilaya._(
          code: BuiltValueNullFieldError.checkNotNull(code, r'Wilaya', 'code'),
          nameFr: BuiltValueNullFieldError.checkNotNull(
            nameFr,
            r'Wilaya',
            'nameFr',
          ),
          nameAr: BuiltValueNullFieldError.checkNotNull(
            nameAr,
            r'Wilaya',
            'nameAr',
          ),
          latitude: BuiltValueNullFieldError.checkNotNull(
            latitude,
            r'Wilaya',
            'latitude',
          ),
          longitude: BuiltValueNullFieldError.checkNotNull(
            longitude,
            r'Wilaya',
            'longitude',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
