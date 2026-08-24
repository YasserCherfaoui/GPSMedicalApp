// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_review.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicReviewStatusEnum _$clinicReviewStatusEnum_pending =
    const ClinicReviewStatusEnum._('pending');
const ClinicReviewStatusEnum _$clinicReviewStatusEnum_published =
    const ClinicReviewStatusEnum._('published');
const ClinicReviewStatusEnum _$clinicReviewStatusEnum_hidden =
    const ClinicReviewStatusEnum._('hidden');
const ClinicReviewStatusEnum _$clinicReviewStatusEnum_deleted =
    const ClinicReviewStatusEnum._('deleted');

ClinicReviewStatusEnum _$clinicReviewStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$clinicReviewStatusEnum_pending;
    case 'published':
      return _$clinicReviewStatusEnum_published;
    case 'hidden':
      return _$clinicReviewStatusEnum_hidden;
    case 'deleted':
      return _$clinicReviewStatusEnum_deleted;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicReviewStatusEnum> _$clinicReviewStatusEnumValues =
    BuiltSet<ClinicReviewStatusEnum>(const <ClinicReviewStatusEnum>[
      _$clinicReviewStatusEnum_pending,
      _$clinicReviewStatusEnum_published,
      _$clinicReviewStatusEnum_hidden,
      _$clinicReviewStatusEnum_deleted,
    ]);

Serializer<ClinicReviewStatusEnum> _$clinicReviewStatusEnumSerializer =
    _$ClinicReviewStatusEnumSerializer();

class _$ClinicReviewStatusEnumSerializer
    implements PrimitiveSerializer<ClinicReviewStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'published': 'published',
    'hidden': 'hidden',
    'deleted': 'deleted',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'published': 'published',
    'hidden': 'hidden',
    'deleted': 'deleted',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicReviewStatusEnum];
  @override
  final String wireName = 'ClinicReviewStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicReviewStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicReviewStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicReviewStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicReview extends ClinicReview {
  @override
  final String? id;
  @override
  final String? clinicId;
  @override
  final String? patientId;
  @override
  final int? rating;
  @override
  final String? comment;
  @override
  final ClinicReviewStatusEnum? status;
  @override
  final DateTime? createdAt;

  factory _$ClinicReview([void Function(ClinicReviewBuilder)? updates]) =>
      (ClinicReviewBuilder()..update(updates))._build();

  _$ClinicReview._({
    this.id,
    this.clinicId,
    this.patientId,
    this.rating,
    this.comment,
    this.status,
    this.createdAt,
  }) : super._();
  @override
  ClinicReview rebuild(void Function(ClinicReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicReviewBuilder toBuilder() => ClinicReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicReview &&
        id == other.id &&
        clinicId == other.clinicId &&
        patientId == other.patientId &&
        rating == other.rating &&
        comment == other.comment &&
        status == other.status &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, clinicId.hashCode);
    _$hash = $jc(_$hash, patientId.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicReview')
          ..add('id', id)
          ..add('clinicId', clinicId)
          ..add('patientId', patientId)
          ..add('rating', rating)
          ..add('comment', comment)
          ..add('status', status)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ClinicReviewBuilder
    implements Builder<ClinicReview, ClinicReviewBuilder> {
  _$ClinicReview? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _clinicId;
  String? get clinicId => _$this._clinicId;
  set clinicId(String? clinicId) => _$this._clinicId = clinicId;

  String? _patientId;
  String? get patientId => _$this._patientId;
  set patientId(String? patientId) => _$this._patientId = patientId;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ClinicReviewStatusEnum? _status;
  ClinicReviewStatusEnum? get status => _$this._status;
  set status(ClinicReviewStatusEnum? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ClinicReviewBuilder() {
    ClinicReview._defaults(this);
  }

  ClinicReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _clinicId = $v.clinicId;
      _patientId = $v.patientId;
      _rating = $v.rating;
      _comment = $v.comment;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicReview other) {
    _$v = other as _$ClinicReview;
  }

  @override
  void update(void Function(ClinicReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicReview build() => _build();

  _$ClinicReview _build() {
    final _$result =
        _$v ??
        _$ClinicReview._(
          id: id,
          clinicId: clinicId,
          patientId: patientId,
          rating: rating,
          comment: comment,
          status: status,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
