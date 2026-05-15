//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_doctors_doctor_id_verify_post_request.g.dart';

/// AdminDoctorsDoctorIdVerifyPostRequest
///
/// Properties:
/// * [decision]
/// * [comment]
@BuiltValue()
abstract class AdminDoctorsDoctorIdVerifyPostRequest
    implements
        Built<
          AdminDoctorsDoctorIdVerifyPostRequest,
          AdminDoctorsDoctorIdVerifyPostRequestBuilder
        > {
  @BuiltValueField(wireName: r'decision')
  AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum get decision;
  // enum decisionEnum {  approved,  rejected,  more_info,  };

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  AdminDoctorsDoctorIdVerifyPostRequest._();

  factory AdminDoctorsDoctorIdVerifyPostRequest([
    void updates(AdminDoctorsDoctorIdVerifyPostRequestBuilder b),
  ]) = _$AdminDoctorsDoctorIdVerifyPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminDoctorsDoctorIdVerifyPostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminDoctorsDoctorIdVerifyPostRequest> get serializer =>
      _$AdminDoctorsDoctorIdVerifyPostRequestSerializer();
}

class _$AdminDoctorsDoctorIdVerifyPostRequestSerializer
    implements PrimitiveSerializer<AdminDoctorsDoctorIdVerifyPostRequest> {
  @override
  final Iterable<Type> types = const [
    AdminDoctorsDoctorIdVerifyPostRequest,
    _$AdminDoctorsDoctorIdVerifyPostRequest,
  ];

  @override
  final String wireName = r'AdminDoctorsDoctorIdVerifyPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminDoctorsDoctorIdVerifyPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'decision';
    yield serializers.serialize(
      object.decision,
      specifiedType: const FullType(
        AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum,
      ),
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
    AdminDoctorsDoctorIdVerifyPostRequest object, {
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
    required AdminDoctorsDoctorIdVerifyPostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'decision':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum,
                    ),
                  )
                  as AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum;
          result.decision = valueDes;
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
  AdminDoctorsDoctorIdVerifyPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminDoctorsDoctorIdVerifyPostRequestBuilder();
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

class AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'approved')
  static const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum approved =
      _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_approved;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum rejected =
      _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_rejected;
  @BuiltValueEnumConst(wireName: r'more_info')
  static const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum moreInfo =
      _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_moreInfo;

  static Serializer<AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum>
  get serializer =>
      _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnumSerializer;

  const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum._(String name)
    : super(name);

  static BuiltSet<AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum>
  get values => _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnumValues;
  static AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum valueOf(
    String name,
  ) => _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnumValueOf(name);
}
