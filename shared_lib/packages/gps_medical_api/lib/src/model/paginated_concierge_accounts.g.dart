// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_concierge_accounts.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedConciergeAccounts extends PaginatedConciergeAccounts {
  @override
  final BuiltList<ConciergeAccount> data;
  @override
  final PaginationMeta meta;

  factory _$PaginatedConciergeAccounts([
    void Function(PaginatedConciergeAccountsBuilder)? updates,
  ]) => (PaginatedConciergeAccountsBuilder()..update(updates))._build();

  _$PaginatedConciergeAccounts._({required this.data, required this.meta})
    : super._();
  @override
  PaginatedConciergeAccounts rebuild(
    void Function(PaginatedConciergeAccountsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedConciergeAccountsBuilder toBuilder() =>
      PaginatedConciergeAccountsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedConciergeAccounts &&
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
    return (newBuiltValueToStringHelper(r'PaginatedConciergeAccounts')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedConciergeAccountsBuilder
    implements
        Builder<PaginatedConciergeAccounts, PaginatedConciergeAccountsBuilder> {
  _$PaginatedConciergeAccounts? _$v;

  ListBuilder<ConciergeAccount>? _data;
  ListBuilder<ConciergeAccount> get data =>
      _$this._data ??= ListBuilder<ConciergeAccount>();
  set data(ListBuilder<ConciergeAccount>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedConciergeAccountsBuilder() {
    PaginatedConciergeAccounts._defaults(this);
  }

  PaginatedConciergeAccountsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _meta = $v.meta.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedConciergeAccounts other) {
    _$v = other as _$PaginatedConciergeAccounts;
  }

  @override
  void update(void Function(PaginatedConciergeAccountsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedConciergeAccounts build() => _build();

  _$PaginatedConciergeAccounts _build() {
    _$PaginatedConciergeAccounts _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedConciergeAccounts._(
            data: data.build(),
            meta: meta.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedConciergeAccounts',
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
