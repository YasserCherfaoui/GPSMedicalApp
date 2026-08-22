import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/src/teleconsultation/sdp_compat.dart';

void main() {
  test('strips Chrome two-token ssrc msid that Safari rejects', () {
    const chrome = 'v=0\n'
        'a=ssrc:1443629567 msid:d7cd629c-5783-4c2e-84b6-33d6e3321c19 d45864aa-80fe-4643-b94a-147d1102c49e\n'
        'a=ssrc:1443629567 mslabel:d7cd629c-5783-4c2e-84b6-33d6e3321c19\n'
        'a=ssrc:1443629567 label:d45864aa-80fe-4643-b94a-147d1102c49e\n';

    final out = compatSdp(chrome);
    expect(
      out,
      contains(
        'a=ssrc:1443629567 msid:d7cd629c-5783-4c2e-84b6-33d6e3321c19\r\n',
      ),
    );
    expect(out, isNot(contains('d45864aa-80fe-4643-b94a-147d1102c49e')));
    expect(out, isNot(contains('mslabel:')));
    expect(out.contains('a=ssrc:1443629567 label:'), isFalse);
    expect(out.endsWith('\r\n'), isTrue);
  });

  test('normalizes lone LF to CRLF and appends terminator', () {
    expect(compatSdp('v=0'), 'v=0\r\n');
    expect(compatSdp('v=0\n'), 'v=0\r\n');
  });
}
