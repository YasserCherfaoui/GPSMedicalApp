import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

List<Map<String, dynamic>> buildIceServers({
  required TeleSession session,
  TurnCredentials? turnCredentials,
}) {
  final servers = <Map<String, dynamic>>[];

  for (final server in session.iceServers ?? BuiltList<IceServer>([])) {
    final urls = _iceServerUrls(server);
    if (urls.isEmpty) continue;
    servers.add({
      'urls': urls.length == 1 ? urls.first : urls,
      if (server.username != null && server.username!.isNotEmpty)
        'username': server.username,
      if (server.credential != null && server.credential!.isNotEmpty)
        'credential': server.credential,
    });
  }

  if (turnCredentials != null) {
    final urls = turnCredentials.urls?.toList() ?? const [];
    if (urls.isNotEmpty) {
      servers.add({
        'urls': urls.length == 1 ? urls.first : urls,
        'username': turnCredentials.username,
        'credential': turnCredentials.credential,
      });
    }
  }

  if (servers.isEmpty) {
    servers.add({'urls': 'stun:stun.l.google.com:19302'});
  }
  return servers;
}

List<String> _iceServerUrls(IceServer server) {
  final urls = server.urls;
  if (urls == null) return const [];
  final value = urls.oneOf.value;
  if (value is String) return [value];
  if (value is BuiltList<String>) return value.toList();
  return [value.toString()];
}
