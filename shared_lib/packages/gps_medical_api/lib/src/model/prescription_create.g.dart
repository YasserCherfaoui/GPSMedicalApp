// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class PrescriptionCreateBuilder {
  void replace(PrescriptionCreate other);
  void update(void Function(PrescriptionCreateBuilder) updates);
  String? get appointmentId;
  set appointmentId(String? appointmentId);

  String? get diagnosis;
  set diagnosis(String? diagnosis);

  ListBuilder<PrescriptionItem> get items;
  set items(ListBuilder<PrescriptionItem>? items);

  Date? get validUntil;
  set validUntil(Date? validUntil);
}

class _$$PrescriptionCreate extends $PrescriptionCreate {
  @override
  final String appointmentId;
  @override
  final String? diagnosis;
  @override
  final BuiltList<PrescriptionItem> items;
  @override
  final Date? validUntil;

  factory _$$PrescriptionCreate([
    void Function($PrescriptionCreateBuilder)? updates,
  ]) => ($PrescriptionCreateBuilder()..update(updates))._build();

  _$$PrescriptionCreate._({
    required this.appointmentId,
    this.diagnosis,
    required this.items,
    this.validUntil,
  }) : super._();
  @override
  $PrescriptionCreate rebuild(
    void Function($PrescriptionCreateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  $PrescriptionCreateBuilder toBuilder() =>
      $PrescriptionCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $PrescriptionCreate &&
        appointmentId == other.appointmentId &&
        diagnosis == other.diagnosis &&
        items == other.items &&
        validUntil == other.validUntil;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, diagnosis.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, validUntil.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$PrescriptionCreate')
          ..add('appointmentId', appointmentId)
          ..add('diagnosis', diagnosis)
          ..add('items', items)
          ..add('validUntil', validUntil))
        .toString();
  }
}

class $PrescriptionCreateBuilder
    implements
        Builder<$PrescriptionCreate, $PrescriptionCreateBuilder>,
        PrescriptionCreateBuilder {
  _$$PrescriptionCreate? _$v;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(covariant String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  String? _diagnosis;
  String? get diagnosis => _$this._diagnosis;
  set diagnosis(covariant String? diagnosis) => _$this._diagnosis = diagnosis;

  ListBuilder<PrescriptionItem>? _items;
  ListBuilder<PrescriptionItem> get items =>
      _$this._items ??= ListBuilder<PrescriptionItem>();
  set items(covariant ListBuilder<PrescriptionItem>? items) =>
      _$this._items = items;

  Date? _validUntil;
  Date? get validUntil => _$this._validUntil;
  set validUntil(covariant Date? validUntil) => _$this._validUntil = validUntil;

  $PrescriptionCreateBuilder() {
    $PrescriptionCreate._defaults(this);
  }

  $PrescriptionCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appointmentId = $v.appointmentId;
      _diagnosis = $v.diagnosis;
      _items = $v.items.toBuilder();
      _validUntil = $v.validUntil;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $PrescriptionCreate other) {
    _$v = other as _$$PrescriptionCreate;
  }

  @override
  void update(void Function($PrescriptionCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $PrescriptionCreate build() => _build();

  _$$PrescriptionCreate _build() {
    _$$PrescriptionCreate _$result;
    try {
      _$result =
          _$v ??
          _$$PrescriptionCreate._(
            appointmentId: BuiltValueNullFieldError.checkNotNull(
              appointmentId,
              r'$PrescriptionCreate',
              'appointmentId',
            ),
            diagnosis: diagnosis,
            items: items.build(),
            validUntil: validUntil,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'$PrescriptionCreate',
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
