class SignedCredentialFileLink {
  const SignedCredentialFileLink({
    required this.credentialId,
    required this.exp,
    required this.token,
  });

  final String credentialId;
  final int exp;
  final String token;
}

SignedCredentialFileLink parseSignedCredentialFileUrl(String? fileUrl) {
  if (fileUrl == null || fileUrl.isEmpty) {
    throw const FormatException('Missing credential file url');
  }
  final uri = fileUrl.startsWith('http')
      ? Uri.parse(fileUrl)
      : Uri.parse('https://api.gpsmedical.dz$fileUrl');
  final segments = uri.pathSegments;
  final credentialsIndex = segments.indexOf('credentials');
  if (credentialsIndex < 0 || credentialsIndex + 1 >= segments.length) {
    throw const FormatException('Invalid credential file path');
  }
  final credentialId = segments[credentialsIndex + 1];
  final expRaw = uri.queryParameters['exp'];
  final token = uri.queryParameters['token'];
  if (expRaw == null || token == null || token.isEmpty) {
    throw const FormatException('Missing signed credential parameters');
  }
  return SignedCredentialFileLink(
    credentialId: credentialId,
    exp: int.parse(expRaw),
    token: token,
  );
}
