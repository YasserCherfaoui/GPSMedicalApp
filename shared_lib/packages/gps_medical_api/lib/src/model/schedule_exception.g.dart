// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_exception.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ScheduleExceptionKindEnum _$scheduleExceptionKindEnum_vacation =
    const ScheduleExceptionKindEnum._('vacation');
const ScheduleExceptionKindEnum _$scheduleExceptionKindEnum_sick =
    const ScheduleExceptionKindEnum._('sick');
const ScheduleExceptionKindEnum _$scheduleExceptionKindEnum_blocked =
    const ScheduleExceptionKindEnum._('blocked');
const ScheduleExceptionKindEnum _$scheduleExceptionKindEnum_extra =
    const ScheduleExceptionKindEnum._('extra');

ScheduleExceptionKindEnum _$scheduleExceptionKindEnumValueOf(String name) {
  switch (name) {
    case 'vacation':
      return _$scheduleExceptionKindEnum_vacation;
    case 'sick':
      return _$scheduleExceptionKindEnum_sick;
    case 'blocked':
      return _$scheduleExceptionKindEnum_blocked;
    case 'extra':
      return _$scheduleExceptionKindEnum_extra;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ScheduleExceptionKindEnum> _$scheduleExceptionKindEnumValues =
    BuiltSet<ScheduleExceptionKindEnum>(const <ScheduleExceptionKindEnum>[
      _$scheduleExceptionKindEnum_vacation,
      _$scheduleExceptionKindEnum_sick,
      _$scheduleExceptionKindEnum_blocked,
      _$scheduleExceptionKindEnum_extra,
    ]);

Serializer<ScheduleExceptionKindEnum> _$scheduleExceptionKindEnumSerializer =
    _$ScheduleExceptionKindEnumSerializer();

class _$ScheduleExceptionKindEnumSerializer
    implements PrimitiveSerializer<ScheduleExceptionKindEnum> {
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
  final Iterable<Type> types = const <Type>[ScheduleExceptionKindEnum];
  @override
  final String wireName = 'ScheduleExceptionKindEnum';

  @override
  Object serialize(
    Serializers serializers,
    ScheduleExceptionKindEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ScheduleExceptionKindEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ScheduleExceptionKindEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ScheduleException extends ScheduleException {
  @override
  final String? id;
  @override
  final DateTime? startAt;
  @override
  final DateTime? endAt;
  @override
  final ScheduleExceptionKindEnum? kind;
  @override
  final String? note;

  factory _$ScheduleException([
    void Function(ScheduleExceptionBuilder)? updates,
  ]) => (ScheduleExceptionBuilder()..update(updates))._build();

  _$ScheduleException._({
    this.id,
    this.startAt,
    this.endAt,
    this.kind,
    this.note,
  }) : super._();
  @override
  ScheduleException rebuild(void Function(ScheduleExceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleExceptionBuilder toBuilder() =>
      ScheduleExceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleException &&
        id == other.id &&
        startAt == other.startAt &&
        endAt == other.endAt &&
        kind == other.kind &&
        note == other.note;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, startAt.hashCode);
    _$hash = $jc(_$hash, endAt.hashCode);
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScheduleException')
          ..add('id', id)
          ..add('startAt', startAt)
          ..add('endAt', endAt)
          ..add('kind', kind)
          ..add('note', note))
        .toString();
  }
}

class ScheduleExceptionBuilder
    implements Builder<ScheduleException, ScheduleExceptionBuilder> {
  _$ScheduleException? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _startAt;
  DateTime? get startAt => _$this._startAt;
  set startAt(DateTime? startAt) => _$this._startAt = startAt;

  DateTime? _endAt;
  DateTime? get endAt => _$this._endAt;
  set endAt(DateTime? endAt) => _$this._endAt = endAt;

  ScheduleExceptionKindEnum? _kind;
  ScheduleExceptionKindEnum? get kind => _$this._kind;
  set kind(ScheduleExceptionKindEnum? kind) => _$this._kind = kind;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  ScheduleExceptionBuilder() {
    ScheduleException._defaults(this);
  }

  ScheduleExceptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _startAt = $v.startAt;
      _endAt = $v.endAt;
      _kind = $v.kind;
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleException other) {
    _$v = other as _$ScheduleException;
  }

  @override
  void update(void Function(ScheduleExceptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScheduleException build() => _build();

  _$ScheduleException _build() {
    final _$result =
        _$v ??
        _$ScheduleException._(
          id: id,
          startAt: startAt,
          endAt: endAt,
          kind: kind,
          note: note,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
