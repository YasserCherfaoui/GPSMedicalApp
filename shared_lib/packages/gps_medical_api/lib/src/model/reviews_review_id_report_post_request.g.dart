// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_review_id_report_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReviewsReviewIdReportPostRequestReasonEnum
_$reviewsReviewIdReportPostRequestReasonEnum_spam =
    const ReviewsReviewIdReportPostRequestReasonEnum._('spam');
const ReviewsReviewIdReportPostRequestReasonEnum
_$reviewsReviewIdReportPostRequestReasonEnum_insult =
    const ReviewsReviewIdReportPostRequestReasonEnum._('insult');
const ReviewsReviewIdReportPostRequestReasonEnum
_$reviewsReviewIdReportPostRequestReasonEnum_defamation =
    const ReviewsReviewIdReportPostRequestReasonEnum._('defamation');
const ReviewsReviewIdReportPostRequestReasonEnum
_$reviewsReviewIdReportPostRequestReasonEnum_offTopic =
    const ReviewsReviewIdReportPostRequestReasonEnum._('offTopic');
const ReviewsReviewIdReportPostRequestReasonEnum
_$reviewsReviewIdReportPostRequestReasonEnum_other =
    const ReviewsReviewIdReportPostRequestReasonEnum._('other');

ReviewsReviewIdReportPostRequestReasonEnum
_$reviewsReviewIdReportPostRequestReasonEnumValueOf(String name) {
  switch (name) {
    case 'spam':
      return _$reviewsReviewIdReportPostRequestReasonEnum_spam;
    case 'insult':
      return _$reviewsReviewIdReportPostRequestReasonEnum_insult;
    case 'defamation':
      return _$reviewsReviewIdReportPostRequestReasonEnum_defamation;
    case 'offTopic':
      return _$reviewsReviewIdReportPostRequestReasonEnum_offTopic;
    case 'other':
      return _$reviewsReviewIdReportPostRequestReasonEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewsReviewIdReportPostRequestReasonEnum>
_$reviewsReviewIdReportPostRequestReasonEnumValues =
    BuiltSet<ReviewsReviewIdReportPostRequestReasonEnum>(
      const <ReviewsReviewIdReportPostRequestReasonEnum>[
        _$reviewsReviewIdReportPostRequestReasonEnum_spam,
        _$reviewsReviewIdReportPostRequestReasonEnum_insult,
        _$reviewsReviewIdReportPostRequestReasonEnum_defamation,
        _$reviewsReviewIdReportPostRequestReasonEnum_offTopic,
        _$reviewsReviewIdReportPostRequestReasonEnum_other,
      ],
    );

Serializer<ReviewsReviewIdReportPostRequestReasonEnum>
_$reviewsReviewIdReportPostRequestReasonEnumSerializer =
    _$ReviewsReviewIdReportPostRequestReasonEnumSerializer();

class _$ReviewsReviewIdReportPostRequestReasonEnumSerializer
    implements PrimitiveSerializer<ReviewsReviewIdReportPostRequestReasonEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'spam': 'spam',
    'insult': 'insult',
    'defamation': 'defamation',
    'offTopic': 'off_topic',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'spam': 'spam',
    'insult': 'insult',
    'defamation': 'defamation',
    'off_topic': 'offTopic',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ReviewsReviewIdReportPostRequestReasonEnum,
  ];
  @override
  final String wireName = 'ReviewsReviewIdReportPostRequestReasonEnum';

  @override
  Object serialize(
    Serializers serializers,
    ReviewsReviewIdReportPostRequestReasonEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ReviewsReviewIdReportPostRequestReasonEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ReviewsReviewIdReportPostRequestReasonEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ReviewsReviewIdReportPostRequest
    extends ReviewsReviewIdReportPostRequest {
  @override
  final ReviewsReviewIdReportPostRequestReasonEnum reason;
  @override
  final String? comment;

  factory _$ReviewsReviewIdReportPostRequest([
    void Function(ReviewsReviewIdReportPostRequestBuilder)? updates,
  ]) => (ReviewsReviewIdReportPostRequestBuilder()..update(updates))._build();

  _$ReviewsReviewIdReportPostRequest._({required this.reason, this.comment})
    : super._();
  @override
  ReviewsReviewIdReportPostRequest rebuild(
    void Function(ReviewsReviewIdReportPostRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ReviewsReviewIdReportPostRequestBuilder toBuilder() =>
      ReviewsReviewIdReportPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewsReviewIdReportPostRequest &&
        reason == other.reason &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewsReviewIdReportPostRequest')
          ..add('reason', reason)
          ..add('comment', comment))
        .toString();
  }
}

class ReviewsReviewIdReportPostRequestBuilder
    implements
        Builder<
          ReviewsReviewIdReportPostRequest,
          ReviewsReviewIdReportPostRequestBuilder
        > {
  _$ReviewsReviewIdReportPostRequest? _$v;

  ReviewsReviewIdReportPostRequestReasonEnum? _reason;
  ReviewsReviewIdReportPostRequestReasonEnum? get reason => _$this._reason;
  set reason(ReviewsReviewIdReportPostRequestReasonEnum? reason) =>
      _$this._reason = reason;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ReviewsReviewIdReportPostRequestBuilder() {
    ReviewsReviewIdReportPostRequest._defaults(this);
  }

  ReviewsReviewIdReportPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reason = $v.reason;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewsReviewIdReportPostRequest other) {
    _$v = other as _$ReviewsReviewIdReportPostRequest;
  }

  @override
  void update(void Function(ReviewsReviewIdReportPostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewsReviewIdReportPostRequest build() => _build();

  _$ReviewsReviewIdReportPostRequest _build() {
    final _$result =
        _$v ??
        _$ReviewsReviewIdReportPostRequest._(
          reason: BuiltValueNullFieldError.checkNotNull(
            reason,
            r'ReviewsReviewIdReportPostRequest',
            'reason',
          ),
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
