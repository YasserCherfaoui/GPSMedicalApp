// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_under_staffed_advisory.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicUnderStaffedAdvisory extends ClinicUnderStaffedAdvisory {
  @override
  final bool? underStaffed;
  @override
  final ClinicUnderstaffedShortfall? shortfall;
  @override
  final BuiltList<ClinicUnderStaffedAdvisoryAffectedTemplatesInner>?
  affectedTemplates;

  factory _$ClinicUnderStaffedAdvisory([
    void Function(ClinicUnderStaffedAdvisoryBuilder)? updates,
  ]) => (ClinicUnderStaffedAdvisoryBuilder()..update(updates))._build();

  _$ClinicUnderStaffedAdvisory._({
    this.underStaffed,
    this.shortfall,
    this.affectedTemplates,
  }) : super._();
  @override
  ClinicUnderStaffedAdvisory rebuild(
    void Function(ClinicUnderStaffedAdvisoryBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicUnderStaffedAdvisoryBuilder toBuilder() =>
      ClinicUnderStaffedAdvisoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicUnderStaffedAdvisory &&
        underStaffed == other.underStaffed &&
        shortfall == other.shortfall &&
        affectedTemplates == other.affectedTemplates;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, underStaffed.hashCode);
    _$hash = $jc(_$hash, shortfall.hashCode);
    _$hash = $jc(_$hash, affectedTemplates.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicUnderStaffedAdvisory')
          ..add('underStaffed', underStaffed)
          ..add('shortfall', shortfall)
          ..add('affectedTemplates', affectedTemplates))
        .toString();
  }
}

class ClinicUnderStaffedAdvisoryBuilder
    implements
        Builder<ClinicUnderStaffedAdvisory, ClinicUnderStaffedAdvisoryBuilder> {
  _$ClinicUnderStaffedAdvisory? _$v;

  bool? _underStaffed;
  bool? get underStaffed => _$this._underStaffed;
  set underStaffed(bool? underStaffed) => _$this._underStaffed = underStaffed;

  ClinicUnderstaffedShortfallBuilder? _shortfall;
  ClinicUnderstaffedShortfallBuilder get shortfall =>
      _$this._shortfall ??= ClinicUnderstaffedShortfallBuilder();
  set shortfall(ClinicUnderstaffedShortfallBuilder? shortfall) =>
      _$this._shortfall = shortfall;

  ListBuilder<ClinicUnderStaffedAdvisoryAffectedTemplatesInner>?
  _affectedTemplates;
  ListBuilder<ClinicUnderStaffedAdvisoryAffectedTemplatesInner>
  get affectedTemplates => _$this._affectedTemplates ??=
      ListBuilder<ClinicUnderStaffedAdvisoryAffectedTemplatesInner>();
  set affectedTemplates(
    ListBuilder<ClinicUnderStaffedAdvisoryAffectedTemplatesInner>?
    affectedTemplates,
  ) => _$this._affectedTemplates = affectedTemplates;

  ClinicUnderStaffedAdvisoryBuilder() {
    ClinicUnderStaffedAdvisory._defaults(this);
  }

  ClinicUnderStaffedAdvisoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _underStaffed = $v.underStaffed;
      _shortfall = $v.shortfall?.toBuilder();
      _affectedTemplates = $v.affectedTemplates?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicUnderStaffedAdvisory other) {
    _$v = other as _$ClinicUnderStaffedAdvisory;
  }

  @override
  void update(void Function(ClinicUnderStaffedAdvisoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicUnderStaffedAdvisory build() => _build();

  _$ClinicUnderStaffedAdvisory _build() {
    _$ClinicUnderStaffedAdvisory _$result;
    try {
      _$result =
          _$v ??
          _$ClinicUnderStaffedAdvisory._(
            underStaffed: underStaffed,
            shortfall: _shortfall?.build(),
            affectedTemplates: _affectedTemplates?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'shortfall';
        _shortfall?.build();
        _$failedField = 'affectedTemplates';
        _affectedTemplates?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ClinicUnderStaffedAdvisory',
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
