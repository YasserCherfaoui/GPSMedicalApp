//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_reviews_review_id_moderate_post_request.g.dart';

/// AdminReviewsReviewIdModeratePostRequest
///
/// Properties:
/// * [decision] 
/// * [comment] 
@BuiltValue()
abstract class AdminReviewsReviewIdModeratePostRequest implements Built<AdminReviewsReviewIdModeratePostRequest, AdminReviewsReviewIdModeratePostRequestBuilder> {
  @BuiltValueField(wireName: r'decision')
  AdminReviewsReviewIdModeratePostRequestDecisionEnum get decision;
  // enum decisionEnum {  approve,  hide,  delete,  };

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  AdminReviewsReviewIdModeratePostRequest._();

  factory AdminReviewsReviewIdModeratePostRequest([void updates(AdminReviewsReviewIdModeratePostRequestBuilder b)]) = _$AdminReviewsReviewIdModeratePostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminReviewsReviewIdModeratePostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminReviewsReviewIdModeratePostRequest> get serializer => _$AdminReviewsReviewIdModeratePostRequestSerializer();
}

class _$AdminReviewsReviewIdModeratePostRequestSerializer implements PrimitiveSerializer<AdminReviewsReviewIdModeratePostRequest> {
  @override
  final Iterable<Type> types = const [AdminReviewsReviewIdModeratePostRequest, _$AdminReviewsReviewIdModeratePostRequest];

  @override
  final String wireName = r'AdminReviewsReviewIdModeratePostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminReviewsReviewIdModeratePostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'decision';
    yield serializers.serialize(
      object.decision,
      specifiedType: const FullType(AdminReviewsReviewIdModeratePostRequestDecisionEnum),
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
    AdminReviewsReviewIdModeratePostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminReviewsReviewIdModeratePostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'decision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminReviewsReviewIdModeratePostRequestDecisionEnum),
          ) as AdminReviewsReviewIdModeratePostRequestDecisionEnum;
          result.decision = valueDes;
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
  AdminReviewsReviewIdModeratePostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminReviewsReviewIdModeratePostRequestBuilder();
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

class AdminReviewsReviewIdModeratePostRequestDecisionEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'approve')
  static const AdminReviewsReviewIdModeratePostRequestDecisionEnum approve = _$adminReviewsReviewIdModeratePostRequestDecisionEnum_approve;
  @BuiltValueEnumConst(wireName: r'hide')
  static const AdminReviewsReviewIdModeratePostRequestDecisionEnum hide_ = _$adminReviewsReviewIdModeratePostRequestDecisionEnum_hide_;
  @BuiltValueEnumConst(wireName: r'delete')
  static const AdminReviewsReviewIdModeratePostRequestDecisionEnum delete = _$adminReviewsReviewIdModeratePostRequestDecisionEnum_delete;

  static Serializer<AdminReviewsReviewIdModeratePostRequestDecisionEnum> get serializer => _$adminReviewsReviewIdModeratePostRequestDecisionEnumSerializer;

  const AdminReviewsReviewIdModeratePostRequestDecisionEnum._(String name): super(name);

  static BuiltSet<AdminReviewsReviewIdModeratePostRequestDecisionEnum> get values => _$adminReviewsReviewIdModeratePostRequestDecisionEnumValues;
  static AdminReviewsReviewIdModeratePostRequestDecisionEnum valueOf(String name) => _$adminReviewsReviewIdModeratePostRequestDecisionEnumValueOf(name);
}

