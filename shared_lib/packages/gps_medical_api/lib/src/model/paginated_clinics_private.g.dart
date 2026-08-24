// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_clinics_private.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedClinicsPrivate extends PaginatedClinicsPrivate {
  @override
  final BuiltList<ClinicPrivate>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedClinicsPrivate([
    void Function(PaginatedClinicsPrivateBuilder)? updates,
  ]) => (PaginatedClinicsPrivateBuilder()..update(updates))._build();

  _$PaginatedClinicsPrivate._({this.data, this.meta}) : super._();
  @override
  PaginatedClinicsPrivate rebuild(
    void Function(PaginatedClinicsPrivateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedClinicsPrivateBuilder toBuilder() =>
      PaginatedClinicsPrivateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedClinicsPrivate &&
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
    return (newBuiltValueToStringHelper(r'PaginatedClinicsPrivate')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedClinicsPrivateBuilder
    implements
        Builder<PaginatedClinicsPrivate, PaginatedClinicsPrivateBuilder> {
  _$PaginatedClinicsPrivate? _$v;

  ListBuilder<ClinicPrivate>? _data;
  ListBuilder<ClinicPrivate> get data =>
      _$this._data ??= ListBuilder<ClinicPrivate>();
  set data(ListBuilder<ClinicPrivate>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedClinicsPrivateBuilder() {
    PaginatedClinicsPrivate._defaults(this);
  }

  PaginatedClinicsPrivateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedClinicsPrivate other) {
    _$v = other as _$PaginatedClinicsPrivate;
  }

  @override
  void update(void Function(PaginatedClinicsPrivateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedClinicsPrivate build() => _build();

  _$PaginatedClinicsPrivate _build() {
    _$PaginatedClinicsPrivate _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedClinicsPrivate._(
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
          r'PaginatedClinicsPrivate',
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
