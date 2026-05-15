// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NotificationTypeEnum _$notificationTypeEnum_appointmentConfirmed =
    const NotificationTypeEnum._('appointmentConfirmed');
const NotificationTypeEnum _$notificationTypeEnum_appointmentReminder =
    const NotificationTypeEnum._('appointmentReminder');
const NotificationTypeEnum _$notificationTypeEnum_appointmentCancelled =
    const NotificationTypeEnum._('appointmentCancelled');
const NotificationTypeEnum _$notificationTypeEnum_appointmentRescheduled =
    const NotificationTypeEnum._('appointmentRescheduled');
const NotificationTypeEnum _$notificationTypeEnum_newMessage =
    const NotificationTypeEnum._('newMessage');
const NotificationTypeEnum _$notificationTypeEnum_prescriptionIssued =
    const NotificationTypeEnum._('prescriptionIssued');
const NotificationTypeEnum _$notificationTypeEnum_paymentSucceeded =
    const NotificationTypeEnum._('paymentSucceeded');
const NotificationTypeEnum _$notificationTypeEnum_paymentFailed =
    const NotificationTypeEnum._('paymentFailed');
const NotificationTypeEnum _$notificationTypeEnum_reviewRequest =
    const NotificationTypeEnum._('reviewRequest');
const NotificationTypeEnum _$notificationTypeEnum_adminAnnouncement =
    const NotificationTypeEnum._('adminAnnouncement');

NotificationTypeEnum _$notificationTypeEnumValueOf(String name) {
  switch (name) {
    case 'appointmentConfirmed':
      return _$notificationTypeEnum_appointmentConfirmed;
    case 'appointmentReminder':
      return _$notificationTypeEnum_appointmentReminder;
    case 'appointmentCancelled':
      return _$notificationTypeEnum_appointmentCancelled;
    case 'appointmentRescheduled':
      return _$notificationTypeEnum_appointmentRescheduled;
    case 'newMessage':
      return _$notificationTypeEnum_newMessage;
    case 'prescriptionIssued':
      return _$notificationTypeEnum_prescriptionIssued;
    case 'paymentSucceeded':
      return _$notificationTypeEnum_paymentSucceeded;
    case 'paymentFailed':
      return _$notificationTypeEnum_paymentFailed;
    case 'reviewRequest':
      return _$notificationTypeEnum_reviewRequest;
    case 'adminAnnouncement':
      return _$notificationTypeEnum_adminAnnouncement;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NotificationTypeEnum> _$notificationTypeEnumValues =
    BuiltSet<NotificationTypeEnum>(const <NotificationTypeEnum>[
      _$notificationTypeEnum_appointmentConfirmed,
      _$notificationTypeEnum_appointmentReminder,
      _$notificationTypeEnum_appointmentCancelled,
      _$notificationTypeEnum_appointmentRescheduled,
      _$notificationTypeEnum_newMessage,
      _$notificationTypeEnum_prescriptionIssued,
      _$notificationTypeEnum_paymentSucceeded,
      _$notificationTypeEnum_paymentFailed,
      _$notificationTypeEnum_reviewRequest,
      _$notificationTypeEnum_adminAnnouncement,
    ]);

Serializer<NotificationTypeEnum> _$notificationTypeEnumSerializer =
    _$NotificationTypeEnumSerializer();

class _$NotificationTypeEnumSerializer
    implements PrimitiveSerializer<NotificationTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'appointmentConfirmed': 'appointment_confirmed',
    'appointmentReminder': 'appointment_reminder',
    'appointmentCancelled': 'appointment_cancelled',
    'appointmentRescheduled': 'appointment_rescheduled',
    'newMessage': 'new_message',
    'prescriptionIssued': 'prescription_issued',
    'paymentSucceeded': 'payment_succeeded',
    'paymentFailed': 'payment_failed',
    'reviewRequest': 'review_request',
    'adminAnnouncement': 'admin_announcement',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'appointment_confirmed': 'appointmentConfirmed',
    'appointment_reminder': 'appointmentReminder',
    'appointment_cancelled': 'appointmentCancelled',
    'appointment_rescheduled': 'appointmentRescheduled',
    'new_message': 'newMessage',
    'prescription_issued': 'prescriptionIssued',
    'payment_succeeded': 'paymentSucceeded',
    'payment_failed': 'paymentFailed',
    'review_request': 'reviewRequest',
    'admin_announcement': 'adminAnnouncement',
  };

  @override
  final Iterable<Type> types = const <Type>[NotificationTypeEnum];
  @override
  final String wireName = 'NotificationTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    NotificationTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  NotificationTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => NotificationTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$Notification extends Notification {
  @override
  final String? id;
  @override
  final NotificationTypeEnum? type;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final BuiltMap<String, JsonObject?>? data;
  @override
  final DateTime? readAt;
  @override
  final DateTime? createdAt;

  factory _$Notification([void Function(NotificationBuilder)? updates]) =>
      (NotificationBuilder()..update(updates))._build();

  _$Notification._({
    this.id,
    this.type,
    this.title,
    this.body,
    this.data,
    this.readAt,
    this.createdAt,
  }) : super._();
  @override
  Notification rebuild(void Function(NotificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationBuilder toBuilder() => NotificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Notification &&
        id == other.id &&
        type == other.type &&
        title == other.title &&
        body == other.body &&
        data == other.data &&
        readAt == other.readAt &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, readAt.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Notification')
          ..add('id', id)
          ..add('type', type)
          ..add('title', title)
          ..add('body', body)
          ..add('data', data)
          ..add('readAt', readAt)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class NotificationBuilder
    implements Builder<Notification, NotificationBuilder> {
  _$Notification? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  NotificationTypeEnum? _type;
  NotificationTypeEnum? get type => _$this._type;
  set type(NotificationTypeEnum? type) => _$this._type = type;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  MapBuilder<String, JsonObject?>? _data;
  MapBuilder<String, JsonObject?> get data =>
      _$this._data ??= MapBuilder<String, JsonObject?>();
  set data(MapBuilder<String, JsonObject?>? data) => _$this._data = data;

  DateTime? _readAt;
  DateTime? get readAt => _$this._readAt;
  set readAt(DateTime? readAt) => _$this._readAt = readAt;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  NotificationBuilder() {
    Notification._defaults(this);
  }

  NotificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _title = $v.title;
      _body = $v.body;
      _data = $v.data?.toBuilder();
      _readAt = $v.readAt;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Notification other) {
    _$v = other as _$Notification;
  }

  @override
  void update(void Function(NotificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Notification build() => _build();

  _$Notification _build() {
    _$Notification _$result;
    try {
      _$result =
          _$v ??
          _$Notification._(
            id: id,
            type: type,
            title: title,
            body: body,
            data: _data?.build(),
            readAt: readAt,
            createdAt: createdAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'Notification',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
