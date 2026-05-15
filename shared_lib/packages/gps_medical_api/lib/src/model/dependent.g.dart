// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependent.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DependentRelationEnum _$dependentRelationEnum_child =
    const DependentRelationEnum._('child');
const DependentRelationEnum _$dependentRelationEnum_spouse =
    const DependentRelationEnum._('spouse');
const DependentRelationEnum _$dependentRelationEnum_parent =
    const DependentRelationEnum._('parent');
const DependentRelationEnum _$dependentRelationEnum_other =
    const DependentRelationEnum._('other');

DependentRelationEnum _$dependentRelationEnumValueOf(String name) {
  switch (name) {
    case 'child':
      return _$dependentRelationEnum_child;
    case 'spouse':
      return _$dependentRelationEnum_spouse;
    case 'parent':
      return _$dependentRelationEnum_parent;
    case 'other':
      return _$dependentRelationEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DependentRelationEnum> _$dependentRelationEnumValues =
    BuiltSet<DependentRelationEnum>(const <DependentRelationEnum>[
      _$dependentRelationEnum_child,
      _$dependentRelationEnum_spouse,
      _$dependentRelationEnum_parent,
      _$dependentRelationEnum_other,
    ]);

const DependentGenderEnum _$dependentGenderEnum_male =
    const DependentGenderEnum._('male');
const DependentGenderEnum _$dependentGenderEnum_female =
    const DependentGenderEnum._('female');

DependentGenderEnum _$dependentGenderEnumValueOf(String name) {
  switch (name) {
    case 'male':
      return _$dependentGenderEnum_male;
    case 'female':
      return _$dependentGenderEnum_female;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DependentGenderEnum> _$dependentGenderEnumValues =
    BuiltSet<DependentGenderEnum>(const <DependentGenderEnum>[
      _$dependentGenderEnum_male,
      _$dependentGenderEnum_female,
    ]);

Serializer<DependentRelationEnum> _$dependentRelationEnumSerializer =
    _$DependentRelationEnumSerializer();
Serializer<DependentGenderEnum> _$dependentGenderEnumSerializer =
    _$DependentGenderEnumSerializer();

class _$DependentRelationEnumSerializer
    implements PrimitiveSerializer<DependentRelationEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'child': 'child',
    'spouse': 'spouse',
    'parent': 'parent',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'child': 'child',
    'spouse': 'spouse',
    'parent': 'parent',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[DependentRelationEnum];
  @override
  final String wireName = 'DependentRelationEnum';

  @override
  Object serialize(
    Serializers serializers,
    DependentRelationEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DependentRelationEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DependentRelationEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DependentGenderEnumSerializer
    implements PrimitiveSerializer<DependentGenderEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'male': 'male',
    'female': 'female',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'male': 'male',
    'female': 'female',
  };

  @override
  final Iterable<Type> types = const <Type>[DependentGenderEnum];
  @override
  final String wireName = 'DependentGenderEnum';

  @override
  Object serialize(
    Serializers serializers,
    DependentGenderEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DependentGenderEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DependentGenderEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$Dependent extends Dependent {
  @override
  final String? id;
  @override
  final String? fullName;
  @override
  final DependentRelationEnum? relation;
  @override
  final Date? birthDate;
  @override
  final DependentGenderEnum? gender;

  factory _$Dependent([void Function(DependentBuilder)? updates]) =>
      (DependentBuilder()..update(updates))._build();

  _$Dependent._({
    this.id,
    this.fullName,
    this.relation,
    this.birthDate,
    this.gender,
  }) : super._();
  @override
  Dependent rebuild(void Function(DependentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DependentBuilder toBuilder() => DependentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Dependent &&
        id == other.id &&
        fullName == other.fullName &&
        relation == other.relation &&
        birthDate == other.birthDate &&
        gender == other.gender;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, relation.hashCode);
    _$hash = $jc(_$hash, birthDate.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Dependent')
          ..add('id', id)
          ..add('fullName', fullName)
          ..add('relation', relation)
          ..add('birthDate', birthDate)
          ..add('gender', gender))
        .toString();
  }
}

class DependentBuilder implements Builder<Dependent, DependentBuilder> {
  _$Dependent? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  DependentRelationEnum? _relation;
  DependentRelationEnum? get relation => _$this._relation;
  set relation(DependentRelationEnum? relation) => _$this._relation = relation;

  Date? _birthDate;
  Date? get birthDate => _$this._birthDate;
  set birthDate(Date? birthDate) => _$this._birthDate = birthDate;

  DependentGenderEnum? _gender;
  DependentGenderEnum? get gender => _$this._gender;
  set gender(DependentGenderEnum? gender) => _$this._gender = gender;

  DependentBuilder() {
    Dependent._defaults(this);
  }

  DependentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fullName = $v.fullName;
      _relation = $v.relation;
      _birthDate = $v.birthDate;
      _gender = $v.gender;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Dependent other) {
    _$v = other as _$Dependent;
  }

  @override
  void update(void Function(DependentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Dependent build() => _build();

  _$Dependent _build() {
    final _$result =
        _$v ??
        _$Dependent._(
          id: id,
          fullName: fullName,
          relation: relation,
          birthDate: birthDate,
          gender: gender,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
