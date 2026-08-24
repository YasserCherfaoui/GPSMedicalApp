//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'patch_doctor_membership_request.g.dart';

/// PatchDoctorMembershipRequest
///
/// Properties:
/// * [visibleOnProfile] 
@BuiltValue()
abstract class PatchDoctorMembershipRequest implements Built<PatchDoctorMembershipRequest, PatchDoctorMembershipRequestBuilder> {
  @BuiltValueField(wireName: r'visible_on_profile')
  bool get visibleOnProfile;

  PatchDoctorMembershipRequest._();

  factory PatchDoctorMembershipRequest([void updates(PatchDoctorMembershipRequestBuilder b)]) = _$PatchDoctorMembershipRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PatchDoctorMembershipRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PatchDoctorMembershipRequest> get serializer => _$PatchDoctorMembershipRequestSerializer();
}

class _$PatchDoctorMembershipRequestSerializer implements PrimitiveSerializer<PatchDoctorMembershipRequest> {
  @override
  final Iterable<Type> types = const [PatchDoctorMembershipRequest, _$PatchDoctorMembershipRequest];

  @override
  final String wireName = r'PatchDoctorMembershipRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PatchDoctorMembershipRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'visible_on_profile';
    yield serializers.serialize(
      object.visibleOnProfile,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PatchDoctorMembershipRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PatchDoctorMembershipRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'visible_on_profile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.visibleOnProfile = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PatchDoctorMembershipRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PatchDoctorMembershipRequestBuilder();
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

