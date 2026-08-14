//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verify_doctor_request.g.dart';

/// VerifyDoctorRequest
///
/// Properties:
/// * [decision] 
/// * [comment] 
@BuiltValue()
abstract class VerifyDoctorRequest implements Built<VerifyDoctorRequest, VerifyDoctorRequestBuilder> {
  @BuiltValueField(wireName: r'decision')
  VerifyDoctorRequestDecisionEnum get decision;
  // enum decisionEnum {  approved,  rejected,  more_info,  };

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  VerifyDoctorRequest._();

  factory VerifyDoctorRequest([void updates(VerifyDoctorRequestBuilder b)]) = _$VerifyDoctorRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VerifyDoctorRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VerifyDoctorRequest> get serializer => _$VerifyDoctorRequestSerializer();
}

class _$VerifyDoctorRequestSerializer implements PrimitiveSerializer<VerifyDoctorRequest> {
  @override
  final Iterable<Type> types = const [VerifyDoctorRequest, _$VerifyDoctorRequest];

  @override
  final String wireName = r'VerifyDoctorRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VerifyDoctorRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'decision';
    yield serializers.serialize(
      object.decision,
      specifiedType: const FullType(VerifyDoctorRequestDecisionEnum),
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
    VerifyDoctorRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VerifyDoctorRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'decision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VerifyDoctorRequestDecisionEnum),
          ) as VerifyDoctorRequestDecisionEnum;
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
  VerifyDoctorRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VerifyDoctorRequestBuilder();
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

class VerifyDoctorRequestDecisionEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'approved')
  static const VerifyDoctorRequestDecisionEnum approved = _$verifyDoctorRequestDecisionEnum_approved;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const VerifyDoctorRequestDecisionEnum rejected = _$verifyDoctorRequestDecisionEnum_rejected;
  @BuiltValueEnumConst(wireName: r'more_info')
  static const VerifyDoctorRequestDecisionEnum moreInfo = _$verifyDoctorRequestDecisionEnum_moreInfo;

  static Serializer<VerifyDoctorRequestDecisionEnum> get serializer => _$verifyDoctorRequestDecisionEnumSerializer;

  const VerifyDoctorRequestDecisionEnum._(String name): super(name);

  static BuiltSet<VerifyDoctorRequestDecisionEnum> get values => _$verifyDoctorRequestDecisionEnumValues;
  static VerifyDoctorRequestDecisionEnum valueOf(String name) => _$verifyDoctorRequestDecisionEnumValueOf(name);
}

