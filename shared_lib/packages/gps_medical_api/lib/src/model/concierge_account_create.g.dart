// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_account_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConciergeAccountCreate extends ConciergeAccountCreate {
  @override
  final String phone;
  @override
  final String? email;
  @override
  final String fullName;
  @override
  final CountryCode country;
  @override
  final String password;

  factory _$ConciergeAccountCreate([
    void Function(ConciergeAccountCreateBuilder)? updates,
  ]) => (ConciergeAccountCreateBuilder()..update(updates))._build();

  _$ConciergeAccountCreate._({
    required this.phone,
    this.email,
    required this.fullName,
    required this.country,
    required this.password,
  }) : super._();
  @override
  ConciergeAccountCreate rebuild(
    void Function(ConciergeAccountCreateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConciergeAccountCreateBuilder toBuilder() =>
      ConciergeAccountCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConciergeAccountCreate &&
        phone == other.phone &&
        email == other.email &&
        fullName == other.fullName &&
        country == other.country &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConciergeAccountCreate')
          ..add('phone', phone)
          ..add('email', email)
          ..add('fullName', fullName)
          ..add('country', country)
          ..add('password', password))
        .toString();
  }
}

class ConciergeAccountCreateBuilder
    implements Builder<ConciergeAccountCreate, ConciergeAccountCreateBuilder> {
  _$ConciergeAccountCreate? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  CountryCode? _country;
  CountryCode? get country => _$this._country;
  set country(CountryCode? country) => _$this._country = country;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  ConciergeAccountCreateBuilder() {
    ConciergeAccountCreate._defaults(this);
  }

  ConciergeAccountCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _email = $v.email;
      _fullName = $v.fullName;
      _country = $v.country;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConciergeAccountCreate other) {
    _$v = other as _$ConciergeAccountCreate;
  }

  @override
  void update(void Function(ConciergeAccountCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConciergeAccountCreate build() => _build();

  _$ConciergeAccountCreate _build() {
    final _$result =
        _$v ??
        _$ConciergeAccountCreate._(
          phone: BuiltValueNullFieldError.checkNotNull(
            phone,
            r'ConciergeAccountCreate',
            'phone',
          ),
          email: email,
          fullName: BuiltValueNullFieldError.checkNotNull(
            fullName,
            r'ConciergeAccountCreate',
            'fullName',
          ),
          country: BuiltValueNullFieldError.checkNotNull(
            country,
            r'ConciergeAccountCreate',
            'country',
          ),
          password: BuiltValueNullFieldError.checkNotNull(
            password,
            r'ConciergeAccountCreate',
            'password',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
