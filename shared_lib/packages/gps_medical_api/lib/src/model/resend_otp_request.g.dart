// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResendOtpRequest extends ResendOtpRequest {
  @override
  final String phone;

  factory _$ResendOtpRequest([
    void Function(ResendOtpRequestBuilder)? updates,
  ]) => (ResendOtpRequestBuilder()..update(updates))._build();

  _$ResendOtpRequest._({required this.phone}) : super._();
  @override
  ResendOtpRequest rebuild(void Function(ResendOtpRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResendOtpRequestBuilder toBuilder() =>
      ResendOtpRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResendOtpRequest && phone == other.phone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'ResendOtpRequest',
    )..add('phone', phone)).toString();
  }
}

class ResendOtpRequestBuilder
    implements Builder<ResendOtpRequest, ResendOtpRequestBuilder> {
  _$ResendOtpRequest? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  ResendOtpRequestBuilder() {
    ResendOtpRequest._defaults(this);
  }

  ResendOtpRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResendOtpRequest other) {
    _$v = other as _$ResendOtpRequest;
  }

  @override
  void update(void Function(ResendOtpRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResendOtpRequest build() => _build();

  _$ResendOtpRequest _build() {
    final _$result =
        _$v ??
        _$ResendOtpRequest._(
          phone: BuiltValueNullFieldError.checkNotNull(
            phone,
            r'ResendOtpRequest',
            'phone',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
