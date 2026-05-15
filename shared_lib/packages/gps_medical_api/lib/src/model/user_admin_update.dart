//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_admin_update.g.dart';

/// UserAdminUpdate
///
/// Properties:
/// * [status]
/// * [suspendedUntil]
/// * [suspensionReason]
/// * [role]
@BuiltValue()
abstract class UserAdminUpdate
    implements Built<UserAdminUpdate, UserAdminUpdateBuilder> {
  @BuiltValueField(wireName: r'status')
  UserAdminUpdateStatusEnum? get status;
  // enum statusEnum {  active,  suspended,  };

  @BuiltValueField(wireName: r'suspended_until')
  DateTime? get suspendedUntil;

  @BuiltValueField(wireName: r'suspension_reason')
  String? get suspensionReason;

  @BuiltValueField(wireName: r'role')
  UserAdminUpdateRoleEnum? get role;
  // enum roleEnum {  patient,  specialist,  concierge,  admin,  moderator,  };

  UserAdminUpdate._();

  factory UserAdminUpdate([void updates(UserAdminUpdateBuilder b)]) =
      _$UserAdminUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserAdminUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserAdminUpdate> get serializer =>
      _$UserAdminUpdateSerializer();
}

class _$UserAdminUpdateSerializer
    implements PrimitiveSerializer<UserAdminUpdate> {
  @override
  final Iterable<Type> types = const [UserAdminUpdate, _$UserAdminUpdate];

  @override
  final String wireName = r'UserAdminUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserAdminUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(UserAdminUpdateStatusEnum),
      );
    }
    if (object.suspendedUntil != null) {
      yield r'suspended_until';
      yield serializers.serialize(
        object.suspendedUntil,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.suspensionReason != null) {
      yield r'suspension_reason';
      yield serializers.serialize(
        object.suspensionReason,
        specifiedType: const FullType(String),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(UserAdminUpdateRoleEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserAdminUpdate object, {
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
    required UserAdminUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(UserAdminUpdateStatusEnum),
                  )
                  as UserAdminUpdateStatusEnum;
          result.status = valueDes;
          break;
        case r'suspended_until':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.suspendedUntil = valueDes;
          break;
        case r'suspension_reason':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.suspensionReason = valueDes;
          break;
        case r'role':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(UserAdminUpdateRoleEnum),
                  )
                  as UserAdminUpdateRoleEnum;
          result.role = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserAdminUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserAdminUpdateBuilder();
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

class UserAdminUpdateStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'active')
  static const UserAdminUpdateStatusEnum active =
      _$userAdminUpdateStatusEnum_active;
  @BuiltValueEnumConst(wireName: r'suspended')
  static const UserAdminUpdateStatusEnum suspended =
      _$userAdminUpdateStatusEnum_suspended;

  static Serializer<UserAdminUpdateStatusEnum> get serializer =>
      _$userAdminUpdateStatusEnumSerializer;

  const UserAdminUpdateStatusEnum._(String name) : super(name);

  static BuiltSet<UserAdminUpdateStatusEnum> get values =>
      _$userAdminUpdateStatusEnumValues;
  static UserAdminUpdateStatusEnum valueOf(String name) =>
      _$userAdminUpdateStatusEnumValueOf(name);
}

class UserAdminUpdateRoleEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'patient')
  static const UserAdminUpdateRoleEnum patient =
      _$userAdminUpdateRoleEnum_patient;
  @BuiltValueEnumConst(wireName: r'specialist')
  static const UserAdminUpdateRoleEnum specialist =
      _$userAdminUpdateRoleEnum_specialist;
  @BuiltValueEnumConst(wireName: r'concierge')
  static const UserAdminUpdateRoleEnum concierge =
      _$userAdminUpdateRoleEnum_concierge;
  @BuiltValueEnumConst(wireName: r'admin')
  static const UserAdminUpdateRoleEnum admin = _$userAdminUpdateRoleEnum_admin;
  @BuiltValueEnumConst(wireName: r'moderator')
  static const UserAdminUpdateRoleEnum moderator =
      _$userAdminUpdateRoleEnum_moderator;

  static Serializer<UserAdminUpdateRoleEnum> get serializer =>
      _$userAdminUpdateRoleEnumSerializer;

  const UserAdminUpdateRoleEnum._(String name) : super(name);

  static BuiltSet<UserAdminUpdateRoleEnum> get values =>
      _$userAdminUpdateRoleEnumValues;
  static UserAdminUpdateRoleEnum valueOf(String name) =>
      _$userAdminUpdateRoleEnumValueOf(name);
}
