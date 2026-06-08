// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PaymentIntentCreatePurposeEnum
_$paymentIntentCreatePurposeEnum_appointmentDeposit =
    const PaymentIntentCreatePurposeEnum._('appointmentDeposit');
const PaymentIntentCreatePurposeEnum
_$paymentIntentCreatePurposeEnum_teleconsultation =
    const PaymentIntentCreatePurposeEnum._('teleconsultation');
const PaymentIntentCreatePurposeEnum
_$paymentIntentCreatePurposeEnum_fullConsultation =
    const PaymentIntentCreatePurposeEnum._('fullConsultation');

PaymentIntentCreatePurposeEnum _$paymentIntentCreatePurposeEnumValueOf(
  String name,
) {
  switch (name) {
    case 'appointmentDeposit':
      return _$paymentIntentCreatePurposeEnum_appointmentDeposit;
    case 'teleconsultation':
      return _$paymentIntentCreatePurposeEnum_teleconsultation;
    case 'fullConsultation':
      return _$paymentIntentCreatePurposeEnum_fullConsultation;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PaymentIntentCreatePurposeEnum>
_$paymentIntentCreatePurposeEnumValues =
    BuiltSet<PaymentIntentCreatePurposeEnum>(
      const <PaymentIntentCreatePurposeEnum>[
        _$paymentIntentCreatePurposeEnum_appointmentDeposit,
        _$paymentIntentCreatePurposeEnum_teleconsultation,
        _$paymentIntentCreatePurposeEnum_fullConsultation,
      ],
    );

const PaymentIntentCreateProviderEnum _$paymentIntentCreateProviderEnum_satim =
    const PaymentIntentCreateProviderEnum._('satim');
const PaymentIntentCreateProviderEnum
_$paymentIntentCreateProviderEnum_edahabia =
    const PaymentIntentCreateProviderEnum._('edahabia');
const PaymentIntentCreateProviderEnum _$paymentIntentCreateProviderEnum_cib =
    const PaymentIntentCreateProviderEnum._('cib');
const PaymentIntentCreateProviderEnum
_$paymentIntentCreateProviderEnum_stripeTest =
    const PaymentIntentCreateProviderEnum._('stripeTest');

PaymentIntentCreateProviderEnum _$paymentIntentCreateProviderEnumValueOf(
  String name,
) {
  switch (name) {
    case 'satim':
      return _$paymentIntentCreateProviderEnum_satim;
    case 'edahabia':
      return _$paymentIntentCreateProviderEnum_edahabia;
    case 'cib':
      return _$paymentIntentCreateProviderEnum_cib;
    case 'stripeTest':
      return _$paymentIntentCreateProviderEnum_stripeTest;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PaymentIntentCreateProviderEnum>
_$paymentIntentCreateProviderEnumValues =
    BuiltSet<PaymentIntentCreateProviderEnum>(
      const <PaymentIntentCreateProviderEnum>[
        _$paymentIntentCreateProviderEnum_satim,
        _$paymentIntentCreateProviderEnum_edahabia,
        _$paymentIntentCreateProviderEnum_cib,
        _$paymentIntentCreateProviderEnum_stripeTest,
      ],
    );

Serializer<PaymentIntentCreatePurposeEnum>
_$paymentIntentCreatePurposeEnumSerializer =
    _$PaymentIntentCreatePurposeEnumSerializer();
Serializer<PaymentIntentCreateProviderEnum>
_$paymentIntentCreateProviderEnumSerializer =
    _$PaymentIntentCreateProviderEnumSerializer();

class _$PaymentIntentCreatePurposeEnumSerializer
    implements PrimitiveSerializer<PaymentIntentCreatePurposeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'appointmentDeposit': 'appointment_deposit',
    'teleconsultation': 'teleconsultation',
    'fullConsultation': 'full_consultation',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'appointment_deposit': 'appointmentDeposit',
    'teleconsultation': 'teleconsultation',
    'full_consultation': 'fullConsultation',
  };

  @override
  final Iterable<Type> types = const <Type>[PaymentIntentCreatePurposeEnum];
  @override
  final String wireName = 'PaymentIntentCreatePurposeEnum';

  @override
  Object serialize(
    Serializers serializers,
    PaymentIntentCreatePurposeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PaymentIntentCreatePurposeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PaymentIntentCreatePurposeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PaymentIntentCreateProviderEnumSerializer
    implements PrimitiveSerializer<PaymentIntentCreateProviderEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'satim': 'satim',
    'edahabia': 'edahabia',
    'cib': 'cib',
    'stripeTest': 'stripe_test',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'satim': 'satim',
    'edahabia': 'edahabia',
    'cib': 'cib',
    'stripe_test': 'stripeTest',
  };

  @override
  final Iterable<Type> types = const <Type>[PaymentIntentCreateProviderEnum];
  @override
  final String wireName = 'PaymentIntentCreateProviderEnum';

  @override
  Object serialize(
    Serializers serializers,
    PaymentIntentCreateProviderEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PaymentIntentCreateProviderEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PaymentIntentCreateProviderEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PaymentIntentCreate extends PaymentIntentCreate {
  @override
  final PaymentIntentCreatePurposeEnum purpose;
  @override
  final String? appointmentId;
  @override
  final int amountDzd;
  @override
  final PaymentIntentCreateProviderEnum provider;
  @override
  final String? returnUrl;

  factory _$PaymentIntentCreate([
    void Function(PaymentIntentCreateBuilder)? updates,
  ]) => (PaymentIntentCreateBuilder()..update(updates))._build();

  _$PaymentIntentCreate._({
    required this.purpose,
    this.appointmentId,
    required this.amountDzd,
    required this.provider,
    this.returnUrl,
  }) : super._();
  @override
  PaymentIntentCreate rebuild(
    void Function(PaymentIntentCreateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaymentIntentCreateBuilder toBuilder() =>
      PaymentIntentCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentIntentCreate &&
        purpose == other.purpose &&
        appointmentId == other.appointmentId &&
        amountDzd == other.amountDzd &&
        provider == other.provider &&
        returnUrl == other.returnUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, purpose.hashCode);
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, amountDzd.hashCode);
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, returnUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentIntentCreate')
          ..add('purpose', purpose)
          ..add('appointmentId', appointmentId)
          ..add('amountDzd', amountDzd)
          ..add('provider', provider)
          ..add('returnUrl', returnUrl))
        .toString();
  }
}

class PaymentIntentCreateBuilder
    implements Builder<PaymentIntentCreate, PaymentIntentCreateBuilder> {
  _$PaymentIntentCreate? _$v;

  PaymentIntentCreatePurposeEnum? _purpose;
  PaymentIntentCreatePurposeEnum? get purpose => _$this._purpose;
  set purpose(PaymentIntentCreatePurposeEnum? purpose) =>
      _$this._purpose = purpose;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  int? _amountDzd;
  int? get amountDzd => _$this._amountDzd;
  set amountDzd(int? amountDzd) => _$this._amountDzd = amountDzd;

  PaymentIntentCreateProviderEnum? _provider;
  PaymentIntentCreateProviderEnum? get provider => _$this._provider;
  set provider(PaymentIntentCreateProviderEnum? provider) =>
      _$this._provider = provider;

  String? _returnUrl;
  String? get returnUrl => _$this._returnUrl;
  set returnUrl(String? returnUrl) => _$this._returnUrl = returnUrl;

  PaymentIntentCreateBuilder() {
    PaymentIntentCreate._defaults(this);
  }

  PaymentIntentCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _purpose = $v.purpose;
      _appointmentId = $v.appointmentId;
      _amountDzd = $v.amountDzd;
      _provider = $v.provider;
      _returnUrl = $v.returnUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentIntentCreate other) {
    _$v = other as _$PaymentIntentCreate;
  }

  @override
  void update(void Function(PaymentIntentCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentIntentCreate build() => _build();

  _$PaymentIntentCreate _build() {
    final _$result =
        _$v ??
        _$PaymentIntentCreate._(
          purpose: BuiltValueNullFieldError.checkNotNull(
            purpose,
            r'PaymentIntentCreate',
            'purpose',
          ),
          appointmentId: appointmentId,
          amountDzd: BuiltValueNullFieldError.checkNotNull(
            amountDzd,
            r'PaymentIntentCreate',
            'amountDzd',
          ),
          provider: BuiltValueNullFieldError.checkNotNull(
            provider,
            r'PaymentIntentCreate',
            'provider',
          ),
          returnUrl: returnUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
