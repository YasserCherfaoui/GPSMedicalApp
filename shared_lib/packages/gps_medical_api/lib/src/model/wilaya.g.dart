// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wilaya.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Wilaya extends Wilaya {
  @override
  final String? code;
  @override
  final String? nameFr;
  @override
  final String? nameAr;

  factory _$Wilaya([void Function(WilayaBuilder)? updates]) =>
      (WilayaBuilder()..update(updates))._build();

  _$Wilaya._({this.code, this.nameFr, this.nameAr}) : super._();
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
        nameAr == other.nameAr;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, nameFr.hashCode);
    _$hash = $jc(_$hash, nameAr.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Wilaya')
          ..add('code', code)
          ..add('nameFr', nameFr)
          ..add('nameAr', nameAr))
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

  WilayaBuilder() {
    Wilaya._defaults(this);
  }

  WilayaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _nameFr = $v.nameFr;
      _nameAr = $v.nameAr;
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
        _$v ?? _$Wilaya._(code: code, nameFr: nameFr, nameAr: nameAr);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
