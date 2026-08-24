//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_credential.g.dart';

/// ClinicCredential
///
/// Properties:
/// * [id] 
/// * [type] 
/// * [fileUrl] 
/// * [issuedYear] 
/// * [status] 
/// * [reviewedAt] 
@BuiltValue()
abstract class ClinicCredential implements Built<ClinicCredential, ClinicCredentialBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'type')
  ClinicCredentialTypeEnum? get type;
  // enum typeEnum {  registre_commerce,  agrement_sante,  other,  };

  @BuiltValueField(wireName: r'file_url')
  String? get fileUrl;

  @BuiltValueField(wireName: r'issued_year')
  int? get issuedYear;

  @BuiltValueField(wireName: r'status')
  ClinicCredentialStatusEnum? get status;
  // enum statusEnum {  pending,  approved,  rejected,  };

  @BuiltValueField(wireName: r'reviewed_at')
  DateTime? get reviewedAt;

  ClinicCredential._();

  factory ClinicCredential([void updates(ClinicCredentialBuilder b)]) = _$ClinicCredential;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicCredentialBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicCredential> get serializer => _$ClinicCredentialSerializer();
}

class _$ClinicCredentialSerializer implements PrimitiveSerializer<ClinicCredential> {
  @override
  final Iterable<Type> types = const [ClinicCredential, _$ClinicCredential];

  @override
  final String wireName = r'ClinicCredential';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicCredential object, {
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
        specifiedType: const FullType(ClinicCredentialTypeEnum),
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
        specifiedType: const FullType(ClinicCredentialStatusEnum),
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
    ClinicCredential object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicCredentialBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicCredentialTypeEnum),
          ) as ClinicCredentialTypeEnum;
          result.type = valueDes;
          break;
        case r'file_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fileUrl = valueDes;
          break;
        case r'issued_year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.issuedYear = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicCredentialStatusEnum),
          ) as ClinicCredentialStatusEnum;
          result.status = valueDes;
          break;
        case r'reviewed_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
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
  ClinicCredential deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicCredentialBuilder();
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

class ClinicCredentialTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'registre_commerce')
  static const ClinicCredentialTypeEnum registreCommerce = _$clinicCredentialTypeEnum_registreCommerce;
  @BuiltValueEnumConst(wireName: r'agrement_sante')
  static const ClinicCredentialTypeEnum agrementSante = _$clinicCredentialTypeEnum_agrementSante;
  @BuiltValueEnumConst(wireName: r'other')
  static const ClinicCredentialTypeEnum other = _$clinicCredentialTypeEnum_other;

  static Serializer<ClinicCredentialTypeEnum> get serializer => _$clinicCredentialTypeEnumSerializer;

  const ClinicCredentialTypeEnum._(String name): super(name);

  static BuiltSet<ClinicCredentialTypeEnum> get values => _$clinicCredentialTypeEnumValues;
  static ClinicCredentialTypeEnum valueOf(String name) => _$clinicCredentialTypeEnumValueOf(name);
}

class ClinicCredentialStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const ClinicCredentialStatusEnum pending = _$clinicCredentialStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'approved')
  static const ClinicCredentialStatusEnum approved = _$clinicCredentialStatusEnum_approved;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const ClinicCredentialStatusEnum rejected = _$clinicCredentialStatusEnum_rejected;

  static Serializer<ClinicCredentialStatusEnum> get serializer => _$clinicCredentialStatusEnumSerializer;

  const ClinicCredentialStatusEnum._(String name): super(name);

  static BuiltSet<ClinicCredentialStatusEnum> get values => _$clinicCredentialStatusEnumValues;
  static ClinicCredentialStatusEnum valueOf(String name) => _$clinicCredentialStatusEnumValueOf(name);
}

