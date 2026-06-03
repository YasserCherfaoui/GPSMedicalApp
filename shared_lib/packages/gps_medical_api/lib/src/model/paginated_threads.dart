//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/thread.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_threads.g.dart';

/// PaginatedThreads
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedThreads implements Built<PaginatedThreads, PaginatedThreadsBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<Thread>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedThreads._();

  factory PaginatedThreads([void updates(PaginatedThreadsBuilder b)]) = _$PaginatedThreads;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedThreadsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedThreads> get serializer => _$PaginatedThreadsSerializer();
}

class _$PaginatedThreadsSerializer implements PrimitiveSerializer<PaginatedThreads> {
  @override
  final Iterable<Type> types = const [PaginatedThreads, _$PaginatedThreads];

  @override
  final String wireName = r'PaginatedThreads';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedThreads object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(Thread)]),
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
    PaginatedThreads object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedThreadsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Thread)]),
          ) as BuiltList<Thread>;
          result.data.replace(valueDes);
          break;
        case r'meta':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaginationMeta),
          ) as PaginationMeta;
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
  PaginatedThreads deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedThreadsBuilder();
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

