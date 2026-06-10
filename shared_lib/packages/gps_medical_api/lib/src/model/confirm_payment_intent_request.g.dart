// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_payment_intent_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConfirmPaymentIntentRequest extends ConfirmPaymentIntentRequest {
  @override
  final String gatewayToken;

  factory _$ConfirmPaymentIntentRequest([
    void Function(ConfirmPaymentIntentRequestBuilder)? updates,
  ]) => (ConfirmPaymentIntentRequestBuilder()..update(updates))._build();

  _$ConfirmPaymentIntentRequest._({required this.gatewayToken}) : super._();
  @override
  ConfirmPaymentIntentRequest rebuild(
    void Function(ConfirmPaymentIntentRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConfirmPaymentIntentRequestBuilder toBuilder() =>
      ConfirmPaymentIntentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfirmPaymentIntentRequest &&
        gatewayToken == other.gatewayToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, gatewayToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'ConfirmPaymentIntentRequest',
    )..add('gatewayToken', gatewayToken)).toString();
  }
}

class ConfirmPaymentIntentRequestBuilder
    implements
        Builder<
          ConfirmPaymentIntentRequest,
          ConfirmPaymentIntentRequestBuilder
        > {
  _$ConfirmPaymentIntentRequest? _$v;

  String? _gatewayToken;
  String? get gatewayToken => _$this._gatewayToken;
  set gatewayToken(String? gatewayToken) => _$this._gatewayToken = gatewayToken;

  ConfirmPaymentIntentRequestBuilder() {
    ConfirmPaymentIntentRequest._defaults(this);
  }

  ConfirmPaymentIntentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gatewayToken = $v.gatewayToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfirmPaymentIntentRequest other) {
    _$v = other as _$ConfirmPaymentIntentRequest;
  }

  @override
  void update(void Function(ConfirmPaymentIntentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfirmPaymentIntentRequest build() => _build();

  _$ConfirmPaymentIntentRequest _build() {
    final _$result =
        _$v ??
        _$ConfirmPaymentIntentRequest._(
          gatewayToken: BuiltValueNullFieldError.checkNotNull(
            gatewayToken,
            r'ConfirmPaymentIntentRequest',
            'gatewayToken',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
