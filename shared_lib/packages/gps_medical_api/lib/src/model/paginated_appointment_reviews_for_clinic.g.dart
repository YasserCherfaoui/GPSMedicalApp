// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_appointment_reviews_for_clinic.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedAppointmentReviewsForClinic
    extends PaginatedAppointmentReviewsForClinic {
  @override
  final BuiltList<AppointmentReviewForClinic>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedAppointmentReviewsForClinic([
    void Function(PaginatedAppointmentReviewsForClinicBuilder)? updates,
  ]) =>
      (PaginatedAppointmentReviewsForClinicBuilder()..update(updates))._build();

  _$PaginatedAppointmentReviewsForClinic._({this.data, this.meta}) : super._();
  @override
  PaginatedAppointmentReviewsForClinic rebuild(
    void Function(PaginatedAppointmentReviewsForClinicBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedAppointmentReviewsForClinicBuilder toBuilder() =>
      PaginatedAppointmentReviewsForClinicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedAppointmentReviewsForClinic &&
        data == other.data &&
        meta == other.meta;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginatedAppointmentReviewsForClinic')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedAppointmentReviewsForClinicBuilder
    implements
        Builder<
          PaginatedAppointmentReviewsForClinic,
          PaginatedAppointmentReviewsForClinicBuilder
        > {
  _$PaginatedAppointmentReviewsForClinic? _$v;

  ListBuilder<AppointmentReviewForClinic>? _data;
  ListBuilder<AppointmentReviewForClinic> get data =>
      _$this._data ??= ListBuilder<AppointmentReviewForClinic>();
  set data(ListBuilder<AppointmentReviewForClinic>? data) =>
      _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedAppointmentReviewsForClinicBuilder() {
    PaginatedAppointmentReviewsForClinic._defaults(this);
  }

  PaginatedAppointmentReviewsForClinicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedAppointmentReviewsForClinic other) {
    _$v = other as _$PaginatedAppointmentReviewsForClinic;
  }

  @override
  void update(
    void Function(PaginatedAppointmentReviewsForClinicBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedAppointmentReviewsForClinic build() => _build();

  _$PaginatedAppointmentReviewsForClinic _build() {
    _$PaginatedAppointmentReviewsForClinic _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedAppointmentReviewsForClinic._(
            data: _data?.build(),
            meta: _meta?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedAppointmentReviewsForClinic',
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
