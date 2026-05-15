// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialty.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Specialty extends Specialty {
  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? nameFr;
  @override
  final String? nameAr;
  @override
  final String? parentId;

  factory _$Specialty([void Function(SpecialtyBuilder)? updates]) =>
      (SpecialtyBuilder()..update(updates))._build();

  _$Specialty._({this.id, this.code, this.nameFr, this.nameAr, this.parentId})
    : super._();
  @override
  Specialty rebuild(void Function(SpecialtyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpecialtyBuilder toBuilder() => SpecialtyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Specialty &&
        id == other.id &&
        code == other.code &&
        nameFr == other.nameFr &&
        nameAr == other.nameAr &&
        parentId == other.parentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, nameFr.hashCode);
    _$hash = $jc(_$hash, nameAr.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Specialty')
          ..add('id', id)
          ..add('code', code)
          ..add('nameFr', nameFr)
          ..add('nameAr', nameAr)
          ..add('parentId', parentId))
        .toString();
  }
}

class SpecialtyBuilder implements Builder<Specialty, SpecialtyBuilder> {
  _$Specialty? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _nameFr;
  String? get nameFr => _$this._nameFr;
  set nameFr(String? nameFr) => _$this._nameFr = nameFr;

  String? _nameAr;
  String? get nameAr => _$this._nameAr;
  set nameAr(String? nameAr) => _$this._nameAr = nameAr;

  String? _parentId;
  String? get parentId => _$this._parentId;
  set parentId(String? parentId) => _$this._parentId = parentId;

  SpecialtyBuilder() {
    Specialty._defaults(this);
  }

  SpecialtyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _code = $v.code;
      _nameFr = $v.nameFr;
      _nameAr = $v.nameAr;
      _parentId = $v.parentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Specialty other) {
    _$v = other as _$Specialty;
  }

  @override
  void update(void Function(SpecialtyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Specialty build() => _build();

  _$Specialty _build() {
    final _$result =
        _$v ??
        _$Specialty._(
          id: id,
          code: code,
          nameFr: nameFr,
          nameAr: nameAr,
          parentId: parentId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
