//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/consent_export_filters.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'consent_export_job.g.dart';

/// ConsentExportJob
///
/// Properties:
/// * [id] 
/// * [status] 
/// * [filters] 
/// * [exportId] 
/// * [grantCount] 
/// * [errorMessage] 
/// * [createdAt] 
/// * [completedAt] 
@BuiltValue()
abstract class ConsentExportJob implements Built<ConsentExportJob, ConsentExportJobBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'status')
  ConsentExportJobStatusEnum get status;
  // enum statusEnum {  pending,  processing,  completed,  failed,  };

  @BuiltValueField(wireName: r'filters')
  ConsentExportFilters get filters;

  @BuiltValueField(wireName: r'export_id')
  String? get exportId;

  @BuiltValueField(wireName: r'grant_count')
  int? get grantCount;

  @BuiltValueField(wireName: r'error_message')
  String? get errorMessage;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'completed_at')
  DateTime? get completedAt;

  ConsentExportJob._();

  factory ConsentExportJob([void updates(ConsentExportJobBuilder b)]) = _$ConsentExportJob;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsentExportJobBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsentExportJob> get serializer => _$ConsentExportJobSerializer();
}

class _$ConsentExportJobSerializer implements PrimitiveSerializer<ConsentExportJob> {
  @override
  final Iterable<Type> types = const [ConsentExportJob, _$ConsentExportJob];

  @override
  final String wireName = r'ConsentExportJob';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsentExportJob object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ConsentExportJobStatusEnum),
    );
    yield r'filters';
    yield serializers.serialize(
      object.filters,
      specifiedType: const FullType(ConsentExportFilters),
    );
    if (object.exportId != null) {
      yield r'export_id';
      yield serializers.serialize(
        object.exportId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.grantCount != null) {
      yield r'grant_count';
      yield serializers.serialize(
        object.grantCount,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.errorMessage != null) {
      yield r'error_message';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.completedAt != null) {
      yield r'completed_at';
      yield serializers.serialize(
        object.completedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConsentExportJob object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConsentExportJobBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConsentExportJobStatusEnum),
          ) as ConsentExportJobStatusEnum;
          result.status = valueDes;
          break;
        case r'filters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConsentExportFilters),
          ) as ConsentExportFilters;
          result.filters.replace(valueDes);
          break;
        case r'export_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.exportId = valueDes;
          break;
        case r'grant_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.grantCount = valueDes;
          break;
        case r'error_message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'completed_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.completedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConsentExportJob deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsentExportJobBuilder();
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

class ConsentExportJobStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const ConsentExportJobStatusEnum pending = _$consentExportJobStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'processing')
  static const ConsentExportJobStatusEnum processing = _$consentExportJobStatusEnum_processing;
  @BuiltValueEnumConst(wireName: r'completed')
  static const ConsentExportJobStatusEnum completed = _$consentExportJobStatusEnum_completed;
  @BuiltValueEnumConst(wireName: r'failed')
  static const ConsentExportJobStatusEnum failed = _$consentExportJobStatusEnum_failed;

  static Serializer<ConsentExportJobStatusEnum> get serializer => _$consentExportJobStatusEnumSerializer;

  const ConsentExportJobStatusEnum._(String name): super(name);

  static BuiltSet<ConsentExportJobStatusEnum> get values => _$consentExportJobStatusEnumValues;
  static ConsentExportJobStatusEnum valueOf(String name) => _$consentExportJobStatusEnumValueOf(name);
}

