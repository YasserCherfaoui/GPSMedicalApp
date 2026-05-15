// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_threads.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedThreads extends PaginatedThreads {
  @override
  final BuiltList<Thread>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedThreads([
    void Function(PaginatedThreadsBuilder)? updates,
  ]) => (PaginatedThreadsBuilder()..update(updates))._build();

  _$PaginatedThreads._({this.data, this.meta}) : super._();
  @override
  PaginatedThreads rebuild(void Function(PaginatedThreadsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedThreadsBuilder toBuilder() =>
      PaginatedThreadsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedThreads &&
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
    return (newBuiltValueToStringHelper(r'PaginatedThreads')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedThreadsBuilder
    implements Builder<PaginatedThreads, PaginatedThreadsBuilder> {
  _$PaginatedThreads? _$v;

  ListBuilder<Thread>? _data;
  ListBuilder<Thread> get data => _$this._data ??= ListBuilder<Thread>();
  set data(ListBuilder<Thread>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedThreadsBuilder() {
    PaginatedThreads._defaults(this);
  }

  PaginatedThreadsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedThreads other) {
    _$v = other as _$PaginatedThreads;
  }

  @override
  void update(void Function(PaginatedThreadsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedThreads build() => _build();

  _$PaginatedThreads _build() {
    _$PaginatedThreads _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedThreads._(data: _data?.build(), meta: _meta?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedThreads',
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
