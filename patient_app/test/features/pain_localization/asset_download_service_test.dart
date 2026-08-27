import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/pain_localization/models/pain3d_body.dart';
import 'package:patient_app/features/pain_localization/models/pain3d_download_progress.dart';
import 'package:patient_app/features/pain_localization/pain3d_constants.dart';
import 'package:patient_app/features/pain_localization/services/asset_download_service.dart';

void main() {
  late HttpServer server;
  late Directory cache;
  late Dio dio;
  late Uint8List payload;
  late String payloadSha;
  late Future<void> Function(HttpRequest request) handle;

  setUp(() async {
    cache = await Directory.systemTemp.createTemp('pain3d_cache_');
    payload = Uint8List.fromList(List<int>.generate(2048, (i) => i % 256));
    payloadSha = sha256.convert(payload).toString();
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    handle = (request) async {
      request.response.statusCode = 404;
      await request.response.close();
    };
    server.listen((request) async {
      await handle(request);
    });
  });

  tearDown(() async {
    await server.close(force: true);
    if (await cache.exists()) await cache.delete(recursive: true);
  });

  String origin() => 'http://${server.address.host}:${server.port}';

  AssetDownloadService service() =>
      AssetDownloadService(dio: dio, cacheRoot: cache, assetsBaseUrl: origin());

  Map<String, dynamic> manifestJson({String? sha, int? bytes}) => {
    'version': pain3dAssetVersion,
    'base_path': 'pain3d/$pain3dAssetVersion/',
    'files': {
      'full_male_body.glb': {
        'sha256': sha ?? payloadSha,
        'bytes': bytes ?? payload.length,
      },
      'full_female_body.glb': {
        'sha256': sha ?? payloadSha,
        'bytes': bytes ?? payload.length,
      },
    },
  };

  Future<void> writeJson(HttpResponse response, Object json) async {
    response.statusCode = 200;
    response.headers.contentType = ContentType.json;
    response.write(jsonEncode(json));
    await response.close();
  }

  test('downloads GLB, verifies SHA-256, then serves from cache', () async {
    var glbGets = 0;
    handle = (request) async {
      if (request.uri.path.endsWith('assets_manifest.json')) {
        await writeJson(request.response, manifestJson());
        return;
      }
      if (request.uri.path.endsWith('full_male_body.glb')) {
        glbGets++;
        request.response.statusCode = 200;
        request.response.headers.contentType = ContentType.binary;
        request.response.contentLength = payload.length;
        request.response.add(payload);
        await request.response.close();
        return;
      }
      request.response.statusCode = 404;
      await request.response.close();
    };

    final first = await service().ensureBody(Pain3dBody.male).toList();
    expect(first.last.phase, Pain3dDownloadPhase.ready);
    expect(first.last.file, isNotNull);
    expect(await first.last.file!.readAsBytes(), payload);
    expect(glbGets, 1);

    final second = await service().ensureBody(Pain3dBody.male).toList();
    expect(second.last.phase, Pain3dDownloadPhase.ready);
    expect(glbGets, 1);
  });

  test('deletes a tampered cache file and re-downloads', () async {
    var glbGets = 0;
    handle = (request) async {
      if (request.uri.path.endsWith('assets_manifest.json')) {
        await writeJson(request.response, manifestJson());
        return;
      }
      glbGets++;
      request.response.statusCode = 200;
      request.response.add(payload);
      await request.response.close();
    };

    await service().ensureBody(Pain3dBody.male).drain<void>();
    final dest = File(
      '${cache.path}/$pain3dAssetVersion/${Pain3dBody.male.glbFileName}',
    );
    await dest.writeAsBytes([1, 2, 3], flush: true);

    final verified = await service().verifiedFile(
      Pain3dBody.male,
      expectedSha256: payloadSha,
    );
    expect(verified, isNull);
    expect(await dest.exists(), isFalse);

    final again = await service().ensureBody(Pain3dBody.male).toList();
    expect(again.last.phase, Pain3dDownloadPhase.ready);
    expect(await again.last.file!.readAsBytes(), payload);
    expect(glbGets, 2);
  });

  test('retries after SHA-256 mismatch then succeeds', () async {
    var glbGets = 0;
    handle = (request) async {
      if (request.uri.path.endsWith('assets_manifest.json')) {
        await writeJson(request.response, manifestJson());
        return;
      }
      glbGets++;
      request.response.statusCode = 200;
      request.response.add(
        glbGets == 1 ? Uint8List.fromList([9, 9, 9]) : payload,
      );
      await request.response.close();
    };

    final events = await service().ensureBody(Pain3dBody.male).toList();
    expect(events.last.phase, Pain3dDownloadPhase.ready);
    expect(glbGets, 2);
  });

  test('resumes a partial temp file with Range', () async {
    final temp = File(
      '${cache.path}/$pain3dAssetVersion/.tmp/${Pain3dBody.male.glbFileName}',
    );
    await temp.parent.create(recursive: true);
    await temp.writeAsBytes(payload.sublist(0, 600), flush: true);

    var sawRange = false;
    handle = (request) async {
      if (request.uri.path.endsWith('assets_manifest.json')) {
        await writeJson(request.response, manifestJson());
        return;
      }
      final range = request.headers.value(HttpHeaders.rangeHeader);
      expect(range, 'bytes=600-');
      sawRange = true;
      request.response.statusCode = 206;
      request.response.headers.set(
        HttpHeaders.contentRangeHeader,
        'bytes 600-2047/${payload.length}',
      );
      request.response.add(payload.sublist(600));
      await request.response.close();
    };

    final events = await service().ensureBody(Pain3dBody.male).toList();
    expect(sawRange, isTrue);
    expect(events.last.phase, Pain3dDownloadPhase.ready);
    expect(await events.last.file!.readAsBytes(), payload);
  });

  test('pins pain3dAssetVersion in URLs', () {
    final uri = pain3dManifestUri(
      baseUrl: 'https://assets.medora-corporate.com',
    );
    expect(
      uri.toString(),
      'https://assets.medora-corporate.com/pain3d/1.1.0/assets_manifest.json',
    );
    expect(pain3dAssetVersion, '1.1.0');
  });
}
