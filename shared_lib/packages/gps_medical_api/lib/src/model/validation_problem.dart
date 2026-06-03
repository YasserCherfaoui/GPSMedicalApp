//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/validation_problem_all_of_errors.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/problem.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'validation_problem.g.dart';

/// ValidationProblem
///
/// Properties:
/// * [type] 
/// * [title] 
/// * [status] 
/// * [detail] 
/// * [instance] 
/// * [code] - Code applicatif (ex. SLOT_TAKEN)
/// * [errors] 
@BuiltValue()
abstract class ValidationProblem implements Problem, Built<ValidationProblem, ValidationProblemBuilder> {
  @BuiltValueField(wireName: r'errors')
  BuiltList<ValidationProblemAllOfErrors>? get errors;

  ValidationProblem._();

  factory ValidationProblem([void updates(ValidationProblemBuilder b)]) = _$ValidationProblem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ValidationProblemBuilder b) => b
      ..type = 'about:blank';

  @BuiltValueSerializer(custom: true)
  static Serializer<ValidationProblem> get serializer => _$ValidationProblemSerializer();
}

class _$ValidationProblemSerializer implements PrimitiveSerializer<ValidationProblem> {
  @override
  final Iterable<Type> types = const [ValidationProblem, _$ValidationProblem];

  @override
  final String wireName = r'ValidationProblem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ValidationProblem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.instance != null) {
      yield r'instance';
      yield serializers.serialize(
        object.instance,
        specifiedType: const FullType(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
    if (object.detail != null) {
      yield r'detail';
      yield serializers.serialize(
        object.detail,
        specifiedType: const FullType(String),
      );
    }
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    if (object.errors != null) {
      yield r'errors';
      yield serializers.serialize(
        object.errors,
        specifiedType: const FullType(BuiltList, [FullType(ValidationProblemAllOfErrors)]),
      );
    }
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ValidationProblem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ValidationProblemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'instance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.instance = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.detail = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'errors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ValidationProblemAllOfErrors)]),
          ) as BuiltList<ValidationProblemAllOfErrors>;
          result.errors.replace(valueDes);
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ValidationProblem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ValidationProblemBuilder();
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

