// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_schedule_template_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicScheduleTemplateCreateSlotDurationMinutesEnum
_$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number10 =
    const ClinicScheduleTemplateCreateSlotDurationMinutesEnum._('number10');
const ClinicScheduleTemplateCreateSlotDurationMinutesEnum
_$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number15 =
    const ClinicScheduleTemplateCreateSlotDurationMinutesEnum._('number15');
const ClinicScheduleTemplateCreateSlotDurationMinutesEnum
_$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number20 =
    const ClinicScheduleTemplateCreateSlotDurationMinutesEnum._('number20');
const ClinicScheduleTemplateCreateSlotDurationMinutesEnum
_$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number30 =
    const ClinicScheduleTemplateCreateSlotDurationMinutesEnum._('number30');
const ClinicScheduleTemplateCreateSlotDurationMinutesEnum
_$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number45 =
    const ClinicScheduleTemplateCreateSlotDurationMinutesEnum._('number45');
const ClinicScheduleTemplateCreateSlotDurationMinutesEnum
_$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number60 =
    const ClinicScheduleTemplateCreateSlotDurationMinutesEnum._('number60');

ClinicScheduleTemplateCreateSlotDurationMinutesEnum
_$clinicScheduleTemplateCreateSlotDurationMinutesEnumValueOf(String name) {
  switch (name) {
    case 'number10':
      return _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number10;
    case 'number15':
      return _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number15;
    case 'number20':
      return _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number20;
    case 'number30':
      return _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number30;
    case 'number45':
      return _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number45;
    case 'number60':
      return _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number60;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicScheduleTemplateCreateSlotDurationMinutesEnum>
_$clinicScheduleTemplateCreateSlotDurationMinutesEnumValues =
    BuiltSet<ClinicScheduleTemplateCreateSlotDurationMinutesEnum>(
      const <ClinicScheduleTemplateCreateSlotDurationMinutesEnum>[
        _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number10,
        _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number15,
        _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number20,
        _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number30,
        _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number45,
        _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number60,
      ],
    );

const ClinicScheduleTemplateCreateModeEnum
_$clinicScheduleTemplateCreateModeEnum_inPerson =
    const ClinicScheduleTemplateCreateModeEnum._('inPerson');
const ClinicScheduleTemplateCreateModeEnum
_$clinicScheduleTemplateCreateModeEnum_telehealth =
    const ClinicScheduleTemplateCreateModeEnum._('telehealth');
const ClinicScheduleTemplateCreateModeEnum
_$clinicScheduleTemplateCreateModeEnum_both =
    const ClinicScheduleTemplateCreateModeEnum._('both');

ClinicScheduleTemplateCreateModeEnum
_$clinicScheduleTemplateCreateModeEnumValueOf(String name) {
  switch (name) {
    case 'inPerson':
      return _$clinicScheduleTemplateCreateModeEnum_inPerson;
    case 'telehealth':
      return _$clinicScheduleTemplateCreateModeEnum_telehealth;
    case 'both':
      return _$clinicScheduleTemplateCreateModeEnum_both;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicScheduleTemplateCreateModeEnum>
_$clinicScheduleTemplateCreateModeEnumValues =
    BuiltSet<ClinicScheduleTemplateCreateModeEnum>(
      const <ClinicScheduleTemplateCreateModeEnum>[
        _$clinicScheduleTemplateCreateModeEnum_inPerson,
        _$clinicScheduleTemplateCreateModeEnum_telehealth,
        _$clinicScheduleTemplateCreateModeEnum_both,
      ],
    );

Serializer<ClinicScheduleTemplateCreateSlotDurationMinutesEnum>
_$clinicScheduleTemplateCreateSlotDurationMinutesEnumSerializer =
    _$ClinicScheduleTemplateCreateSlotDurationMinutesEnumSerializer();
Serializer<ClinicScheduleTemplateCreateModeEnum>
_$clinicScheduleTemplateCreateModeEnumSerializer =
    _$ClinicScheduleTemplateCreateModeEnumSerializer();

class _$ClinicScheduleTemplateCreateSlotDurationMinutesEnumSerializer
    implements
        PrimitiveSerializer<
          ClinicScheduleTemplateCreateSlotDurationMinutesEnum
        > {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number10': 10,
    'number15': 15,
    'number20': 20,
    'number30': 30,
    'number45': 45,
    'number60': 60,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    10: 'number10',
    15: 'number15',
    20: 'number20',
    30: 'number30',
    45: 'number45',
    60: 'number60',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ClinicScheduleTemplateCreateSlotDurationMinutesEnum,
  ];
  @override
  final String wireName = 'ClinicScheduleTemplateCreateSlotDurationMinutesEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicScheduleTemplateCreateSlotDurationMinutesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicScheduleTemplateCreateSlotDurationMinutesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicScheduleTemplateCreateSlotDurationMinutesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicScheduleTemplateCreateModeEnumSerializer
    implements PrimitiveSerializer<ClinicScheduleTemplateCreateModeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'inPerson': 'in_person',
    'telehealth': 'telehealth',
    'both': 'both',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'in_person': 'inPerson',
    'telehealth': 'telehealth',
    'both': 'both',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ClinicScheduleTemplateCreateModeEnum,
  ];
  @override
  final String wireName = 'ClinicScheduleTemplateCreateModeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicScheduleTemplateCreateModeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicScheduleTemplateCreateModeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicScheduleTemplateCreateModeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicScheduleTemplateCreate extends ClinicScheduleTemplateCreate {
  @override
  final String? serviceId;
  @override
  final int weekday;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final ClinicScheduleTemplateCreateSlotDurationMinutesEnum slotDurationMinutes;
  @override
  final ClinicScheduleTemplateCreateModeEnum mode;
  @override
  final int? capacity;

  factory _$ClinicScheduleTemplateCreate([
    void Function(ClinicScheduleTemplateCreateBuilder)? updates,
  ]) => (ClinicScheduleTemplateCreateBuilder()..update(updates))._build();

  _$ClinicScheduleTemplateCreate._({
    this.serviceId,
    required this.weekday,
    required this.startTime,
    required this.endTime,
    required this.slotDurationMinutes,
    required this.mode,
    this.capacity,
  }) : super._();
  @override
  ClinicScheduleTemplateCreate rebuild(
    void Function(ClinicScheduleTemplateCreateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicScheduleTemplateCreateBuilder toBuilder() =>
      ClinicScheduleTemplateCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicScheduleTemplateCreate &&
        serviceId == other.serviceId &&
        weekday == other.weekday &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        slotDurationMinutes == other.slotDurationMinutes &&
        mode == other.mode &&
        capacity == other.capacity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, weekday.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, slotDurationMinutes.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, capacity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicScheduleTemplateCreate')
          ..add('serviceId', serviceId)
          ..add('weekday', weekday)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('slotDurationMinutes', slotDurationMinutes)
          ..add('mode', mode)
          ..add('capacity', capacity))
        .toString();
  }
}

class ClinicScheduleTemplateCreateBuilder
    implements
        Builder<
          ClinicScheduleTemplateCreate,
          ClinicScheduleTemplateCreateBuilder
        > {
  _$ClinicScheduleTemplateCreate? _$v;

  String? _serviceId;
  String? get serviceId => _$this._serviceId;
  set serviceId(String? serviceId) => _$this._serviceId = serviceId;

  int? _weekday;
  int? get weekday => _$this._weekday;
  set weekday(int? weekday) => _$this._weekday = weekday;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  ClinicScheduleTemplateCreateSlotDurationMinutesEnum? _slotDurationMinutes;
  ClinicScheduleTemplateCreateSlotDurationMinutesEnum?
  get slotDurationMinutes => _$this._slotDurationMinutes;
  set slotDurationMinutes(
    ClinicScheduleTemplateCreateSlotDurationMinutesEnum? slotDurationMinutes,
  ) => _$this._slotDurationMinutes = slotDurationMinutes;

  ClinicScheduleTemplateCreateModeEnum? _mode;
  ClinicScheduleTemplateCreateModeEnum? get mode => _$this._mode;
  set mode(ClinicScheduleTemplateCreateModeEnum? mode) => _$this._mode = mode;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  ClinicScheduleTemplateCreateBuilder() {
    ClinicScheduleTemplateCreate._defaults(this);
  }

  ClinicScheduleTemplateCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceId = $v.serviceId;
      _weekday = $v.weekday;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _slotDurationMinutes = $v.slotDurationMinutes;
      _mode = $v.mode;
      _capacity = $v.capacity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicScheduleTemplateCreate other) {
    _$v = other as _$ClinicScheduleTemplateCreate;
  }

  @override
  void update(void Function(ClinicScheduleTemplateCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicScheduleTemplateCreate build() => _build();

  _$ClinicScheduleTemplateCreate _build() {
    final _$result =
        _$v ??
        _$ClinicScheduleTemplateCreate._(
          serviceId: serviceId,
          weekday: BuiltValueNullFieldError.checkNotNull(
            weekday,
            r'ClinicScheduleTemplateCreate',
            'weekday',
          ),
          startTime: BuiltValueNullFieldError.checkNotNull(
            startTime,
            r'ClinicScheduleTemplateCreate',
            'startTime',
          ),
          endTime: BuiltValueNullFieldError.checkNotNull(
            endTime,
            r'ClinicScheduleTemplateCreate',
            'endTime',
          ),
          slotDurationMinutes: BuiltValueNullFieldError.checkNotNull(
            slotDurationMinutes,
            r'ClinicScheduleTemplateCreate',
            'slotDurationMinutes',
          ),
          mode: BuiltValueNullFieldError.checkNotNull(
            mode,
            r'ClinicScheduleTemplateCreate',
            'mode',
          ),
          capacity: capacity,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
