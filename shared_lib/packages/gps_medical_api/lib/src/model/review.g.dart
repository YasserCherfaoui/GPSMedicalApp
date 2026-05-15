// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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

Serializer<ReviewStatusEnum> _$reviewStatusEnumSerializer =
    _$ReviewStatusEnumSerializer();

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
  final String? doctorId;
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
    this.doctorId,
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
        doctorId == other.doctorId &&
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
    _$hash = $jc(_$hash, doctorId.hashCode);
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
          ..add('doctorId', doctorId)
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

  String? _doctorId;
  String? get doctorId => _$this._doctorId;
  set doctorId(String? doctorId) => _$this._doctorId = doctorId;

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
      _doctorId = $v.doctorId;
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
          doctorId: doctorId,
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
