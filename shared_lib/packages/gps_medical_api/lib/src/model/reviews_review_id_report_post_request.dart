//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reviews_review_id_report_post_request.g.dart';

/// ReviewsReviewIdReportPostRequest
///
/// Properties:
/// * [reason]
/// * [comment]
@BuiltValue()
abstract class ReviewsReviewIdReportPostRequest
    implements
        Built<
          ReviewsReviewIdReportPostRequest,
          ReviewsReviewIdReportPostRequestBuilder
        > {
  @BuiltValueField(wireName: r'reason')
  ReviewsReviewIdReportPostRequestReasonEnum get reason;
  // enum reasonEnum {  spam,  insult,  defamation,  off_topic,  other,  };

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  ReviewsReviewIdReportPostRequest._();

  factory ReviewsReviewIdReportPostRequest([
    void updates(ReviewsReviewIdReportPostRequestBuilder b),
  ]) = _$ReviewsReviewIdReportPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewsReviewIdReportPostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewsReviewIdReportPostRequest> get serializer =>
      _$ReviewsReviewIdReportPostRequestSerializer();
}

class _$ReviewsReviewIdReportPostRequestSerializer
    implements PrimitiveSerializer<ReviewsReviewIdReportPostRequest> {
  @override
  final Iterable<Type> types = const [
    ReviewsReviewIdReportPostRequest,
    _$ReviewsReviewIdReportPostRequest,
  ];

  @override
  final String wireName = r'ReviewsReviewIdReportPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewsReviewIdReportPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(ReviewsReviewIdReportPostRequestReasonEnum),
    );
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewsReviewIdReportPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReviewsReviewIdReportPostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reason':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      ReviewsReviewIdReportPostRequestReasonEnum,
                    ),
                  )
                  as ReviewsReviewIdReportPostRequestReasonEnum;
          result.reason = valueDes;
          break;
        case r'comment':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.comment = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReviewsReviewIdReportPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewsReviewIdReportPostRequestBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class ReviewsReviewIdReportPostRequestReasonEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'spam')
  static const ReviewsReviewIdReportPostRequestReasonEnum spam =
      _$reviewsReviewIdReportPostRequestReasonEnum_spam;
  @BuiltValueEnumConst(wireName: r'insult')
  static const ReviewsReviewIdReportPostRequestReasonEnum insult =
      _$reviewsReviewIdReportPostRequestReasonEnum_insult;
  @BuiltValueEnumConst(wireName: r'defamation')
  static const ReviewsReviewIdReportPostRequestReasonEnum defamation =
      _$reviewsReviewIdReportPostRequestReasonEnum_defamation;
  @BuiltValueEnumConst(wireName: r'off_topic')
  static const ReviewsReviewIdReportPostRequestReasonEnum offTopic =
      _$reviewsReviewIdReportPostRequestReasonEnum_offTopic;
  @BuiltValueEnumConst(wireName: r'other')
  static const ReviewsReviewIdReportPostRequestReasonEnum other =
      _$reviewsReviewIdReportPostRequestReasonEnum_other;

  static Serializer<ReviewsReviewIdReportPostRequestReasonEnum>
  get serializer => _$reviewsReviewIdReportPostRequestReasonEnumSerializer;

  const ReviewsReviewIdReportPostRequestReasonEnum._(String name) : super(name);

  static BuiltSet<ReviewsReviewIdReportPostRequestReasonEnum> get values =>
      _$reviewsReviewIdReportPostRequestReasonEnumValues;
  static ReviewsReviewIdReportPostRequestReasonEnum valueOf(String name) =>
      _$reviewsReviewIdReportPostRequestReasonEnumValueOf(name);
}
