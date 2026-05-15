// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_pair.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TokenPair extends TokenPair {
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final String? tokenType;
  @override
  final int? expiresIn;

  factory _$TokenPair([void Function(TokenPairBuilder)? updates]) =>
      (TokenPairBuilder()..update(updates))._build();

  _$TokenPair._({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
  }) : super._();
  @override
  TokenPair rebuild(void Function(TokenPairBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenPairBuilder toBuilder() => TokenPairBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenPair &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType &&
        expiresIn == other.expiresIn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jc(_$hash, expiresIn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TokenPair')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('tokenType', tokenType)
          ..add('expiresIn', expiresIn))
        .toString();
  }
}

class TokenPairBuilder implements Builder<TokenPair, TokenPairBuilder> {
  _$TokenPair? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  int? _expiresIn;
  int? get expiresIn => _$this._expiresIn;
  set expiresIn(int? expiresIn) => _$this._expiresIn = expiresIn;

  TokenPairBuilder() {
    TokenPair._defaults(this);
  }

  TokenPairBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _tokenType = $v.tokenType;
      _expiresIn = $v.expiresIn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenPair other) {
    _$v = other as _$TokenPair;
  }

  @override
  void update(void Function(TokenPairBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenPair build() => _build();

  _$TokenPair _build() {
    final _$result =
        _$v ??
        _$TokenPair._(
          accessToken: accessToken,
          refreshToken: refreshToken,
          tokenType: tokenType,
          expiresIn: expiresIn,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
