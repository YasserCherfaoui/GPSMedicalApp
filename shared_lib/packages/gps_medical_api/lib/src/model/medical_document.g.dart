// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_document.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MedicalDocumentTypeEnum _$medicalDocumentTypeEnum_prescription =
    const MedicalDocumentTypeEnum._('prescription');
const MedicalDocumentTypeEnum _$medicalDocumentTypeEnum_report =
    const MedicalDocumentTypeEnum._('report');
const MedicalDocumentTypeEnum _$medicalDocumentTypeEnum_labResult =
    const MedicalDocumentTypeEnum._('labResult');
const MedicalDocumentTypeEnum _$medicalDocumentTypeEnum_imaging =
    const MedicalDocumentTypeEnum._('imaging');
const MedicalDocumentTypeEnum _$medicalDocumentTypeEnum_certificate =
    const MedicalDocumentTypeEnum._('certificate');
const MedicalDocumentTypeEnum _$medicalDocumentTypeEnum_other =
    const MedicalDocumentTypeEnum._('other');

MedicalDocumentTypeEnum _$medicalDocumentTypeEnumValueOf(String name) {
  switch (name) {
    case 'prescription':
      return _$medicalDocumentTypeEnum_prescription;
    case 'report':
      return _$medicalDocumentTypeEnum_report;
    case 'labResult':
      return _$medicalDocumentTypeEnum_labResult;
    case 'imaging':
      return _$medicalDocumentTypeEnum_imaging;
    case 'certificate':
      return _$medicalDocumentTypeEnum_certificate;
    case 'other':
      return _$medicalDocumentTypeEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<MedicalDocumentTypeEnum> _$medicalDocumentTypeEnumValues =
    BuiltSet<MedicalDocumentTypeEnum>(const <MedicalDocumentTypeEnum>[
      _$medicalDocumentTypeEnum_prescription,
      _$medicalDocumentTypeEnum_report,
      _$medicalDocumentTypeEnum_labResult,
      _$medicalDocumentTypeEnum_imaging,
      _$medicalDocumentTypeEnum_certificate,
      _$medicalDocumentTypeEnum_other,
    ]);

const MedicalDocumentAuthorRoleEnum _$medicalDocumentAuthorRoleEnum_patient =
    const MedicalDocumentAuthorRoleEnum._('patient');
const MedicalDocumentAuthorRoleEnum _$medicalDocumentAuthorRoleEnum_specialist =
    const MedicalDocumentAuthorRoleEnum._('specialist');
const MedicalDocumentAuthorRoleEnum _$medicalDocumentAuthorRoleEnum_concierge =
    const MedicalDocumentAuthorRoleEnum._('concierge');

MedicalDocumentAuthorRoleEnum _$medicalDocumentAuthorRoleEnumValueOf(
  String name,
) {
  switch (name) {
    case 'patient':
      return _$medicalDocumentAuthorRoleEnum_patient;
    case 'specialist':
      return _$medicalDocumentAuthorRoleEnum_specialist;
    case 'concierge':
      return _$medicalDocumentAuthorRoleEnum_concierge;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<MedicalDocumentAuthorRoleEnum>
_$medicalDocumentAuthorRoleEnumValues = BuiltSet<MedicalDocumentAuthorRoleEnum>(
  const <MedicalDocumentAuthorRoleEnum>[
    _$medicalDocumentAuthorRoleEnum_patient,
    _$medicalDocumentAuthorRoleEnum_specialist,
    _$medicalDocumentAuthorRoleEnum_concierge,
  ],
);

Serializer<MedicalDocumentTypeEnum> _$medicalDocumentTypeEnumSerializer =
    _$MedicalDocumentTypeEnumSerializer();
Serializer<MedicalDocumentAuthorRoleEnum>
_$medicalDocumentAuthorRoleEnumSerializer =
    _$MedicalDocumentAuthorRoleEnumSerializer();

class _$MedicalDocumentTypeEnumSerializer
    implements PrimitiveSerializer<MedicalDocumentTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'prescription': 'prescription',
    'report': 'report',
    'labResult': 'lab_result',
    'imaging': 'imaging',
    'certificate': 'certificate',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'prescription': 'prescription',
    'report': 'report',
    'lab_result': 'labResult',
    'imaging': 'imaging',
    'certificate': 'certificate',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[MedicalDocumentTypeEnum];
  @override
  final String wireName = 'MedicalDocumentTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    MedicalDocumentTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  MedicalDocumentTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => MedicalDocumentTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$MedicalDocumentAuthorRoleEnumSerializer
    implements PrimitiveSerializer<MedicalDocumentAuthorRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'patient': 'patient',
    'specialist': 'specialist',
    'concierge': 'concierge',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'patient': 'patient',
    'specialist': 'specialist',
    'concierge': 'concierge',
  };

  @override
  final Iterable<Type> types = const <Type>[MedicalDocumentAuthorRoleEnum];
  @override
  final String wireName = 'MedicalDocumentAuthorRoleEnum';

  @override
  Object serialize(
    Serializers serializers,
    MedicalDocumentAuthorRoleEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  MedicalDocumentAuthorRoleEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => MedicalDocumentAuthorRoleEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$MedicalDocument extends MedicalDocument {
  @override
  final String? id;
  @override
  final MedicalDocumentTypeEnum? type;
  @override
  final String? title;
  @override
  final String? notes;
  @override
  final String? appointmentId;
  @override
  final String? patientId;
  @override
  final String? authorId;
  @override
  final MedicalDocumentAuthorRoleEnum? authorRole;
  @override
  final int? fileSize;
  @override
  final String? mimeType;
  @override
  final DateTime? createdAt;

  factory _$MedicalDocument([void Function(MedicalDocumentBuilder)? updates]) =>
      (MedicalDocumentBuilder()..update(updates))._build();

  _$MedicalDocument._({
    this.id,
    this.type,
    this.title,
    this.notes,
    this.appointmentId,
    this.patientId,
    this.authorId,
    this.authorRole,
    this.fileSize,
    this.mimeType,
    this.createdAt,
  }) : super._();
  @override
  MedicalDocument rebuild(void Function(MedicalDocumentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicalDocumentBuilder toBuilder() => MedicalDocumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicalDocument &&
        id == other.id &&
        type == other.type &&
        title == other.title &&
        notes == other.notes &&
        appointmentId == other.appointmentId &&
        patientId == other.patientId &&
        authorId == other.authorId &&
        authorRole == other.authorRole &&
        fileSize == other.fileSize &&
        mimeType == other.mimeType &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, patientId.hashCode);
    _$hash = $jc(_$hash, authorId.hashCode);
    _$hash = $jc(_$hash, authorRole.hashCode);
    _$hash = $jc(_$hash, fileSize.hashCode);
    _$hash = $jc(_$hash, mimeType.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedicalDocument')
          ..add('id', id)
          ..add('type', type)
          ..add('title', title)
          ..add('notes', notes)
          ..add('appointmentId', appointmentId)
          ..add('patientId', patientId)
          ..add('authorId', authorId)
          ..add('authorRole', authorRole)
          ..add('fileSize', fileSize)
          ..add('mimeType', mimeType)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class MedicalDocumentBuilder
    implements Builder<MedicalDocument, MedicalDocumentBuilder> {
  _$MedicalDocument? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  MedicalDocumentTypeEnum? _type;
  MedicalDocumentTypeEnum? get type => _$this._type;
  set type(MedicalDocumentTypeEnum? type) => _$this._type = type;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  String? _patientId;
  String? get patientId => _$this._patientId;
  set patientId(String? patientId) => _$this._patientId = patientId;

  String? _authorId;
  String? get authorId => _$this._authorId;
  set authorId(String? authorId) => _$this._authorId = authorId;

  MedicalDocumentAuthorRoleEnum? _authorRole;
  MedicalDocumentAuthorRoleEnum? get authorRole => _$this._authorRole;
  set authorRole(MedicalDocumentAuthorRoleEnum? authorRole) =>
      _$this._authorRole = authorRole;

  int? _fileSize;
  int? get fileSize => _$this._fileSize;
  set fileSize(int? fileSize) => _$this._fileSize = fileSize;

  String? _mimeType;
  String? get mimeType => _$this._mimeType;
  set mimeType(String? mimeType) => _$this._mimeType = mimeType;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  MedicalDocumentBuilder() {
    MedicalDocument._defaults(this);
  }

  MedicalDocumentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _title = $v.title;
      _notes = $v.notes;
      _appointmentId = $v.appointmentId;
      _patientId = $v.patientId;
      _authorId = $v.authorId;
      _authorRole = $v.authorRole;
      _fileSize = $v.fileSize;
      _mimeType = $v.mimeType;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicalDocument other) {
    _$v = other as _$MedicalDocument;
  }

  @override
  void update(void Function(MedicalDocumentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MedicalDocument build() => _build();

  _$MedicalDocument _build() {
    final _$result =
        _$v ??
        _$MedicalDocument._(
          id: id,
          type: type,
          title: title,
          notes: notes,
          appointmentId: appointmentId,
          patientId: patientId,
          authorId: authorId,
          authorRole: authorRole,
          fileSize: fileSize,
          mimeType: mimeType,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
