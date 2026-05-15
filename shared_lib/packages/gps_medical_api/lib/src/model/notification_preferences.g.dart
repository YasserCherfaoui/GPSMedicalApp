// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preferences.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NotificationPreferencesReminderHoursBeforeEnum
_$notificationPreferencesReminderHoursBeforeEnum_number1 =
    const NotificationPreferencesReminderHoursBeforeEnum._('number1');
const NotificationPreferencesReminderHoursBeforeEnum
_$notificationPreferencesReminderHoursBeforeEnum_number2 =
    const NotificationPreferencesReminderHoursBeforeEnum._('number2');
const NotificationPreferencesReminderHoursBeforeEnum
_$notificationPreferencesReminderHoursBeforeEnum_number6 =
    const NotificationPreferencesReminderHoursBeforeEnum._('number6');
const NotificationPreferencesReminderHoursBeforeEnum
_$notificationPreferencesReminderHoursBeforeEnum_number12 =
    const NotificationPreferencesReminderHoursBeforeEnum._('number12');
const NotificationPreferencesReminderHoursBeforeEnum
_$notificationPreferencesReminderHoursBeforeEnum_number24 =
    const NotificationPreferencesReminderHoursBeforeEnum._('number24');

NotificationPreferencesReminderHoursBeforeEnum
_$notificationPreferencesReminderHoursBeforeEnumValueOf(String name) {
  switch (name) {
    case 'number1':
      return _$notificationPreferencesReminderHoursBeforeEnum_number1;
    case 'number2':
      return _$notificationPreferencesReminderHoursBeforeEnum_number2;
    case 'number6':
      return _$notificationPreferencesReminderHoursBeforeEnum_number6;
    case 'number12':
      return _$notificationPreferencesReminderHoursBeforeEnum_number12;
    case 'number24':
      return _$notificationPreferencesReminderHoursBeforeEnum_number24;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NotificationPreferencesReminderHoursBeforeEnum>
_$notificationPreferencesReminderHoursBeforeEnumValues =
    BuiltSet<NotificationPreferencesReminderHoursBeforeEnum>(
      const <NotificationPreferencesReminderHoursBeforeEnum>[
        _$notificationPreferencesReminderHoursBeforeEnum_number1,
        _$notificationPreferencesReminderHoursBeforeEnum_number2,
        _$notificationPreferencesReminderHoursBeforeEnum_number6,
        _$notificationPreferencesReminderHoursBeforeEnum_number12,
        _$notificationPreferencesReminderHoursBeforeEnum_number24,
      ],
    );

Serializer<NotificationPreferencesReminderHoursBeforeEnum>
_$notificationPreferencesReminderHoursBeforeEnumSerializer =
    _$NotificationPreferencesReminderHoursBeforeEnumSerializer();

class _$NotificationPreferencesReminderHoursBeforeEnumSerializer
    implements
        PrimitiveSerializer<NotificationPreferencesReminderHoursBeforeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number1': 1,
    'number2': 2,
    'number6': 6,
    'number12': 12,
    'number24': 24,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'number1',
    2: 'number2',
    6: 'number6',
    12: 'number12',
    24: 'number24',
  };

  @override
  final Iterable<Type> types = const <Type>[
    NotificationPreferencesReminderHoursBeforeEnum,
  ];
  @override
  final String wireName = 'NotificationPreferencesReminderHoursBeforeEnum';

  @override
  Object serialize(
    Serializers serializers,
    NotificationPreferencesReminderHoursBeforeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  NotificationPreferencesReminderHoursBeforeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => NotificationPreferencesReminderHoursBeforeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$NotificationPreferences extends NotificationPreferences {
  @override
  final bool? pushEnabled;
  @override
  final bool? smsEnabled;
  @override
  final bool? emailEnabled;
  @override
  final bool? appointmentReminders;
  @override
  final bool? marketing;
  @override
  final NotificationPreferencesReminderHoursBeforeEnum? reminderHoursBefore;

  factory _$NotificationPreferences([
    void Function(NotificationPreferencesBuilder)? updates,
  ]) => (NotificationPreferencesBuilder()..update(updates))._build();

  _$NotificationPreferences._({
    this.pushEnabled,
    this.smsEnabled,
    this.emailEnabled,
    this.appointmentReminders,
    this.marketing,
    this.reminderHoursBefore,
  }) : super._();
  @override
  NotificationPreferences rebuild(
    void Function(NotificationPreferencesBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  NotificationPreferencesBuilder toBuilder() =>
      NotificationPreferencesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationPreferences &&
        pushEnabled == other.pushEnabled &&
        smsEnabled == other.smsEnabled &&
        emailEnabled == other.emailEnabled &&
        appointmentReminders == other.appointmentReminders &&
        marketing == other.marketing &&
        reminderHoursBefore == other.reminderHoursBefore;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pushEnabled.hashCode);
    _$hash = $jc(_$hash, smsEnabled.hashCode);
    _$hash = $jc(_$hash, emailEnabled.hashCode);
    _$hash = $jc(_$hash, appointmentReminders.hashCode);
    _$hash = $jc(_$hash, marketing.hashCode);
    _$hash = $jc(_$hash, reminderHoursBefore.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationPreferences')
          ..add('pushEnabled', pushEnabled)
          ..add('smsEnabled', smsEnabled)
          ..add('emailEnabled', emailEnabled)
          ..add('appointmentReminders', appointmentReminders)
          ..add('marketing', marketing)
          ..add('reminderHoursBefore', reminderHoursBefore))
        .toString();
  }
}

class NotificationPreferencesBuilder
    implements
        Builder<NotificationPreferences, NotificationPreferencesBuilder> {
  _$NotificationPreferences? _$v;

  bool? _pushEnabled;
  bool? get pushEnabled => _$this._pushEnabled;
  set pushEnabled(bool? pushEnabled) => _$this._pushEnabled = pushEnabled;

  bool? _smsEnabled;
  bool? get smsEnabled => _$this._smsEnabled;
  set smsEnabled(bool? smsEnabled) => _$this._smsEnabled = smsEnabled;

  bool? _emailEnabled;
  bool? get emailEnabled => _$this._emailEnabled;
  set emailEnabled(bool? emailEnabled) => _$this._emailEnabled = emailEnabled;

  bool? _appointmentReminders;
  bool? get appointmentReminders => _$this._appointmentReminders;
  set appointmentReminders(bool? appointmentReminders) =>
      _$this._appointmentReminders = appointmentReminders;

  bool? _marketing;
  bool? get marketing => _$this._marketing;
  set marketing(bool? marketing) => _$this._marketing = marketing;

  NotificationPreferencesReminderHoursBeforeEnum? _reminderHoursBefore;
  NotificationPreferencesReminderHoursBeforeEnum? get reminderHoursBefore =>
      _$this._reminderHoursBefore;
  set reminderHoursBefore(
    NotificationPreferencesReminderHoursBeforeEnum? reminderHoursBefore,
  ) => _$this._reminderHoursBefore = reminderHoursBefore;

  NotificationPreferencesBuilder() {
    NotificationPreferences._defaults(this);
  }

  NotificationPreferencesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pushEnabled = $v.pushEnabled;
      _smsEnabled = $v.smsEnabled;
      _emailEnabled = $v.emailEnabled;
      _appointmentReminders = $v.appointmentReminders;
      _marketing = $v.marketing;
      _reminderHoursBefore = $v.reminderHoursBefore;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationPreferences other) {
    _$v = other as _$NotificationPreferences;
  }

  @override
  void update(void Function(NotificationPreferencesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationPreferences build() => _build();

  _$NotificationPreferences _build() {
    final _$result =
        _$v ??
        _$NotificationPreferences._(
          pushEnabled: pushEnabled,
          smsEnabled: smsEnabled,
          emailEnabled: emailEnabled,
          appointmentReminders: appointmentReminders,
          marketing: marketing,
          reminderHoursBefore: reminderHoursBefore,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
