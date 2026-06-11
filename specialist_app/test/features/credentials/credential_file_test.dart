import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/credentials/utils/credential_file.dart';

void main() {
  test('parseSignedCredentialFileUrl extracts id exp and token', () {
    const url =
        '/v1/doctors/me/credentials/00000000-0000-4000-8000-000000000099/file?exp=1700000000&token=abc123';
    final link = parseSignedCredentialFileUrl(url);
    expect(link.credentialId, '00000000-0000-4000-8000-000000000099');
    expect(link.exp, 1700000000);
    expect(link.token, 'abc123');
  });
}
