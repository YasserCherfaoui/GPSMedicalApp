//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_preferences.g.dart';

/// NotificationPreferences
///
/// Properties:
/// * [pushEnabled] 
/// * [smsEnabled] 
/// * [emailEnabled] 
/// * [appointmentReminders] 
/// * [marketing] 
/// * [reminderHoursBefore] 
@BuiltValue()
abstract class NotificationPreferences implements Built<NotificationPreferences, NotificationPreferencesBuilder> {
  @BuiltValueField(wireName: r'push_enabled')
  bool? get pushEnabled;

  @BuiltValueField(wireName: r'sms_enabled')
  bool? get smsEnabled;

  @BuiltValueField(wireName: r'email_enabled')
  bool? get emailEnabled;

  @BuiltValueField(wireName: r'appointment_reminders')
  bool? get appointmentReminders;

  @BuiltValueField(wireName: r'marketing')
  bool? get marketing;

  @BuiltValueField(wireName: r'reminder_hours_before')
  NotificationPreferencesReminderHoursBeforeEnum? get reminderHoursBefore;
  // enum reminderHoursBeforeEnum {  1,  2,  6,  12,  24,  };

  NotificationPreferences._();

  factory NotificationPreferences([void updates(NotificationPreferencesBuilder b)]) = _$NotificationPreferences;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NotificationPreferencesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationPreferences> get serializer => _$NotificationPreferencesSerializer();
}

class _$NotificationPreferencesSerializer implements PrimitiveSerializer<NotificationPreferences> {
  @override
  final Iterable<Type> types = const [NotificationPreferences, _$NotificationPreferences];

  @override
  final String wireName = r'NotificationPreferences';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NotificationPreferences object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.pushEnabled != null) {
      yield r'push_enabled';
      yield serializers.serialize(
        object.pushEnabled,
        specifiedType: const FullType(bool),
      );
    }
    if (object.smsEnabled != null) {
      yield r'sms_enabled';
      yield serializers.serialize(
        object.smsEnabled,
        specifiedType: const FullType(bool),
      );
    }
    if (object.emailEnabled != null) {
      yield r'email_enabled';
      yield serializers.serialize(
        object.emailEnabled,
        specifiedType: const FullType(bool),
      );
    }
    if (object.appointmentReminders != null) {
      yield r'appointment_reminders';
      yield serializers.serialize(
        object.appointmentReminders,
        specifiedType: const FullType(bool),
      );
    }
    if (object.marketing != null) {
      yield r'marketing';
      yield serializers.serialize(
        object.marketing,
        specifiedType: const FullType(bool),
      );
    }
    if (object.reminderHoursBefore != null) {
      yield r'reminder_hours_before';
      yield serializers.serialize(
        object.reminderHoursBefore,
        specifiedType: const FullType(NotificationPreferencesReminderHoursBeforeEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    NotificationPreferences object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NotificationPreferencesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'push_enabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.pushEnabled = valueDes;
          break;
        case r'sms_enabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.smsEnabled = valueDes;
          break;
        case r'email_enabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.emailEnabled = valueDes;
          break;
        case r'appointment_reminders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.appointmentReminders = valueDes;
          break;
        case r'marketing':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.marketing = valueDes;
          break;
        case r'reminder_hours_before':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NotificationPreferencesReminderHoursBeforeEnum),
          ) as NotificationPreferencesReminderHoursBeforeEnum;
          result.reminderHoursBefore = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NotificationPreferences deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationPreferencesBuilder();
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

class NotificationPreferencesReminderHoursBeforeEnum extends EnumClass {

  @BuiltValueEnumConst(wireNumber: 1)
  static const NotificationPreferencesReminderHoursBeforeEnum number1 = _$notificationPreferencesReminderHoursBeforeEnum_number1;
  @BuiltValueEnumConst(wireNumber: 2)
  static const NotificationPreferencesReminderHoursBeforeEnum number2 = _$notificationPreferencesReminderHoursBeforeEnum_number2;
  @BuiltValueEnumConst(wireNumber: 6)
  static const NotificationPreferencesReminderHoursBeforeEnum number6 = _$notificationPreferencesReminderHoursBeforeEnum_number6;
  @BuiltValueEnumConst(wireNumber: 12)
  static const NotificationPreferencesReminderHoursBeforeEnum number12 = _$notificationPreferencesReminderHoursBeforeEnum_number12;
  @BuiltValueEnumConst(wireNumber: 24)
  static const NotificationPreferencesReminderHoursBeforeEnum number24 = _$notificationPreferencesReminderHoursBeforeEnum_number24;

  static Serializer<NotificationPreferencesReminderHoursBeforeEnum> get serializer => _$notificationPreferencesReminderHoursBeforeEnumSerializer;

  const NotificationPreferencesReminderHoursBeforeEnum._(String name): super(name);

  static BuiltSet<NotificationPreferencesReminderHoursBeforeEnum> get values => _$notificationPreferencesReminderHoursBeforeEnumValues;
  static NotificationPreferencesReminderHoursBeforeEnum valueOf(String name) => _$notificationPreferencesReminderHoursBeforeEnumValueOf(name);
}

