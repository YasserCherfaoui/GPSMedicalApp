// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_clinics.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedClinics extends PaginatedClinics {
  @override
  final BuiltList<Clinic>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedClinics([
    void Function(PaginatedClinicsBuilder)? updates,
  ]) => (PaginatedClinicsBuilder()..update(updates))._build();

  _$PaginatedClinics._({this.data, this.meta}) : super._();
  @override
  PaginatedClinics rebuild(void Function(PaginatedClinicsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedClinicsBuilder toBuilder() =>
      PaginatedClinicsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedClinics &&
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
    return (newBuiltValueToStringHelper(r'PaginatedClinics')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedClinicsBuilder
    implements Builder<PaginatedClinics, PaginatedClinicsBuilder> {
  _$PaginatedClinics? _$v;

  ListBuilder<Clinic>? _data;
  ListBuilder<Clinic> get data => _$this._data ??= ListBuilder<Clinic>();
  set data(ListBuilder<Clinic>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedClinicsBuilder() {
    PaginatedClinics._defaults(this);
  }

  PaginatedClinicsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedClinics other) {
    _$v = other as _$PaginatedClinics;
  }

  @override
  void update(void Function(PaginatedClinicsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedClinics build() => _build();

  _$PaginatedClinics _build() {
    _$PaginatedClinics _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedClinics._(data: _data?.build(), meta: _meta?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedClinics',
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
