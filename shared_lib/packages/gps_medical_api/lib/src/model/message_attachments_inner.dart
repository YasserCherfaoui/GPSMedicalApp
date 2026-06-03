//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'message_attachments_inner.g.dart';

/// MessageAttachmentsInner
///
/// Properties:
/// * [documentId] 
/// * [fileName] 
/// * [mimeType] 
@BuiltValue()
abstract class MessageAttachmentsInner implements Built<MessageAttachmentsInner, MessageAttachmentsInnerBuilder> {
  @BuiltValueField(wireName: r'document_id')
  String? get documentId;

  @BuiltValueField(wireName: r'file_name')
  String? get fileName;

  @BuiltValueField(wireName: r'mime_type')
  String? get mimeType;

  MessageAttachmentsInner._();

  factory MessageAttachmentsInner([void updates(MessageAttachmentsInnerBuilder b)]) = _$MessageAttachmentsInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MessageAttachmentsInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MessageAttachmentsInner> get serializer => _$MessageAttachmentsInnerSerializer();
}

class _$MessageAttachmentsInnerSerializer implements PrimitiveSerializer<MessageAttachmentsInner> {
  @override
  final Iterable<Type> types = const [MessageAttachmentsInner, _$MessageAttachmentsInner];

  @override
  final String wireName = r'MessageAttachmentsInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MessageAttachmentsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.documentId != null) {
      yield r'document_id';
      yield serializers.serialize(
        object.documentId,
        specifiedType: const FullType(String),
      );
    }
    if (object.fileName != null) {
      yield r'file_name';
      yield serializers.serialize(
        object.fileName,
        specifiedType: const FullType(String),
      );
    }
    if (object.mimeType != null) {
      yield r'mime_type';
      yield serializers.serialize(
        object.mimeType,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MessageAttachmentsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MessageAttachmentsInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'document_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.documentId = valueDes;
          break;
        case r'file_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fileName = valueDes;
          break;
        case r'mime_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mimeType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MessageAttachmentsInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MessageAttachmentsInnerBuilder();
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

