// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_roster_availability.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicRosterAvailability extends ClinicRosterAvailability {
  @override
  final DateTime from;
  @override
  final DateTime to;
  @override
  final BuiltList<ClinicRosterMemberAvailability> members;

  factory _$ClinicRosterAvailability([
    void Function(ClinicRosterAvailabilityBuilder)? updates,
  ]) => (ClinicRosterAvailabilityBuilder()..update(updates))._build();

  _$ClinicRosterAvailability._({
    required this.from,
    required this.to,
    required this.members,
  }) : super._();
  @override
  ClinicRosterAvailability rebuild(
    void Function(ClinicRosterAvailabilityBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicRosterAvailabilityBuilder toBuilder() =>
      ClinicRosterAvailabilityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicRosterAvailability &&
        from == other.from &&
        to == other.to &&
        members == other.members;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jc(_$hash, members.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicRosterAvailability')
          ..add('from', from)
          ..add('to', to)
          ..add('members', members))
        .toString();
  }
}

class ClinicRosterAvailabilityBuilder
    implements
        Builder<ClinicRosterAvailability, ClinicRosterAvailabilityBuilder> {
  _$ClinicRosterAvailability? _$v;

  DateTime? _from;
  DateTime? get from => _$this._from;
  set from(DateTime? from) => _$this._from = from;

  DateTime? _to;
  DateTime? get to => _$this._to;
  set to(DateTime? to) => _$this._to = to;

  ListBuilder<ClinicRosterMemberAvailability>? _members;
  ListBuilder<ClinicRosterMemberAvailability> get members =>
      _$this._members ??= ListBuilder<ClinicRosterMemberAvailability>();
  set members(ListBuilder<ClinicRosterMemberAvailability>? members) =>
      _$this._members = members;

  ClinicRosterAvailabilityBuilder() {
    ClinicRosterAvailability._defaults(this);
  }

  ClinicRosterAvailabilityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _from = $v.from;
      _to = $v.to;
      _members = $v.members.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicRosterAvailability other) {
    _$v = other as _$ClinicRosterAvailability;
  }

  @override
  void update(void Function(ClinicRosterAvailabilityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicRosterAvailability build() => _build();

  _$ClinicRosterAvailability _build() {
    _$ClinicRosterAvailability _$result;
    try {
      _$result =
          _$v ??
          _$ClinicRosterAvailability._(
            from: BuiltValueNullFieldError.checkNotNull(
              from,
              r'ClinicRosterAvailability',
              'from',
            ),
            to: BuiltValueNullFieldError.checkNotNull(
              to,
              r'ClinicRosterAvailability',
              'to',
            ),
            members: members.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'members';
        members.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ClinicRosterAvailability',
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
