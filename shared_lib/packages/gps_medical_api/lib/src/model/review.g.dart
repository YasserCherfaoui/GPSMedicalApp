// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReviewSubjectTypeEnum _$reviewSubjectTypeEnum_doctor =
    const ReviewSubjectTypeEnum._('doctor');
const ReviewSubjectTypeEnum _$reviewSubjectTypeEnum_clinic =
    const ReviewSubjectTypeEnum._('clinic');

ReviewSubjectTypeEnum _$reviewSubjectTypeEnumValueOf(String name) {
  switch (name) {
    case 'doctor':
      return _$reviewSubjectTypeEnum_doctor;
    case 'clinic':
      return _$reviewSubjectTypeEnum_clinic;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewSubjectTypeEnum> _$reviewSubjectTypeEnumValues =
    BuiltSet<ReviewSubjectTypeEnum>(const <ReviewSubjectTypeEnum>[
      _$reviewSubjectTypeEnum_doctor,
      _$reviewSubjectTypeEnum_clinic,
    ]);

const ReviewReviewScopeEnum _$reviewReviewScopeEnum_appointment =
    const ReviewReviewScopeEnum._('appointment');
const ReviewReviewScopeEnum _$reviewReviewScopeEnum_profile =
    const ReviewReviewScopeEnum._('profile');

ReviewReviewScopeEnum _$reviewReviewScopeEnumValueOf(String name) {
  switch (name) {
    case 'appointment':
      return _$reviewReviewScopeEnum_appointment;
    case 'profile':
      return _$reviewReviewScopeEnum_profile;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewReviewScopeEnum> _$reviewReviewScopeEnumValues =
    BuiltSet<ReviewReviewScopeEnum>(const <ReviewReviewScopeEnum>[
      _$reviewReviewScopeEnum_appointment,
      _$reviewReviewScopeEnum_profile,
    ]);

const ReviewStatusEnum _$reviewStatusEnum_pending = const ReviewStatusEnum._(
  'pending',
);
const ReviewStatusEnum _$reviewStatusEnum_published = const ReviewStatusEnum._(
  'published',
);
const ReviewStatusEnum _$reviewStatusEnum_hidden = const ReviewStatusEnum._(
  'hidden',
);
const ReviewStatusEnum _$reviewStatusEnum_deleted = const ReviewStatusEnum._(
  'deleted',
);

ReviewStatusEnum _$reviewStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$reviewStatusEnum_pending;
    case 'published':
      return _$reviewStatusEnum_published;
    case 'hidden':
      return _$reviewStatusEnum_hidden;
    case 'deleted':
      return _$reviewStatusEnum_deleted;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewStatusEnum> _$reviewStatusEnumValues =
    BuiltSet<ReviewStatusEnum>(const <ReviewStatusEnum>[
      _$reviewStatusEnum_pending,
      _$reviewStatusEnum_published,
      _$reviewStatusEnum_hidden,
      _$reviewStatusEnum_deleted,
    ]);

Serializer<ReviewSubjectTypeEnum> _$reviewSubjectTypeEnumSerializer =
    _$ReviewSubjectTypeEnumSerializer();
Serializer<ReviewReviewScopeEnum> _$reviewReviewScopeEnumSerializer =
    _$ReviewReviewScopeEnumSerializer();
Serializer<ReviewStatusEnum> _$reviewStatusEnumSerializer =
    _$ReviewStatusEnumSerializer();

class _$ReviewSubjectTypeEnumSerializer
    implements PrimitiveSerializer<ReviewSubjectTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'doctor': 'doctor',
    'clinic': 'clinic',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'doctor': 'doctor',
    'clinic': 'clinic',
  };

  @override
  final Iterable<Type> types = const <Type>[ReviewSubjectTypeEnum];
  @override
  final String wireName = 'ReviewSubjectTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ReviewSubjectTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ReviewSubjectTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ReviewSubjectTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ReviewReviewScopeEnumSerializer
    implements PrimitiveSerializer<ReviewReviewScopeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'appointment': 'appointment',
    'profile': 'profile',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'appointment': 'appointment',
    'profile': 'profile',
  };

  @override
  final Iterable<Type> types = const <Type>[ReviewReviewScopeEnum];
  @override
  final String wireName = 'ReviewReviewScopeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ReviewReviewScopeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ReviewReviewScopeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ReviewReviewScopeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ReviewStatusEnumSerializer
    implements PrimitiveSerializer<ReviewStatusEnum> {
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
  final Iterable<Type> types = const <Type>[ReviewStatusEnum];
  @override
  final String wireName = 'ReviewStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    ReviewStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ReviewStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ReviewStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$Review extends Review {
  @override
  final String? id;
  @override
  final ReviewSubjectTypeEnum? subjectType;
  @override
  final String? subjectId;
  @override
  final ReviewReviewScopeEnum? reviewScope;
  @override
  final String? doctorId;
  @override
  final String? clinicId;
  @override
  final String? patientId;
  @override
  final String? appointmentId;
  @override
  final int? rating;
  @override
  final String? comment;
  @override
  final ReviewStatusEnum? status;
  @override
  final DateTime? createdAt;

  factory _$Review([void Function(ReviewBuilder)? updates]) =>
      (ReviewBuilder()..update(updates))._build();

  _$Review._({
    this.id,
    this.subjectType,
    this.subjectId,
    this.reviewScope,
    this.doctorId,
    this.clinicId,
    this.patientId,
    this.appointmentId,
    this.rating,
    this.comment,
    this.status,
    this.createdAt,
  }) : super._();
  @override
  Review rebuild(void Function(ReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewBuilder toBuilder() => ReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Review &&
        id == other.id &&
        subjectType == other.subjectType &&
        subjectId == other.subjectId &&
        reviewScope == other.reviewScope &&
        doctorId == other.doctorId &&
        clinicId == other.clinicId &&
        patientId == other.patientId &&
        appointmentId == other.appointmentId &&
        rating == other.rating &&
        comment == other.comment &&
        status == other.status &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, subjectType.hashCode);
    _$hash = $jc(_$hash, subjectId.hashCode);
    _$hash = $jc(_$hash, reviewScope.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, clinicId.hashCode);
    _$hash = $jc(_$hash, patientId.hashCode);
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Review')
          ..add('id', id)
          ..add('subjectType', subjectType)
          ..add('subjectId', subjectId)
          ..add('reviewScope', reviewScope)
          ..add('doctorId', doctorId)
          ..add('clinicId', clinicId)
          ..add('patientId', patientId)
          ..add('appointmentId', appointmentId)
          ..add('rating', rating)
          ..add('comment', comment)
          ..add('status', status)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ReviewBuilder implements Builder<Review, ReviewBuilder> {
  _$Review? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ReviewSubjectTypeEnum? _subjectType;
  ReviewSubjectTypeEnum? get subjectType => _$this._subjectType;
  set subjectType(ReviewSubjectTypeEnum? subjectType) =>
      _$this._subjectType = subjectType;

  String? _subjectId;
  String? get subjectId => _$this._subjectId;
  set subjectId(String? subjectId) => _$this._subjectId = subjectId;

  ReviewReviewScopeEnum? _reviewScope;
  ReviewReviewScopeEnum? get reviewScope => _$this._reviewScope;
  set reviewScope(ReviewReviewScopeEnum? reviewScope) =>
      _$this._reviewScope = reviewScope;

  String? _doctorId;
  String? get doctorId => _$this._doctorId;
  set doctorId(String? doctorId) => _$this._doctorId = doctorId;

  String? _clinicId;
  String? get clinicId => _$this._clinicId;
  set clinicId(String? clinicId) => _$this._clinicId = clinicId;

  String? _patientId;
  String? get patientId => _$this._patientId;
  set patientId(String? patientId) => _$this._patientId = patientId;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ReviewStatusEnum? _status;
  ReviewStatusEnum? get status => _$this._status;
  set status(ReviewStatusEnum? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ReviewBuilder() {
    Review._defaults(this);
  }

  ReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _subjectType = $v.subjectType;
      _subjectId = $v.subjectId;
      _reviewScope = $v.reviewScope;
      _doctorId = $v.doctorId;
      _clinicId = $v.clinicId;
      _patientId = $v.patientId;
      _appointmentId = $v.appointmentId;
      _rating = $v.rating;
      _comment = $v.comment;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Review other) {
    _$v = other as _$Review;
  }

  @override
  void update(void Function(ReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Review build() => _build();

  _$Review _build() {
    final _$result =
        _$v ??
        _$Review._(
          id: id,
          subjectType: subjectType,
          subjectId: subjectId,
          reviewScope: reviewScope,
          doctorId: doctorId,
          clinicId: clinicId,
          patientId: patientId,
          appointmentId: appointmentId,
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
