//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'appointment_origin.g.dart';

class AppointmentOrigin extends EnumClass {

  @BuiltValueEnumConst(wireName: r'doctor_direct')
  static const AppointmentOrigin doctorDirect = _$doctorDirect;
  @BuiltValueEnumConst(wireName: r'clinic_service')
  static const AppointmentOrigin clinicService = _$clinicService;

  static Serializer<AppointmentOrigin> get serializer => _$appointmentOriginSerializer;

  const AppointmentOrigin._(String name): super(name);

  static BuiltSet<AppointmentOrigin> get values => _$values;
  static AppointmentOrigin valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AppointmentOriginMixin = Object with _$AppointmentOriginMixin;

