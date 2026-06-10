//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_review_request.g.dart';

/// ReportReviewRequest
///
/// Properties:
/// * [reason] 
/// * [comment] 
@BuiltValue()
abstract class ReportReviewRequest implements Built<ReportReviewRequest, ReportReviewRequestBuilder> {
  @BuiltValueField(wireName: r'reason')
  ReportReviewRequestReasonEnum get reason;
  // enum reasonEnum {  spam,  insult,  defamation,  off_topic,  other,  };

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  ReportReviewRequest._();

  factory ReportReviewRequest([void updates(ReportReviewRequestBuilder b)]) = _$ReportReviewRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportReviewRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportReviewRequest> get serializer => _$ReportReviewRequestSerializer();
}

class _$ReportReviewRequestSerializer implements PrimitiveSerializer<ReportReviewRequest> {
  @override
  final Iterable<Type> types = const [ReportReviewRequest, _$ReportReviewRequest];

  @override
  final String wireName = r'ReportReviewRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportReviewRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(ReportReviewRequestReasonEnum),
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
    ReportReviewRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReportReviewRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportReviewRequestReasonEnum),
          ) as ReportReviewRequestReasonEnum;
          result.reason = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
  ReportReviewRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportReviewRequestBuilder();
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

class ReportReviewRequestReasonEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'spam')
  static const ReportReviewRequestReasonEnum spam = _$reportReviewRequestReasonEnum_spam;
  @BuiltValueEnumConst(wireName: r'insult')
  static const ReportReviewRequestReasonEnum insult = _$reportReviewRequestReasonEnum_insult;
  @BuiltValueEnumConst(wireName: r'defamation')
  static const ReportReviewRequestReasonEnum defamation = _$reportReviewRequestReasonEnum_defamation;
  @BuiltValueEnumConst(wireName: r'off_topic')
  static const ReportReviewRequestReasonEnum offTopic = _$reportReviewRequestReasonEnum_offTopic;
  @BuiltValueEnumConst(wireName: r'other')
  static const ReportReviewRequestReasonEnum other = _$reportReviewRequestReasonEnum_other;

  static Serializer<ReportReviewRequestReasonEnum> get serializer => _$reportReviewRequestReasonEnumSerializer;

  const ReportReviewRequestReasonEnum._(String name): super(name);

  static BuiltSet<ReportReviewRequestReasonEnum> get values => _$reportReviewRequestReasonEnumValues;
  static ReportReviewRequestReasonEnum valueOf(String name) => _$reportReviewRequestReasonEnumValueOf(name);
}

