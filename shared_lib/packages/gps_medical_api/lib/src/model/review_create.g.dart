// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReviewCreateSubjectTypeEnum _$reviewCreateSubjectTypeEnum_doctor =
    const ReviewCreateSubjectTypeEnum._('doctor');
const ReviewCreateSubjectTypeEnum _$reviewCreateSubjectTypeEnum_clinic =
    const ReviewCreateSubjectTypeEnum._('clinic');

ReviewCreateSubjectTypeEnum _$reviewCreateSubjectTypeEnumValueOf(String name) {
  switch (name) {
    case 'doctor':
      return _$reviewCreateSubjectTypeEnum_doctor;
    case 'clinic':
      return _$reviewCreateSubjectTypeEnum_clinic;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewCreateSubjectTypeEnum>
_$reviewCreateSubjectTypeEnumValues = BuiltSet<ReviewCreateSubjectTypeEnum>(
  const <ReviewCreateSubjectTypeEnum>[
    _$reviewCreateSubjectTypeEnum_doctor,
    _$reviewCreateSubjectTypeEnum_clinic,
  ],
);

const ReviewCreateReviewScopeEnum _$reviewCreateReviewScopeEnum_appointment =
    const ReviewCreateReviewScopeEnum._('appointment');
const ReviewCreateReviewScopeEnum _$reviewCreateReviewScopeEnum_profile =
    const ReviewCreateReviewScopeEnum._('profile');

ReviewCreateReviewScopeEnum _$reviewCreateReviewScopeEnumValueOf(String name) {
  switch (name) {
    case 'appointment':
      return _$reviewCreateReviewScopeEnum_appointment;
    case 'profile':
      return _$reviewCreateReviewScopeEnum_profile;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewCreateReviewScopeEnum>
_$reviewCreateReviewScopeEnumValues =
    BuiltSet<ReviewCreateReviewScopeEnum>(const <ReviewCreateReviewScopeEnum>[
      _$reviewCreateReviewScopeEnum_appointment,
      _$reviewCreateReviewScopeEnum_profile,
    ]);

Serializer<ReviewCreateSubjectTypeEnum>
_$reviewCreateSubjectTypeEnumSerializer =
    _$ReviewCreateSubjectTypeEnumSerializer();
Serializer<ReviewCreateReviewScopeEnum>
_$reviewCreateReviewScopeEnumSerializer =
    _$ReviewCreateReviewScopeEnumSerializer();

class _$ReviewCreateSubjectTypeEnumSerializer
    implements PrimitiveSerializer<ReviewCreateSubjectTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'doctor': 'doctor',
    'clinic': 'clinic',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'doctor': 'doctor',
    'clinic': 'clinic',
  };

  @override
  final Iterable<Type> types = const <Type>[ReviewCreateSubjectTypeEnum];
  @override
  final String wireName = 'ReviewCreateSubjectTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ReviewCreateSubjectTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ReviewCreateSubjectTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ReviewCreateSubjectTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ReviewCreateReviewScopeEnumSerializer
    implements PrimitiveSerializer<ReviewCreateReviewScopeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'appointment': 'appointment',
    'profile': 'profile',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'appointment': 'appointment',
    'profile': 'profile',
  };

  @override
  final Iterable<Type> types = const <Type>[ReviewCreateReviewScopeEnum];
  @override
  final String wireName = 'ReviewCreateReviewScopeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ReviewCreateReviewScopeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ReviewCreateReviewScopeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ReviewCreateReviewScopeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ReviewCreate extends ReviewCreate {
  @override
  final ReviewCreateSubjectTypeEnum? subjectType;
  @override
  final ReviewCreateReviewScopeEnum? reviewScope;
  @override
  final String? appointmentId;
  @override
  final String? clinicId;
  @override
  final int rating;
  @override
  final String? comment;

  factory _$ReviewCreate([void Function(ReviewCreateBuilder)? updates]) =>
      (ReviewCreateBuilder()..update(updates))._build();

  _$ReviewCreate._({
    this.subjectType,
    this.reviewScope,
    this.appointmentId,
    this.clinicId,
    required this.rating,
    this.comment,
  }) : super._();
  @override
  ReviewCreate rebuild(void Function(ReviewCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewCreateBuilder toBuilder() => ReviewCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewCreate &&
        subjectType == other.subjectType &&
        reviewScope == other.reviewScope &&
        appointmentId == other.appointmentId &&
        clinicId == other.clinicId &&
        rating == other.rating &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, subjectType.hashCode);
    _$hash = $jc(_$hash, reviewScope.hashCode);
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, clinicId.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewCreate')
          ..add('subjectType', subjectType)
          ..add('reviewScope', reviewScope)
          ..add('appointmentId', appointmentId)
          ..add('clinicId', clinicId)
          ..add('rating', rating)
          ..add('comment', comment))
        .toString();
  }
}

class ReviewCreateBuilder
    implements Builder<ReviewCreate, ReviewCreateBuilder> {
  _$ReviewCreate? _$v;

  ReviewCreateSubjectTypeEnum? _subjectType;
  ReviewCreateSubjectTypeEnum? get subjectType => _$this._subjectType;
  set subjectType(ReviewCreateSubjectTypeEnum? subjectType) =>
      _$this._subjectType = subjectType;

  ReviewCreateReviewScopeEnum? _reviewScope;
  ReviewCreateReviewScopeEnum? get reviewScope => _$this._reviewScope;
  set reviewScope(ReviewCreateReviewScopeEnum? reviewScope) =>
      _$this._reviewScope = reviewScope;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  String? _clinicId;
  String? get clinicId => _$this._clinicId;
  set clinicId(String? clinicId) => _$this._clinicId = clinicId;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ReviewCreateBuilder() {
    ReviewCreate._defaults(this);
  }

  ReviewCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subjectType = $v.subjectType;
      _reviewScope = $v.reviewScope;
      _appointmentId = $v.appointmentId;
      _clinicId = $v.clinicId;
      _rating = $v.rating;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewCreate other) {
    _$v = other as _$ReviewCreate;
  }

  @override
  void update(void Function(ReviewCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewCreate build() => _build();

  _$ReviewCreate _build() {
    final _$result =
        _$v ??
        _$ReviewCreate._(
          subjectType: subjectType,
          reviewScope: reviewScope,
          appointmentId: appointmentId,
          clinicId: clinicId,
          rating: BuiltValueNullFieldError.checkNotNull(
            rating,
            r'ReviewCreate',
            'rating',
          ),
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
