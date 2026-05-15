//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/user.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_admin.g.dart';

/// UserAdmin
///
/// Properties:
/// * [id]
/// * [phone] - Numéro algérien au format E.164
/// * [email]
/// * [role]
/// * [fullName]
/// * [status]
/// * [createdAt]
/// * [lastLoginAt]
/// * [loginCount]
/// * [suspendedUntil]
/// * [suspensionReason]
@BuiltValue()
abstract class UserAdmin implements User, Built<UserAdmin, UserAdminBuilder> {
  @BuiltValueField(wireName: r'suspended_until')
  DateTime? get suspendedUntil;

  @BuiltValueField(wireName: r'last_login_at')
  DateTime? get lastLoginAt;

  @BuiltValueField(wireName: r'suspension_reason')
  String? get suspensionReason;

  @BuiltValueField(wireName: r'login_count')
  int? get loginCount;

  UserAdmin._();

  factory UserAdmin([void updates(UserAdminBuilder b)]) = _$UserAdmin;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserAdminBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserAdmin> get serializer => _$UserAdminSerializer();
}

class _$UserAdminSerializer implements PrimitiveSerializer<UserAdmin> {
  @override
  final Iterable<Type> types = const [UserAdmin, _$UserAdmin];

  @override
  final String wireName = r'UserAdmin';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserAdmin object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.suspendedUntil != null) {
      yield r'suspended_until';
      yield serializers.serialize(
        object.suspendedUntil,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.lastLoginAt != null) {
      yield r'last_login_at';
      yield serializers.serialize(
        object.lastLoginAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(UserRoleEnum),
      );
    }
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
        specifiedType: const FullType(String),
      );
    }
    if (object.suspensionReason != null) {
      yield r'suspension_reason';
      yield serializers.serialize(
        object.suspensionReason,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(String),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.loginCount != null) {
      yield r'login_count';
      yield serializers.serialize(
        object.loginCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(UserStatusEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserAdmin object, {
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
    required UserAdminBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'created_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.createdAt = valueDes;
          break;
        case r'suspended_until':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(DateTime),
                  )
                  as DateTime?;
          if (valueDes == null) continue;
          result.suspendedUntil = valueDes;
          break;
        case r'last_login_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.lastLoginAt = valueDes;
          break;
        case r'role':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(UserRoleEnum),
                  )
                  as UserRoleEnum;
          result.role = valueDes;
          break;
        case r'phone':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.phone = valueDes;
          break;
        case r'suspension_reason':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.suspensionReason = valueDes;
          break;
        case r'full_name':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.fullName = valueDes;
          break;
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        case r'login_count':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.loginCount = valueDes;
          break;
        case r'email':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.email = valueDes;
          break;
        case r'status':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(UserStatusEnum),
                  )
                  as UserStatusEnum;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserAdmin deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserAdminBuilder();
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

class UserAdminRoleEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'patient')
  static const UserAdminRoleEnum patient = _$userAdminRoleEnum_patient;
  @BuiltValueEnumConst(wireName: r'specialist')
  static const UserAdminRoleEnum specialist = _$userAdminRoleEnum_specialist;
  @BuiltValueEnumConst(wireName: r'concierge')
  static const UserAdminRoleEnum concierge = _$userAdminRoleEnum_concierge;
  @BuiltValueEnumConst(wireName: r'admin')
  static const UserAdminRoleEnum admin = _$userAdminRoleEnum_admin;
  @BuiltValueEnumConst(wireName: r'moderator')
  static const UserAdminRoleEnum moderator = _$userAdminRoleEnum_moderator;

  static Serializer<UserAdminRoleEnum> get serializer =>
      _$userAdminRoleEnumSerializer;

  const UserAdminRoleEnum._(String name) : super(name);

  static BuiltSet<UserAdminRoleEnum> get values => _$userAdminRoleEnumValues;
  static UserAdminRoleEnum valueOf(String name) =>
      _$userAdminRoleEnumValueOf(name);
}

class UserAdminStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'pending_verification')
  static const UserAdminStatusEnum pendingVerification =
      _$userAdminStatusEnum_pendingVerification;
  @BuiltValueEnumConst(wireName: r'active')
  static const UserAdminStatusEnum active = _$userAdminStatusEnum_active;
  @BuiltValueEnumConst(wireName: r'suspended')
  static const UserAdminStatusEnum suspended = _$userAdminStatusEnum_suspended;
  @BuiltValueEnumConst(wireName: r'deleted')
  static const UserAdminStatusEnum deleted = _$userAdminStatusEnum_deleted;

  static Serializer<UserAdminStatusEnum> get serializer =>
      _$userAdminStatusEnumSerializer;

  const UserAdminStatusEnum._(String name) : super(name);

  static BuiltSet<UserAdminStatusEnum> get values =>
      _$userAdminStatusEnumValues;
  static UserAdminStatusEnum valueOf(String name) =>
      _$userAdminStatusEnumValueOf(name);
}
