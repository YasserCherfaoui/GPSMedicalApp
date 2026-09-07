//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/country_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'concierge_account.g.dart';

/// ConciergeAccount
///
/// Properties:
/// * [userId] 
/// * [phone] 
/// * [email] 
/// * [fullName] 
/// * [country] 
/// * [status] 
/// * [role] 
/// * [openCaseCount] 
/// * [createdAt] 
@BuiltValue()
abstract class ConciergeAccount implements Built<ConciergeAccount, ConciergeAccountBuilder> {
  @BuiltValueField(wireName: r'user_id')
  String get userId;

  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'full_name')
  String get fullName;

  @BuiltValueField(wireName: r'country')
  CountryCode get country;
  // enum countryEnum {  DZ,  TN,  AT,  BE,  BG,  HR,  CY,  CZ,  DK,  EE,  FI,  FR,  DE,  GR,  HU,  IE,  IT,  LV,  LT,  LU,  MT,  NL,  PL,  PT,  RO,  SK,  SI,  ES,  SE,  };

  @BuiltValueField(wireName: r'status')
  ConciergeAccountStatusEnum get status;
  // enum statusEnum {  active,  suspended,  };

  @BuiltValueField(wireName: r'role')
  ConciergeAccountRoleEnum get role;
  // enum roleEnum {  concierge,  };

  @BuiltValueField(wireName: r'open_case_count')
  int? get openCaseCount;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  ConciergeAccount._();

  factory ConciergeAccount([void updates(ConciergeAccountBuilder b)]) = _$ConciergeAccount;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConciergeAccountBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConciergeAccount> get serializer => _$ConciergeAccountSerializer();
}

class _$ConciergeAccountSerializer implements PrimitiveSerializer<ConciergeAccount> {
  @override
  final Iterable<Type> types = const [ConciergeAccount, _$ConciergeAccount];

  @override
  final String wireName = r'ConciergeAccount';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConciergeAccount object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
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
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'full_name';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    yield r'country';
    yield serializers.serialize(
      object.country,
      specifiedType: const FullType(CountryCode),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ConciergeAccountStatusEnum),
    );
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(ConciergeAccountRoleEnum),
    );
    if (object.openCaseCount != null) {
      yield r'open_case_count';
      yield serializers.serialize(
        object.openCaseCount,
        specifiedType: const FullType(int),
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
    ConciergeAccount object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConciergeAccountBuilder result,
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
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CountryCode),
          ) as CountryCode;
          result.country = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConciergeAccountStatusEnum),
          ) as ConciergeAccountStatusEnum;
          result.status = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConciergeAccountRoleEnum),
          ) as ConciergeAccountRoleEnum;
          result.role = valueDes;
          break;
        case r'open_case_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.openCaseCount = valueDes;
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
  ConciergeAccount deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConciergeAccountBuilder();
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

class ConciergeAccountStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'active')
  static const ConciergeAccountStatusEnum active = _$conciergeAccountStatusEnum_active;
  @BuiltValueEnumConst(wireName: r'suspended')
  static const ConciergeAccountStatusEnum suspended = _$conciergeAccountStatusEnum_suspended;

  static Serializer<ConciergeAccountStatusEnum> get serializer => _$conciergeAccountStatusEnumSerializer;

  const ConciergeAccountStatusEnum._(String name): super(name);

  static BuiltSet<ConciergeAccountStatusEnum> get values => _$conciergeAccountStatusEnumValues;
  static ConciergeAccountStatusEnum valueOf(String name) => _$conciergeAccountStatusEnumValueOf(name);
}

class ConciergeAccountRoleEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'concierge')
  static const ConciergeAccountRoleEnum concierge = _$conciergeAccountRoleEnum_concierge;

  static Serializer<ConciergeAccountRoleEnum> get serializer => _$conciergeAccountRoleEnumSerializer;

  const ConciergeAccountRoleEnum._(String name): super(name);

  static BuiltSet<ConciergeAccountRoleEnum> get values => _$conciergeAccountRoleEnumValues;
  static ConciergeAccountRoleEnum valueOf(String name) => _$conciergeAccountRoleEnumValueOf(name);
}

