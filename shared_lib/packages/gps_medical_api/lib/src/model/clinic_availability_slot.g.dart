// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_availability_slot.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicAvailabilitySlotModeEnum _$clinicAvailabilitySlotModeEnum_inPerson =
    const ClinicAvailabilitySlotModeEnum._('inPerson');
const ClinicAvailabilitySlotModeEnum
_$clinicAvailabilitySlotModeEnum_telehealth =
    const ClinicAvailabilitySlotModeEnum._('telehealth');

ClinicAvailabilitySlotModeEnum _$clinicAvailabilitySlotModeEnumValueOf(
  String name,
) {
  switch (name) {
    case 'inPerson':
      return _$clinicAvailabilitySlotModeEnum_inPerson;
    case 'telehealth':
      return _$clinicAvailabilitySlotModeEnum_telehealth;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicAvailabilitySlotModeEnum>
_$clinicAvailabilitySlotModeEnumValues =
    BuiltSet<ClinicAvailabilitySlotModeEnum>(
      const <ClinicAvailabilitySlotModeEnum>[
        _$clinicAvailabilitySlotModeEnum_inPerson,
        _$clinicAvailabilitySlotModeEnum_telehealth,
      ],
    );

Serializer<ClinicAvailabilitySlotModeEnum>
_$clinicAvailabilitySlotModeEnumSerializer =
    _$ClinicAvailabilitySlotModeEnumSerializer();

class _$ClinicAvailabilitySlotModeEnumSerializer
    implements PrimitiveSerializer<ClinicAvailabilitySlotModeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'inPerson': 'in_person',
    'telehealth': 'telehealth',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'in_person': 'inPerson',
    'telehealth': 'telehealth',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicAvailabilitySlotModeEnum];
  @override
  final String wireName = 'ClinicAvailabilitySlotModeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicAvailabilitySlotModeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicAvailabilitySlotModeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicAvailabilitySlotModeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicAvailabilitySlot extends ClinicAvailabilitySlot {
  @override
  final DateTime? startAt;
  @override
  final DateTime? endAt;
  @override
  final ClinicAvailabilitySlotModeEnum? mode;
  @override
  final int? remainingCapacity;
  @override
  final String? slotLockToken;

  factory _$ClinicAvailabilitySlot([
    void Function(ClinicAvailabilitySlotBuilder)? updates,
  ]) => (ClinicAvailabilitySlotBuilder()..update(updates))._build();

  _$ClinicAvailabilitySlot._({
    this.startAt,
    this.endAt,
    this.mode,
    this.remainingCapacity,
    this.slotLockToken,
  }) : super._();
  @override
  ClinicAvailabilitySlot rebuild(
    void Function(ClinicAvailabilitySlotBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicAvailabilitySlotBuilder toBuilder() =>
      ClinicAvailabilitySlotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicAvailabilitySlot &&
        startAt == other.startAt &&
        endAt == other.endAt &&
        mode == other.mode &&
        remainingCapacity == other.remainingCapacity &&
        slotLockToken == other.slotLockToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startAt.hashCode);
    _$hash = $jc(_$hash, endAt.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, remainingCapacity.hashCode);
    _$hash = $jc(_$hash, slotLockToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicAvailabilitySlot')
          ..add('startAt', startAt)
          ..add('endAt', endAt)
          ..add('mode', mode)
          ..add('remainingCapacity', remainingCapacity)
          ..add('slotLockToken', slotLockToken))
        .toString();
  }
}

class ClinicAvailabilitySlotBuilder
    implements Builder<ClinicAvailabilitySlot, ClinicAvailabilitySlotBuilder> {
  _$ClinicAvailabilitySlot? _$v;

  DateTime? _startAt;
  DateTime? get startAt => _$this._startAt;
  set startAt(DateTime? startAt) => _$this._startAt = startAt;

  DateTime? _endAt;
  DateTime? get endAt => _$this._endAt;
  set endAt(DateTime? endAt) => _$this._endAt = endAt;

  ClinicAvailabilitySlotModeEnum? _mode;
  ClinicAvailabilitySlotModeEnum? get mode => _$this._mode;
  set mode(ClinicAvailabilitySlotModeEnum? mode) => _$this._mode = mode;

  int? _remainingCapacity;
  int? get remainingCapacity => _$this._remainingCapacity;
  set remainingCapacity(int? remainingCapacity) =>
      _$this._remainingCapacity = remainingCapacity;

  String? _slotLockToken;
  String? get slotLockToken => _$this._slotLockToken;
  set slotLockToken(String? slotLockToken) =>
      _$this._slotLockToken = slotLockToken;

  ClinicAvailabilitySlotBuilder() {
    ClinicAvailabilitySlot._defaults(this);
  }

  ClinicAvailabilitySlotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startAt = $v.startAt;
      _endAt = $v.endAt;
      _mode = $v.mode;
      _remainingCapacity = $v.remainingCapacity;
      _slotLockToken = $v.slotLockToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicAvailabilitySlot other) {
    _$v = other as _$ClinicAvailabilitySlot;
  }

  @override
  void update(void Function(ClinicAvailabilitySlotBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicAvailabilitySlot build() => _build();

  _$ClinicAvailabilitySlot _build() {
    final _$result =
        _$v ??
        _$ClinicAvailabilitySlot._(
          startAt: startAt,
          endAt: endAt,
          mode: mode,
          remainingCapacity: remainingCapacity,
          slotLockToken: slotLockToken,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
