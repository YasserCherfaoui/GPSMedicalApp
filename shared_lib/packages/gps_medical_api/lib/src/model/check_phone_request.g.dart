// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_phone_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckPhoneRequest extends CheckPhoneRequest {
  @override
  final String phone;

  factory _$CheckPhoneRequest([
    void Function(CheckPhoneRequestBuilder)? updates,
  ]) => (CheckPhoneRequestBuilder()..update(updates))._build();

  _$CheckPhoneRequest._({required this.phone}) : super._();
  @override
  CheckPhoneRequest rebuild(void Function(CheckPhoneRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckPhoneRequestBuilder toBuilder() =>
      CheckPhoneRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckPhoneRequest && phone == other.phone;
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
      r'CheckPhoneRequest',
    )..add('phone', phone)).toString();
  }
}

class CheckPhoneRequestBuilder
    implements Builder<CheckPhoneRequest, CheckPhoneRequestBuilder> {
  _$CheckPhoneRequest? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  CheckPhoneRequestBuilder() {
    CheckPhoneRequest._defaults(this);
  }

  CheckPhoneRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckPhoneRequest other) {
    _$v = other as _$CheckPhoneRequest;
  }

  @override
  void update(void Function(CheckPhoneRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckPhoneRequest build() => _build();

  _$CheckPhoneRequest _build() {
    final _$result =
        _$v ??
        _$CheckPhoneRequest._(
          phone: BuiltValueNullFieldError.checkNotNull(
            phone,
            r'CheckPhoneRequest',
            'phone',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
