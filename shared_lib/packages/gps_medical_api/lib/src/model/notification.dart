//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification.g.dart';

/// Notification
///
/// Properties:
/// * [id] 
/// * [type] 
/// * [title] 
/// * [body] 
/// * [data] 
/// * [readAt] 
/// * [createdAt] 
@BuiltValue()
abstract class Notification implements Built<Notification, NotificationBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'type')
  NotificationTypeEnum? get type;
  // enum typeEnum {  appointment_created,  appointment_confirmed,  appointment_reminder,  appointment_cancelled,  appointment_rescheduled,  new_message,  prescription_issued,  payment_succeeded,  payment_failed,  review_request,  admin_announcement,  };

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'body')
  String? get body;

  @BuiltValueField(wireName: r'data')
  BuiltMap<String, JsonObject?>? get data;

  @BuiltValueField(wireName: r'read_at')
  DateTime? get readAt;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  Notification._();

  factory Notification([void updates(NotificationBuilder b)]) = _$Notification;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NotificationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Notification> get serializer => _$NotificationSerializer();
}

class _$NotificationSerializer implements PrimitiveSerializer<Notification> {
  @override
  final Iterable<Type> types = const [Notification, _$Notification];

  @override
  final String wireName = r'Notification';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Notification object, {
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
        specifiedType: const FullType(NotificationTypeEnum),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.body != null) {
      yield r'body';
      yield serializers.serialize(
        object.body,
        specifiedType: const FullType(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
    if (object.readAt != null) {
      yield r'read_at';
      yield serializers.serialize(
        object.readAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Notification object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NotificationBuilder result,
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
            specifiedType: const FullType(NotificationTypeEnum),
          ) as NotificationTypeEnum;
          result.type = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>;
          result.data.replace(valueDes);
          break;
        case r'read_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.readAt = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Notification deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationBuilder();
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

class NotificationTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'appointment_created')
  static const NotificationTypeEnum appointmentCreated = _$notificationTypeEnum_appointmentCreated;
  @BuiltValueEnumConst(wireName: r'appointment_confirmed')
  static const NotificationTypeEnum appointmentConfirmed = _$notificationTypeEnum_appointmentConfirmed;
  @BuiltValueEnumConst(wireName: r'appointment_reminder')
  static const NotificationTypeEnum appointmentReminder = _$notificationTypeEnum_appointmentReminder;
  @BuiltValueEnumConst(wireName: r'appointment_cancelled')
  static const NotificationTypeEnum appointmentCancelled = _$notificationTypeEnum_appointmentCancelled;
  @BuiltValueEnumConst(wireName: r'appointment_rescheduled')
  static const NotificationTypeEnum appointmentRescheduled = _$notificationTypeEnum_appointmentRescheduled;
  @BuiltValueEnumConst(wireName: r'new_message')
  static const NotificationTypeEnum newMessage = _$notificationTypeEnum_newMessage;
  @BuiltValueEnumConst(wireName: r'prescription_issued')
  static const NotificationTypeEnum prescriptionIssued = _$notificationTypeEnum_prescriptionIssued;
  @BuiltValueEnumConst(wireName: r'payment_succeeded')
  static const NotificationTypeEnum paymentSucceeded = _$notificationTypeEnum_paymentSucceeded;
  @BuiltValueEnumConst(wireName: r'payment_failed')
  static const NotificationTypeEnum paymentFailed = _$notificationTypeEnum_paymentFailed;
  @BuiltValueEnumConst(wireName: r'review_request')
  static const NotificationTypeEnum reviewRequest = _$notificationTypeEnum_reviewRequest;
  @BuiltValueEnumConst(wireName: r'admin_announcement')
  static const NotificationTypeEnum adminAnnouncement = _$notificationTypeEnum_adminAnnouncement;

  static Serializer<NotificationTypeEnum> get serializer => _$notificationTypeEnumSerializer;

  const NotificationTypeEnum._(String name): super(name);

  static BuiltSet<NotificationTypeEnum> get values => _$notificationTypeEnumValues;
  static NotificationTypeEnum valueOf(String name) => _$notificationTypeEnumValueOf(name);
}

