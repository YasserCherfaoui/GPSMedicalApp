//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:gps_medical_api/src/model/audit_entry.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_audit_entries.g.dart';

/// PaginatedAuditEntries
///
/// Properties:
/// * [data]
/// * [meta]
@BuiltValue()
abstract class PaginatedAuditEntries
    implements Built<PaginatedAuditEntries, PaginatedAuditEntriesBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<AuditEntry>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedAuditEntries._();

  factory PaginatedAuditEntries([
    void updates(PaginatedAuditEntriesBuilder b),
  ]) = _$PaginatedAuditEntries;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedAuditEntriesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedAuditEntries> get serializer =>
      _$PaginatedAuditEntriesSerializer();
}

class _$PaginatedAuditEntriesSerializer
    implements PrimitiveSerializer<PaginatedAuditEntries> {
  @override
  final Iterable<Type> types = const [
    PaginatedAuditEntries,
    _$PaginatedAuditEntries,
  ];

  @override
  final String wireName = r'PaginatedAuditEntries';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedAuditEntries object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(AuditEntry)]),
      );
    }
    if (object.meta != null) {
      yield r'meta';
      yield serializers.serialize(
        object.meta,
        specifiedType: const FullType(PaginationMeta),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedAuditEntries object, {
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
    required PaginatedAuditEntriesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(AuditEntry),
                    ]),
                  )
                  as BuiltList<AuditEntry>;
          result.data.replace(valueDes);
          break;
        case r'meta':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(PaginationMeta),
                  )
                  as PaginationMeta;
          result.meta.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginatedAuditEntries deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedAuditEntriesBuilder();
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
