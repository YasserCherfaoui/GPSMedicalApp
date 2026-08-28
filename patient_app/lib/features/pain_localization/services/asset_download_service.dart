import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import '../models/pain3d_body.dart';
import '../models/pain3d_download_progress.dart';
import '../models/pain3d_manifest.dart';
import '../pain3d_constants.dart';
import '../pain3d_log.dart';

class Pain3dAssetException implements Exception {
  const Pain3dAssetException(this.message);
  final String message;

  @override
  String toString() => 'Pain3dAssetException: $message';
}

/// Cache + download surface used by the WebView host (A-19.2).
abstract class Pain3dGlbStore {
  Future<File?> verifiedFile(Pain3dBody body, {String? expectedSha256});
  Stream<Pain3dDownloadProgress> ensureBody(Pain3dBody body);
}

/// Fetches the versioned R2 manifest, downloads a body GLB with progress,
/// verifies SHA-256, and only then exposes the file under
/// `<cacheRoot>/<version>/`.
class AssetDownloadService implements Pain3dGlbStore {
  AssetDownloadService({
    required Dio dio,
    required Directory cacheRoot,
    String? assetsBaseUrl,
    this.maxChecksumRetries = 2,
  }) : _dio = dio,
       _cacheRoot = cacheRoot,
       _assetsBaseUrl = _stripTrailingSlash(
         assetsBaseUrl ?? pain3dAssetsBaseUrl(),
       );

  final Dio _dio;
  final Directory _cacheRoot;
  final String _assetsBaseUrl;
  final int maxChecksumRetries;

  Directory get _versionDir =>
      Directory('${_cacheRoot.path}/$pain3dAssetVersion');

  Directory get _tmpDir => Directory('${_versionDir.path}/.tmp');

  File _destFile(Pain3dBody body) =>
      File('${_versionDir.path}/${body.glbFileName}');

  File _tempFile(Pain3dBody body) =>
      File('${_tmpDir.path}/${body.glbFileName}');

  @override
  Future<File?> verifiedFile(Pain3dBody body, {String? expectedSha256}) async {
    final dest = _destFile(body);
    if (!await dest.exists()) {
      pain3dLog('verifiedFile miss ${body.glbFileName}');
      return null;
    }
    if (expectedSha256 == null) {
      pain3dLog('verifiedFile ${dest.path} exists — fetching manifest for SHA');
    }
    final sha = expectedSha256 ?? (await fetchManifest()).fileFor(body).sha256;
    final actual = await _sha256Hex(dest);
    if (actual == sha) return dest;
    pain3dLog(
      'cache SHA mismatch for ${body.glbFileName} expected=$sha actual=$actual — deleting',
    );
    await dest.delete();
    return null;
  }

  @override
  Stream<Pain3dDownloadProgress> ensureBody(Pain3dBody body) async* {
    pain3dLog('ensureBody ${body.glbFileName} origin=$_assetsBaseUrl');
    yield const Pain3dDownloadProgress.fetchingManifest();
    final manifest = await fetchManifest();
    if (manifest.version != pain3dAssetVersion) {
      pain3dLog(
        'manifest version ${manifest.version} != pinned $pain3dAssetVersion',
      );
      throw Pain3dAssetException(
        'manifest version ${manifest.version} != pinned $pain3dAssetVersion',
      );
    }
    final entry = manifest.fileFor(body);
    final dest = _destFile(body);

    if (await dest.exists() && await _sha256Hex(dest) == entry.sha256) {
      yield Pain3dDownloadProgress.ready(dest, entry.bytes);
      return;
    }
    if (await dest.exists()) {
      await dest.delete();
    }

    var attempt = 0;
    while (true) {
      attempt++;
      yield* _downloadToTemp(
        uri: pain3dGlbUri(body.glbFileName, baseUrl: _assetsBaseUrl),
        temp: _tempFile(body),
        expectedBytes: entry.bytes,
      );
      yield const Pain3dDownloadProgress.verifying();
      final hex = await _sha256Hex(_tempFile(body));
      if (hex == entry.sha256) {
        await _versionDir.create(recursive: true);
        await _tempFile(body).rename(dest.path);
        pain3dLog('GLB stored ${dest.path} bytes=${entry.bytes} sha=$hex');
        yield Pain3dDownloadProgress.ready(dest, entry.bytes);
        return;
      }
      pain3dLog(
        'SHA-256 mismatch attempt=$attempt/$maxChecksumRetries '
        'file=${body.glbFileName} expected=${entry.sha256} actual=$hex',
      );
      final temp = _tempFile(body);
      if (await temp.exists()) await temp.delete();
      if (attempt >= maxChecksumRetries) {
        throw Pain3dAssetException(
          'SHA-256 mismatch for ${body.glbFileName} after $attempt attempts',
        );
      }
    }
  }

  Future<Pain3dManifest> fetchManifest() async {
    final uri = pain3dManifestUri(baseUrl: _assetsBaseUrl);
    pain3dLog('GET manifest $uri');
    try {
      final response = await _dio.get<dynamic>(
        uri.toString(),
        options: Options(
          responseType: ResponseType.plain,
          validateStatus: (status) => status == 200,
        ),
      );
      pain3dLog(
        'manifest ${response.statusCode} bytes=${response.data?.toString().length}',
      );
      final data = response.data;
      final decoded = data is String
          ? jsonDecode(data)
          : data is Map<String, dynamic>
          ? data
          : jsonDecode(utf8.decode(data as List<int>));
      if (decoded is! Map<String, dynamic>) {
        throw const FormatException('assets_manifest.json: expected object');
      }
      return Pain3dManifest.fromJson(decoded);
    } on DioException catch (error, stack) {
      pain3dLog('manifest GET failed ${_dioDetail(error)}', error, stack);
      throw Pain3dAssetException('manifest GET failed: ${_dioDetail(error)}');
    }
  }

  Stream<Pain3dDownloadProgress> _downloadToTemp({
    required Uri uri,
    required File temp,
    required int expectedBytes,
  }) async* {
    await _tmpDir.create(recursive: true);
    var resumeFrom = 0;
    if (await temp.exists()) {
      resumeFrom = await temp.length();
      if (resumeFrom >= expectedBytes) {
        await temp.delete();
        resumeFrom = 0;
      }
    }

    late Response<ResponseBody> response;
    pain3dLog(
      'GET GLB $uri resumeFrom=$resumeFrom expectedBytes=$expectedBytes',
    );
    try {
      response = await _dio.get<ResponseBody>(
        uri.toString(),
        options: Options(
          responseType: ResponseType.stream,
          followRedirects: true,
          validateStatus: (status) => status == 200 || status == 206,
          headers: {
            if (resumeFrom > 0) HttpHeaders.rangeHeader: 'bytes=$resumeFrom-',
          },
        ),
      );
    } on DioException catch (error, stack) {
      pain3dLog('GLB GET failed ${_dioDetail(error)}', error, stack);
      throw Pain3dAssetException('GLB GET failed: ${_dioDetail(error)}');
    }

    final status = response.statusCode ?? 0;
    pain3dLog(
      'GLB response status=$status contentLength=${_contentLength(response)}',
    );
    final append = status == 206 && resumeFrom > 0;
    if (!append && await temp.exists()) {
      await temp.delete();
      resumeFrom = 0;
    }

    final sink = temp.openWrite(
      mode: append ? FileMode.append : FileMode.write,
    );
    var received = append ? resumeFrom : 0;
    final contentLength = _contentLength(response);
    final total = contentLength != null
        ? (append ? resumeFrom + contentLength : contentLength)
        : expectedBytes;

    try {
      final stream = response.data?.stream;
      if (stream == null) {
        throw const Pain3dAssetException('GLB GET returned an empty body');
      }
      await for (final Uint8List chunk in stream) {
        sink.add(chunk);
        received += chunk.length;
        yield Pain3dDownloadProgress(
          phase: Pain3dDownloadPhase.downloading,
          receivedBytes: received,
          totalBytes: total,
        );
      }
      await sink.flush();
    } catch (error, stack) {
      await sink.close();
      pain3dLog('GLB download interrupted', error, stack);
      throw Pain3dAssetException('GLB download interrupted: $error');
    }
    await sink.close();
    pain3dLog('GLB stream done received=$received total=$total');
  }

  static String _dioDetail(DioException error) {
    final status = error.response?.statusCode;
    return '${error.type} status=$status uri=${error.requestOptions.uri} '
        'message=${error.message} inner=${error.error}';
  }

  static int? _contentLength(Response<ResponseBody> response) {
    final header = response.headers.value(HttpHeaders.contentLengthHeader);
    if (header == null) return null;
    return int.tryParse(header);
  }

  static Future<String> _sha256Hex(File file) async {
    final digest = await sha256.bind(file.openRead()).first;
    return digest.toString();
  }

  static String _stripTrailingSlash(String raw) {
    return raw.endsWith('/') ? raw.substring(0, raw.length - 1) : raw;
  }
}
