//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_staff_member.g.dart';

/// ClinicStaffMember
///
/// Properties:
/// * [userId] 
/// * [role] 
/// * [fullName] 
/// * [email] 
@BuiltValue()
abstract class ClinicStaffMember implements Built<ClinicStaffMember, ClinicStaffMemberBuilder> {
  @BuiltValueField(wireName: r'user_id')
  String? get userId;

  @BuiltValueField(wireName: r'role')
  ClinicStaffMemberRoleEnum? get role;
  // enum roleEnum {  clinic_owner,  clinic_admin,  };

  @BuiltValueField(wireName: r'full_name')
  String? get fullName;

  @BuiltValueField(wireName: r'email')
  String? get email;

  ClinicStaffMember._();

  factory ClinicStaffMember([void updates(ClinicStaffMemberBuilder b)]) = _$ClinicStaffMember;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicStaffMemberBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicStaffMember> get serializer => _$ClinicStaffMemberSerializer();
}

class _$ClinicStaffMemberSerializer implements PrimitiveSerializer<ClinicStaffMember> {
  @override
  final Iterable<Type> types = const [ClinicStaffMember, _$ClinicStaffMember];

  @override
  final String wireName = r'ClinicStaffMember';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicStaffMember object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'user_id';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(ClinicStaffMemberRoleEnum),
      );
    }
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicStaffMember object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicStaffMemberBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicStaffMemberRoleEnum),
          ) as ClinicStaffMemberRoleEnum;
          result.role = valueDes;
          break;
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicStaffMember deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicStaffMemberBuilder();
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

class ClinicStaffMemberRoleEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'clinic_owner')
  static const ClinicStaffMemberRoleEnum clinicOwner = _$clinicStaffMemberRoleEnum_clinicOwner;
  @BuiltValueEnumConst(wireName: r'clinic_admin')
  static const ClinicStaffMemberRoleEnum clinicAdmin = _$clinicStaffMemberRoleEnum_clinicAdmin;

  static Serializer<ClinicStaffMemberRoleEnum> get serializer => _$clinicStaffMemberRoleEnumSerializer;

  const ClinicStaffMemberRoleEnum._(String name): super(name);

  static BuiltSet<ClinicStaffMemberRoleEnum> get values => _$clinicStaffMemberRoleEnumValues;
  static ClinicStaffMemberRoleEnum valueOf(String name) => _$clinicStaffMemberRoleEnumValueOf(name);
}

