// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LoginRequestClientEnum _$loginRequestClientEnum_mobile =
    const LoginRequestClientEnum._('mobile');
const LoginRequestClientEnum _$loginRequestClientEnum_dashboard =
    const LoginRequestClientEnum._('dashboard');

LoginRequestClientEnum _$loginRequestClientEnumValueOf(String name) {
  switch (name) {
    case 'mobile':
      return _$loginRequestClientEnum_mobile;
    case 'dashboard':
      return _$loginRequestClientEnum_dashboard;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<LoginRequestClientEnum> _$loginRequestClientEnumValues =
    BuiltSet<LoginRequestClientEnum>(const <LoginRequestClientEnum>[
      _$loginRequestClientEnum_mobile,
      _$loginRequestClientEnum_dashboard,
    ]);

Serializer<LoginRequestClientEnum> _$loginRequestClientEnumSerializer =
    _$LoginRequestClientEnumSerializer();

class _$LoginRequestClientEnumSerializer
    implements PrimitiveSerializer<LoginRequestClientEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'mobile': 'mobile',
    'dashboard': 'dashboard',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'mobile': 'mobile',
    'dashboard': 'dashboard',
  };

  @override
  final Iterable<Type> types = const <Type>[LoginRequestClientEnum];
  @override
  final String wireName = 'LoginRequestClientEnum';

  @override
  Object serialize(
    Serializers serializers,
    LoginRequestClientEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  LoginRequestClientEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => LoginRequestClientEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$LoginRequest extends LoginRequest {
  @override
  final String phone;
  @override
  final String password;
  @override
  final LoginRequestClientEnum? client;

  factory _$LoginRequest([void Function(LoginRequestBuilder)? updates]) =>
      (LoginRequestBuilder()..update(updates))._build();

  _$LoginRequest._({required this.phone, required this.password, this.client})
    : super._();
  @override
  LoginRequest rebuild(void Function(LoginRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginRequestBuilder toBuilder() => LoginRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginRequest &&
        phone == other.phone &&
        password == other.password &&
        client == other.client;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, client.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginRequest')
          ..add('phone', phone)
          ..add('password', password)
          ..add('client', client))
        .toString();
  }
}

class LoginRequestBuilder
    implements Builder<LoginRequest, LoginRequestBuilder> {
  _$LoginRequest? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  LoginRequestClientEnum? _client;
  LoginRequestClientEnum? get client => _$this._client;
  set client(LoginRequestClientEnum? client) => _$this._client = client;

  LoginRequestBuilder() {
    LoginRequest._defaults(this);
  }

  LoginRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _password = $v.password;
      _client = $v.client;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginRequest other) {
    _$v = other as _$LoginRequest;
  }

  @override
  void update(void Function(LoginRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginRequest build() => _build();

  _$LoginRequest _build() {
    final _$result =
        _$v ??
        _$LoginRequest._(
          phone: BuiltValueNullFieldError.checkNotNull(
            phone,
            r'LoginRequest',
            'phone',
          ),
          password: BuiltValueNullFieldError.checkNotNull(
            password,
            r'LoginRequest',
            'password',
          ),
          client: client,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
