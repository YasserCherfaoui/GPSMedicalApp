// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PrescriptionItem extends PrescriptionItem {
  @override
  final String drugName;
  @override
  final String? activeIngredient;
  @override
  final String dosage;
  @override
  final String frequency;
  @override
  final int durationDays;
  @override
  final String? instructions;

  factory _$PrescriptionItem([
    void Function(PrescriptionItemBuilder)? updates,
  ]) => (PrescriptionItemBuilder()..update(updates))._build();

  _$PrescriptionItem._({
    required this.drugName,
    this.activeIngredient,
    required this.dosage,
    required this.frequency,
    required this.durationDays,
    this.instructions,
  }) : super._();
  @override
  PrescriptionItem rebuild(void Function(PrescriptionItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrescriptionItemBuilder toBuilder() =>
      PrescriptionItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrescriptionItem &&
        drugName == other.drugName &&
        activeIngredient == other.activeIngredient &&
        dosage == other.dosage &&
        frequency == other.frequency &&
        durationDays == other.durationDays &&
        instructions == other.instructions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, drugName.hashCode);
    _$hash = $jc(_$hash, activeIngredient.hashCode);
    _$hash = $jc(_$hash, dosage.hashCode);
    _$hash = $jc(_$hash, frequency.hashCode);
    _$hash = $jc(_$hash, durationDays.hashCode);
    _$hash = $jc(_$hash, instructions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PrescriptionItem')
          ..add('drugName', drugName)
          ..add('activeIngredient', activeIngredient)
          ..add('dosage', dosage)
          ..add('frequency', frequency)
          ..add('durationDays', durationDays)
          ..add('instructions', instructions))
        .toString();
  }
}

class PrescriptionItemBuilder
    implements Builder<PrescriptionItem, PrescriptionItemBuilder> {
  _$PrescriptionItem? _$v;

  String? _drugName;
  String? get drugName => _$this._drugName;
  set drugName(String? drugName) => _$this._drugName = drugName;

  String? _activeIngredient;
  String? get activeIngredient => _$this._activeIngredient;
  set activeIngredient(String? activeIngredient) =>
      _$this._activeIngredient = activeIngredient;

  String? _dosage;
  String? get dosage => _$this._dosage;
  set dosage(String? dosage) => _$this._dosage = dosage;

  String? _frequency;
  String? get frequency => _$this._frequency;
  set frequency(String? frequency) => _$this._frequency = frequency;

  int? _durationDays;
  int? get durationDays => _$this._durationDays;
  set durationDays(int? durationDays) => _$this._durationDays = durationDays;

  String? _instructions;
  String? get instructions => _$this._instructions;
  set instructions(String? instructions) => _$this._instructions = instructions;

  PrescriptionItemBuilder() {
    PrescriptionItem._defaults(this);
  }

  PrescriptionItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _drugName = $v.drugName;
      _activeIngredient = $v.activeIngredient;
      _dosage = $v.dosage;
      _frequency = $v.frequency;
      _durationDays = $v.durationDays;
      _instructions = $v.instructions;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrescriptionItem other) {
    _$v = other as _$PrescriptionItem;
  }

  @override
  void update(void Function(PrescriptionItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PrescriptionItem build() => _build();

  _$PrescriptionItem _build() {
    final _$result =
        _$v ??
        _$PrescriptionItem._(
          drugName: BuiltValueNullFieldError.checkNotNull(
            drugName,
            r'PrescriptionItem',
            'drugName',
          ),
          activeIngredient: activeIngredient,
          dosage: BuiltValueNullFieldError.checkNotNull(
            dosage,
            r'PrescriptionItem',
            'dosage',
          ),
          frequency: BuiltValueNullFieldError.checkNotNull(
            frequency,
            r'PrescriptionItem',
            'frequency',
          ),
          durationDays: BuiltValueNullFieldError.checkNotNull(
            durationDays,
            r'PrescriptionItem',
            'durationDays',
          ),
          instructions: instructions,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
