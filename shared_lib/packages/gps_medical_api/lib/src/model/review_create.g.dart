// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewCreate extends ReviewCreate {
  @override
  final String appointmentId;
  @override
  final int rating;
  @override
  final String? comment;

  factory _$ReviewCreate([void Function(ReviewCreateBuilder)? updates]) =>
      (ReviewCreateBuilder()..update(updates))._build();

  _$ReviewCreate._({
    required this.appointmentId,
    required this.rating,
    this.comment,
  }) : super._();
  @override
  ReviewCreate rebuild(void Function(ReviewCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewCreateBuilder toBuilder() => ReviewCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewCreate &&
        appointmentId == other.appointmentId &&
        rating == other.rating &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewCreate')
          ..add('appointmentId', appointmentId)
          ..add('rating', rating)
          ..add('comment', comment))
        .toString();
  }
}

class ReviewCreateBuilder
    implements Builder<ReviewCreate, ReviewCreateBuilder> {
  _$ReviewCreate? _$v;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ReviewCreateBuilder() {
    ReviewCreate._defaults(this);
  }

  ReviewCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appointmentId = $v.appointmentId;
      _rating = $v.rating;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewCreate other) {
    _$v = other as _$ReviewCreate;
  }

  @override
  void update(void Function(ReviewCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewCreate build() => _build();

  _$ReviewCreate _build() {
    final _$result =
        _$v ??
        _$ReviewCreate._(
          appointmentId: BuiltValueNullFieldError.checkNotNull(
            appointmentId,
            r'ReviewCreate',
            'appointmentId',
          ),
          rating: BuiltValueNullFieldError.checkNotNull(
            rating,
            r'ReviewCreate',
            'rating',
          ),
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
