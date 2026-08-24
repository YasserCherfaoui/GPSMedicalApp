// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_review_for_clinic.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppointmentReviewForClinic extends AppointmentReviewForClinic {
  @override
  final String? id;
  @override
  final String? appointmentId;
  @override
  final String? clinicId;
  @override
  final String? patientId;
  @override
  final int? rating;
  @override
  final String? comment;
  @override
  final DateTime? createdAt;

  factory _$AppointmentReviewForClinic([
    void Function(AppointmentReviewForClinicBuilder)? updates,
  ]) => (AppointmentReviewForClinicBuilder()..update(updates))._build();

  _$AppointmentReviewForClinic._({
    this.id,
    this.appointmentId,
    this.clinicId,
    this.patientId,
    this.rating,
    this.comment,
    this.createdAt,
  }) : super._();
  @override
  AppointmentReviewForClinic rebuild(
    void Function(AppointmentReviewForClinicBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  AppointmentReviewForClinicBuilder toBuilder() =>
      AppointmentReviewForClinicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppointmentReviewForClinic &&
        id == other.id &&
        appointmentId == other.appointmentId &&
        clinicId == other.clinicId &&
        patientId == other.patientId &&
        rating == other.rating &&
        comment == other.comment &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, clinicId.hashCode);
    _$hash = $jc(_$hash, patientId.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppointmentReviewForClinic')
          ..add('id', id)
          ..add('appointmentId', appointmentId)
          ..add('clinicId', clinicId)
          ..add('patientId', patientId)
          ..add('rating', rating)
          ..add('comment', comment)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class AppointmentReviewForClinicBuilder
    implements
        Builder<AppointmentReviewForClinic, AppointmentReviewForClinicBuilder> {
  _$AppointmentReviewForClinic? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  String? _clinicId;
  String? get clinicId => _$this._clinicId;
  set clinicId(String? clinicId) => _$this._clinicId = clinicId;

  String? _patientId;
  String? get patientId => _$this._patientId;
  set patientId(String? patientId) => _$this._patientId = patientId;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  AppointmentReviewForClinicBuilder() {
    AppointmentReviewForClinic._defaults(this);
  }

  AppointmentReviewForClinicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _appointmentId = $v.appointmentId;
      _clinicId = $v.clinicId;
      _patientId = $v.patientId;
      _rating = $v.rating;
      _comment = $v.comment;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppointmentReviewForClinic other) {
    _$v = other as _$AppointmentReviewForClinic;
  }

  @override
  void update(void Function(AppointmentReviewForClinicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppointmentReviewForClinic build() => _build();

  _$AppointmentReviewForClinic _build() {
    final _$result =
        _$v ??
        _$AppointmentReviewForClinic._(
          id: id,
          appointmentId: appointmentId,
          clinicId: clinicId,
          patientId: patientId,
          rating: rating,
          comment: comment,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
