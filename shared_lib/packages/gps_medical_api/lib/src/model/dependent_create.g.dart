// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependent_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DependentCreateRelationEnum _$dependentCreateRelationEnum_child =
    const DependentCreateRelationEnum._('child');
const DependentCreateRelationEnum _$dependentCreateRelationEnum_spouse =
    const DependentCreateRelationEnum._('spouse');
const DependentCreateRelationEnum _$dependentCreateRelationEnum_parent =
    const DependentCreateRelationEnum._('parent');
const DependentCreateRelationEnum _$dependentCreateRelationEnum_other =
    const DependentCreateRelationEnum._('other');

DependentCreateRelationEnum _$dependentCreateRelationEnumValueOf(String name) {
  switch (name) {
    case 'child':
      return _$dependentCreateRelationEnum_child;
    case 'spouse':
      return _$dependentCreateRelationEnum_spouse;
    case 'parent':
      return _$dependentCreateRelationEnum_parent;
    case 'other':
      return _$dependentCreateRelationEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DependentCreateRelationEnum>
_$dependentCreateRelationEnumValues =
    BuiltSet<DependentCreateRelationEnum>(const <DependentCreateRelationEnum>[
      _$dependentCreateRelationEnum_child,
      _$dependentCreateRelationEnum_spouse,
      _$dependentCreateRelationEnum_parent,
      _$dependentCreateRelationEnum_other,
    ]);

const DependentCreateGenderEnum _$dependentCreateGenderEnum_male =
    const DependentCreateGenderEnum._('male');
const DependentCreateGenderEnum _$dependentCreateGenderEnum_female =
    const DependentCreateGenderEnum._('female');

DependentCreateGenderEnum _$dependentCreateGenderEnumValueOf(String name) {
  switch (name) {
    case 'male':
      return _$dependentCreateGenderEnum_male;
    case 'female':
      return _$dependentCreateGenderEnum_female;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DependentCreateGenderEnum> _$dependentCreateGenderEnumValues =
    BuiltSet<DependentCreateGenderEnum>(const <DependentCreateGenderEnum>[
      _$dependentCreateGenderEnum_male,
      _$dependentCreateGenderEnum_female,
    ]);

Serializer<DependentCreateRelationEnum>
_$dependentCreateRelationEnumSerializer =
    _$DependentCreateRelationEnumSerializer();
Serializer<DependentCreateGenderEnum> _$dependentCreateGenderEnumSerializer =
    _$DependentCreateGenderEnumSerializer();

class _$DependentCreateRelationEnumSerializer
    implements PrimitiveSerializer<DependentCreateRelationEnum> {
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
  final Iterable<Type> types = const <Type>[DependentCreateRelationEnum];
  @override
  final String wireName = 'DependentCreateRelationEnum';

  @override
  Object serialize(
    Serializers serializers,
    DependentCreateRelationEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DependentCreateRelationEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DependentCreateRelationEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DependentCreateGenderEnumSerializer
    implements PrimitiveSerializer<DependentCreateGenderEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'male': 'male',
    'female': 'female',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'male': 'male',
    'female': 'female',
  };

  @override
  final Iterable<Type> types = const <Type>[DependentCreateGenderEnum];
  @override
  final String wireName = 'DependentCreateGenderEnum';

  @override
  Object serialize(
    Serializers serializers,
    DependentCreateGenderEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DependentCreateGenderEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DependentCreateGenderEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DependentCreate extends DependentCreate {
  @override
  final String fullName;
  @override
  final DependentCreateRelationEnum relation;
  @override
  final Date birthDate;
  @override
  final DependentCreateGenderEnum gender;

  factory _$DependentCreate([void Function(DependentCreateBuilder)? updates]) =>
      (DependentCreateBuilder()..update(updates))._build();

  _$DependentCreate._({
    required this.fullName,
    required this.relation,
    required this.birthDate,
    required this.gender,
  }) : super._();
  @override
  DependentCreate rebuild(void Function(DependentCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DependentCreateBuilder toBuilder() => DependentCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DependentCreate &&
        fullName == other.fullName &&
        relation == other.relation &&
        birthDate == other.birthDate &&
        gender == other.gender;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, relation.hashCode);
    _$hash = $jc(_$hash, birthDate.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DependentCreate')
          ..add('fullName', fullName)
          ..add('relation', relation)
          ..add('birthDate', birthDate)
          ..add('gender', gender))
        .toString();
  }
}

class DependentCreateBuilder
    implements Builder<DependentCreate, DependentCreateBuilder> {
  _$DependentCreate? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  DependentCreateRelationEnum? _relation;
  DependentCreateRelationEnum? get relation => _$this._relation;
  set relation(DependentCreateRelationEnum? relation) =>
      _$this._relation = relation;

  Date? _birthDate;
  Date? get birthDate => _$this._birthDate;
  set birthDate(Date? birthDate) => _$this._birthDate = birthDate;

  DependentCreateGenderEnum? _gender;
  DependentCreateGenderEnum? get gender => _$this._gender;
  set gender(DependentCreateGenderEnum? gender) => _$this._gender = gender;

  DependentCreateBuilder() {
    DependentCreate._defaults(this);
  }

  DependentCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _relation = $v.relation;
      _birthDate = $v.birthDate;
      _gender = $v.gender;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DependentCreate other) {
    _$v = other as _$DependentCreate;
  }

  @override
  void update(void Function(DependentCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DependentCreate build() => _build();

  _$DependentCreate _build() {
    final _$result =
        _$v ??
        _$DependentCreate._(
          fullName: BuiltValueNullFieldError.checkNotNull(
            fullName,
            r'DependentCreate',
            'fullName',
          ),
          relation: BuiltValueNullFieldError.checkNotNull(
            relation,
            r'DependentCreate',
            'relation',
          ),
          birthDate: BuiltValueNullFieldError.checkNotNull(
            birthDate,
            r'DependentCreate',
            'birthDate',
          ),
          gender: BuiltValueNullFieldError.checkNotNull(
            gender,
            r'DependentCreate',
            'gender',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
