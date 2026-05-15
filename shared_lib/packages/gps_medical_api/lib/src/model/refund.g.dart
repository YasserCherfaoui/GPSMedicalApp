// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RefundStatusEnum _$refundStatusEnum_pending = const RefundStatusEnum._(
  'pending',
);
const RefundStatusEnum _$refundStatusEnum_succeeded = const RefundStatusEnum._(
  'succeeded',
);
const RefundStatusEnum _$refundStatusEnum_failed = const RefundStatusEnum._(
  'failed',
);

RefundStatusEnum _$refundStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$refundStatusEnum_pending;
    case 'succeeded':
      return _$refundStatusEnum_succeeded;
    case 'failed':
      return _$refundStatusEnum_failed;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<RefundStatusEnum> _$refundStatusEnumValues =
    BuiltSet<RefundStatusEnum>(const <RefundStatusEnum>[
      _$refundStatusEnum_pending,
      _$refundStatusEnum_succeeded,
      _$refundStatusEnum_failed,
    ]);

Serializer<RefundStatusEnum> _$refundStatusEnumSerializer =
    _$RefundStatusEnumSerializer();

class _$RefundStatusEnumSerializer
    implements PrimitiveSerializer<RefundStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'succeeded': 'succeeded',
    'failed': 'failed',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'succeeded': 'succeeded',
    'failed': 'failed',
  };

  @override
  final Iterable<Type> types = const <Type>[RefundStatusEnum];
  @override
  final String wireName = 'RefundStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    RefundStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  RefundStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => RefundStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$Refund extends Refund {
  @override
  final String? id;
  @override
  final String? paymentIntentId;
  @override
  final int? amountDzd;
  @override
  final RefundStatusEnum? status;
  @override
  final DateTime? createdAt;

  factory _$Refund([void Function(RefundBuilder)? updates]) =>
      (RefundBuilder()..update(updates))._build();

  _$Refund._({
    this.id,
    this.paymentIntentId,
    this.amountDzd,
    this.status,
    this.createdAt,
  }) : super._();
  @override
  Refund rebuild(void Function(RefundBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefundBuilder toBuilder() => RefundBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Refund &&
        id == other.id &&
        paymentIntentId == other.paymentIntentId &&
        amountDzd == other.amountDzd &&
        status == other.status &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, paymentIntentId.hashCode);
    _$hash = $jc(_$hash, amountDzd.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Refund')
          ..add('id', id)
          ..add('paymentIntentId', paymentIntentId)
          ..add('amountDzd', amountDzd)
          ..add('status', status)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class RefundBuilder implements Builder<Refund, RefundBuilder> {
  _$Refund? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _paymentIntentId;
  String? get paymentIntentId => _$this._paymentIntentId;
  set paymentIntentId(String? paymentIntentId) =>
      _$this._paymentIntentId = paymentIntentId;

  int? _amountDzd;
  int? get amountDzd => _$this._amountDzd;
  set amountDzd(int? amountDzd) => _$this._amountDzd = amountDzd;

  RefundStatusEnum? _status;
  RefundStatusEnum? get status => _$this._status;
  set status(RefundStatusEnum? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  RefundBuilder() {
    Refund._defaults(this);
  }

  RefundBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _paymentIntentId = $v.paymentIntentId;
      _amountDzd = $v.amountDzd;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Refund other) {
    _$v = other as _$Refund;
  }

  @override
  void update(void Function(RefundBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Refund build() => _build();

  _$Refund _build() {
    final _$result =
        _$v ??
        _$Refund._(
          id: id,
          paymentIntentId: paymentIntentId,
          amountDzd: amountDzd,
          status: status,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
