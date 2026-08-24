//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verify_clinic_request.g.dart';

/// VerifyClinicRequest
///
/// Properties:
/// * [decision] 
/// * [comment] 
@BuiltValue()
abstract class VerifyClinicRequest implements Built<VerifyClinicRequest, VerifyClinicRequestBuilder> {
  @BuiltValueField(wireName: r'decision')
  VerifyClinicRequestDecisionEnum get decision;
  // enum decisionEnum {  approved,  rejected,  more_info,  };

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  VerifyClinicRequest._();

  factory VerifyClinicRequest([void updates(VerifyClinicRequestBuilder b)]) = _$VerifyClinicRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VerifyClinicRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VerifyClinicRequest> get serializer => _$VerifyClinicRequestSerializer();
}

class _$VerifyClinicRequestSerializer implements PrimitiveSerializer<VerifyClinicRequest> {
  @override
  final Iterable<Type> types = const [VerifyClinicRequest, _$VerifyClinicRequest];

  @override
  final String wireName = r'VerifyClinicRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VerifyClinicRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'decision';
    yield serializers.serialize(
      object.decision,
      specifiedType: const FullType(VerifyClinicRequestDecisionEnum),
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
    VerifyClinicRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VerifyClinicRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'decision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VerifyClinicRequestDecisionEnum),
          ) as VerifyClinicRequestDecisionEnum;
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
  VerifyClinicRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VerifyClinicRequestBuilder();
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

class VerifyClinicRequestDecisionEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'approved')
  static const VerifyClinicRequestDecisionEnum approved = _$verifyClinicRequestDecisionEnum_approved;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const VerifyClinicRequestDecisionEnum rejected = _$verifyClinicRequestDecisionEnum_rejected;
  @BuiltValueEnumConst(wireName: r'more_info')
  static const VerifyClinicRequestDecisionEnum moreInfo = _$verifyClinicRequestDecisionEnum_moreInfo;

  static Serializer<VerifyClinicRequestDecisionEnum> get serializer => _$verifyClinicRequestDecisionEnumSerializer;

  const VerifyClinicRequestDecisionEnum._(String name): super(name);

  static BuiltSet<VerifyClinicRequestDecisionEnum> get values => _$verifyClinicRequestDecisionEnumValues;
  static VerifyClinicRequestDecisionEnum valueOf(String name) => _$verifyClinicRequestDecisionEnumValueOf(name);
}

