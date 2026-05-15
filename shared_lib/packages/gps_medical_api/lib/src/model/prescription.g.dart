// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Prescription extends Prescription {
  @override
  final String? doctorId;
  @override
  final String? patientId;
  @override
  final String? id;
  @override
  final DateTime? issuedAt;
  @override
  final String? pdfDocumentId;
  @override
  final String appointmentId;
  @override
  final String? diagnosis;
  @override
  final BuiltList<PrescriptionItem> items;
  @override
  final Date? validUntil;

  factory _$Prescription([void Function(PrescriptionBuilder)? updates]) =>
      (PrescriptionBuilder()..update(updates))._build();

  _$Prescription._({
    this.doctorId,
    this.patientId,
    this.id,
    this.issuedAt,
    this.pdfDocumentId,
    required this.appointmentId,
    this.diagnosis,
    required this.items,
    this.validUntil,
  }) : super._();
  @override
  Prescription rebuild(void Function(PrescriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrescriptionBuilder toBuilder() => PrescriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Prescription &&
        doctorId == other.doctorId &&
        patientId == other.patientId &&
        id == other.id &&
        issuedAt == other.issuedAt &&
        pdfDocumentId == other.pdfDocumentId &&
        appointmentId == other.appointmentId &&
        diagnosis == other.diagnosis &&
        items == other.items &&
        validUntil == other.validUntil;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, patientId.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, issuedAt.hashCode);
    _$hash = $jc(_$hash, pdfDocumentId.hashCode);
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, diagnosis.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, validUntil.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Prescription')
          ..add('doctorId', doctorId)
          ..add('patientId', patientId)
          ..add('id', id)
          ..add('issuedAt', issuedAt)
          ..add('pdfDocumentId', pdfDocumentId)
          ..add('appointmentId', appointmentId)
          ..add('diagnosis', diagnosis)
          ..add('items', items)
          ..add('validUntil', validUntil))
        .toString();
  }
}

class PrescriptionBuilder
    implements
        Builder<Prescription, PrescriptionBuilder>,
        PrescriptionCreateBuilder {
  _$Prescription? _$v;

  String? _doctorId;
  String? get doctorId => _$this._doctorId;
  set doctorId(covariant String? doctorId) => _$this._doctorId = doctorId;

  String? _patientId;
  String? get patientId => _$this._patientId;
  set patientId(covariant String? patientId) => _$this._patientId = patientId;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  DateTime? _issuedAt;
  DateTime? get issuedAt => _$this._issuedAt;
  set issuedAt(covariant DateTime? issuedAt) => _$this._issuedAt = issuedAt;

  String? _pdfDocumentId;
  String? get pdfDocumentId => _$this._pdfDocumentId;
  set pdfDocumentId(covariant String? pdfDocumentId) =>
      _$this._pdfDocumentId = pdfDocumentId;

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

  PrescriptionBuilder() {
    Prescription._defaults(this);
  }

  PrescriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctorId = $v.doctorId;
      _patientId = $v.patientId;
      _id = $v.id;
      _issuedAt = $v.issuedAt;
      _pdfDocumentId = $v.pdfDocumentId;
      _appointmentId = $v.appointmentId;
      _diagnosis = $v.diagnosis;
      _items = $v.items.toBuilder();
      _validUntil = $v.validUntil;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Prescription other) {
    _$v = other as _$Prescription;
  }

  @override
  void update(void Function(PrescriptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Prescription build() => _build();

  _$Prescription _build() {
    _$Prescription _$result;
    try {
      _$result =
          _$v ??
          _$Prescription._(
            doctorId: doctorId,
            patientId: patientId,
            id: id,
            issuedAt: issuedAt,
            pdfDocumentId: pdfDocumentId,
            appointmentId: BuiltValueNullFieldError.checkNotNull(
              appointmentId,
              r'Prescription',
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
          r'Prescription',
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
