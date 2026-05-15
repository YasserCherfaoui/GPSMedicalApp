// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasswordResetRequest extends PasswordResetRequest {
  @override
  final String phone;
  @override
  final String code;
  @override
  final String newPassword;

  factory _$PasswordResetRequest([
    void Function(PasswordResetRequestBuilder)? updates,
  ]) => (PasswordResetRequestBuilder()..update(updates))._build();

  _$PasswordResetRequest._({
    required this.phone,
    required this.code,
    required this.newPassword,
  }) : super._();
  @override
  PasswordResetRequest rebuild(
    void Function(PasswordResetRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PasswordResetRequestBuilder toBuilder() =>
      PasswordResetRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasswordResetRequest &&
        phone == other.phone &&
        code == other.code &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasswordResetRequest')
          ..add('phone', phone)
          ..add('code', code)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class PasswordResetRequestBuilder
    implements Builder<PasswordResetRequest, PasswordResetRequestBuilder> {
  _$PasswordResetRequest? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  PasswordResetRequestBuilder() {
    PasswordResetRequest._defaults(this);
  }

  PasswordResetRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _code = $v.code;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasswordResetRequest other) {
    _$v = other as _$PasswordResetRequest;
  }

  @override
  void update(void Function(PasswordResetRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasswordResetRequest build() => _build();

  _$PasswordResetRequest _build() {
    final _$result =
        _$v ??
        _$PasswordResetRequest._(
          phone: BuiltValueNullFieldError.checkNotNull(
            phone,
            r'PasswordResetRequest',
            'phone',
          ),
          code: BuiltValueNullFieldError.checkNotNull(
            code,
            r'PasswordResetRequest',
            'code',
          ),
          newPassword: BuiltValueNullFieldError.checkNotNull(
            newPassword,
            r'PasswordResetRequest',
            'newPassword',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
