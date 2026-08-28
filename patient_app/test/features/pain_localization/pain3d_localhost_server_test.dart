import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/pain_localization/services/pain3d_localhost_server.dart';

void main() {
  test('serves files from a directory on disk', () async {
    final root = await Directory.systemTemp.createTemp('pain3d_http_');
    late final Pain3dLocalhostServer server;
    addTearDown(() async {
      await server.close();
      await root.delete(recursive: true);
    });
    await File(
      '${root.path}/pain_viewer.html',
    ).writeAsString('<html>ok</html>', flush: true);
    await File(
      '${root.path}/three.min.js',
    ).writeAsString('console.log("three");', flush: true);

    server = Pain3dLocalhostServer(documentRoot: root, port: 0);
    await server.start();

    final client = HttpClient();
    addTearDown(client.close);
    final html = await client.getUrl(
      Uri.parse('http://127.0.0.1:${server.boundPort}/pain_viewer.html'),
    );
    final htmlResponse = await html.close();
    expect(htmlResponse.statusCode, HttpStatus.ok);
    expect(
      await htmlResponse.transform(utf8.decoder).join(),
      '<html>ok</html>',
    );

    final js = await client.getUrl(
      Uri.parse('http://127.0.0.1:${server.boundPort}/three.min.js'),
    );
    final jsResponse = await js.close();
    expect(jsResponse.statusCode, HttpStatus.ok);
    expect(jsResponse.headers.contentType?.mimeType, 'application/javascript');
  });
}
