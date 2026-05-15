// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwks_keys_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$JWKSKeysInner extends JWKSKeysInner {
  @override
  final String kty;
  @override
  final String use;
  @override
  final String alg;
  @override
  final String kid;
  @override
  final String n;
  @override
  final String e;

  factory _$JWKSKeysInner([void Function(JWKSKeysInnerBuilder)? updates]) =>
      (JWKSKeysInnerBuilder()..update(updates))._build();

  _$JWKSKeysInner._({
    required this.kty,
    required this.use,
    required this.alg,
    required this.kid,
    required this.n,
    required this.e,
  }) : super._();
  @override
  JWKSKeysInner rebuild(void Function(JWKSKeysInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JWKSKeysInnerBuilder toBuilder() => JWKSKeysInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JWKSKeysInner &&
        kty == other.kty &&
        use == other.use &&
        alg == other.alg &&
        kid == other.kid &&
        n == other.n &&
        e == other.e;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kty.hashCode);
    _$hash = $jc(_$hash, use.hashCode);
    _$hash = $jc(_$hash, alg.hashCode);
    _$hash = $jc(_$hash, kid.hashCode);
    _$hash = $jc(_$hash, n.hashCode);
    _$hash = $jc(_$hash, e.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JWKSKeysInner')
          ..add('kty', kty)
          ..add('use', use)
          ..add('alg', alg)
          ..add('kid', kid)
          ..add('n', n)
          ..add('e', e))
        .toString();
  }
}

class JWKSKeysInnerBuilder
    implements Builder<JWKSKeysInner, JWKSKeysInnerBuilder> {
  _$JWKSKeysInner? _$v;

  String? _kty;
  String? get kty => _$this._kty;
  set kty(String? kty) => _$this._kty = kty;

  String? _use;
  String? get use => _$this._use;
  set use(String? use) => _$this._use = use;

  String? _alg;
  String? get alg => _$this._alg;
  set alg(String? alg) => _$this._alg = alg;

  String? _kid;
  String? get kid => _$this._kid;
  set kid(String? kid) => _$this._kid = kid;

  String? _n;
  String? get n => _$this._n;
  set n(String? n) => _$this._n = n;

  String? _e;
  String? get e => _$this._e;
  set e(String? e) => _$this._e = e;

  JWKSKeysInnerBuilder() {
    JWKSKeysInner._defaults(this);
  }

  JWKSKeysInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kty = $v.kty;
      _use = $v.use;
      _alg = $v.alg;
      _kid = $v.kid;
      _n = $v.n;
      _e = $v.e;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JWKSKeysInner other) {
    _$v = other as _$JWKSKeysInner;
  }

  @override
  void update(void Function(JWKSKeysInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JWKSKeysInner build() => _build();

  _$JWKSKeysInner _build() {
    final _$result =
        _$v ??
        _$JWKSKeysInner._(
          kty: BuiltValueNullFieldError.checkNotNull(
            kty,
            r'JWKSKeysInner',
            'kty',
          ),
          use: BuiltValueNullFieldError.checkNotNull(
            use,
            r'JWKSKeysInner',
            'use',
          ),
          alg: BuiltValueNullFieldError.checkNotNull(
            alg,
            r'JWKSKeysInner',
            'alg',
          ),
          kid: BuiltValueNullFieldError.checkNotNull(
            kid,
            r'JWKSKeysInner',
            'kid',
          ),
          n: BuiltValueNullFieldError.checkNotNull(n, r'JWKSKeysInner', 'n'),
          e: BuiltValueNullFieldError.checkNotNull(e, r'JWKSKeysInner', 'e'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
