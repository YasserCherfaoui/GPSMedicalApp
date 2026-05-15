// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_intents_intent_id_confirm_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaymentsIntentsIntentIdConfirmPostRequest
    extends PaymentsIntentsIntentIdConfirmPostRequest {
  @override
  final String gatewayToken;

  factory _$PaymentsIntentsIntentIdConfirmPostRequest([
    void Function(PaymentsIntentsIntentIdConfirmPostRequestBuilder)? updates,
  ]) => (PaymentsIntentsIntentIdConfirmPostRequestBuilder()..update(updates))
      ._build();

  _$PaymentsIntentsIntentIdConfirmPostRequest._({required this.gatewayToken})
    : super._();
  @override
  PaymentsIntentsIntentIdConfirmPostRequest rebuild(
    void Function(PaymentsIntentsIntentIdConfirmPostRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaymentsIntentsIntentIdConfirmPostRequestBuilder toBuilder() =>
      PaymentsIntentsIntentIdConfirmPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentsIntentsIntentIdConfirmPostRequest &&
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
      r'PaymentsIntentsIntentIdConfirmPostRequest',
    )..add('gatewayToken', gatewayToken)).toString();
  }
}

class PaymentsIntentsIntentIdConfirmPostRequestBuilder
    implements
        Builder<
          PaymentsIntentsIntentIdConfirmPostRequest,
          PaymentsIntentsIntentIdConfirmPostRequestBuilder
        > {
  _$PaymentsIntentsIntentIdConfirmPostRequest? _$v;

  String? _gatewayToken;
  String? get gatewayToken => _$this._gatewayToken;
  set gatewayToken(String? gatewayToken) => _$this._gatewayToken = gatewayToken;

  PaymentsIntentsIntentIdConfirmPostRequestBuilder() {
    PaymentsIntentsIntentIdConfirmPostRequest._defaults(this);
  }

  PaymentsIntentsIntentIdConfirmPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gatewayToken = $v.gatewayToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentsIntentsIntentIdConfirmPostRequest other) {
    _$v = other as _$PaymentsIntentsIntentIdConfirmPostRequest;
  }

  @override
  void update(
    void Function(PaymentsIntentsIntentIdConfirmPostRequestBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  PaymentsIntentsIntentIdConfirmPostRequest build() => _build();

  _$PaymentsIntentsIntentIdConfirmPostRequest _build() {
    final _$result =
        _$v ??
        _$PaymentsIntentsIntentIdConfirmPostRequest._(
          gatewayToken: BuiltValueNullFieldError.checkNotNull(
            gatewayToken,
            r'PaymentsIntentsIntentIdConfirmPostRequest',
            'gatewayToken',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
