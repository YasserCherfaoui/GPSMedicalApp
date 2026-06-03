//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

/// User
///
/// Properties:
/// * [id] 
/// * [phone] - Numéro algérien au format E.164
/// * [email] 
/// * [role] 
/// * [fullName] 
/// * [status] 
/// * [createdAt] 
@BuiltValue(instantiable: false)
abstract class User  {
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Numéro algérien au format E.164
  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'role')
  UserRoleEnum? get role;
  // enum roleEnum {  patient,  specialist,  concierge,  admin,  moderator,  };

  @BuiltValueField(wireName: r'full_name')
  String? get fullName;

  @BuiltValueField(wireName: r'status')
  UserStatusEnum? get status;
  // enum statusEnum {  pending_verification,  active,  suspended,  deleted,  };

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  @BuiltValueSerializer(custom: true)
  static Serializer<User> get serializer => _$UserSerializer();
}

class _$UserSerializer implements PrimitiveSerializer<User> {
  @override
  final Iterable<Type> types = const [User];

  @override
  final String wireName = r'User';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    User object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
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
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(UserRoleEnum),
      );
    }
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
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
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    User object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  User deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($User)) as $User;
  }
}

/// a concrete implementation of [User], since [User] is not instantiable
@BuiltValue(instantiable: true)
abstract class $User implements User, Built<$User, $UserBuilder> {
  $User._();

  factory $User([void Function($UserBuilder)? updates]) = _$$User;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($UserBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$User> get serializer => _$$UserSerializer();
}

class _$$UserSerializer implements PrimitiveSerializer<$User> {
  @override
  final Iterable<Type> types = const [$User, _$$User];

  @override
  final String wireName = r'$User';

  @override
  Object serialize(
    Serializers serializers,
    $User object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(User))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserRoleEnum),
          ) as UserRoleEnum;
          result.role = valueDes;
          break;
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserStatusEnum),
          ) as UserStatusEnum;
          result.status = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $User deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $UserBuilder();
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

class UserRoleEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'patient')
  static const UserRoleEnum patient = _$userRoleEnum_patient;
  @BuiltValueEnumConst(wireName: r'specialist')
  static const UserRoleEnum specialist = _$userRoleEnum_specialist;
  @BuiltValueEnumConst(wireName: r'concierge')
  static const UserRoleEnum concierge = _$userRoleEnum_concierge;
  @BuiltValueEnumConst(wireName: r'admin')
  static const UserRoleEnum admin = _$userRoleEnum_admin;
  @BuiltValueEnumConst(wireName: r'moderator')
  static const UserRoleEnum moderator = _$userRoleEnum_moderator;

  static Serializer<UserRoleEnum> get serializer => _$userRoleEnumSerializer;

  const UserRoleEnum._(String name): super(name);

  static BuiltSet<UserRoleEnum> get values => _$userRoleEnumValues;
  static UserRoleEnum valueOf(String name) => _$userRoleEnumValueOf(name);
}

class UserStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending_verification')
  static const UserStatusEnum pendingVerification = _$userStatusEnum_pendingVerification;
  @BuiltValueEnumConst(wireName: r'active')
  static const UserStatusEnum active = _$userStatusEnum_active;
  @BuiltValueEnumConst(wireName: r'suspended')
  static const UserStatusEnum suspended = _$userStatusEnum_suspended;
  @BuiltValueEnumConst(wireName: r'deleted')
  static const UserStatusEnum deleted = _$userStatusEnum_deleted;

  static Serializer<UserStatusEnum> get serializer => _$userStatusEnumSerializer;

  const UserStatusEnum._(String name): super(name);

  static BuiltSet<UserStatusEnum> get values => _$userStatusEnumValues;
  static UserStatusEnum valueOf(String name) => _$userStatusEnumValueOf(name);
}

