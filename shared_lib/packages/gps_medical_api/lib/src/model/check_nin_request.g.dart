// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_nin_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckNinRequest extends CheckNinRequest {
  @override
  final String nin;

  factory _$CheckNinRequest([void Function(CheckNinRequestBuilder)? updates]) =>
      (CheckNinRequestBuilder()..update(updates))._build();

  _$CheckNinRequest._({required this.nin}) : super._();
  @override
  CheckNinRequest rebuild(void Function(CheckNinRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckNinRequestBuilder toBuilder() => CheckNinRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckNinRequest && nin == other.nin;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nin.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'CheckNinRequest',
    )..add('nin', nin)).toString();
  }
}

class CheckNinRequestBuilder
    implements Builder<CheckNinRequest, CheckNinRequestBuilder> {
  _$CheckNinRequest? _$v;

  String? _nin;
  String? get nin => _$this._nin;
  set nin(String? nin) => _$this._nin = nin;

  CheckNinRequestBuilder() {
    CheckNinRequest._defaults(this);
  }

  CheckNinRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nin = $v.nin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckNinRequest other) {
    _$v = other as _$CheckNinRequest;
  }

  @override
  void update(void Function(CheckNinRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckNinRequest build() => _build();

  _$CheckNinRequest _build() {
    final _$result =
        _$v ??
        _$CheckNinRequest._(
          nin: BuiltValueNullFieldError.checkNotNull(
            nin,
            r'CheckNinRequest',
            'nin',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
