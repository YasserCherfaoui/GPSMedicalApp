//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'country_code.g.dart';

class CountryCode extends EnumClass {

  /// Code pays ISO 3166-1 alpha-2. Fixé à l'inscription ; immuable après vérification OTP. Aucun endpoint n'accepte une mutation ultérieure. 
  @BuiltValueEnumConst(wireName: r'DZ')
  static const CountryCode DZ = _$DZ;
  /// Code pays ISO 3166-1 alpha-2. Fixé à l'inscription ; immuable après vérification OTP. Aucun endpoint n'accepte une mutation ultérieure. 
  @BuiltValueEnumConst(wireName: r'TN')
  static const CountryCode TN = _$TN;

  static Serializer<CountryCode> get serializer => _$countryCodeSerializer;

  const CountryCode._(String name): super(name);

  static BuiltSet<CountryCode> get values => _$values;
  static CountryCode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CountryCodeMixin = Object with _$CountryCodeMixin;

