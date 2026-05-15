//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'credential.g.dart';

/// Credential
///
/// Properties:
/// * [id]
/// * [type]
/// * [fileUrl]
/// * [issuedYear]
/// * [status]
/// * [reviewedAt]
@BuiltValue()
abstract class Credential implements Built<Credential, CredentialBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'type')
  CredentialTypeEnum? get type;
  // enum typeEnum {  diploma,  council_card,  specialty_cert,  other,  };

  @BuiltValueField(wireName: r'file_url')
  String? get fileUrl;

  @BuiltValueField(wireName: r'issued_year')
  int? get issuedYear;

  @BuiltValueField(wireName: r'status')
  CredentialStatusEnum? get status;
  // enum statusEnum {  pending,  approved,  rejected,  };

  @BuiltValueField(wireName: r'reviewed_at')
  DateTime? get reviewedAt;

  Credential._();

  factory Credential([void updates(CredentialBuilder b)]) = _$Credential;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CredentialBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Credential> get serializer => _$CredentialSerializer();
}

class _$CredentialSerializer implements PrimitiveSerializer<Credential> {
  @override
  final Iterable<Type> types = const [Credential, _$Credential];

  @override
  final String wireName = r'Credential';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Credential object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(CredentialTypeEnum),
      );
    }
    if (object.fileUrl != null) {
      yield r'file_url';
      yield serializers.serialize(
        object.fileUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.issuedYear != null) {
      yield r'issued_year';
      yield serializers.serialize(
        object.issuedYear,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(CredentialStatusEnum),
      );
    }
    if (object.reviewedAt != null) {
      yield r'reviewed_at';
      yield serializers.serialize(
        object.reviewedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Credential object, {
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
    required CredentialBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        case r'type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(CredentialTypeEnum),
                  )
                  as CredentialTypeEnum;
          result.type = valueDes;
          break;
        case r'file_url':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.fileUrl = valueDes;
          break;
        case r'issued_year':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.issuedYear = valueDes;
          break;
        case r'status':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(CredentialStatusEnum),
                  )
                  as CredentialStatusEnum;
          result.status = valueDes;
          break;
        case r'reviewed_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(DateTime),
                  )
                  as DateTime?;
          if (valueDes == null) continue;
          result.reviewedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Credential deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CredentialBuilder();
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

class CredentialTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'diploma')
  static const CredentialTypeEnum diploma = _$credentialTypeEnum_diploma;
  @BuiltValueEnumConst(wireName: r'council_card')
  static const CredentialTypeEnum councilCard =
      _$credentialTypeEnum_councilCard;
  @BuiltValueEnumConst(wireName: r'specialty_cert')
  static const CredentialTypeEnum specialtyCert =
      _$credentialTypeEnum_specialtyCert;
  @BuiltValueEnumConst(wireName: r'other')
  static const CredentialTypeEnum other = _$credentialTypeEnum_other;

  static Serializer<CredentialTypeEnum> get serializer =>
      _$credentialTypeEnumSerializer;

  const CredentialTypeEnum._(String name) : super(name);

  static BuiltSet<CredentialTypeEnum> get values => _$credentialTypeEnumValues;
  static CredentialTypeEnum valueOf(String name) =>
      _$credentialTypeEnumValueOf(name);
}

class CredentialStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'pending')
  static const CredentialStatusEnum pending = _$credentialStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'approved')
  static const CredentialStatusEnum approved = _$credentialStatusEnum_approved;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const CredentialStatusEnum rejected = _$credentialStatusEnum_rejected;

  static Serializer<CredentialStatusEnum> get serializer =>
      _$credentialStatusEnumSerializer;

  const CredentialStatusEnum._(String name) : super(name);

  static BuiltSet<CredentialStatusEnum> get values =>
      _$credentialStatusEnumValues;
  static CredentialStatusEnum valueOf(String name) =>
      _$credentialStatusEnumValueOf(name);
}
