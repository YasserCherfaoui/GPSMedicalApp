// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_doctors.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedDoctors extends PaginatedDoctors {
  @override
  final BuiltList<Doctor>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedDoctors([
    void Function(PaginatedDoctorsBuilder)? updates,
  ]) => (PaginatedDoctorsBuilder()..update(updates))._build();

  _$PaginatedDoctors._({this.data, this.meta}) : super._();
  @override
  PaginatedDoctors rebuild(void Function(PaginatedDoctorsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedDoctorsBuilder toBuilder() =>
      PaginatedDoctorsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedDoctors &&
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
    return (newBuiltValueToStringHelper(r'PaginatedDoctors')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedDoctorsBuilder
    implements Builder<PaginatedDoctors, PaginatedDoctorsBuilder> {
  _$PaginatedDoctors? _$v;

  ListBuilder<Doctor>? _data;
  ListBuilder<Doctor> get data => _$this._data ??= ListBuilder<Doctor>();
  set data(ListBuilder<Doctor>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedDoctorsBuilder() {
    PaginatedDoctors._defaults(this);
  }

  PaginatedDoctorsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedDoctors other) {
    _$v = other as _$PaginatedDoctors;
  }

  @override
  void update(void Function(PaginatedDoctorsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedDoctors build() => _build();

  _$PaginatedDoctors _build() {
    _$PaginatedDoctors _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedDoctors._(data: _data?.build(), meta: _meta?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedDoctors',
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
