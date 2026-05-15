// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwks.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$JWKS extends JWKS {
  @override
  final BuiltList<JWKSKeysInner> keys;

  factory _$JWKS([void Function(JWKSBuilder)? updates]) =>
      (JWKSBuilder()..update(updates))._build();

  _$JWKS._({required this.keys}) : super._();
  @override
  JWKS rebuild(void Function(JWKSBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JWKSBuilder toBuilder() => JWKSBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JWKS && keys == other.keys;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, keys.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JWKS')..add('keys', keys)).toString();
  }
}

class JWKSBuilder implements Builder<JWKS, JWKSBuilder> {
  _$JWKS? _$v;

  ListBuilder<JWKSKeysInner>? _keys;
  ListBuilder<JWKSKeysInner> get keys =>
      _$this._keys ??= ListBuilder<JWKSKeysInner>();
  set keys(ListBuilder<JWKSKeysInner>? keys) => _$this._keys = keys;

  JWKSBuilder() {
    JWKS._defaults(this);
  }

  JWKSBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _keys = $v.keys.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JWKS other) {
    _$v = other as _$JWKS;
  }

  @override
  void update(void Function(JWKSBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JWKS build() => _build();

  _$JWKS _build() {
    _$JWKS _$result;
    try {
      _$result = _$v ?? _$JWKS._(keys: keys.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'keys';
        keys.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'JWKS', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
