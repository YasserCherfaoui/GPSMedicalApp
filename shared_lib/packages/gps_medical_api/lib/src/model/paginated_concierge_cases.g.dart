// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_concierge_cases.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedConciergeCases extends PaginatedConciergeCases {
  @override
  final BuiltList<ConciergeCase> data;
  @override
  final PaginationMeta meta;

  factory _$PaginatedConciergeCases([
    void Function(PaginatedConciergeCasesBuilder)? updates,
  ]) => (PaginatedConciergeCasesBuilder()..update(updates))._build();

  _$PaginatedConciergeCases._({required this.data, required this.meta})
    : super._();
  @override
  PaginatedConciergeCases rebuild(
    void Function(PaginatedConciergeCasesBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedConciergeCasesBuilder toBuilder() =>
      PaginatedConciergeCasesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedConciergeCases &&
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
    return (newBuiltValueToStringHelper(r'PaginatedConciergeCases')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedConciergeCasesBuilder
    implements
        Builder<PaginatedConciergeCases, PaginatedConciergeCasesBuilder> {
  _$PaginatedConciergeCases? _$v;

  ListBuilder<ConciergeCase>? _data;
  ListBuilder<ConciergeCase> get data =>
      _$this._data ??= ListBuilder<ConciergeCase>();
  set data(ListBuilder<ConciergeCase>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedConciergeCasesBuilder() {
    PaginatedConciergeCases._defaults(this);
  }

  PaginatedConciergeCasesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _meta = $v.meta.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedConciergeCases other) {
    _$v = other as _$PaginatedConciergeCases;
  }

  @override
  void update(void Function(PaginatedConciergeCasesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedConciergeCases build() => _build();

  _$PaginatedConciergeCases _build() {
    _$PaginatedConciergeCases _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedConciergeCases._(data: data.build(), meta: meta.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedConciergeCases',
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
