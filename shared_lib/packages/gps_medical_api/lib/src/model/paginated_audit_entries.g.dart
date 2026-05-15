// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_audit_entries.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedAuditEntries extends PaginatedAuditEntries {
  @override
  final BuiltList<AuditEntry>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedAuditEntries([
    void Function(PaginatedAuditEntriesBuilder)? updates,
  ]) => (PaginatedAuditEntriesBuilder()..update(updates))._build();

  _$PaginatedAuditEntries._({this.data, this.meta}) : super._();
  @override
  PaginatedAuditEntries rebuild(
    void Function(PaginatedAuditEntriesBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedAuditEntriesBuilder toBuilder() =>
      PaginatedAuditEntriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedAuditEntries &&
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
    return (newBuiltValueToStringHelper(r'PaginatedAuditEntries')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedAuditEntriesBuilder
    implements Builder<PaginatedAuditEntries, PaginatedAuditEntriesBuilder> {
  _$PaginatedAuditEntries? _$v;

  ListBuilder<AuditEntry>? _data;
  ListBuilder<AuditEntry> get data =>
      _$this._data ??= ListBuilder<AuditEntry>();
  set data(ListBuilder<AuditEntry>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedAuditEntriesBuilder() {
    PaginatedAuditEntries._defaults(this);
  }

  PaginatedAuditEntriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedAuditEntries other) {
    _$v = other as _$PaginatedAuditEntries;
  }

  @override
  void update(void Function(PaginatedAuditEntriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedAuditEntries build() => _build();

  _$PaginatedAuditEntries _build() {
    _$PaginatedAuditEntries _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedAuditEntries._(data: _data?.build(), meta: _meta?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedAuditEntries',
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
