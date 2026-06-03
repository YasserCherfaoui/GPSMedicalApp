//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'message_create.g.dart';

/// MessageCreate
///
/// Properties:
/// * [body] 
/// * [attachmentDocumentIds] 
@BuiltValue()
abstract class MessageCreate implements Built<MessageCreate, MessageCreateBuilder> {
  @BuiltValueField(wireName: r'body')
  String? get body;

  @BuiltValueField(wireName: r'attachment_document_ids')
  BuiltList<String>? get attachmentDocumentIds;

  MessageCreate._();

  factory MessageCreate([void updates(MessageCreateBuilder b)]) = _$MessageCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MessageCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MessageCreate> get serializer => _$MessageCreateSerializer();
}

class _$MessageCreateSerializer implements PrimitiveSerializer<MessageCreate> {
  @override
  final Iterable<Type> types = const [MessageCreate, _$MessageCreate];

  @override
  final String wireName = r'MessageCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MessageCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.body != null) {
      yield r'body';
      yield serializers.serialize(
        object.body,
        specifiedType: const FullType(String),
      );
    }
    if (object.attachmentDocumentIds != null) {
      yield r'attachment_document_ids';
      yield serializers.serialize(
        object.attachmentDocumentIds,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MessageCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MessageCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        case r'attachment_document_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.attachmentDocumentIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MessageCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MessageCreateBuilder();
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

