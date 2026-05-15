// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewUpdate extends ReviewUpdate {
  @override
  final int? rating;
  @override
  final String? comment;

  factory _$ReviewUpdate([void Function(ReviewUpdateBuilder)? updates]) =>
      (ReviewUpdateBuilder()..update(updates))._build();

  _$ReviewUpdate._({this.rating, this.comment}) : super._();
  @override
  ReviewUpdate rebuild(void Function(ReviewUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewUpdateBuilder toBuilder() => ReviewUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewUpdate &&
        rating == other.rating &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewUpdate')
          ..add('rating', rating)
          ..add('comment', comment))
        .toString();
  }
}

class ReviewUpdateBuilder
    implements Builder<ReviewUpdate, ReviewUpdateBuilder> {
  _$ReviewUpdate? _$v;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ReviewUpdateBuilder() {
    ReviewUpdate._defaults(this);
  }

  ReviewUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rating = $v.rating;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewUpdate other) {
    _$v = other as _$ReviewUpdate;
  }

  @override
  void update(void Function(ReviewUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewUpdate build() => _build();

  _$ReviewUpdate _build() {
    final _$result = _$v ?? _$ReviewUpdate._(rating: rating, comment: comment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
