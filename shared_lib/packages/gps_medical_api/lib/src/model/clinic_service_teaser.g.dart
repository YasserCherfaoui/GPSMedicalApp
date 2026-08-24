// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_service_teaser.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicServiceTeaser extends ClinicServiceTeaser {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? priceAmount;
  @override
  final CurrencyCode? currency;
  @override
  final int? durationMinutes;

  factory _$ClinicServiceTeaser([
    void Function(ClinicServiceTeaserBuilder)? updates,
  ]) => (ClinicServiceTeaserBuilder()..update(updates))._build();

  _$ClinicServiceTeaser._({
    this.id,
    this.name,
    this.priceAmount,
    this.currency,
    this.durationMinutes,
  }) : super._();
  @override
  ClinicServiceTeaser rebuild(
    void Function(ClinicServiceTeaserBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicServiceTeaserBuilder toBuilder() =>
      ClinicServiceTeaserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicServiceTeaser &&
        id == other.id &&
        name == other.name &&
        priceAmount == other.priceAmount &&
        currency == other.currency &&
        durationMinutes == other.durationMinutes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, priceAmount.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, durationMinutes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicServiceTeaser')
          ..add('id', id)
          ..add('name', name)
          ..add('priceAmount', priceAmount)
          ..add('currency', currency)
          ..add('durationMinutes', durationMinutes))
        .toString();
  }
}

class ClinicServiceTeaserBuilder
    implements Builder<ClinicServiceTeaser, ClinicServiceTeaserBuilder> {
  _$ClinicServiceTeaser? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _priceAmount;
  int? get priceAmount => _$this._priceAmount;
  set priceAmount(int? priceAmount) => _$this._priceAmount = priceAmount;

  CurrencyCode? _currency;
  CurrencyCode? get currency => _$this._currency;
  set currency(CurrencyCode? currency) => _$this._currency = currency;

  int? _durationMinutes;
  int? get durationMinutes => _$this._durationMinutes;
  set durationMinutes(int? durationMinutes) =>
      _$this._durationMinutes = durationMinutes;

  ClinicServiceTeaserBuilder() {
    ClinicServiceTeaser._defaults(this);
  }

  ClinicServiceTeaserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _priceAmount = $v.priceAmount;
      _currency = $v.currency;
      _durationMinutes = $v.durationMinutes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicServiceTeaser other) {
    _$v = other as _$ClinicServiceTeaser;
  }

  @override
  void update(void Function(ClinicServiceTeaserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicServiceTeaser build() => _build();

  _$ClinicServiceTeaser _build() {
    final _$result =
        _$v ??
        _$ClinicServiceTeaser._(
          id: id,
          name: name,
          priceAmount: priceAmount,
          currency: currency,
          durationMinutes: durationMinutes,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
