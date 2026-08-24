// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_earnings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicEarnings extends ClinicEarnings {
  @override
  final Date? from;
  @override
  final Date? to;
  @override
  final int? completedSessions;
  @override
  final int? amountPayable;
  @override
  final CurrencyCode? currency;
  @override
  final String? note;

  factory _$ClinicEarnings([void Function(ClinicEarningsBuilder)? updates]) =>
      (ClinicEarningsBuilder()..update(updates))._build();

  _$ClinicEarnings._({
    this.from,
    this.to,
    this.completedSessions,
    this.amountPayable,
    this.currency,
    this.note,
  }) : super._();
  @override
  ClinicEarnings rebuild(void Function(ClinicEarningsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicEarningsBuilder toBuilder() => ClinicEarningsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicEarnings &&
        from == other.from &&
        to == other.to &&
        completedSessions == other.completedSessions &&
        amountPayable == other.amountPayable &&
        currency == other.currency &&
        note == other.note;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jc(_$hash, completedSessions.hashCode);
    _$hash = $jc(_$hash, amountPayable.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicEarnings')
          ..add('from', from)
          ..add('to', to)
          ..add('completedSessions', completedSessions)
          ..add('amountPayable', amountPayable)
          ..add('currency', currency)
          ..add('note', note))
        .toString();
  }
}

class ClinicEarningsBuilder
    implements Builder<ClinicEarnings, ClinicEarningsBuilder> {
  _$ClinicEarnings? _$v;

  Date? _from;
  Date? get from => _$this._from;
  set from(Date? from) => _$this._from = from;

  Date? _to;
  Date? get to => _$this._to;
  set to(Date? to) => _$this._to = to;

  int? _completedSessions;
  int? get completedSessions => _$this._completedSessions;
  set completedSessions(int? completedSessions) =>
      _$this._completedSessions = completedSessions;

  int? _amountPayable;
  int? get amountPayable => _$this._amountPayable;
  set amountPayable(int? amountPayable) =>
      _$this._amountPayable = amountPayable;

  CurrencyCode? _currency;
  CurrencyCode? get currency => _$this._currency;
  set currency(CurrencyCode? currency) => _$this._currency = currency;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  ClinicEarningsBuilder() {
    ClinicEarnings._defaults(this);
  }

  ClinicEarningsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _from = $v.from;
      _to = $v.to;
      _completedSessions = $v.completedSessions;
      _amountPayable = $v.amountPayable;
      _currency = $v.currency;
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicEarnings other) {
    _$v = other as _$ClinicEarnings;
  }

  @override
  void update(void Function(ClinicEarningsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicEarnings build() => _build();

  _$ClinicEarnings _build() {
    final _$result =
        _$v ??
        _$ClinicEarnings._(
          from: from,
          to: to,
          completedSessions: completedSessions,
          amountPayable: amountPayable,
          currency: currency,
          note: note,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
