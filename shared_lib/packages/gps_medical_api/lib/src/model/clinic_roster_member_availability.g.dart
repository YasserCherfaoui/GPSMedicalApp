// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_roster_member_availability.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicRosterMemberAvailability extends ClinicRosterMemberAvailability {
  @override
  final String specialistId;
  @override
  final String fullName;
  @override
  final String? specialtyCode;
  @override
  final BuiltList<ClinicRosterDonatedBlock> blocks;

  factory _$ClinicRosterMemberAvailability([
    void Function(ClinicRosterMemberAvailabilityBuilder)? updates,
  ]) => (ClinicRosterMemberAvailabilityBuilder()..update(updates))._build();

  _$ClinicRosterMemberAvailability._({
    required this.specialistId,
    required this.fullName,
    this.specialtyCode,
    required this.blocks,
  }) : super._();
  @override
  ClinicRosterMemberAvailability rebuild(
    void Function(ClinicRosterMemberAvailabilityBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicRosterMemberAvailabilityBuilder toBuilder() =>
      ClinicRosterMemberAvailabilityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicRosterMemberAvailability &&
        specialistId == other.specialistId &&
        fullName == other.fullName &&
        specialtyCode == other.specialtyCode &&
        blocks == other.blocks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, specialistId.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, specialtyCode.hashCode);
    _$hash = $jc(_$hash, blocks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicRosterMemberAvailability')
          ..add('specialistId', specialistId)
          ..add('fullName', fullName)
          ..add('specialtyCode', specialtyCode)
          ..add('blocks', blocks))
        .toString();
  }
}

class ClinicRosterMemberAvailabilityBuilder
    implements
        Builder<
          ClinicRosterMemberAvailability,
          ClinicRosterMemberAvailabilityBuilder
        > {
  _$ClinicRosterMemberAvailability? _$v;

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

  ListBuilder<ClinicRosterDonatedBlock>? _blocks;
  ListBuilder<ClinicRosterDonatedBlock> get blocks =>
      _$this._blocks ??= ListBuilder<ClinicRosterDonatedBlock>();
  set blocks(ListBuilder<ClinicRosterDonatedBlock>? blocks) =>
      _$this._blocks = blocks;

  ClinicRosterMemberAvailabilityBuilder() {
    ClinicRosterMemberAvailability._defaults(this);
  }

  ClinicRosterMemberAvailabilityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specialistId = $v.specialistId;
      _fullName = $v.fullName;
      _specialtyCode = $v.specialtyCode;
      _blocks = $v.blocks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicRosterMemberAvailability other) {
    _$v = other as _$ClinicRosterMemberAvailability;
  }

  @override
  void update(void Function(ClinicRosterMemberAvailabilityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicRosterMemberAvailability build() => _build();

  _$ClinicRosterMemberAvailability _build() {
    _$ClinicRosterMemberAvailability _$result;
    try {
      _$result =
          _$v ??
          _$ClinicRosterMemberAvailability._(
            specialistId: BuiltValueNullFieldError.checkNotNull(
              specialistId,
              r'ClinicRosterMemberAvailability',
              'specialistId',
            ),
            fullName: BuiltValueNullFieldError.checkNotNull(
              fullName,
              r'ClinicRosterMemberAvailability',
              'fullName',
            ),
            specialtyCode: specialtyCode,
            blocks: blocks.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blocks';
        blocks.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ClinicRosterMemberAvailability',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
