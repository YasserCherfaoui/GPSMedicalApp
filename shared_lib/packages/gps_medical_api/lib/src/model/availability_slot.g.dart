// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_slot.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AvailabilitySlotModeEnum _$availabilitySlotModeEnum_inPerson =
    const AvailabilitySlotModeEnum._('inPerson');
const AvailabilitySlotModeEnum _$availabilitySlotModeEnum_telehealth =
    const AvailabilitySlotModeEnum._('telehealth');

AvailabilitySlotModeEnum _$availabilitySlotModeEnumValueOf(String name) {
  switch (name) {
    case 'inPerson':
      return _$availabilitySlotModeEnum_inPerson;
    case 'telehealth':
      return _$availabilitySlotModeEnum_telehealth;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AvailabilitySlotModeEnum> _$availabilitySlotModeEnumValues =
    BuiltSet<AvailabilitySlotModeEnum>(const <AvailabilitySlotModeEnum>[
      _$availabilitySlotModeEnum_inPerson,
      _$availabilitySlotModeEnum_telehealth,
    ]);

Serializer<AvailabilitySlotModeEnum> _$availabilitySlotModeEnumSerializer =
    _$AvailabilitySlotModeEnumSerializer();

class _$AvailabilitySlotModeEnumSerializer
    implements PrimitiveSerializer<AvailabilitySlotModeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'inPerson': 'in_person',
    'telehealth': 'telehealth',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'in_person': 'inPerson',
    'telehealth': 'telehealth',
  };

  @override
  final Iterable<Type> types = const <Type>[AvailabilitySlotModeEnum];
  @override
  final String wireName = 'AvailabilitySlotModeEnum';

  @override
  Object serialize(
    Serializers serializers,
    AvailabilitySlotModeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AvailabilitySlotModeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AvailabilitySlotModeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$AvailabilitySlot extends AvailabilitySlot {
  @override
  final DateTime? startAt;
  @override
  final DateTime? endAt;
  @override
  final AvailabilitySlotModeEnum? mode;
  @override
  final String? slotLockToken;

  factory _$AvailabilitySlot([
    void Function(AvailabilitySlotBuilder)? updates,
  ]) => (AvailabilitySlotBuilder()..update(updates))._build();

  _$AvailabilitySlot._({
    this.startAt,
    this.endAt,
    this.mode,
    this.slotLockToken,
  }) : super._();
  @override
  AvailabilitySlot rebuild(void Function(AvailabilitySlotBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvailabilitySlotBuilder toBuilder() =>
      AvailabilitySlotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AvailabilitySlot &&
        startAt == other.startAt &&
        endAt == other.endAt &&
        mode == other.mode &&
        slotLockToken == other.slotLockToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startAt.hashCode);
    _$hash = $jc(_$hash, endAt.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, slotLockToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AvailabilitySlot')
          ..add('startAt', startAt)
          ..add('endAt', endAt)
          ..add('mode', mode)
          ..add('slotLockToken', slotLockToken))
        .toString();
  }
}

class AvailabilitySlotBuilder
    implements Builder<AvailabilitySlot, AvailabilitySlotBuilder> {
  _$AvailabilitySlot? _$v;

  DateTime? _startAt;
  DateTime? get startAt => _$this._startAt;
  set startAt(DateTime? startAt) => _$this._startAt = startAt;

  DateTime? _endAt;
  DateTime? get endAt => _$this._endAt;
  set endAt(DateTime? endAt) => _$this._endAt = endAt;

  AvailabilitySlotModeEnum? _mode;
  AvailabilitySlotModeEnum? get mode => _$this._mode;
  set mode(AvailabilitySlotModeEnum? mode) => _$this._mode = mode;

  String? _slotLockToken;
  String? get slotLockToken => _$this._slotLockToken;
  set slotLockToken(String? slotLockToken) =>
      _$this._slotLockToken = slotLockToken;

  AvailabilitySlotBuilder() {
    AvailabilitySlot._defaults(this);
  }

  AvailabilitySlotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startAt = $v.startAt;
      _endAt = $v.endAt;
      _mode = $v.mode;
      _slotLockToken = $v.slotLockToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AvailabilitySlot other) {
    _$v = other as _$AvailabilitySlot;
  }

  @override
  void update(void Function(AvailabilitySlotBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AvailabilitySlot build() => _build();

  _$AvailabilitySlot _build() {
    final _$result =
        _$v ??
        _$AvailabilitySlot._(
          startAt: startAt,
          endAt: endAt,
          mode: mode,
          slotLockToken: slotLockToken,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
