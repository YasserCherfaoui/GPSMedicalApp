// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_clinic_reviews.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedClinicReviews extends PaginatedClinicReviews {
  @override
  final BuiltList<ClinicReview>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedClinicReviews([
    void Function(PaginatedClinicReviewsBuilder)? updates,
  ]) => (PaginatedClinicReviewsBuilder()..update(updates))._build();

  _$PaginatedClinicReviews._({this.data, this.meta}) : super._();
  @override
  PaginatedClinicReviews rebuild(
    void Function(PaginatedClinicReviewsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedClinicReviewsBuilder toBuilder() =>
      PaginatedClinicReviewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedClinicReviews &&
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
    return (newBuiltValueToStringHelper(r'PaginatedClinicReviews')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedClinicReviewsBuilder
    implements Builder<PaginatedClinicReviews, PaginatedClinicReviewsBuilder> {
  _$PaginatedClinicReviews? _$v;

  ListBuilder<ClinicReview>? _data;
  ListBuilder<ClinicReview> get data =>
      _$this._data ??= ListBuilder<ClinicReview>();
  set data(ListBuilder<ClinicReview>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedClinicReviewsBuilder() {
    PaginatedClinicReviews._defaults(this);
  }

  PaginatedClinicReviewsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedClinicReviews other) {
    _$v = other as _$PaginatedClinicReviews;
  }

  @override
  void update(void Function(PaginatedClinicReviewsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedClinicReviews build() => _build();

  _$PaginatedClinicReviews _build() {
    _$PaginatedClinicReviews _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedClinicReviews._(
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
          r'PaginatedClinicReviews',
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
