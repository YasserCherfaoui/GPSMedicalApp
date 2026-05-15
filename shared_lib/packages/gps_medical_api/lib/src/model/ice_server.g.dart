// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_server.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IceServer extends IceServer {
  @override
  final IceServerUrls? urls;
  @override
  final String? username;
  @override
  final String? credential;

  factory _$IceServer([void Function(IceServerBuilder)? updates]) =>
      (IceServerBuilder()..update(updates))._build();

  _$IceServer._({this.urls, this.username, this.credential}) : super._();
  @override
  IceServer rebuild(void Function(IceServerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IceServerBuilder toBuilder() => IceServerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IceServer &&
        urls == other.urls &&
        username == other.username &&
        credential == other.credential;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, urls.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, credential.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IceServer')
          ..add('urls', urls)
          ..add('username', username)
          ..add('credential', credential))
        .toString();
  }
}

class IceServerBuilder implements Builder<IceServer, IceServerBuilder> {
  _$IceServer? _$v;

  IceServerUrlsBuilder? _urls;
  IceServerUrlsBuilder get urls => _$this._urls ??= IceServerUrlsBuilder();
  set urls(IceServerUrlsBuilder? urls) => _$this._urls = urls;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _credential;
  String? get credential => _$this._credential;
  set credential(String? credential) => _$this._credential = credential;

  IceServerBuilder() {
    IceServer._defaults(this);
  }

  IceServerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _urls = $v.urls?.toBuilder();
      _username = $v.username;
      _credential = $v.credential;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IceServer other) {
    _$v = other as _$IceServer;
  }

  @override
  void update(void Function(IceServerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IceServer build() => _build();

  _$IceServer _build() {
    _$IceServer _$result;
    try {
      _$result =
          _$v ??
          _$IceServer._(
            urls: _urls?.build(),
            username: username,
            credential: credential,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'urls';
        _urls?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'IceServer',
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
