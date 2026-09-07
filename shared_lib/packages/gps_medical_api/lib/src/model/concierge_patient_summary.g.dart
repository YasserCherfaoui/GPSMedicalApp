// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_patient_summary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConciergePatientSummary extends ConciergePatientSummary {
  @override
  final String userId;
  @override
  final String fullName;
  @override
  final CountryCode? country;

  factory _$ConciergePatientSummary([
    void Function(ConciergePatientSummaryBuilder)? updates,
  ]) => (ConciergePatientSummaryBuilder()..update(updates))._build();

  _$ConciergePatientSummary._({
    required this.userId,
    required this.fullName,
    this.country,
  }) : super._();
  @override
  ConciergePatientSummary rebuild(
    void Function(ConciergePatientSummaryBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConciergePatientSummaryBuilder toBuilder() =>
      ConciergePatientSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConciergePatientSummary &&
        userId == other.userId &&
        fullName == other.fullName &&
        country == other.country;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConciergePatientSummary')
          ..add('userId', userId)
          ..add('fullName', fullName)
          ..add('country', country))
        .toString();
  }
}

class ConciergePatientSummaryBuilder
    implements
        Builder<ConciergePatientSummary, ConciergePatientSummaryBuilder> {
  _$ConciergePatientSummary? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  CountryCode? _country;
  CountryCode? get country => _$this._country;
  set country(CountryCode? country) => _$this._country = country;

  ConciergePatientSummaryBuilder() {
    ConciergePatientSummary._defaults(this);
  }

  ConciergePatientSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _fullName = $v.fullName;
      _country = $v.country;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConciergePatientSummary other) {
    _$v = other as _$ConciergePatientSummary;
  }

  @override
  void update(void Function(ConciergePatientSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConciergePatientSummary build() => _build();

  _$ConciergePatientSummary _build() {
    final _$result =
        _$v ??
        _$ConciergePatientSummary._(
          userId: BuiltValueNullFieldError.checkNotNull(
            userId,
            r'ConciergePatientSummary',
            'userId',
          ),
          fullName: BuiltValueNullFieldError.checkNotNull(
            fullName,
            r'ConciergePatientSummary',
            'fullName',
          ),
          country: country,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
