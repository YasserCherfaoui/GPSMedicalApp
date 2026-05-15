// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RefundRequestReasonEnum _$refundRequestReasonEnum_appointmentCancelled =
    const RefundRequestReasonEnum._('appointmentCancelled');
const RefundRequestReasonEnum _$refundRequestReasonEnum_doctorNoShow =
    const RefundRequestReasonEnum._('doctorNoShow');
const RefundRequestReasonEnum _$refundRequestReasonEnum_duplicate =
    const RefundRequestReasonEnum._('duplicate');
const RefundRequestReasonEnum _$refundRequestReasonEnum_other =
    const RefundRequestReasonEnum._('other');

RefundRequestReasonEnum _$refundRequestReasonEnumValueOf(String name) {
  switch (name) {
    case 'appointmentCancelled':
      return _$refundRequestReasonEnum_appointmentCancelled;
    case 'doctorNoShow':
      return _$refundRequestReasonEnum_doctorNoShow;
    case 'duplicate':
      return _$refundRequestReasonEnum_duplicate;
    case 'other':
      return _$refundRequestReasonEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<RefundRequestReasonEnum> _$refundRequestReasonEnumValues =
    BuiltSet<RefundRequestReasonEnum>(const <RefundRequestReasonEnum>[
      _$refundRequestReasonEnum_appointmentCancelled,
      _$refundRequestReasonEnum_doctorNoShow,
      _$refundRequestReasonEnum_duplicate,
      _$refundRequestReasonEnum_other,
    ]);

Serializer<RefundRequestReasonEnum> _$refundRequestReasonEnumSerializer =
    _$RefundRequestReasonEnumSerializer();

class _$RefundRequestReasonEnumSerializer
    implements PrimitiveSerializer<RefundRequestReasonEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'appointmentCancelled': 'appointment_cancelled',
    'doctorNoShow': 'doctor_no_show',
    'duplicate': 'duplicate',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'appointment_cancelled': 'appointmentCancelled',
    'doctor_no_show': 'doctorNoShow',
    'duplicate': 'duplicate',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[RefundRequestReasonEnum];
  @override
  final String wireName = 'RefundRequestReasonEnum';

  @override
  Object serialize(
    Serializers serializers,
    RefundRequestReasonEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  RefundRequestReasonEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => RefundRequestReasonEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$RefundRequest extends RefundRequest {
  @override
  final String paymentIntentId;
  @override
  final int? amountDzd;
  @override
  final RefundRequestReasonEnum reason;
  @override
  final String? comment;

  factory _$RefundRequest([void Function(RefundRequestBuilder)? updates]) =>
      (RefundRequestBuilder()..update(updates))._build();

  _$RefundRequest._({
    required this.paymentIntentId,
    this.amountDzd,
    required this.reason,
    this.comment,
  }) : super._();
  @override
  RefundRequest rebuild(void Function(RefundRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefundRequestBuilder toBuilder() => RefundRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefundRequest &&
        paymentIntentId == other.paymentIntentId &&
        amountDzd == other.amountDzd &&
        reason == other.reason &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentIntentId.hashCode);
    _$hash = $jc(_$hash, amountDzd.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RefundRequest')
          ..add('paymentIntentId', paymentIntentId)
          ..add('amountDzd', amountDzd)
          ..add('reason', reason)
          ..add('comment', comment))
        .toString();
  }
}

class RefundRequestBuilder
    implements Builder<RefundRequest, RefundRequestBuilder> {
  _$RefundRequest? _$v;

  String? _paymentIntentId;
  String? get paymentIntentId => _$this._paymentIntentId;
  set paymentIntentId(String? paymentIntentId) =>
      _$this._paymentIntentId = paymentIntentId;

  int? _amountDzd;
  int? get amountDzd => _$this._amountDzd;
  set amountDzd(int? amountDzd) => _$this._amountDzd = amountDzd;

  RefundRequestReasonEnum? _reason;
  RefundRequestReasonEnum? get reason => _$this._reason;
  set reason(RefundRequestReasonEnum? reason) => _$this._reason = reason;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  RefundRequestBuilder() {
    RefundRequest._defaults(this);
  }

  RefundRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentIntentId = $v.paymentIntentId;
      _amountDzd = $v.amountDzd;
      _reason = $v.reason;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefundRequest other) {
    _$v = other as _$RefundRequest;
  }

  @override
  void update(void Function(RefundRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefundRequest build() => _build();

  _$RefundRequest _build() {
    final _$result =
        _$v ??
        _$RefundRequest._(
          paymentIntentId: BuiltValueNullFieldError.checkNotNull(
            paymentIntentId,
            r'RefundRequest',
            'paymentIntentId',
          ),
          amountDzd: amountDzd,
          reason: BuiltValueNullFieldError.checkNotNull(
            reason,
            r'RefundRequest',
            'reason',
          ),
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
