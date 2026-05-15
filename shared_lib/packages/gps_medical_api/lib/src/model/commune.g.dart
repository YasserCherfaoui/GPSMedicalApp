// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commune.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Commune extends Commune {
  @override
  final String? id;
  @override
  final String? wilayaCode;
  @override
  final String? nameFr;
  @override
  final String? nameAr;

  factory _$Commune([void Function(CommuneBuilder)? updates]) =>
      (CommuneBuilder()..update(updates))._build();

  _$Commune._({this.id, this.wilayaCode, this.nameFr, this.nameAr}) : super._();
  @override
  Commune rebuild(void Function(CommuneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommuneBuilder toBuilder() => CommuneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Commune &&
        id == other.id &&
        wilayaCode == other.wilayaCode &&
        nameFr == other.nameFr &&
        nameAr == other.nameAr;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, wilayaCode.hashCode);
    _$hash = $jc(_$hash, nameFr.hashCode);
    _$hash = $jc(_$hash, nameAr.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Commune')
          ..add('id', id)
          ..add('wilayaCode', wilayaCode)
          ..add('nameFr', nameFr)
          ..add('nameAr', nameAr))
        .toString();
  }
}

class CommuneBuilder implements Builder<Commune, CommuneBuilder> {
  _$Commune? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _wilayaCode;
  String? get wilayaCode => _$this._wilayaCode;
  set wilayaCode(String? wilayaCode) => _$this._wilayaCode = wilayaCode;

  String? _nameFr;
  String? get nameFr => _$this._nameFr;
  set nameFr(String? nameFr) => _$this._nameFr = nameFr;

  String? _nameAr;
  String? get nameAr => _$this._nameAr;
  set nameAr(String? nameAr) => _$this._nameAr = nameAr;

  CommuneBuilder() {
    Commune._defaults(this);
  }

  CommuneBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _wilayaCode = $v.wilayaCode;
      _nameFr = $v.nameFr;
      _nameAr = $v.nameAr;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Commune other) {
    _$v = other as _$Commune;
  }

  @override
  void update(void Function(CommuneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Commune build() => _build();

  _$Commune _build() {
    final _$result =
        _$v ??
        _$Commune._(
          id: id,
          wilayaCode: wilayaCode,
          nameFr: nameFr,
          nameAr: nameAr,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
