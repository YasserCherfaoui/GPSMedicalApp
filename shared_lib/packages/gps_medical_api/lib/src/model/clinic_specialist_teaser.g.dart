// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_specialist_teaser.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicSpecialistTeaser extends ClinicSpecialistTeaser {
  @override
  final String? id;
  @override
  final String? fullName;
  @override
  final String? title;
  @override
  final String? specialtyCode;
  @override
  final String? photoUrl;

  factory _$ClinicSpecialistTeaser([
    void Function(ClinicSpecialistTeaserBuilder)? updates,
  ]) => (ClinicSpecialistTeaserBuilder()..update(updates))._build();

  _$ClinicSpecialistTeaser._({
    this.id,
    this.fullName,
    this.title,
    this.specialtyCode,
    this.photoUrl,
  }) : super._();
  @override
  ClinicSpecialistTeaser rebuild(
    void Function(ClinicSpecialistTeaserBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicSpecialistTeaserBuilder toBuilder() =>
      ClinicSpecialistTeaserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicSpecialistTeaser &&
        id == other.id &&
        fullName == other.fullName &&
        title == other.title &&
        specialtyCode == other.specialtyCode &&
        photoUrl == other.photoUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, specialtyCode.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicSpecialistTeaser')
          ..add('id', id)
          ..add('fullName', fullName)
          ..add('title', title)
          ..add('specialtyCode', specialtyCode)
          ..add('photoUrl', photoUrl))
        .toString();
  }
}

class ClinicSpecialistTeaserBuilder
    implements Builder<ClinicSpecialistTeaser, ClinicSpecialistTeaserBuilder> {
  _$ClinicSpecialistTeaser? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _specialtyCode;
  String? get specialtyCode => _$this._specialtyCode;
  set specialtyCode(String? specialtyCode) =>
      _$this._specialtyCode = specialtyCode;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  ClinicSpecialistTeaserBuilder() {
    ClinicSpecialistTeaser._defaults(this);
  }

  ClinicSpecialistTeaserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fullName = $v.fullName;
      _title = $v.title;
      _specialtyCode = $v.specialtyCode;
      _photoUrl = $v.photoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicSpecialistTeaser other) {
    _$v = other as _$ClinicSpecialistTeaser;
  }

  @override
  void update(void Function(ClinicSpecialistTeaserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicSpecialistTeaser build() => _build();

  _$ClinicSpecialistTeaser _build() {
    final _$result =
        _$v ??
        _$ClinicSpecialistTeaser._(
          id: id,
          fullName: fullName,
          title: title,
          specialtyCode: specialtyCode,
          photoUrl: photoUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
