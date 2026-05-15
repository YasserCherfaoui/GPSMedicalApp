// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_tokens_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RefreshTokensRequest extends RefreshTokensRequest {
  @override
  final String refreshToken;

  factory _$RefreshTokensRequest([
    void Function(RefreshTokensRequestBuilder)? updates,
  ]) => (RefreshTokensRequestBuilder()..update(updates))._build();

  _$RefreshTokensRequest._({required this.refreshToken}) : super._();
  @override
  RefreshTokensRequest rebuild(
    void Function(RefreshTokensRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  RefreshTokensRequestBuilder toBuilder() =>
      RefreshTokensRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshTokensRequest && refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'RefreshTokensRequest',
    )..add('refreshToken', refreshToken)).toString();
  }
}

class RefreshTokensRequestBuilder
    implements Builder<RefreshTokensRequest, RefreshTokensRequestBuilder> {
  _$RefreshTokensRequest? _$v;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  RefreshTokensRequestBuilder() {
    RefreshTokensRequest._defaults(this);
  }

  RefreshTokensRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshTokensRequest other) {
    _$v = other as _$RefreshTokensRequest;
  }

  @override
  void update(void Function(RefreshTokensRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshTokensRequest build() => _build();

  _$RefreshTokensRequest _build() {
    final _$result =
        _$v ??
        _$RefreshTokensRequest._(
          refreshToken: BuiltValueNullFieldError.checkNotNull(
            refreshToken,
            r'RefreshTokensRequest',
            'refreshToken',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
