// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SuggestItemKindEnum _$suggestItemKindEnum_doctor =
    const SuggestItemKindEnum._('doctor');
const SuggestItemKindEnum _$suggestItemKindEnum_specialty =
    const SuggestItemKindEnum._('specialty');
const SuggestItemKindEnum _$suggestItemKindEnum_location =
    const SuggestItemKindEnum._('location');

SuggestItemKindEnum _$suggestItemKindEnumValueOf(String name) {
  switch (name) {
    case 'doctor':
      return _$suggestItemKindEnum_doctor;
    case 'specialty':
      return _$suggestItemKindEnum_specialty;
    case 'location':
      return _$suggestItemKindEnum_location;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SuggestItemKindEnum> _$suggestItemKindEnumValues =
    BuiltSet<SuggestItemKindEnum>(const <SuggestItemKindEnum>[
      _$suggestItemKindEnum_doctor,
      _$suggestItemKindEnum_specialty,
      _$suggestItemKindEnum_location,
    ]);

Serializer<SuggestItemKindEnum> _$suggestItemKindEnumSerializer =
    _$SuggestItemKindEnumSerializer();

class _$SuggestItemKindEnumSerializer
    implements PrimitiveSerializer<SuggestItemKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'doctor': 'doctor',
    'specialty': 'specialty',
    'location': 'location',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'doctor': 'doctor',
    'specialty': 'specialty',
    'location': 'location',
  };

  @override
  final Iterable<Type> types = const <Type>[SuggestItemKindEnum];
  @override
  final String wireName = 'SuggestItemKindEnum';

  @override
  Object serialize(
    Serializers serializers,
    SuggestItemKindEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  SuggestItemKindEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => SuggestItemKindEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$SuggestItem extends SuggestItem {
  @override
  final String? id;
  @override
  final String? label;
  @override
  final SuggestItemKindEnum? kind;

  factory _$SuggestItem([void Function(SuggestItemBuilder)? updates]) =>
      (SuggestItemBuilder()..update(updates))._build();

  _$SuggestItem._({this.id, this.label, this.kind}) : super._();
  @override
  SuggestItem rebuild(void Function(SuggestItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuggestItemBuilder toBuilder() => SuggestItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuggestItem &&
        id == other.id &&
        label == other.label &&
        kind == other.kind;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SuggestItem')
          ..add('id', id)
          ..add('label', label)
          ..add('kind', kind))
        .toString();
  }
}

class SuggestItemBuilder implements Builder<SuggestItem, SuggestItemBuilder> {
  _$SuggestItem? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  SuggestItemKindEnum? _kind;
  SuggestItemKindEnum? get kind => _$this._kind;
  set kind(SuggestItemKindEnum? kind) => _$this._kind = kind;

  SuggestItemBuilder() {
    SuggestItem._defaults(this);
  }

  SuggestItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _label = $v.label;
      _kind = $v.kind;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SuggestItem other) {
    _$v = other as _$SuggestItem;
  }

  @override
  void update(void Function(SuggestItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SuggestItem build() => _build();

  _$SuggestItem _build() {
    final _$result = _$v ?? _$SuggestItem._(id: id, label: label, kind: kind);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
