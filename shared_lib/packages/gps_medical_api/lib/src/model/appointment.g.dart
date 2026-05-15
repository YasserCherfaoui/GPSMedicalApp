// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppointmentModeEnum _$appointmentModeEnum_inPerson =
    const AppointmentModeEnum._('inPerson');
const AppointmentModeEnum _$appointmentModeEnum_telehealth =
    const AppointmentModeEnum._('telehealth');

AppointmentModeEnum _$appointmentModeEnumValueOf(String name) {
  switch (name) {
    case 'inPerson':
      return _$appointmentModeEnum_inPerson;
    case 'telehealth':
      return _$appointmentModeEnum_telehealth;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AppointmentModeEnum> _$appointmentModeEnumValues =
    BuiltSet<AppointmentModeEnum>(const <AppointmentModeEnum>[
      _$appointmentModeEnum_inPerson,
      _$appointmentModeEnum_telehealth,
    ]);

const AppointmentStatusEnum _$appointmentStatusEnum_pending =
    const AppointmentStatusEnum._('pending');
const AppointmentStatusEnum _$appointmentStatusEnum_confirmed =
    const AppointmentStatusEnum._('confirmed');
const AppointmentStatusEnum _$appointmentStatusEnum_cancelled =
    const AppointmentStatusEnum._('cancelled');
const AppointmentStatusEnum _$appointmentStatusEnum_completed =
    const AppointmentStatusEnum._('completed');
const AppointmentStatusEnum _$appointmentStatusEnum_noShow =
    const AppointmentStatusEnum._('noShow');

AppointmentStatusEnum _$appointmentStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$appointmentStatusEnum_pending;
    case 'confirmed':
      return _$appointmentStatusEnum_confirmed;
    case 'cancelled':
      return _$appointmentStatusEnum_cancelled;
    case 'completed':
      return _$appointmentStatusEnum_completed;
    case 'noShow':
      return _$appointmentStatusEnum_noShow;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AppointmentStatusEnum> _$appointmentStatusEnumValues =
    BuiltSet<AppointmentStatusEnum>(const <AppointmentStatusEnum>[
      _$appointmentStatusEnum_pending,
      _$appointmentStatusEnum_confirmed,
      _$appointmentStatusEnum_cancelled,
      _$appointmentStatusEnum_completed,
      _$appointmentStatusEnum_noShow,
    ]);

const AppointmentPaymentStatusEnum _$appointmentPaymentStatusEnum_unpaid =
    const AppointmentPaymentStatusEnum._('unpaid');
const AppointmentPaymentStatusEnum _$appointmentPaymentStatusEnum_depositPaid =
    const AppointmentPaymentStatusEnum._('depositPaid');
const AppointmentPaymentStatusEnum _$appointmentPaymentStatusEnum_paid =
    const AppointmentPaymentStatusEnum._('paid');
const AppointmentPaymentStatusEnum _$appointmentPaymentStatusEnum_refunded =
    const AppointmentPaymentStatusEnum._('refunded');

AppointmentPaymentStatusEnum _$appointmentPaymentStatusEnumValueOf(
  String name,
) {
  switch (name) {
    case 'unpaid':
      return _$appointmentPaymentStatusEnum_unpaid;
    case 'depositPaid':
      return _$appointmentPaymentStatusEnum_depositPaid;
    case 'paid':
      return _$appointmentPaymentStatusEnum_paid;
    case 'refunded':
      return _$appointmentPaymentStatusEnum_refunded;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AppointmentPaymentStatusEnum>
_$appointmentPaymentStatusEnumValues =
    BuiltSet<AppointmentPaymentStatusEnum>(const <AppointmentPaymentStatusEnum>[
      _$appointmentPaymentStatusEnum_unpaid,
      _$appointmentPaymentStatusEnum_depositPaid,
      _$appointmentPaymentStatusEnum_paid,
      _$appointmentPaymentStatusEnum_refunded,
    ]);

Serializer<AppointmentModeEnum> _$appointmentModeEnumSerializer =
    _$AppointmentModeEnumSerializer();
Serializer<AppointmentStatusEnum> _$appointmentStatusEnumSerializer =
    _$AppointmentStatusEnumSerializer();
Serializer<AppointmentPaymentStatusEnum>
_$appointmentPaymentStatusEnumSerializer =
    _$AppointmentPaymentStatusEnumSerializer();

class _$AppointmentModeEnumSerializer
    implements PrimitiveSerializer<AppointmentModeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'inPerson': 'in_person',
    'telehealth': 'telehealth',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'in_person': 'inPerson',
    'telehealth': 'telehealth',
  };

  @override
  final Iterable<Type> types = const <Type>[AppointmentModeEnum];
  @override
  final String wireName = 'AppointmentModeEnum';

  @override
  Object serialize(
    Serializers serializers,
    AppointmentModeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AppointmentModeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AppointmentModeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$AppointmentStatusEnumSerializer
    implements PrimitiveSerializer<AppointmentStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'confirmed': 'confirmed',
    'cancelled': 'cancelled',
    'completed': 'completed',
    'noShow': 'no_show',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'confirmed': 'confirmed',
    'cancelled': 'cancelled',
    'completed': 'completed',
    'no_show': 'noShow',
  };

  @override
  final Iterable<Type> types = const <Type>[AppointmentStatusEnum];
  @override
  final String wireName = 'AppointmentStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    AppointmentStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AppointmentStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AppointmentStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$AppointmentPaymentStatusEnumSerializer
    implements PrimitiveSerializer<AppointmentPaymentStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'unpaid': 'unpaid',
    'depositPaid': 'deposit_paid',
    'paid': 'paid',
    'refunded': 'refunded',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'unpaid': 'unpaid',
    'deposit_paid': 'depositPaid',
    'paid': 'paid',
    'refunded': 'refunded',
  };

  @override
  final Iterable<Type> types = const <Type>[AppointmentPaymentStatusEnum];
  @override
  final String wireName = 'AppointmentPaymentStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    AppointmentPaymentStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AppointmentPaymentStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AppointmentPaymentStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$Appointment extends Appointment {
  @override
  final String? id;
  @override
  final String? patientId;
  @override
  final String? dependentId;
  @override
  final String? doctorId;
  @override
  final DateTime? startAt;
  @override
  final DateTime? endAt;
  @override
  final AppointmentModeEnum? mode;
  @override
  final AppointmentStatusEnum? status;
  @override
  final String? reason;
  @override
  final int? feeDzd;
  @override
  final AppointmentPaymentStatusEnum? paymentStatus;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$Appointment([void Function(AppointmentBuilder)? updates]) =>
      (AppointmentBuilder()..update(updates))._build();

  _$Appointment._({
    this.id,
    this.patientId,
    this.dependentId,
    this.doctorId,
    this.startAt,
    this.endAt,
    this.mode,
    this.status,
    this.reason,
    this.feeDzd,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
  }) : super._();
  @override
  Appointment rebuild(void Function(AppointmentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppointmentBuilder toBuilder() => AppointmentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Appointment &&
        id == other.id &&
        patientId == other.patientId &&
        dependentId == other.dependentId &&
        doctorId == other.doctorId &&
        startAt == other.startAt &&
        endAt == other.endAt &&
        mode == other.mode &&
        status == other.status &&
        reason == other.reason &&
        feeDzd == other.feeDzd &&
        paymentStatus == other.paymentStatus &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, patientId.hashCode);
    _$hash = $jc(_$hash, dependentId.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, startAt.hashCode);
    _$hash = $jc(_$hash, endAt.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, feeDzd.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Appointment')
          ..add('id', id)
          ..add('patientId', patientId)
          ..add('dependentId', dependentId)
          ..add('doctorId', doctorId)
          ..add('startAt', startAt)
          ..add('endAt', endAt)
          ..add('mode', mode)
          ..add('status', status)
          ..add('reason', reason)
          ..add('feeDzd', feeDzd)
          ..add('paymentStatus', paymentStatus)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AppointmentBuilder implements Builder<Appointment, AppointmentBuilder> {
  _$Appointment? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _patientId;
  String? get patientId => _$this._patientId;
  set patientId(String? patientId) => _$this._patientId = patientId;

  String? _dependentId;
  String? get dependentId => _$this._dependentId;
  set dependentId(String? dependentId) => _$this._dependentId = dependentId;

  String? _doctorId;
  String? get doctorId => _$this._doctorId;
  set doctorId(String? doctorId) => _$this._doctorId = doctorId;

  DateTime? _startAt;
  DateTime? get startAt => _$this._startAt;
  set startAt(DateTime? startAt) => _$this._startAt = startAt;

  DateTime? _endAt;
  DateTime? get endAt => _$this._endAt;
  set endAt(DateTime? endAt) => _$this._endAt = endAt;

  AppointmentModeEnum? _mode;
  AppointmentModeEnum? get mode => _$this._mode;
  set mode(AppointmentModeEnum? mode) => _$this._mode = mode;

  AppointmentStatusEnum? _status;
  AppointmentStatusEnum? get status => _$this._status;
  set status(AppointmentStatusEnum? status) => _$this._status = status;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  int? _feeDzd;
  int? get feeDzd => _$this._feeDzd;
  set feeDzd(int? feeDzd) => _$this._feeDzd = feeDzd;

  AppointmentPaymentStatusEnum? _paymentStatus;
  AppointmentPaymentStatusEnum? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(AppointmentPaymentStatusEnum? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  AppointmentBuilder() {
    Appointment._defaults(this);
  }

  AppointmentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _patientId = $v.patientId;
      _dependentId = $v.dependentId;
      _doctorId = $v.doctorId;
      _startAt = $v.startAt;
      _endAt = $v.endAt;
      _mode = $v.mode;
      _status = $v.status;
      _reason = $v.reason;
      _feeDzd = $v.feeDzd;
      _paymentStatus = $v.paymentStatus;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Appointment other) {
    _$v = other as _$Appointment;
  }

  @override
  void update(void Function(AppointmentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Appointment build() => _build();

  _$Appointment _build() {
    final _$result =
        _$v ??
        _$Appointment._(
          id: id,
          patientId: patientId,
          dependentId: dependentId,
          doctorId: doctorId,
          startAt: startAt,
          endAt: endAt,
          mode: mode,
          status: status,
          reason: reason,
          feeDzd: feeDzd,
          paymentStatus: paymentStatus,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
