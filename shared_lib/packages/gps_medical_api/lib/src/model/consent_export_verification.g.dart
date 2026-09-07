// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_export_verification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConsentExportVerificationAlgorithmEnum
_$consentExportVerificationAlgorithmEnum_ed25519 =
    const ConsentExportVerificationAlgorithmEnum._('ed25519');

ConsentExportVerificationAlgorithmEnum
_$consentExportVerificationAlgorithmEnumValueOf(String name) {
  switch (name) {
    case 'ed25519':
      return _$consentExportVerificationAlgorithmEnum_ed25519;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConsentExportVerificationAlgorithmEnum>
_$consentExportVerificationAlgorithmEnumValues =
    BuiltSet<ConsentExportVerificationAlgorithmEnum>(
      const <ConsentExportVerificationAlgorithmEnum>[
        _$consentExportVerificationAlgorithmEnum_ed25519,
      ],
    );

const ConsentExportVerificationSignedOverEnum
_$consentExportVerificationSignedOverEnum_payload =
    const ConsentExportVerificationSignedOverEnum._('payload');

ConsentExportVerificationSignedOverEnum
_$consentExportVerificationSignedOverEnumValueOf(String name) {
  switch (name) {
    case 'payload':
      return _$consentExportVerificationSignedOverEnum_payload;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConsentExportVerificationSignedOverEnum>
_$consentExportVerificationSignedOverEnumValues =
    BuiltSet<ConsentExportVerificationSignedOverEnum>(
      const <ConsentExportVerificationSignedOverEnum>[
        _$consentExportVerificationSignedOverEnum_payload,
      ],
    );

Serializer<ConsentExportVerificationAlgorithmEnum>
_$consentExportVerificationAlgorithmEnumSerializer =
    _$ConsentExportVerificationAlgorithmEnumSerializer();
Serializer<ConsentExportVerificationSignedOverEnum>
_$consentExportVerificationSignedOverEnumSerializer =
    _$ConsentExportVerificationSignedOverEnumSerializer();

class _$ConsentExportVerificationAlgorithmEnumSerializer
    implements PrimitiveSerializer<ConsentExportVerificationAlgorithmEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ed25519': 'Ed25519',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Ed25519': 'ed25519',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ConsentExportVerificationAlgorithmEnum,
  ];
  @override
  final String wireName = 'ConsentExportVerificationAlgorithmEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConsentExportVerificationAlgorithmEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConsentExportVerificationAlgorithmEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConsentExportVerificationAlgorithmEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConsentExportVerificationSignedOverEnumSerializer
    implements PrimitiveSerializer<ConsentExportVerificationSignedOverEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'payload': 'payload',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'payload': 'payload',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ConsentExportVerificationSignedOverEnum,
  ];
  @override
  final String wireName = 'ConsentExportVerificationSignedOverEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConsentExportVerificationSignedOverEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConsentExportVerificationSignedOverEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConsentExportVerificationSignedOverEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConsentExportVerification extends ConsentExportVerification {
  @override
  final ConsentExportVerificationAlgorithmEnum algorithm;
  @override
  final String publicKey;
  @override
  final ConsentExportVerificationSignedOverEnum signedOver;
  @override
  final String verificationDocPath;

  factory _$ConsentExportVerification([
    void Function(ConsentExportVerificationBuilder)? updates,
  ]) => (ConsentExportVerificationBuilder()..update(updates))._build();

  _$ConsentExportVerification._({
    required this.algorithm,
    required this.publicKey,
    required this.signedOver,
    required this.verificationDocPath,
  }) : super._();
  @override
  ConsentExportVerification rebuild(
    void Function(ConsentExportVerificationBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConsentExportVerificationBuilder toBuilder() =>
      ConsentExportVerificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsentExportVerification &&
        algorithm == other.algorithm &&
        publicKey == other.publicKey &&
        signedOver == other.signedOver &&
        verificationDocPath == other.verificationDocPath;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, algorithm.hashCode);
    _$hash = $jc(_$hash, publicKey.hashCode);
    _$hash = $jc(_$hash, signedOver.hashCode);
    _$hash = $jc(_$hash, verificationDocPath.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsentExportVerification')
          ..add('algorithm', algorithm)
          ..add('publicKey', publicKey)
          ..add('signedOver', signedOver)
          ..add('verificationDocPath', verificationDocPath))
        .toString();
  }
}

class ConsentExportVerificationBuilder
    implements
        Builder<ConsentExportVerification, ConsentExportVerificationBuilder> {
  _$ConsentExportVerification? _$v;

  ConsentExportVerificationAlgorithmEnum? _algorithm;
  ConsentExportVerificationAlgorithmEnum? get algorithm => _$this._algorithm;
  set algorithm(ConsentExportVerificationAlgorithmEnum? algorithm) =>
      _$this._algorithm = algorithm;

  String? _publicKey;
  String? get publicKey => _$this._publicKey;
  set publicKey(String? publicKey) => _$this._publicKey = publicKey;

  ConsentExportVerificationSignedOverEnum? _signedOver;
  ConsentExportVerificationSignedOverEnum? get signedOver => _$this._signedOver;
  set signedOver(ConsentExportVerificationSignedOverEnum? signedOver) =>
      _$this._signedOver = signedOver;

  String? _verificationDocPath;
  String? get verificationDocPath => _$this._verificationDocPath;
  set verificationDocPath(String? verificationDocPath) =>
      _$this._verificationDocPath = verificationDocPath;

  ConsentExportVerificationBuilder() {
    ConsentExportVerification._defaults(this);
  }

  ConsentExportVerificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _algorithm = $v.algorithm;
      _publicKey = $v.publicKey;
      _signedOver = $v.signedOver;
      _verificationDocPath = $v.verificationDocPath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsentExportVerification other) {
    _$v = other as _$ConsentExportVerification;
  }

  @override
  void update(void Function(ConsentExportVerificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsentExportVerification build() => _build();

  _$ConsentExportVerification _build() {
    final _$result =
        _$v ??
        _$ConsentExportVerification._(
          algorithm: BuiltValueNullFieldError.checkNotNull(
            algorithm,
            r'ConsentExportVerification',
            'algorithm',
          ),
          publicKey: BuiltValueNullFieldError.checkNotNull(
            publicKey,
            r'ConsentExportVerification',
            'publicKey',
          ),
          signedOver: BuiltValueNullFieldError.checkNotNull(
            signedOver,
            r'ConsentExportVerification',
            'signedOver',
          ),
          verificationDocPath: BuiltValueNullFieldError.checkNotNull(
            verificationDocPath,
            r'ConsentExportVerification',
            'verificationDocPath',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
