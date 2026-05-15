// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationMeta extends PaginationMeta {
  @override
  final int? page;
  @override
  final int? pageSize;
  @override
  final int? total;
  @override
  final int? totalPages;

  factory _$PaginationMeta([void Function(PaginationMetaBuilder)? updates]) =>
      (PaginationMetaBuilder()..update(updates))._build();

  _$PaginationMeta._({this.page, this.pageSize, this.total, this.totalPages})
    : super._();
  @override
  PaginationMeta rebuild(void Function(PaginationMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationMetaBuilder toBuilder() => PaginationMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationMeta &&
        page == other.page &&
        pageSize == other.pageSize &&
        total == other.total &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, totalPages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginationMeta')
          ..add('page', page)
          ..add('pageSize', pageSize)
          ..add('total', total)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class PaginationMetaBuilder
    implements Builder<PaginationMeta, PaginationMetaBuilder> {
  _$PaginationMeta? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  PaginationMetaBuilder() {
    PaginationMeta._defaults(this);
  }

  PaginationMetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _pageSize = $v.pageSize;
      _total = $v.total;
      _totalPages = $v.totalPages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginationMeta other) {
    _$v = other as _$PaginationMeta;
  }

  @override
  void update(void Function(PaginationMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationMeta build() => _build();

  _$PaginationMeta _build() {
    final _$result =
        _$v ??
        _$PaginationMeta._(
          page: page,
          pageSize: pageSize,
          total: total,
          totalPages: totalPages,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
