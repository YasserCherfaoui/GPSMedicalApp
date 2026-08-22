/// Chrome / libwebrtc emits `a=ssrc:<id> msid:<stream> <track>`.
/// WebKit (Safari / iOS `flutter_webrtc`) treats the extra track token as an
/// invalid SDP line and `setRemoteDescription` fails. Align line endings with
/// RFC 4566 (CRLF) and drop Plan-B `mslabel` / `label` attributes.
String compatSdp(String sdp) {
  var out = sdp.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
  out = out.replaceAllMapped(
    RegExp(r'^a=ssrc:(\d+) msid:(\S+) \S+\s*$', multiLine: true),
    (match) => 'a=ssrc:${match[1]} msid:${match[2]}',
  );
  out = out.replaceAll(RegExp(r'^a=ssrc:\d+ mslabel:.*$', multiLine: true), '');
  out = out.replaceAll(RegExp(r'^a=ssrc:\d+ label:.*$', multiLine: true), '');
  out = out.replaceAll(RegExp(r'\n{2,}'), '\n');
  if (!out.endsWith('\n')) {
    out = '$out\n';
  }
  return out.replaceAll('\n', '\r\n');
}
