// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_template.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ScheduleTemplateSlotDurationMinutesEnum
_$scheduleTemplateSlotDurationMinutesEnum_number10 =
    const ScheduleTemplateSlotDurationMinutesEnum._('number10');
const ScheduleTemplateSlotDurationMinutesEnum
_$scheduleTemplateSlotDurationMinutesEnum_number15 =
    const ScheduleTemplateSlotDurationMinutesEnum._('number15');
const ScheduleTemplateSlotDurationMinutesEnum
_$scheduleTemplateSlotDurationMinutesEnum_number20 =
    const ScheduleTemplateSlotDurationMinutesEnum._('number20');
const ScheduleTemplateSlotDurationMinutesEnum
_$scheduleTemplateSlotDurationMinutesEnum_number30 =
    const ScheduleTemplateSlotDurationMinutesEnum._('number30');
const ScheduleTemplateSlotDurationMinutesEnum
_$scheduleTemplateSlotDurationMinutesEnum_number45 =
    const ScheduleTemplateSlotDurationMinutesEnum._('number45');
const ScheduleTemplateSlotDurationMinutesEnum
_$scheduleTemplateSlotDurationMinutesEnum_number60 =
    const ScheduleTemplateSlotDurationMinutesEnum._('number60');

ScheduleTemplateSlotDurationMinutesEnum
_$scheduleTemplateSlotDurationMinutesEnumValueOf(String name) {
  switch (name) {
    case 'number10':
      return _$scheduleTemplateSlotDurationMinutesEnum_number10;
    case 'number15':
      return _$scheduleTemplateSlotDurationMinutesEnum_number15;
    case 'number20':
      return _$scheduleTemplateSlotDurationMinutesEnum_number20;
    case 'number30':
      return _$scheduleTemplateSlotDurationMinutesEnum_number30;
    case 'number45':
      return _$scheduleTemplateSlotDurationMinutesEnum_number45;
    case 'number60':
      return _$scheduleTemplateSlotDurationMinutesEnum_number60;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ScheduleTemplateSlotDurationMinutesEnum>
_$scheduleTemplateSlotDurationMinutesEnumValues =
    BuiltSet<ScheduleTemplateSlotDurationMinutesEnum>(
      const <ScheduleTemplateSlotDurationMinutesEnum>[
        _$scheduleTemplateSlotDurationMinutesEnum_number10,
        _$scheduleTemplateSlotDurationMinutesEnum_number15,
        _$scheduleTemplateSlotDurationMinutesEnum_number20,
        _$scheduleTemplateSlotDurationMinutesEnum_number30,
        _$scheduleTemplateSlotDurationMinutesEnum_number45,
        _$scheduleTemplateSlotDurationMinutesEnum_number60,
      ],
    );

const ScheduleTemplateModeEnum _$scheduleTemplateModeEnum_inPerson =
    const ScheduleTemplateModeEnum._('inPerson');
const ScheduleTemplateModeEnum _$scheduleTemplateModeEnum_telehealth =
    const ScheduleTemplateModeEnum._('telehealth');
const ScheduleTemplateModeEnum _$scheduleTemplateModeEnum_both =
    const ScheduleTemplateModeEnum._('both');

ScheduleTemplateModeEnum _$scheduleTemplateModeEnumValueOf(String name) {
  switch (name) {
    case 'inPerson':
      return _$scheduleTemplateModeEnum_inPerson;
    case 'telehealth':
      return _$scheduleTemplateModeEnum_telehealth;
    case 'both':
      return _$scheduleTemplateModeEnum_both;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ScheduleTemplateModeEnum> _$scheduleTemplateModeEnumValues =
    BuiltSet<ScheduleTemplateModeEnum>(const <ScheduleTemplateModeEnum>[
      _$scheduleTemplateModeEnum_inPerson,
      _$scheduleTemplateModeEnum_telehealth,
      _$scheduleTemplateModeEnum_both,
    ]);

Serializer<ScheduleTemplateSlotDurationMinutesEnum>
_$scheduleTemplateSlotDurationMinutesEnumSerializer =
    _$ScheduleTemplateSlotDurationMinutesEnumSerializer();
Serializer<ScheduleTemplateModeEnum> _$scheduleTemplateModeEnumSerializer =
    _$ScheduleTemplateModeEnumSerializer();

class _$ScheduleTemplateSlotDurationMinutesEnumSerializer
    implements PrimitiveSerializer<ScheduleTemplateSlotDurationMinutesEnum> {
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
    ScheduleTemplateSlotDurationMinutesEnum,
  ];
  @override
  final String wireName = 'ScheduleTemplateSlotDurationMinutesEnum';

  @override
  Object serialize(
    Serializers serializers,
    ScheduleTemplateSlotDurationMinutesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ScheduleTemplateSlotDurationMinutesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ScheduleTemplateSlotDurationMinutesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ScheduleTemplateModeEnumSerializer
    implements PrimitiveSerializer<ScheduleTemplateModeEnum> {
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
  final Iterable<Type> types = const <Type>[ScheduleTemplateModeEnum];
  @override
  final String wireName = 'ScheduleTemplateModeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ScheduleTemplateModeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ScheduleTemplateModeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ScheduleTemplateModeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ScheduleTemplate extends ScheduleTemplate {
  @override
  final String? id;
  @override
  final int? weekday;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final ScheduleTemplateSlotDurationMinutesEnum? slotDurationMinutes;
  @override
  final ScheduleTemplateModeEnum? mode;
  @override
  final bool? active;

  factory _$ScheduleTemplate([
    void Function(ScheduleTemplateBuilder)? updates,
  ]) => (ScheduleTemplateBuilder()..update(updates))._build();

  _$ScheduleTemplate._({
    this.id,
    this.weekday,
    this.startTime,
    this.endTime,
    this.slotDurationMinutes,
    this.mode,
    this.active,
  }) : super._();
  @override
  ScheduleTemplate rebuild(void Function(ScheduleTemplateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleTemplateBuilder toBuilder() =>
      ScheduleTemplateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleTemplate &&
        id == other.id &&
        weekday == other.weekday &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        slotDurationMinutes == other.slotDurationMinutes &&
        mode == other.mode &&
        active == other.active;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, weekday.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, slotDurationMinutes.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScheduleTemplate')
          ..add('id', id)
          ..add('weekday', weekday)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('slotDurationMinutes', slotDurationMinutes)
          ..add('mode', mode)
          ..add('active', active))
        .toString();
  }
}

class ScheduleTemplateBuilder
    implements Builder<ScheduleTemplate, ScheduleTemplateBuilder> {
  _$ScheduleTemplate? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _weekday;
  int? get weekday => _$this._weekday;
  set weekday(int? weekday) => _$this._weekday = weekday;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  ScheduleTemplateSlotDurationMinutesEnum? _slotDurationMinutes;
  ScheduleTemplateSlotDurationMinutesEnum? get slotDurationMinutes =>
      _$this._slotDurationMinutes;
  set slotDurationMinutes(
    ScheduleTemplateSlotDurationMinutesEnum? slotDurationMinutes,
  ) => _$this._slotDurationMinutes = slotDurationMinutes;

  ScheduleTemplateModeEnum? _mode;
  ScheduleTemplateModeEnum? get mode => _$this._mode;
  set mode(ScheduleTemplateModeEnum? mode) => _$this._mode = mode;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  ScheduleTemplateBuilder() {
    ScheduleTemplate._defaults(this);
  }

  ScheduleTemplateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _weekday = $v.weekday;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _slotDurationMinutes = $v.slotDurationMinutes;
      _mode = $v.mode;
      _active = $v.active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleTemplate other) {
    _$v = other as _$ScheduleTemplate;
  }

  @override
  void update(void Function(ScheduleTemplateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScheduleTemplate build() => _build();

  _$ScheduleTemplate _build() {
    final _$result =
        _$v ??
        _$ScheduleTemplate._(
          id: id,
          weekday: weekday,
          startTime: startTime,
          endTime: endTime,
          slotDurationMinutes: slotDurationMinutes,
          mode: mode,
          active: active,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
