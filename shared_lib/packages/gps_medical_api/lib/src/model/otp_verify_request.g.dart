// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OtpVerifyRequest extends OtpVerifyRequest {
  @override
  final String phone;
  @override
  final String code;

  factory _$OtpVerifyRequest([
    void Function(OtpVerifyRequestBuilder)? updates,
  ]) => (OtpVerifyRequestBuilder()..update(updates))._build();

  _$OtpVerifyRequest._({required this.phone, required this.code}) : super._();
  @override
  OtpVerifyRequest rebuild(void Function(OtpVerifyRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OtpVerifyRequestBuilder toBuilder() =>
      OtpVerifyRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OtpVerifyRequest &&
        phone == other.phone &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OtpVerifyRequest')
          ..add('phone', phone)
          ..add('code', code))
        .toString();
  }
}

class OtpVerifyRequestBuilder
    implements Builder<OtpVerifyRequest, OtpVerifyRequestBuilder> {
  _$OtpVerifyRequest? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  OtpVerifyRequestBuilder() {
    OtpVerifyRequest._defaults(this);
  }

  OtpVerifyRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OtpVerifyRequest other) {
    _$v = other as _$OtpVerifyRequest;
  }

  @override
  void update(void Function(OtpVerifyRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OtpVerifyRequest build() => _build();

  _$OtpVerifyRequest _build() {
    final _$result =
        _$v ??
        _$OtpVerifyRequest._(
          phone: BuiltValueNullFieldError.checkNotNull(
            phone,
            r'OtpVerifyRequest',
            'phone',
          ),
          code: BuiltValueNullFieldError.checkNotNull(
            code,
            r'OtpVerifyRequest',
            'code',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
