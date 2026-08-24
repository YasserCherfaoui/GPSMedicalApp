//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/teleconsult_signal_type.dart';
import 'package:gps_medical_api/src/model/teleconsult_ice_candidate.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsult_lab_signal_write.g.dart';

/// TeleconsultLabSignalWrite
///
/// Properties:
/// * [peerId] 
/// * [type] 
/// * [sdp] 
/// * [candidate] 
@BuiltValue()
abstract class TeleconsultLabSignalWrite implements Built<TeleconsultLabSignalWrite, TeleconsultLabSignalWriteBuilder> {
  @BuiltValueField(wireName: r'peer_id')
  String get peerId;

  @BuiltValueField(wireName: r'type')
  TeleconsultSignalType get type;
  // enum typeEnum {  offer,  answer,  ice_candidate,  hangup,  };

  @BuiltValueField(wireName: r'sdp')
  String? get sdp;

  @BuiltValueField(wireName: r'candidate')
  TeleconsultIceCandidate? get candidate;

  TeleconsultLabSignalWrite._();

  factory TeleconsultLabSignalWrite([void updates(TeleconsultLabSignalWriteBuilder b)]) = _$TeleconsultLabSignalWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleconsultLabSignalWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleconsultLabSignalWrite> get serializer => _$TeleconsultLabSignalWriteSerializer();
}

class _$TeleconsultLabSignalWriteSerializer implements PrimitiveSerializer<TeleconsultLabSignalWrite> {
  @override
  final Iterable<Type> types = const [TeleconsultLabSignalWrite, _$TeleconsultLabSignalWrite];

  @override
  final String wireName = r'TeleconsultLabSignalWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleconsultLabSignalWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'peer_id';
    yield serializers.serialize(
      object.peerId,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(TeleconsultSignalType),
    );
    if (object.sdp != null) {
      yield r'sdp';
      yield serializers.serialize(
        object.sdp,
        specifiedType: const FullType(String),
      );
    }
    if (object.candidate != null) {
      yield r'candidate';
      yield serializers.serialize(
        object.candidate,
        specifiedType: const FullType(TeleconsultIceCandidate),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultLabSignalWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleconsultLabSignalWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'peer_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.peerId = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TeleconsultSignalType),
          ) as TeleconsultSignalType;
          result.type = valueDes;
          break;
        case r'sdp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sdp = valueDes;
          break;
        case r'candidate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TeleconsultIceCandidate),
          ) as TeleconsultIceCandidate;
          result.candidate.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TeleconsultLabSignalWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleconsultLabSignalWriteBuilder();
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

