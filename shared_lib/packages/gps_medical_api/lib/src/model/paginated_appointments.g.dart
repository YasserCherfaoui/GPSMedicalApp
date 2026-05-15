// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_appointments.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedAppointments extends PaginatedAppointments {
  @override
  final BuiltList<Appointment>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedAppointments([
    void Function(PaginatedAppointmentsBuilder)? updates,
  ]) => (PaginatedAppointmentsBuilder()..update(updates))._build();

  _$PaginatedAppointments._({this.data, this.meta}) : super._();
  @override
  PaginatedAppointments rebuild(
    void Function(PaginatedAppointmentsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedAppointmentsBuilder toBuilder() =>
      PaginatedAppointmentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedAppointments &&
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
    return (newBuiltValueToStringHelper(r'PaginatedAppointments')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedAppointmentsBuilder
    implements Builder<PaginatedAppointments, PaginatedAppointmentsBuilder> {
  _$PaginatedAppointments? _$v;

  ListBuilder<Appointment>? _data;
  ListBuilder<Appointment> get data =>
      _$this._data ??= ListBuilder<Appointment>();
  set data(ListBuilder<Appointment>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedAppointmentsBuilder() {
    PaginatedAppointments._defaults(this);
  }

  PaginatedAppointmentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedAppointments other) {
    _$v = other as _$PaginatedAppointments;
  }

  @override
  void update(void Function(PaginatedAppointmentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedAppointments build() => _build();

  _$PaginatedAppointments _build() {
    _$PaginatedAppointments _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedAppointments._(data: _data?.build(), meta: _meta?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedAppointments',
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
