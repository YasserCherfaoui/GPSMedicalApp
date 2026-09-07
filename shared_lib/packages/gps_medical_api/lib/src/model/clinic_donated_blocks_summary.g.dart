// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_donated_blocks_summary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicDonatedBlocksSummary extends ClinicDonatedBlocksSummary {
  @override
  final DateTime windowFrom;
  @override
  final DateTime windowTo;
  @override
  final int activeMembers;
  @override
  final int blockCount;
  @override
  final double donatedHours;

  factory _$ClinicDonatedBlocksSummary([
    void Function(ClinicDonatedBlocksSummaryBuilder)? updates,
  ]) => (ClinicDonatedBlocksSummaryBuilder()..update(updates))._build();

  _$ClinicDonatedBlocksSummary._({
    required this.windowFrom,
    required this.windowTo,
    required this.activeMembers,
    required this.blockCount,
    required this.donatedHours,
  }) : super._();
  @override
  ClinicDonatedBlocksSummary rebuild(
    void Function(ClinicDonatedBlocksSummaryBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicDonatedBlocksSummaryBuilder toBuilder() =>
      ClinicDonatedBlocksSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicDonatedBlocksSummary &&
        windowFrom == other.windowFrom &&
        windowTo == other.windowTo &&
        activeMembers == other.activeMembers &&
        blockCount == other.blockCount &&
        donatedHours == other.donatedHours;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, windowFrom.hashCode);
    _$hash = $jc(_$hash, windowTo.hashCode);
    _$hash = $jc(_$hash, activeMembers.hashCode);
    _$hash = $jc(_$hash, blockCount.hashCode);
    _$hash = $jc(_$hash, donatedHours.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicDonatedBlocksSummary')
          ..add('windowFrom', windowFrom)
          ..add('windowTo', windowTo)
          ..add('activeMembers', activeMembers)
          ..add('blockCount', blockCount)
          ..add('donatedHours', donatedHours))
        .toString();
  }
}

class ClinicDonatedBlocksSummaryBuilder
    implements
        Builder<ClinicDonatedBlocksSummary, ClinicDonatedBlocksSummaryBuilder> {
  _$ClinicDonatedBlocksSummary? _$v;

  DateTime? _windowFrom;
  DateTime? get windowFrom => _$this._windowFrom;
  set windowFrom(DateTime? windowFrom) => _$this._windowFrom = windowFrom;

  DateTime? _windowTo;
  DateTime? get windowTo => _$this._windowTo;
  set windowTo(DateTime? windowTo) => _$this._windowTo = windowTo;

  int? _activeMembers;
  int? get activeMembers => _$this._activeMembers;
  set activeMembers(int? activeMembers) =>
      _$this._activeMembers = activeMembers;

  int? _blockCount;
  int? get blockCount => _$this._blockCount;
  set blockCount(int? blockCount) => _$this._blockCount = blockCount;

  double? _donatedHours;
  double? get donatedHours => _$this._donatedHours;
  set donatedHours(double? donatedHours) => _$this._donatedHours = donatedHours;

  ClinicDonatedBlocksSummaryBuilder() {
    ClinicDonatedBlocksSummary._defaults(this);
  }

  ClinicDonatedBlocksSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _windowFrom = $v.windowFrom;
      _windowTo = $v.windowTo;
      _activeMembers = $v.activeMembers;
      _blockCount = $v.blockCount;
      _donatedHours = $v.donatedHours;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicDonatedBlocksSummary other) {
    _$v = other as _$ClinicDonatedBlocksSummary;
  }

  @override
  void update(void Function(ClinicDonatedBlocksSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicDonatedBlocksSummary build() => _build();

  _$ClinicDonatedBlocksSummary _build() {
    final _$result =
        _$v ??
        _$ClinicDonatedBlocksSummary._(
          windowFrom: BuiltValueNullFieldError.checkNotNull(
            windowFrom,
            r'ClinicDonatedBlocksSummary',
            'windowFrom',
          ),
          windowTo: BuiltValueNullFieldError.checkNotNull(
            windowTo,
            r'ClinicDonatedBlocksSummary',
            'windowTo',
          ),
          activeMembers: BuiltValueNullFieldError.checkNotNull(
            activeMembers,
            r'ClinicDonatedBlocksSummary',
            'activeMembers',
          ),
          blockCount: BuiltValueNullFieldError.checkNotNull(
            blockCount,
            r'ClinicDonatedBlocksSummary',
            'blockCount',
          ),
          donatedHours: BuiltValueNullFieldError.checkNotNull(
            donatedHours,
            r'ClinicDonatedBlocksSummary',
            'donatedHours',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
