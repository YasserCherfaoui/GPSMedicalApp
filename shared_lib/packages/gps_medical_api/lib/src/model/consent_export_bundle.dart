//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/consent_export_verification.dart';
import 'package:gps_medical_api/src/model/consent_grant.dart';
import 'package:gps_medical_api/src/model/consent_export_filters.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'consent_export_bundle.g.dart';

/// ConsentExportBundle
///
/// Properties:
/// * [exportId] 
/// * [generatedAt] 
/// * [userId] 
/// * [filters] 
/// * [grants] 
/// * [signature] - Signature Ed25519 détachée (base64)
/// * [verification] 
@BuiltValue()
abstract class ConsentExportBundle implements Built<ConsentExportBundle, ConsentExportBundleBuilder> {
  @BuiltValueField(wireName: r'export_id')
  String get exportId;

  @BuiltValueField(wireName: r'generated_at')
  DateTime get generatedAt;

  @BuiltValueField(wireName: r'user_id')
  String? get userId;

  @BuiltValueField(wireName: r'filters')
  ConsentExportFilters get filters;

  @BuiltValueField(wireName: r'grants')
  BuiltList<ConsentGrant> get grants;

  /// Signature Ed25519 détachée (base64)
  @BuiltValueField(wireName: r'signature')
  String get signature;

  @BuiltValueField(wireName: r'verification')
  ConsentExportVerification get verification;

  ConsentExportBundle._();

  factory ConsentExportBundle([void updates(ConsentExportBundleBuilder b)]) = _$ConsentExportBundle;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsentExportBundleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsentExportBundle> get serializer => _$ConsentExportBundleSerializer();
}

class _$ConsentExportBundleSerializer implements PrimitiveSerializer<ConsentExportBundle> {
  @override
  final Iterable<Type> types = const [ConsentExportBundle, _$ConsentExportBundle];

  @override
  final String wireName = r'ConsentExportBundle';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsentExportBundle object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'export_id';
    yield serializers.serialize(
      object.exportId,
      specifiedType: const FullType(String),
    );
    yield r'generated_at';
    yield serializers.serialize(
      object.generatedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.userId != null) {
      yield r'user_id';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'filters';
    yield serializers.serialize(
      object.filters,
      specifiedType: const FullType(ConsentExportFilters),
    );
    yield r'grants';
    yield serializers.serialize(
      object.grants,
      specifiedType: const FullType(BuiltList, [FullType(ConsentGrant)]),
    );
    yield r'signature';
    yield serializers.serialize(
      object.signature,
      specifiedType: const FullType(String),
    );
    yield r'verification';
    yield serializers.serialize(
      object.verification,
      specifiedType: const FullType(ConsentExportVerification),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConsentExportBundle object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConsentExportBundleBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'export_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.exportId = valueDes;
          break;
        case r'generated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.generatedAt = valueDes;
          break;
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'filters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConsentExportFilters),
          ) as ConsentExportFilters;
          result.filters.replace(valueDes);
          break;
        case r'grants':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ConsentGrant)]),
          ) as BuiltList<ConsentGrant>;
          result.grants.replace(valueDes);
          break;
        case r'signature':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.signature = valueDes;
          break;
        case r'verification':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConsentExportVerification),
          ) as ConsentExportVerification;
          result.verification.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConsentExportBundle deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsentExportBundleBuilder();
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

