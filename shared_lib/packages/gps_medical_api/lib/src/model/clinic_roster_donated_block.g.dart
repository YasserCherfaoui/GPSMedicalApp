// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_roster_donated_block.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicRosterDonatedBlockModeEnum
_$clinicRosterDonatedBlockModeEnum_inPerson =
    const ClinicRosterDonatedBlockModeEnum._('inPerson');
const ClinicRosterDonatedBlockModeEnum
_$clinicRosterDonatedBlockModeEnum_telehealth =
    const ClinicRosterDonatedBlockModeEnum._('telehealth');
const ClinicRosterDonatedBlockModeEnum _$clinicRosterDonatedBlockModeEnum_both =
    const ClinicRosterDonatedBlockModeEnum._('both');

ClinicRosterDonatedBlockModeEnum _$clinicRosterDonatedBlockModeEnumValueOf(
  String name,
) {
  switch (name) {
    case 'inPerson':
      return _$clinicRosterDonatedBlockModeEnum_inPerson;
    case 'telehealth':
      return _$clinicRosterDonatedBlockModeEnum_telehealth;
    case 'both':
      return _$clinicRosterDonatedBlockModeEnum_both;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicRosterDonatedBlockModeEnum>
_$clinicRosterDonatedBlockModeEnumValues =
    BuiltSet<ClinicRosterDonatedBlockModeEnum>(
      const <ClinicRosterDonatedBlockModeEnum>[
        _$clinicRosterDonatedBlockModeEnum_inPerson,
        _$clinicRosterDonatedBlockModeEnum_telehealth,
        _$clinicRosterDonatedBlockModeEnum_both,
      ],
    );

Serializer<ClinicRosterDonatedBlockModeEnum>
_$clinicRosterDonatedBlockModeEnumSerializer =
    _$ClinicRosterDonatedBlockModeEnumSerializer();

class _$ClinicRosterDonatedBlockModeEnumSerializer
    implements PrimitiveSerializer<ClinicRosterDonatedBlockModeEnum> {
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
  final Iterable<Type> types = const <Type>[ClinicRosterDonatedBlockModeEnum];
  @override
  final String wireName = 'ClinicRosterDonatedBlockModeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicRosterDonatedBlockModeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicRosterDonatedBlockModeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicRosterDonatedBlockModeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicRosterDonatedBlock extends ClinicRosterDonatedBlock {
  @override
  final DateTime startAt;
  @override
  final DateTime endAt;
  @override
  final ClinicRosterDonatedBlockModeEnum? mode;

  factory _$ClinicRosterDonatedBlock([
    void Function(ClinicRosterDonatedBlockBuilder)? updates,
  ]) => (ClinicRosterDonatedBlockBuilder()..update(updates))._build();

  _$ClinicRosterDonatedBlock._({
    required this.startAt,
    required this.endAt,
    this.mode,
  }) : super._();
  @override
  ClinicRosterDonatedBlock rebuild(
    void Function(ClinicRosterDonatedBlockBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicRosterDonatedBlockBuilder toBuilder() =>
      ClinicRosterDonatedBlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicRosterDonatedBlock &&
        startAt == other.startAt &&
        endAt == other.endAt &&
        mode == other.mode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startAt.hashCode);
    _$hash = $jc(_$hash, endAt.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicRosterDonatedBlock')
          ..add('startAt', startAt)
          ..add('endAt', endAt)
          ..add('mode', mode))
        .toString();
  }
}

class ClinicRosterDonatedBlockBuilder
    implements
        Builder<ClinicRosterDonatedBlock, ClinicRosterDonatedBlockBuilder> {
  _$ClinicRosterDonatedBlock? _$v;

  DateTime? _startAt;
  DateTime? get startAt => _$this._startAt;
  set startAt(DateTime? startAt) => _$this._startAt = startAt;

  DateTime? _endAt;
  DateTime? get endAt => _$this._endAt;
  set endAt(DateTime? endAt) => _$this._endAt = endAt;

  ClinicRosterDonatedBlockModeEnum? _mode;
  ClinicRosterDonatedBlockModeEnum? get mode => _$this._mode;
  set mode(ClinicRosterDonatedBlockModeEnum? mode) => _$this._mode = mode;

  ClinicRosterDonatedBlockBuilder() {
    ClinicRosterDonatedBlock._defaults(this);
  }

  ClinicRosterDonatedBlockBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startAt = $v.startAt;
      _endAt = $v.endAt;
      _mode = $v.mode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicRosterDonatedBlock other) {
    _$v = other as _$ClinicRosterDonatedBlock;
  }

  @override
  void update(void Function(ClinicRosterDonatedBlockBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicRosterDonatedBlock build() => _build();

  _$ClinicRosterDonatedBlock _build() {
    final _$result =
        _$v ??
        _$ClinicRosterDonatedBlock._(
          startAt: BuiltValueNullFieldError.checkNotNull(
            startAt,
            r'ClinicRosterDonatedBlock',
            'startAt',
          ),
          endAt: BuiltValueNullFieldError.checkNotNull(
            endAt,
            r'ClinicRosterDonatedBlock',
            'endAt',
          ),
          mode: mode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
