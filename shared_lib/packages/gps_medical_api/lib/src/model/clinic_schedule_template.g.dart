// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_schedule_template.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicScheduleTemplateSlotDurationMinutesEnum
_$clinicScheduleTemplateSlotDurationMinutesEnum_number10 =
    const ClinicScheduleTemplateSlotDurationMinutesEnum._('number10');
const ClinicScheduleTemplateSlotDurationMinutesEnum
_$clinicScheduleTemplateSlotDurationMinutesEnum_number15 =
    const ClinicScheduleTemplateSlotDurationMinutesEnum._('number15');
const ClinicScheduleTemplateSlotDurationMinutesEnum
_$clinicScheduleTemplateSlotDurationMinutesEnum_number20 =
    const ClinicScheduleTemplateSlotDurationMinutesEnum._('number20');
const ClinicScheduleTemplateSlotDurationMinutesEnum
_$clinicScheduleTemplateSlotDurationMinutesEnum_number30 =
    const ClinicScheduleTemplateSlotDurationMinutesEnum._('number30');
const ClinicScheduleTemplateSlotDurationMinutesEnum
_$clinicScheduleTemplateSlotDurationMinutesEnum_number45 =
    const ClinicScheduleTemplateSlotDurationMinutesEnum._('number45');
const ClinicScheduleTemplateSlotDurationMinutesEnum
_$clinicScheduleTemplateSlotDurationMinutesEnum_number60 =
    const ClinicScheduleTemplateSlotDurationMinutesEnum._('number60');

ClinicScheduleTemplateSlotDurationMinutesEnum
_$clinicScheduleTemplateSlotDurationMinutesEnumValueOf(String name) {
  switch (name) {
    case 'number10':
      return _$clinicScheduleTemplateSlotDurationMinutesEnum_number10;
    case 'number15':
      return _$clinicScheduleTemplateSlotDurationMinutesEnum_number15;
    case 'number20':
      return _$clinicScheduleTemplateSlotDurationMinutesEnum_number20;
    case 'number30':
      return _$clinicScheduleTemplateSlotDurationMinutesEnum_number30;
    case 'number45':
      return _$clinicScheduleTemplateSlotDurationMinutesEnum_number45;
    case 'number60':
      return _$clinicScheduleTemplateSlotDurationMinutesEnum_number60;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicScheduleTemplateSlotDurationMinutesEnum>
_$clinicScheduleTemplateSlotDurationMinutesEnumValues =
    BuiltSet<ClinicScheduleTemplateSlotDurationMinutesEnum>(
      const <ClinicScheduleTemplateSlotDurationMinutesEnum>[
        _$clinicScheduleTemplateSlotDurationMinutesEnum_number10,
        _$clinicScheduleTemplateSlotDurationMinutesEnum_number15,
        _$clinicScheduleTemplateSlotDurationMinutesEnum_number20,
        _$clinicScheduleTemplateSlotDurationMinutesEnum_number30,
        _$clinicScheduleTemplateSlotDurationMinutesEnum_number45,
        _$clinicScheduleTemplateSlotDurationMinutesEnum_number60,
      ],
    );

const ClinicScheduleTemplateModeEnum _$clinicScheduleTemplateModeEnum_inPerson =
    const ClinicScheduleTemplateModeEnum._('inPerson');
const ClinicScheduleTemplateModeEnum
_$clinicScheduleTemplateModeEnum_telehealth =
    const ClinicScheduleTemplateModeEnum._('telehealth');
const ClinicScheduleTemplateModeEnum _$clinicScheduleTemplateModeEnum_both =
    const ClinicScheduleTemplateModeEnum._('both');

ClinicScheduleTemplateModeEnum _$clinicScheduleTemplateModeEnumValueOf(
  String name,
) {
  switch (name) {
    case 'inPerson':
      return _$clinicScheduleTemplateModeEnum_inPerson;
    case 'telehealth':
      return _$clinicScheduleTemplateModeEnum_telehealth;
    case 'both':
      return _$clinicScheduleTemplateModeEnum_both;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicScheduleTemplateModeEnum>
_$clinicScheduleTemplateModeEnumValues =
    BuiltSet<ClinicScheduleTemplateModeEnum>(
      const <ClinicScheduleTemplateModeEnum>[
        _$clinicScheduleTemplateModeEnum_inPerson,
        _$clinicScheduleTemplateModeEnum_telehealth,
        _$clinicScheduleTemplateModeEnum_both,
      ],
    );

Serializer<ClinicScheduleTemplateSlotDurationMinutesEnum>
_$clinicScheduleTemplateSlotDurationMinutesEnumSerializer =
    _$ClinicScheduleTemplateSlotDurationMinutesEnumSerializer();
Serializer<ClinicScheduleTemplateModeEnum>
_$clinicScheduleTemplateModeEnumSerializer =
    _$ClinicScheduleTemplateModeEnumSerializer();

class _$ClinicScheduleTemplateSlotDurationMinutesEnumSerializer
    implements
        PrimitiveSerializer<ClinicScheduleTemplateSlotDurationMinutesEnum> {
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
    ClinicScheduleTemplateSlotDurationMinutesEnum,
  ];
  @override
  final String wireName = 'ClinicScheduleTemplateSlotDurationMinutesEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicScheduleTemplateSlotDurationMinutesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicScheduleTemplateSlotDurationMinutesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicScheduleTemplateSlotDurationMinutesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicScheduleTemplateModeEnumSerializer
    implements PrimitiveSerializer<ClinicScheduleTemplateModeEnum> {
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
  final Iterable<Type> types = const <Type>[ClinicScheduleTemplateModeEnum];
  @override
  final String wireName = 'ClinicScheduleTemplateModeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicScheduleTemplateModeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicScheduleTemplateModeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicScheduleTemplateModeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicScheduleTemplate extends ClinicScheduleTemplate {
  @override
  final String? id;
  @override
  final String? serviceId;
  @override
  final int? weekday;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final ClinicScheduleTemplateSlotDurationMinutesEnum? slotDurationMinutes;
  @override
  final ClinicScheduleTemplateModeEnum? mode;
  @override
  final int? capacity;
  @override
  final bool? active;

  factory _$ClinicScheduleTemplate([
    void Function(ClinicScheduleTemplateBuilder)? updates,
  ]) => (ClinicScheduleTemplateBuilder()..update(updates))._build();

  _$ClinicScheduleTemplate._({
    this.id,
    this.serviceId,
    this.weekday,
    this.startTime,
    this.endTime,
    this.slotDurationMinutes,
    this.mode,
    this.capacity,
    this.active,
  }) : super._();
  @override
  ClinicScheduleTemplate rebuild(
    void Function(ClinicScheduleTemplateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicScheduleTemplateBuilder toBuilder() =>
      ClinicScheduleTemplateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicScheduleTemplate &&
        id == other.id &&
        serviceId == other.serviceId &&
        weekday == other.weekday &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        slotDurationMinutes == other.slotDurationMinutes &&
        mode == other.mode &&
        capacity == other.capacity &&
        active == other.active;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, weekday.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, slotDurationMinutes.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, capacity.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicScheduleTemplate')
          ..add('id', id)
          ..add('serviceId', serviceId)
          ..add('weekday', weekday)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('slotDurationMinutes', slotDurationMinutes)
          ..add('mode', mode)
          ..add('capacity', capacity)
          ..add('active', active))
        .toString();
  }
}

class ClinicScheduleTemplateBuilder
    implements Builder<ClinicScheduleTemplate, ClinicScheduleTemplateBuilder> {
  _$ClinicScheduleTemplate? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

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

  ClinicScheduleTemplateSlotDurationMinutesEnum? _slotDurationMinutes;
  ClinicScheduleTemplateSlotDurationMinutesEnum? get slotDurationMinutes =>
      _$this._slotDurationMinutes;
  set slotDurationMinutes(
    ClinicScheduleTemplateSlotDurationMinutesEnum? slotDurationMinutes,
  ) => _$this._slotDurationMinutes = slotDurationMinutes;

  ClinicScheduleTemplateModeEnum? _mode;
  ClinicScheduleTemplateModeEnum? get mode => _$this._mode;
  set mode(ClinicScheduleTemplateModeEnum? mode) => _$this._mode = mode;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  ClinicScheduleTemplateBuilder() {
    ClinicScheduleTemplate._defaults(this);
  }

  ClinicScheduleTemplateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _serviceId = $v.serviceId;
      _weekday = $v.weekday;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _slotDurationMinutes = $v.slotDurationMinutes;
      _mode = $v.mode;
      _capacity = $v.capacity;
      _active = $v.active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicScheduleTemplate other) {
    _$v = other as _$ClinicScheduleTemplate;
  }

  @override
  void update(void Function(ClinicScheduleTemplateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicScheduleTemplate build() => _build();

  _$ClinicScheduleTemplate _build() {
    final _$result =
        _$v ??
        _$ClinicScheduleTemplate._(
          id: id,
          serviceId: serviceId,
          weekday: weekday,
          startTime: startTime,
          endTime: endTime,
          slotDurationMinutes: slotDurationMinutes,
          mode: mode,
          capacity: capacity,
          active: active,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
