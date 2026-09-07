// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_roster_member_summary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicRosterMemberSummaryStatusEnum
_$clinicRosterMemberSummaryStatusEnum_active =
    const ClinicRosterMemberSummaryStatusEnum._('active');
const ClinicRosterMemberSummaryStatusEnum
_$clinicRosterMemberSummaryStatusEnum_invited =
    const ClinicRosterMemberSummaryStatusEnum._('invited');
const ClinicRosterMemberSummaryStatusEnum
_$clinicRosterMemberSummaryStatusEnum_detachRequested =
    const ClinicRosterMemberSummaryStatusEnum._('detachRequested');
const ClinicRosterMemberSummaryStatusEnum
_$clinicRosterMemberSummaryStatusEnum_detached =
    const ClinicRosterMemberSummaryStatusEnum._('detached');
const ClinicRosterMemberSummaryStatusEnum
_$clinicRosterMemberSummaryStatusEnum_refused =
    const ClinicRosterMemberSummaryStatusEnum._('refused');

ClinicRosterMemberSummaryStatusEnum
_$clinicRosterMemberSummaryStatusEnumValueOf(String name) {
  switch (name) {
    case 'active':
      return _$clinicRosterMemberSummaryStatusEnum_active;
    case 'invited':
      return _$clinicRosterMemberSummaryStatusEnum_invited;
    case 'detachRequested':
      return _$clinicRosterMemberSummaryStatusEnum_detachRequested;
    case 'detached':
      return _$clinicRosterMemberSummaryStatusEnum_detached;
    case 'refused':
      return _$clinicRosterMemberSummaryStatusEnum_refused;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicRosterMemberSummaryStatusEnum>
_$clinicRosterMemberSummaryStatusEnumValues =
    BuiltSet<ClinicRosterMemberSummaryStatusEnum>(
      const <ClinicRosterMemberSummaryStatusEnum>[
        _$clinicRosterMemberSummaryStatusEnum_active,
        _$clinicRosterMemberSummaryStatusEnum_invited,
        _$clinicRosterMemberSummaryStatusEnum_detachRequested,
        _$clinicRosterMemberSummaryStatusEnum_detached,
        _$clinicRosterMemberSummaryStatusEnum_refused,
      ],
    );

Serializer<ClinicRosterMemberSummaryStatusEnum>
_$clinicRosterMemberSummaryStatusEnumSerializer =
    _$ClinicRosterMemberSummaryStatusEnumSerializer();

class _$ClinicRosterMemberSummaryStatusEnumSerializer
    implements PrimitiveSerializer<ClinicRosterMemberSummaryStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'active': 'active',
    'invited': 'invited',
    'detachRequested': 'detach_requested',
    'detached': 'detached',
    'refused': 'refused',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'active': 'active',
    'invited': 'invited',
    'detach_requested': 'detachRequested',
    'detached': 'detached',
    'refused': 'refused',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ClinicRosterMemberSummaryStatusEnum,
  ];
  @override
  final String wireName = 'ClinicRosterMemberSummaryStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicRosterMemberSummaryStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicRosterMemberSummaryStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicRosterMemberSummaryStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicRosterMemberSummary extends ClinicRosterMemberSummary {
  @override
  final String specialistId;
  @override
  final String fullName;
  @override
  final String? specialtyCode;
  @override
  final ClinicRosterMemberSummaryStatusEnum status;
  @override
  final bool? isSeededStub;

  factory _$ClinicRosterMemberSummary([
    void Function(ClinicRosterMemberSummaryBuilder)? updates,
  ]) => (ClinicRosterMemberSummaryBuilder()..update(updates))._build();

  _$ClinicRosterMemberSummary._({
    required this.specialistId,
    required this.fullName,
    this.specialtyCode,
    required this.status,
    this.isSeededStub,
  }) : super._();
  @override
  ClinicRosterMemberSummary rebuild(
    void Function(ClinicRosterMemberSummaryBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicRosterMemberSummaryBuilder toBuilder() =>
      ClinicRosterMemberSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicRosterMemberSummary &&
        specialistId == other.specialistId &&
        fullName == other.fullName &&
        specialtyCode == other.specialtyCode &&
        status == other.status &&
        isSeededStub == other.isSeededStub;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, specialistId.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, specialtyCode.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, isSeededStub.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicRosterMemberSummary')
          ..add('specialistId', specialistId)
          ..add('fullName', fullName)
          ..add('specialtyCode', specialtyCode)
          ..add('status', status)
          ..add('isSeededStub', isSeededStub))
        .toString();
  }
}

class ClinicRosterMemberSummaryBuilder
    implements
        Builder<ClinicRosterMemberSummary, ClinicRosterMemberSummaryBuilder> {
  _$ClinicRosterMemberSummary? _$v;

  String? _specialistId;
  String? get specialistId => _$this._specialistId;
  set specialistId(String? specialistId) => _$this._specialistId = specialistId;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _specialtyCode;
  String? get specialtyCode => _$this._specialtyCode;
  set specialtyCode(String? specialtyCode) =>
      _$this._specialtyCode = specialtyCode;

  ClinicRosterMemberSummaryStatusEnum? _status;
  ClinicRosterMemberSummaryStatusEnum? get status => _$this._status;
  set status(ClinicRosterMemberSummaryStatusEnum? status) =>
      _$this._status = status;

  bool? _isSeededStub;
  bool? get isSeededStub => _$this._isSeededStub;
  set isSeededStub(bool? isSeededStub) => _$this._isSeededStub = isSeededStub;

  ClinicRosterMemberSummaryBuilder() {
    ClinicRosterMemberSummary._defaults(this);
  }

  ClinicRosterMemberSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specialistId = $v.specialistId;
      _fullName = $v.fullName;
      _specialtyCode = $v.specialtyCode;
      _status = $v.status;
      _isSeededStub = $v.isSeededStub;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicRosterMemberSummary other) {
    _$v = other as _$ClinicRosterMemberSummary;
  }

  @override
  void update(void Function(ClinicRosterMemberSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicRosterMemberSummary build() => _build();

  _$ClinicRosterMemberSummary _build() {
    final _$result =
        _$v ??
        _$ClinicRosterMemberSummary._(
          specialistId: BuiltValueNullFieldError.checkNotNull(
            specialistId,
            r'ClinicRosterMemberSummary',
            'specialistId',
          ),
          fullName: BuiltValueNullFieldError.checkNotNull(
            fullName,
            r'ClinicRosterMemberSummary',
            'fullName',
          ),
          specialtyCode: specialtyCode,
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            r'ClinicRosterMemberSummary',
            'status',
          ),
          isSeededStub: isSeededStub,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
