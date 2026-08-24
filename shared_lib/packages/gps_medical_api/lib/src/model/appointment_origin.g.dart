// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_origin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppointmentOrigin _$doctorDirect = const AppointmentOrigin._(
  'doctorDirect',
);
const AppointmentOrigin _$clinicService = const AppointmentOrigin._(
  'clinicService',
);

AppointmentOrigin _$valueOf(String name) {
  switch (name) {
    case 'doctorDirect':
      return _$doctorDirect;
    case 'clinicService':
      return _$clinicService;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AppointmentOrigin> _$values = BuiltSet<AppointmentOrigin>(
  const <AppointmentOrigin>[_$doctorDirect, _$clinicService],
);

class _$AppointmentOriginMeta {
  const _$AppointmentOriginMeta();
  AppointmentOrigin get doctorDirect => _$doctorDirect;
  AppointmentOrigin get clinicService => _$clinicService;
  AppointmentOrigin valueOf(String name) => _$valueOf(name);
  BuiltSet<AppointmentOrigin> get values => _$values;
}

mixin _$AppointmentOriginMixin {
  // ignore: non_constant_identifier_names
  _$AppointmentOriginMeta get AppointmentOrigin =>
      const _$AppointmentOriginMeta();
}

Serializer<AppointmentOrigin> _$appointmentOriginSerializer =
    _$AppointmentOriginSerializer();

class _$AppointmentOriginSerializer
    implements PrimitiveSerializer<AppointmentOrigin> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'doctorDirect': 'doctor_direct',
    'clinicService': 'clinic_service',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'doctor_direct': 'doctorDirect',
    'clinic_service': 'clinicService',
  };

  @override
  final Iterable<Type> types = const <Type>[AppointmentOrigin];
  @override
  final String wireName = 'AppointmentOrigin';

  @override
  Object serialize(
    Serializers serializers,
    AppointmentOrigin object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AppointmentOrigin deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AppointmentOrigin.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
