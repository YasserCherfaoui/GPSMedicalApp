// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_reviews.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedReviews extends PaginatedReviews {
  @override
  final BuiltList<Review>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedReviews([
    void Function(PaginatedReviewsBuilder)? updates,
  ]) => (PaginatedReviewsBuilder()..update(updates))._build();

  _$PaginatedReviews._({this.data, this.meta}) : super._();
  @override
  PaginatedReviews rebuild(void Function(PaginatedReviewsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedReviewsBuilder toBuilder() =>
      PaginatedReviewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedReviews &&
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
    return (newBuiltValueToStringHelper(r'PaginatedReviews')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedReviewsBuilder
    implements Builder<PaginatedReviews, PaginatedReviewsBuilder> {
  _$PaginatedReviews? _$v;

  ListBuilder<Review>? _data;
  ListBuilder<Review> get data => _$this._data ??= ListBuilder<Review>();
  set data(ListBuilder<Review>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedReviewsBuilder() {
    PaginatedReviews._defaults(this);
  }

  PaginatedReviewsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedReviews other) {
    _$v = other as _$PaginatedReviews;
  }

  @override
  void update(void Function(PaginatedReviewsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedReviews build() => _build();

  _$PaginatedReviews _build() {
    _$PaginatedReviews _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedReviews._(data: _data?.build(), meta: _meta?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedReviews',
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
