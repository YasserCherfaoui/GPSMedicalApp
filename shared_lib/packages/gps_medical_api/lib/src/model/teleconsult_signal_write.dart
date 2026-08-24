//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/teleconsult_signal_type.dart';
import 'package:gps_medical_api/src/model/teleconsult_ice_candidate.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsult_signal_write.g.dart';

/// TeleconsultSignalWrite
///
/// Properties:
/// * [type] 
/// * [sdp] - SDP pour `offer` et `answer`
/// * [candidate] 
@BuiltValue()
abstract class TeleconsultSignalWrite implements Built<TeleconsultSignalWrite, TeleconsultSignalWriteBuilder> {
  @BuiltValueField(wireName: r'type')
  TeleconsultSignalType get type;
  // enum typeEnum {  offer,  answer,  ice_candidate,  hangup,  };

  /// SDP pour `offer` et `answer`
  @BuiltValueField(wireName: r'sdp')
  String? get sdp;

  @BuiltValueField(wireName: r'candidate')
  TeleconsultIceCandidate? get candidate;

  TeleconsultSignalWrite._();

  factory TeleconsultSignalWrite([void updates(TeleconsultSignalWriteBuilder b)]) = _$TeleconsultSignalWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleconsultSignalWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleconsultSignalWrite> get serializer => _$TeleconsultSignalWriteSerializer();
}

class _$TeleconsultSignalWriteSerializer implements PrimitiveSerializer<TeleconsultSignalWrite> {
  @override
  final Iterable<Type> types = const [TeleconsultSignalWrite, _$TeleconsultSignalWrite];

  @override
  final String wireName = r'TeleconsultSignalWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleconsultSignalWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    TeleconsultSignalWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleconsultSignalWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  TeleconsultSignalWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleconsultSignalWriteBuilder();
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

