// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppointmentCreateModeEnum _$appointmentCreateModeEnum_inPerson =
    const AppointmentCreateModeEnum._('inPerson');
const AppointmentCreateModeEnum _$appointmentCreateModeEnum_telehealth =
    const AppointmentCreateModeEnum._('telehealth');

AppointmentCreateModeEnum _$appointmentCreateModeEnumValueOf(String name) {
  switch (name) {
    case 'inPerson':
      return _$appointmentCreateModeEnum_inPerson;
    case 'telehealth':
      return _$appointmentCreateModeEnum_telehealth;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AppointmentCreateModeEnum> _$appointmentCreateModeEnumValues =
    BuiltSet<AppointmentCreateModeEnum>(const <AppointmentCreateModeEnum>[
      _$appointmentCreateModeEnum_inPerson,
      _$appointmentCreateModeEnum_telehealth,
    ]);

Serializer<AppointmentCreateModeEnum> _$appointmentCreateModeEnumSerializer =
    _$AppointmentCreateModeEnumSerializer();

class _$AppointmentCreateModeEnumSerializer
    implements PrimitiveSerializer<AppointmentCreateModeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'inPerson': 'in_person',
    'telehealth': 'telehealth',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'in_person': 'inPerson',
    'telehealth': 'telehealth',
  };

  @override
  final Iterable<Type> types = const <Type>[AppointmentCreateModeEnum];
  @override
  final String wireName = 'AppointmentCreateModeEnum';

  @override
  Object serialize(
    Serializers serializers,
    AppointmentCreateModeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AppointmentCreateModeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AppointmentCreateModeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$AppointmentCreate extends AppointmentCreate {
  @override
  final String doctorId;
  @override
  final String? dependentId;
  @override
  final DateTime startAt;
  @override
  final AppointmentCreateModeEnum mode;
  @override
  final String? reason;
  @override
  final String? slotLockToken;

  factory _$AppointmentCreate([
    void Function(AppointmentCreateBuilder)? updates,
  ]) => (AppointmentCreateBuilder()..update(updates))._build();

  _$AppointmentCreate._({
    required this.doctorId,
    this.dependentId,
    required this.startAt,
    required this.mode,
    this.reason,
    this.slotLockToken,
  }) : super._();
  @override
  AppointmentCreate rebuild(void Function(AppointmentCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppointmentCreateBuilder toBuilder() =>
      AppointmentCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppointmentCreate &&
        doctorId == other.doctorId &&
        dependentId == other.dependentId &&
        startAt == other.startAt &&
        mode == other.mode &&
        reason == other.reason &&
        slotLockToken == other.slotLockToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, dependentId.hashCode);
    _$hash = $jc(_$hash, startAt.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, slotLockToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppointmentCreate')
          ..add('doctorId', doctorId)
          ..add('dependentId', dependentId)
          ..add('startAt', startAt)
          ..add('mode', mode)
          ..add('reason', reason)
          ..add('slotLockToken', slotLockToken))
        .toString();
  }
}

class AppointmentCreateBuilder
    implements Builder<AppointmentCreate, AppointmentCreateBuilder> {
  _$AppointmentCreate? _$v;

  String? _doctorId;
  String? get doctorId => _$this._doctorId;
  set doctorId(String? doctorId) => _$this._doctorId = doctorId;

  String? _dependentId;
  String? get dependentId => _$this._dependentId;
  set dependentId(String? dependentId) => _$this._dependentId = dependentId;

  DateTime? _startAt;
  DateTime? get startAt => _$this._startAt;
  set startAt(DateTime? startAt) => _$this._startAt = startAt;

  AppointmentCreateModeEnum? _mode;
  AppointmentCreateModeEnum? get mode => _$this._mode;
  set mode(AppointmentCreateModeEnum? mode) => _$this._mode = mode;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _slotLockToken;
  String? get slotLockToken => _$this._slotLockToken;
  set slotLockToken(String? slotLockToken) =>
      _$this._slotLockToken = slotLockToken;

  AppointmentCreateBuilder() {
    AppointmentCreate._defaults(this);
  }

  AppointmentCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctorId = $v.doctorId;
      _dependentId = $v.dependentId;
      _startAt = $v.startAt;
      _mode = $v.mode;
      _reason = $v.reason;
      _slotLockToken = $v.slotLockToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppointmentCreate other) {
    _$v = other as _$AppointmentCreate;
  }

  @override
  void update(void Function(AppointmentCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppointmentCreate build() => _build();

  _$AppointmentCreate _build() {
    final _$result =
        _$v ??
        _$AppointmentCreate._(
          doctorId: BuiltValueNullFieldError.checkNotNull(
            doctorId,
            r'AppointmentCreate',
            'doctorId',
          ),
          dependentId: dependentId,
          startAt: BuiltValueNullFieldError.checkNotNull(
            startAt,
            r'AppointmentCreate',
            'startAt',
          ),
          mode: BuiltValueNullFieldError.checkNotNull(
            mode,
            r'AppointmentCreate',
            'mode',
          ),
          reason: reason,
          slotLockToken: slotLockToken,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
