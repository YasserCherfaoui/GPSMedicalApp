//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invite_clinic_membership_request.g.dart';

/// InviteClinicMembershipRequest
///
/// Properties:
/// * [specialistId] 
@BuiltValue()
abstract class InviteClinicMembershipRequest implements Built<InviteClinicMembershipRequest, InviteClinicMembershipRequestBuilder> {
  @BuiltValueField(wireName: r'specialist_id')
  String get specialistId;

  InviteClinicMembershipRequest._();

  factory InviteClinicMembershipRequest([void updates(InviteClinicMembershipRequestBuilder b)]) = _$InviteClinicMembershipRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InviteClinicMembershipRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InviteClinicMembershipRequest> get serializer => _$InviteClinicMembershipRequestSerializer();
}

class _$InviteClinicMembershipRequestSerializer implements PrimitiveSerializer<InviteClinicMembershipRequest> {
  @override
  final Iterable<Type> types = const [InviteClinicMembershipRequest, _$InviteClinicMembershipRequest];

  @override
  final String wireName = r'InviteClinicMembershipRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InviteClinicMembershipRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'specialist_id';
    yield serializers.serialize(
      object.specialistId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InviteClinicMembershipRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InviteClinicMembershipRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'specialist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.specialistId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InviteClinicMembershipRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InviteClinicMembershipRequestBuilder();
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

