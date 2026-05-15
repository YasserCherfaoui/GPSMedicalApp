// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_doctors_private.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedDoctorsPrivate extends PaginatedDoctorsPrivate {
  @override
  final BuiltList<DoctorPrivate>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedDoctorsPrivate([
    void Function(PaginatedDoctorsPrivateBuilder)? updates,
  ]) => (PaginatedDoctorsPrivateBuilder()..update(updates))._build();

  _$PaginatedDoctorsPrivate._({this.data, this.meta}) : super._();
  @override
  PaginatedDoctorsPrivate rebuild(
    void Function(PaginatedDoctorsPrivateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedDoctorsPrivateBuilder toBuilder() =>
      PaginatedDoctorsPrivateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedDoctorsPrivate &&
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
    return (newBuiltValueToStringHelper(r'PaginatedDoctorsPrivate')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedDoctorsPrivateBuilder
    implements
        Builder<PaginatedDoctorsPrivate, PaginatedDoctorsPrivateBuilder> {
  _$PaginatedDoctorsPrivate? _$v;

  ListBuilder<DoctorPrivate>? _data;
  ListBuilder<DoctorPrivate> get data =>
      _$this._data ??= ListBuilder<DoctorPrivate>();
  set data(ListBuilder<DoctorPrivate>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedDoctorsPrivateBuilder() {
    PaginatedDoctorsPrivate._defaults(this);
  }

  PaginatedDoctorsPrivateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedDoctorsPrivate other) {
    _$v = other as _$PaginatedDoctorsPrivate;
  }

  @override
  void update(void Function(PaginatedDoctorsPrivateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedDoctorsPrivate build() => _build();

  _$PaginatedDoctorsPrivate _build() {
    _$PaginatedDoctorsPrivate _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedDoctorsPrivate._(
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
          r'PaginatedDoctorsPrivate',
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
