import 'dart:convert';

/// Lightweight signed-in user cached on device so routing can stay
/// authenticated without a network round-trip.
class AuthUserSnapshot {
  const AuthUserSnapshot({
    required this.userId,
    required this.role,
    this.phone,
  });

  final String userId;
  final String role;
  final String? phone;

  AuthUserSnapshot copyWith({String? userId, String? role, String? phone}) {
    return AuthUserSnapshot(
      userId: userId ?? this.userId,
      role: role ?? this.role,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'role': role,
    if (phone != null && phone!.isNotEmpty) 'phone': phone,
  };

  factory AuthUserSnapshot.fromJson(Map<String, dynamic> json) {
    return AuthUserSnapshot(
      userId: json['userId'] as String? ?? '',
      role: json['role'] as String? ?? '',
      phone: json['phone'] as String?,
    );
  }

  /// Reads `sub` / `role` from a JWT access token. Returns null if the token
  /// is not a JWT (e.g. mock tokens in tests).
  static AuthUserSnapshot? fromAccessToken(String token, {String? phone}) {
    final parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }
    try {
      final normalized = base64Url.normalize(parts[1]);
      final payload =
          jsonDecode(utf8.decode(base64Url.decode(normalized)))
              as Map<String, dynamic>;
      final userId = payload['sub'] as String?;
      if (userId == null || userId.isEmpty) {
        return null;
      }
      return AuthUserSnapshot(
        userId: userId,
        role: payload['role'] as String? ?? '',
        phone: phone,
      );
    } on FormatException {
      return null;
    } on Object {
      return null;
    }
  }

  /// UTC expiry from a JWT `exp` claim, or null if [token] is not a JWT.
  static DateTime? expiryFromJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }
    try {
      final normalized = base64Url.normalize(parts[1]);
      final payload =
          jsonDecode(utf8.decode(base64Url.decode(normalized)))
              as Map<String, dynamic>;
      final exp = payload['exp'];
      if (exp is int) {
        return DateTime.fromMillisecondsSinceEpoch(exp * 1000, isUtc: true);
      }
      if (exp is num) {
        return DateTime.fromMillisecondsSinceEpoch(
          (exp * 1000).round(),
          isUtc: true,
        );
      }
      return null;
    } on FormatException {
      return null;
    } on Object {
      return null;
    }
  }
}
