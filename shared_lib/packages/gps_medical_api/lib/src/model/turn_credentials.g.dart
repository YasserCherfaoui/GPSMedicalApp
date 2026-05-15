// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn_credentials.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TurnCredentials extends TurnCredentials {
  @override
  final String? username;
  @override
  final String? credential;
  @override
  final int? ttlSeconds;
  @override
  final BuiltList<String>? urls;

  factory _$TurnCredentials([void Function(TurnCredentialsBuilder)? updates]) =>
      (TurnCredentialsBuilder()..update(updates))._build();

  _$TurnCredentials._({
    this.username,
    this.credential,
    this.ttlSeconds,
    this.urls,
  }) : super._();
  @override
  TurnCredentials rebuild(void Function(TurnCredentialsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TurnCredentialsBuilder toBuilder() => TurnCredentialsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TurnCredentials &&
        username == other.username &&
        credential == other.credential &&
        ttlSeconds == other.ttlSeconds &&
        urls == other.urls;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, credential.hashCode);
    _$hash = $jc(_$hash, ttlSeconds.hashCode);
    _$hash = $jc(_$hash, urls.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TurnCredentials')
          ..add('username', username)
          ..add('credential', credential)
          ..add('ttlSeconds', ttlSeconds)
          ..add('urls', urls))
        .toString();
  }
}

class TurnCredentialsBuilder
    implements Builder<TurnCredentials, TurnCredentialsBuilder> {
  _$TurnCredentials? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _credential;
  String? get credential => _$this._credential;
  set credential(String? credential) => _$this._credential = credential;

  int? _ttlSeconds;
  int? get ttlSeconds => _$this._ttlSeconds;
  set ttlSeconds(int? ttlSeconds) => _$this._ttlSeconds = ttlSeconds;

  ListBuilder<String>? _urls;
  ListBuilder<String> get urls => _$this._urls ??= ListBuilder<String>();
  set urls(ListBuilder<String>? urls) => _$this._urls = urls;

  TurnCredentialsBuilder() {
    TurnCredentials._defaults(this);
  }

  TurnCredentialsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _credential = $v.credential;
      _ttlSeconds = $v.ttlSeconds;
      _urls = $v.urls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TurnCredentials other) {
    _$v = other as _$TurnCredentials;
  }

  @override
  void update(void Function(TurnCredentialsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TurnCredentials build() => _build();

  _$TurnCredentials _build() {
    _$TurnCredentials _$result;
    try {
      _$result =
          _$v ??
          _$TurnCredentials._(
            username: username,
            credential: credential,
            ttlSeconds: ttlSeconds,
            urls: _urls?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'urls';
        _urls?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'TurnCredentials',
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
