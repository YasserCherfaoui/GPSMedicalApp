// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_template_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ScheduleTemplateCreateSlotDurationMinutesEnum
_$scheduleTemplateCreateSlotDurationMinutesEnum_number10 =
    const ScheduleTemplateCreateSlotDurationMinutesEnum._('number10');
const ScheduleTemplateCreateSlotDurationMinutesEnum
_$scheduleTemplateCreateSlotDurationMinutesEnum_number15 =
    const ScheduleTemplateCreateSlotDurationMinutesEnum._('number15');
const ScheduleTemplateCreateSlotDurationMinutesEnum
_$scheduleTemplateCreateSlotDurationMinutesEnum_number20 =
    const ScheduleTemplateCreateSlotDurationMinutesEnum._('number20');
const ScheduleTemplateCreateSlotDurationMinutesEnum
_$scheduleTemplateCreateSlotDurationMinutesEnum_number30 =
    const ScheduleTemplateCreateSlotDurationMinutesEnum._('number30');
const ScheduleTemplateCreateSlotDurationMinutesEnum
_$scheduleTemplateCreateSlotDurationMinutesEnum_number45 =
    const ScheduleTemplateCreateSlotDurationMinutesEnum._('number45');
const ScheduleTemplateCreateSlotDurationMinutesEnum
_$scheduleTemplateCreateSlotDurationMinutesEnum_number60 =
    const ScheduleTemplateCreateSlotDurationMinutesEnum._('number60');

ScheduleTemplateCreateSlotDurationMinutesEnum
_$scheduleTemplateCreateSlotDurationMinutesEnumValueOf(String name) {
  switch (name) {
    case 'number10':
      return _$scheduleTemplateCreateSlotDurationMinutesEnum_number10;
    case 'number15':
      return _$scheduleTemplateCreateSlotDurationMinutesEnum_number15;
    case 'number20':
      return _$scheduleTemplateCreateSlotDurationMinutesEnum_number20;
    case 'number30':
      return _$scheduleTemplateCreateSlotDurationMinutesEnum_number30;
    case 'number45':
      return _$scheduleTemplateCreateSlotDurationMinutesEnum_number45;
    case 'number60':
      return _$scheduleTemplateCreateSlotDurationMinutesEnum_number60;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ScheduleTemplateCreateSlotDurationMinutesEnum>
_$scheduleTemplateCreateSlotDurationMinutesEnumValues =
    BuiltSet<ScheduleTemplateCreateSlotDurationMinutesEnum>(
      const <ScheduleTemplateCreateSlotDurationMinutesEnum>[
        _$scheduleTemplateCreateSlotDurationMinutesEnum_number10,
        _$scheduleTemplateCreateSlotDurationMinutesEnum_number15,
        _$scheduleTemplateCreateSlotDurationMinutesEnum_number20,
        _$scheduleTemplateCreateSlotDurationMinutesEnum_number30,
        _$scheduleTemplateCreateSlotDurationMinutesEnum_number45,
        _$scheduleTemplateCreateSlotDurationMinutesEnum_number60,
      ],
    );

const ScheduleTemplateCreateModeEnum _$scheduleTemplateCreateModeEnum_inPerson =
    const ScheduleTemplateCreateModeEnum._('inPerson');
const ScheduleTemplateCreateModeEnum
_$scheduleTemplateCreateModeEnum_telehealth =
    const ScheduleTemplateCreateModeEnum._('telehealth');
const ScheduleTemplateCreateModeEnum _$scheduleTemplateCreateModeEnum_both =
    const ScheduleTemplateCreateModeEnum._('both');

ScheduleTemplateCreateModeEnum _$scheduleTemplateCreateModeEnumValueOf(
  String name,
) {
  switch (name) {
    case 'inPerson':
      return _$scheduleTemplateCreateModeEnum_inPerson;
    case 'telehealth':
      return _$scheduleTemplateCreateModeEnum_telehealth;
    case 'both':
      return _$scheduleTemplateCreateModeEnum_both;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ScheduleTemplateCreateModeEnum>
_$scheduleTemplateCreateModeEnumValues =
    BuiltSet<ScheduleTemplateCreateModeEnum>(
      const <ScheduleTemplateCreateModeEnum>[
        _$scheduleTemplateCreateModeEnum_inPerson,
        _$scheduleTemplateCreateModeEnum_telehealth,
        _$scheduleTemplateCreateModeEnum_both,
      ],
    );

Serializer<ScheduleTemplateCreateSlotDurationMinutesEnum>
_$scheduleTemplateCreateSlotDurationMinutesEnumSerializer =
    _$ScheduleTemplateCreateSlotDurationMinutesEnumSerializer();
Serializer<ScheduleTemplateCreateModeEnum>
_$scheduleTemplateCreateModeEnumSerializer =
    _$ScheduleTemplateCreateModeEnumSerializer();

class _$ScheduleTemplateCreateSlotDurationMinutesEnumSerializer
    implements
        PrimitiveSerializer<ScheduleTemplateCreateSlotDurationMinutesEnum> {
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
    ScheduleTemplateCreateSlotDurationMinutesEnum,
  ];
  @override
  final String wireName = 'ScheduleTemplateCreateSlotDurationMinutesEnum';

  @override
  Object serialize(
    Serializers serializers,
    ScheduleTemplateCreateSlotDurationMinutesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ScheduleTemplateCreateSlotDurationMinutesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ScheduleTemplateCreateSlotDurationMinutesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ScheduleTemplateCreateModeEnumSerializer
    implements PrimitiveSerializer<ScheduleTemplateCreateModeEnum> {
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
  final Iterable<Type> types = const <Type>[ScheduleTemplateCreateModeEnum];
  @override
  final String wireName = 'ScheduleTemplateCreateModeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ScheduleTemplateCreateModeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ScheduleTemplateCreateModeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ScheduleTemplateCreateModeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ScheduleTemplateCreate extends ScheduleTemplateCreate {
  @override
  final int weekday;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final ScheduleTemplateCreateSlotDurationMinutesEnum slotDurationMinutes;
  @override
  final ScheduleTemplateCreateModeEnum mode;

  factory _$ScheduleTemplateCreate([
    void Function(ScheduleTemplateCreateBuilder)? updates,
  ]) => (ScheduleTemplateCreateBuilder()..update(updates))._build();

  _$ScheduleTemplateCreate._({
    required this.weekday,
    required this.startTime,
    required this.endTime,
    required this.slotDurationMinutes,
    required this.mode,
  }) : super._();
  @override
  ScheduleTemplateCreate rebuild(
    void Function(ScheduleTemplateCreateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ScheduleTemplateCreateBuilder toBuilder() =>
      ScheduleTemplateCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleTemplateCreate &&
        weekday == other.weekday &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        slotDurationMinutes == other.slotDurationMinutes &&
        mode == other.mode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, weekday.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, slotDurationMinutes.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScheduleTemplateCreate')
          ..add('weekday', weekday)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('slotDurationMinutes', slotDurationMinutes)
          ..add('mode', mode))
        .toString();
  }
}

class ScheduleTemplateCreateBuilder
    implements Builder<ScheduleTemplateCreate, ScheduleTemplateCreateBuilder> {
  _$ScheduleTemplateCreate? _$v;

  int? _weekday;
  int? get weekday => _$this._weekday;
  set weekday(int? weekday) => _$this._weekday = weekday;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  ScheduleTemplateCreateSlotDurationMinutesEnum? _slotDurationMinutes;
  ScheduleTemplateCreateSlotDurationMinutesEnum? get slotDurationMinutes =>
      _$this._slotDurationMinutes;
  set slotDurationMinutes(
    ScheduleTemplateCreateSlotDurationMinutesEnum? slotDurationMinutes,
  ) => _$this._slotDurationMinutes = slotDurationMinutes;

  ScheduleTemplateCreateModeEnum? _mode;
  ScheduleTemplateCreateModeEnum? get mode => _$this._mode;
  set mode(ScheduleTemplateCreateModeEnum? mode) => _$this._mode = mode;

  ScheduleTemplateCreateBuilder() {
    ScheduleTemplateCreate._defaults(this);
  }

  ScheduleTemplateCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weekday = $v.weekday;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _slotDurationMinutes = $v.slotDurationMinutes;
      _mode = $v.mode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleTemplateCreate other) {
    _$v = other as _$ScheduleTemplateCreate;
  }

  @override
  void update(void Function(ScheduleTemplateCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScheduleTemplateCreate build() => _build();

  _$ScheduleTemplateCreate _build() {
    final _$result =
        _$v ??
        _$ScheduleTemplateCreate._(
          weekday: BuiltValueNullFieldError.checkNotNull(
            weekday,
            r'ScheduleTemplateCreate',
            'weekday',
          ),
          startTime: BuiltValueNullFieldError.checkNotNull(
            startTime,
            r'ScheduleTemplateCreate',
            'startTime',
          ),
          endTime: BuiltValueNullFieldError.checkNotNull(
            endTime,
            r'ScheduleTemplateCreate',
            'endTime',
          ),
          slotDurationMinutes: BuiltValueNullFieldError.checkNotNull(
            slotDurationMinutes,
            r'ScheduleTemplateCreate',
            'slotDurationMinutes',
          ),
          mode: BuiltValueNullFieldError.checkNotNull(
            mode,
            r'ScheduleTemplateCreate',
            'mode',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
