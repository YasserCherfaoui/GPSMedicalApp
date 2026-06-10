// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_user_admin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedUserAdmin extends PaginatedUserAdmin {
  @override
  final BuiltList<UserAdmin>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedUserAdmin([
    void Function(PaginatedUserAdminBuilder)? updates,
  ]) => (PaginatedUserAdminBuilder()..update(updates))._build();

  _$PaginatedUserAdmin._({this.data, this.meta}) : super._();
  @override
  PaginatedUserAdmin rebuild(
    void Function(PaginatedUserAdminBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedUserAdminBuilder toBuilder() =>
      PaginatedUserAdminBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedUserAdmin &&
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
    return (newBuiltValueToStringHelper(r'PaginatedUserAdmin')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedUserAdminBuilder
    implements Builder<PaginatedUserAdmin, PaginatedUserAdminBuilder> {
  _$PaginatedUserAdmin? _$v;

  ListBuilder<UserAdmin>? _data;
  ListBuilder<UserAdmin> get data => _$this._data ??= ListBuilder<UserAdmin>();
  set data(ListBuilder<UserAdmin>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedUserAdminBuilder() {
    PaginatedUserAdmin._defaults(this);
  }

  PaginatedUserAdminBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedUserAdmin other) {
    _$v = other as _$PaginatedUserAdmin;
  }

  @override
  void update(void Function(PaginatedUserAdminBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedUserAdmin build() => _build();

  _$PaginatedUserAdmin _build() {
    _$PaginatedUserAdmin _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedUserAdmin._(data: _data?.build(), meta: _meta?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedUserAdmin',
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
