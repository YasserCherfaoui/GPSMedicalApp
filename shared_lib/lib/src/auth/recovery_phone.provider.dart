import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recovery_phone.provider.g.dart';

/// Phone used during forgot / reset password flow.
@Riverpod(keepAlive: true)
class RecoveryPhone extends _$RecoveryPhone {
  @override
  String? build() => null;

  void set(String? phone) => state = phone;
}
