// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PaymentIntentStatusEnum _$paymentIntentStatusEnum_created =
    const PaymentIntentStatusEnum._('created');
const PaymentIntentStatusEnum _$paymentIntentStatusEnum_requiresAction =
    const PaymentIntentStatusEnum._('requiresAction');
const PaymentIntentStatusEnum _$paymentIntentStatusEnum_processing =
    const PaymentIntentStatusEnum._('processing');
const PaymentIntentStatusEnum _$paymentIntentStatusEnum_succeeded =
    const PaymentIntentStatusEnum._('succeeded');
const PaymentIntentStatusEnum _$paymentIntentStatusEnum_failed =
    const PaymentIntentStatusEnum._('failed');
const PaymentIntentStatusEnum _$paymentIntentStatusEnum_cancelled =
    const PaymentIntentStatusEnum._('cancelled');

PaymentIntentStatusEnum _$paymentIntentStatusEnumValueOf(String name) {
  switch (name) {
    case 'created':
      return _$paymentIntentStatusEnum_created;
    case 'requiresAction':
      return _$paymentIntentStatusEnum_requiresAction;
    case 'processing':
      return _$paymentIntentStatusEnum_processing;
    case 'succeeded':
      return _$paymentIntentStatusEnum_succeeded;
    case 'failed':
      return _$paymentIntentStatusEnum_failed;
    case 'cancelled':
      return _$paymentIntentStatusEnum_cancelled;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PaymentIntentStatusEnum> _$paymentIntentStatusEnumValues =
    BuiltSet<PaymentIntentStatusEnum>(const <PaymentIntentStatusEnum>[
      _$paymentIntentStatusEnum_created,
      _$paymentIntentStatusEnum_requiresAction,
      _$paymentIntentStatusEnum_processing,
      _$paymentIntentStatusEnum_succeeded,
      _$paymentIntentStatusEnum_failed,
      _$paymentIntentStatusEnum_cancelled,
    ]);

Serializer<PaymentIntentStatusEnum> _$paymentIntentStatusEnumSerializer =
    _$PaymentIntentStatusEnumSerializer();

class _$PaymentIntentStatusEnumSerializer
    implements PrimitiveSerializer<PaymentIntentStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'created': 'created',
    'requiresAction': 'requires_action',
    'processing': 'processing',
    'succeeded': 'succeeded',
    'failed': 'failed',
    'cancelled': 'cancelled',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'created': 'created',
    'requires_action': 'requiresAction',
    'processing': 'processing',
    'succeeded': 'succeeded',
    'failed': 'failed',
    'cancelled': 'cancelled',
  };

  @override
  final Iterable<Type> types = const <Type>[PaymentIntentStatusEnum];
  @override
  final String wireName = 'PaymentIntentStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    PaymentIntentStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PaymentIntentStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PaymentIntentStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PaymentIntent extends PaymentIntent {
  @override
  final String? id;
  @override
  final String? purpose;
  @override
  final String? appointmentId;
  @override
  final int? amountDzd;
  @override
  final String? provider;
  @override
  final PaymentIntentStatusEnum? status;
  @override
  final String? clientSecret;
  @override
  final String? redirectUrl;
  @override
  final DateTime? createdAt;

  factory _$PaymentIntent([void Function(PaymentIntentBuilder)? updates]) =>
      (PaymentIntentBuilder()..update(updates))._build();

  _$PaymentIntent._({
    this.id,
    this.purpose,
    this.appointmentId,
    this.amountDzd,
    this.provider,
    this.status,
    this.clientSecret,
    this.redirectUrl,
    this.createdAt,
  }) : super._();
  @override
  PaymentIntent rebuild(void Function(PaymentIntentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentIntentBuilder toBuilder() => PaymentIntentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentIntent &&
        id == other.id &&
        purpose == other.purpose &&
        appointmentId == other.appointmentId &&
        amountDzd == other.amountDzd &&
        provider == other.provider &&
        status == other.status &&
        clientSecret == other.clientSecret &&
        redirectUrl == other.redirectUrl &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, purpose.hashCode);
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, amountDzd.hashCode);
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, clientSecret.hashCode);
    _$hash = $jc(_$hash, redirectUrl.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentIntent')
          ..add('id', id)
          ..add('purpose', purpose)
          ..add('appointmentId', appointmentId)
          ..add('amountDzd', amountDzd)
          ..add('provider', provider)
          ..add('status', status)
          ..add('clientSecret', clientSecret)
          ..add('redirectUrl', redirectUrl)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class PaymentIntentBuilder
    implements Builder<PaymentIntent, PaymentIntentBuilder> {
  _$PaymentIntent? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _purpose;
  String? get purpose => _$this._purpose;
  set purpose(String? purpose) => _$this._purpose = purpose;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  int? _amountDzd;
  int? get amountDzd => _$this._amountDzd;
  set amountDzd(int? amountDzd) => _$this._amountDzd = amountDzd;

  String? _provider;
  String? get provider => _$this._provider;
  set provider(String? provider) => _$this._provider = provider;

  PaymentIntentStatusEnum? _status;
  PaymentIntentStatusEnum? get status => _$this._status;
  set status(PaymentIntentStatusEnum? status) => _$this._status = status;

  String? _clientSecret;
  String? get clientSecret => _$this._clientSecret;
  set clientSecret(String? clientSecret) => _$this._clientSecret = clientSecret;

  String? _redirectUrl;
  String? get redirectUrl => _$this._redirectUrl;
  set redirectUrl(String? redirectUrl) => _$this._redirectUrl = redirectUrl;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  PaymentIntentBuilder() {
    PaymentIntent._defaults(this);
  }

  PaymentIntentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _purpose = $v.purpose;
      _appointmentId = $v.appointmentId;
      _amountDzd = $v.amountDzd;
      _provider = $v.provider;
      _status = $v.status;
      _clientSecret = $v.clientSecret;
      _redirectUrl = $v.redirectUrl;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentIntent other) {
    _$v = other as _$PaymentIntent;
  }

  @override
  void update(void Function(PaymentIntentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentIntent build() => _build();

  _$PaymentIntent _build() {
    final _$result =
        _$v ??
        _$PaymentIntent._(
          id: id,
          purpose: purpose,
          appointmentId: appointmentId,
          amountDzd: amountDzd,
          provider: provider,
          status: status,
          clientSecret: clientSecret,
          redirectUrl: redirectUrl,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
