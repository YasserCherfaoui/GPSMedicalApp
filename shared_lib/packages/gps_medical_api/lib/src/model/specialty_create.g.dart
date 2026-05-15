// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialty_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SpecialtyCreate extends SpecialtyCreate {
  @override
  final String code;
  @override
  final String nameFr;
  @override
  final String? nameAr;
  @override
  final String? parentId;

  factory _$SpecialtyCreate([void Function(SpecialtyCreateBuilder)? updates]) =>
      (SpecialtyCreateBuilder()..update(updates))._build();

  _$SpecialtyCreate._({
    required this.code,
    required this.nameFr,
    this.nameAr,
    this.parentId,
  }) : super._();
  @override
  SpecialtyCreate rebuild(void Function(SpecialtyCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpecialtyCreateBuilder toBuilder() => SpecialtyCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpecialtyCreate &&
        code == other.code &&
        nameFr == other.nameFr &&
        nameAr == other.nameAr &&
        parentId == other.parentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, nameFr.hashCode);
    _$hash = $jc(_$hash, nameAr.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpecialtyCreate')
          ..add('code', code)
          ..add('nameFr', nameFr)
          ..add('nameAr', nameAr)
          ..add('parentId', parentId))
        .toString();
  }
}

class SpecialtyCreateBuilder
    implements Builder<SpecialtyCreate, SpecialtyCreateBuilder> {
  _$SpecialtyCreate? _$v;

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

  SpecialtyCreateBuilder() {
    SpecialtyCreate._defaults(this);
  }

  SpecialtyCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _nameFr = $v.nameFr;
      _nameAr = $v.nameAr;
      _parentId = $v.parentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SpecialtyCreate other) {
    _$v = other as _$SpecialtyCreate;
  }

  @override
  void update(void Function(SpecialtyCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpecialtyCreate build() => _build();

  _$SpecialtyCreate _build() {
    final _$result =
        _$v ??
        _$SpecialtyCreate._(
          code: BuiltValueNullFieldError.checkNotNull(
            code,
            r'SpecialtyCreate',
            'code',
          ),
          nameFr: BuiltValueNullFieldError.checkNotNull(
            nameFr,
            r'SpecialtyCreate',
            'nameFr',
          ),
          nameAr: nameAr,
          parentId: parentId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
