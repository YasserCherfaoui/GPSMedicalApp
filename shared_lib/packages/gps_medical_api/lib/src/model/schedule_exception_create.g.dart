// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_exception_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ScheduleExceptionCreateKindEnum
_$scheduleExceptionCreateKindEnum_vacation =
    const ScheduleExceptionCreateKindEnum._('vacation');
const ScheduleExceptionCreateKindEnum _$scheduleExceptionCreateKindEnum_sick =
    const ScheduleExceptionCreateKindEnum._('sick');
const ScheduleExceptionCreateKindEnum
_$scheduleExceptionCreateKindEnum_blocked =
    const ScheduleExceptionCreateKindEnum._('blocked');
const ScheduleExceptionCreateKindEnum _$scheduleExceptionCreateKindEnum_extra =
    const ScheduleExceptionCreateKindEnum._('extra');

ScheduleExceptionCreateKindEnum _$scheduleExceptionCreateKindEnumValueOf(
  String name,
) {
  switch (name) {
    case 'vacation':
      return _$scheduleExceptionCreateKindEnum_vacation;
    case 'sick':
      return _$scheduleExceptionCreateKindEnum_sick;
    case 'blocked':
      return _$scheduleExceptionCreateKindEnum_blocked;
    case 'extra':
      return _$scheduleExceptionCreateKindEnum_extra;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ScheduleExceptionCreateKindEnum>
_$scheduleExceptionCreateKindEnumValues =
    BuiltSet<ScheduleExceptionCreateKindEnum>(
      const <ScheduleExceptionCreateKindEnum>[
        _$scheduleExceptionCreateKindEnum_vacation,
        _$scheduleExceptionCreateKindEnum_sick,
        _$scheduleExceptionCreateKindEnum_blocked,
        _$scheduleExceptionCreateKindEnum_extra,
      ],
    );

Serializer<ScheduleExceptionCreateKindEnum>
_$scheduleExceptionCreateKindEnumSerializer =
    _$ScheduleExceptionCreateKindEnumSerializer();

class _$ScheduleExceptionCreateKindEnumSerializer
    implements PrimitiveSerializer<ScheduleExceptionCreateKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'vacation': 'vacation',
    'sick': 'sick',
    'blocked': 'blocked',
    'extra': 'extra',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'vacation': 'vacation',
    'sick': 'sick',
    'blocked': 'blocked',
    'extra': 'extra',
  };

  @override
  final Iterable<Type> types = const <Type>[ScheduleExceptionCreateKindEnum];
  @override
  final String wireName = 'ScheduleExceptionCreateKindEnum';

  @override
  Object serialize(
    Serializers serializers,
    ScheduleExceptionCreateKindEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ScheduleExceptionCreateKindEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ScheduleExceptionCreateKindEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ScheduleExceptionCreate extends ScheduleExceptionCreate {
  @override
  final DateTime startAt;
  @override
  final DateTime endAt;
  @override
  final ScheduleExceptionCreateKindEnum kind;
  @override
  final String? note;

  factory _$ScheduleExceptionCreate([
    void Function(ScheduleExceptionCreateBuilder)? updates,
  ]) => (ScheduleExceptionCreateBuilder()..update(updates))._build();

  _$ScheduleExceptionCreate._({
    required this.startAt,
    required this.endAt,
    required this.kind,
    this.note,
  }) : super._();
  @override
  ScheduleExceptionCreate rebuild(
    void Function(ScheduleExceptionCreateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ScheduleExceptionCreateBuilder toBuilder() =>
      ScheduleExceptionCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleExceptionCreate &&
        startAt == other.startAt &&
        endAt == other.endAt &&
        kind == other.kind &&
        note == other.note;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startAt.hashCode);
    _$hash = $jc(_$hash, endAt.hashCode);
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScheduleExceptionCreate')
          ..add('startAt', startAt)
          ..add('endAt', endAt)
          ..add('kind', kind)
          ..add('note', note))
        .toString();
  }
}

class ScheduleExceptionCreateBuilder
    implements
        Builder<ScheduleExceptionCreate, ScheduleExceptionCreateBuilder> {
  _$ScheduleExceptionCreate? _$v;

  DateTime? _startAt;
  DateTime? get startAt => _$this._startAt;
  set startAt(DateTime? startAt) => _$this._startAt = startAt;

  DateTime? _endAt;
  DateTime? get endAt => _$this._endAt;
  set endAt(DateTime? endAt) => _$this._endAt = endAt;

  ScheduleExceptionCreateKindEnum? _kind;
  ScheduleExceptionCreateKindEnum? get kind => _$this._kind;
  set kind(ScheduleExceptionCreateKindEnum? kind) => _$this._kind = kind;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  ScheduleExceptionCreateBuilder() {
    ScheduleExceptionCreate._defaults(this);
  }

  ScheduleExceptionCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startAt = $v.startAt;
      _endAt = $v.endAt;
      _kind = $v.kind;
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleExceptionCreate other) {
    _$v = other as _$ScheduleExceptionCreate;
  }

  @override
  void update(void Function(ScheduleExceptionCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScheduleExceptionCreate build() => _build();

  _$ScheduleExceptionCreate _build() {
    final _$result =
        _$v ??
        _$ScheduleExceptionCreate._(
          startAt: BuiltValueNullFieldError.checkNotNull(
            startAt,
            r'ScheduleExceptionCreate',
            'startAt',
          ),
          endAt: BuiltValueNullFieldError.checkNotNull(
            endAt,
            r'ScheduleExceptionCreate',
            'endAt',
          ),
          kind: BuiltValueNullFieldError.checkNotNull(
            kind,
            r'ScheduleExceptionCreate',
            'kind',
          ),
          note: note,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
