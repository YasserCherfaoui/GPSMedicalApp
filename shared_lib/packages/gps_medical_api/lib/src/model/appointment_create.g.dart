// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppointmentCreateOriginEnum _$appointmentCreateOriginEnum_doctorDirect =
    const AppointmentCreateOriginEnum._('doctorDirect');
const AppointmentCreateOriginEnum _$appointmentCreateOriginEnum_clinicService =
    const AppointmentCreateOriginEnum._('clinicService');

AppointmentCreateOriginEnum _$appointmentCreateOriginEnumValueOf(String name) {
  switch (name) {
    case 'doctorDirect':
      return _$appointmentCreateOriginEnum_doctorDirect;
    case 'clinicService':
      return _$appointmentCreateOriginEnum_clinicService;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AppointmentCreateOriginEnum>
_$appointmentCreateOriginEnumValues =
    BuiltSet<AppointmentCreateOriginEnum>(const <AppointmentCreateOriginEnum>[
      _$appointmentCreateOriginEnum_doctorDirect,
      _$appointmentCreateOriginEnum_clinicService,
    ]);

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

Serializer<AppointmentCreateOriginEnum>
_$appointmentCreateOriginEnumSerializer =
    _$AppointmentCreateOriginEnumSerializer();
Serializer<AppointmentCreateModeEnum> _$appointmentCreateModeEnumSerializer =
    _$AppointmentCreateModeEnumSerializer();

class _$AppointmentCreateOriginEnumSerializer
    implements PrimitiveSerializer<AppointmentCreateOriginEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'doctorDirect': 'doctor_direct',
    'clinicService': 'clinic_service',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'doctor_direct': 'doctorDirect',
    'clinic_service': 'clinicService',
  };

  @override
  final Iterable<Type> types = const <Type>[AppointmentCreateOriginEnum];
  @override
  final String wireName = 'AppointmentCreateOriginEnum';

  @override
  Object serialize(
    Serializers serializers,
    AppointmentCreateOriginEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AppointmentCreateOriginEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AppointmentCreateOriginEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

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
  final AppointmentCreateOriginEnum? origin;
  @override
  final String? doctorId;
  @override
  final String? clinicId;
  @override
  final String? serviceId;
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
    this.origin,
    this.doctorId,
    this.clinicId,
    this.serviceId,
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
        origin == other.origin &&
        doctorId == other.doctorId &&
        clinicId == other.clinicId &&
        serviceId == other.serviceId &&
        dependentId == other.dependentId &&
        startAt == other.startAt &&
        mode == other.mode &&
        reason == other.reason &&
        slotLockToken == other.slotLockToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, origin.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, clinicId.hashCode);
    _$hash = $jc(_$hash, serviceId.hashCode);
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
          ..add('origin', origin)
          ..add('doctorId', doctorId)
          ..add('clinicId', clinicId)
          ..add('serviceId', serviceId)
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

  AppointmentCreateOriginEnum? _origin;
  AppointmentCreateOriginEnum? get origin => _$this._origin;
  set origin(AppointmentCreateOriginEnum? origin) => _$this._origin = origin;

  String? _doctorId;
  String? get doctorId => _$this._doctorId;
  set doctorId(String? doctorId) => _$this._doctorId = doctorId;

  String? _clinicId;
  String? get clinicId => _$this._clinicId;
  set clinicId(String? clinicId) => _$this._clinicId = clinicId;

  String? _serviceId;
  String? get serviceId => _$this._serviceId;
  set serviceId(String? serviceId) => _$this._serviceId = serviceId;

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
      _origin = $v.origin;
      _doctorId = $v.doctorId;
      _clinicId = $v.clinicId;
      _serviceId = $v.serviceId;
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
          origin: origin,
          doctorId: doctorId,
          clinicId: clinicId,
          serviceId: serviceId,
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
