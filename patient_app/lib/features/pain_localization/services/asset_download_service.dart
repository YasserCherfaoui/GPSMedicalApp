import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import '../models/pain3d_body.dart';
import '../models/pain3d_download_progress.dart';
import '../models/pain3d_manifest.dart';
import '../pain3d_constants.dart';

class Pain3dAssetException implements Exception {
  const Pain3dAssetException(this.message);
  final String message;

  @override
  String toString() => 'Pain3dAssetException: $message';
}

/// Fetches the versioned R2 manifest, downloads a body GLB with progress,
/// verifies SHA-256, and only then exposes the file under
/// `<cacheRoot>/<version>/`.
class AssetDownloadService {
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

  /// Returns [file] only if it exists and matches [expectedSha256].
  /// A mismatched file is deleted and this returns null.
  Future<File?> verifiedFile(Pain3dBody body, {String? expectedSha256}) async {
    final dest = _destFile(body);
    if (!await dest.exists()) return null;
    final sha = expectedSha256 ?? (await fetchManifest()).fileFor(body).sha256;
    if (await _sha256Hex(dest) == sha) return dest;
    await dest.delete();
    return null;
  }

  Stream<Pain3dDownloadProgress> ensureBody(Pain3dBody body) async* {
    yield const Pain3dDownloadProgress.fetchingManifest();
    final manifest = await fetchManifest();
    if (manifest.version != pain3dAssetVersion) {
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
        yield Pain3dDownloadProgress.ready(dest, entry.bytes);
        return;
      }
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
    try {
      final response = await _dio.get<dynamic>(
        uri.toString(),
        options: Options(
          responseType: ResponseType.plain,
          validateStatus: (status) => status == 200,
        ),
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
    } on DioException catch (error) {
      throw Pain3dAssetException(
        'manifest GET failed: ${error.message ?? error.type}',
      );
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
    } on DioException catch (error) {
      throw Pain3dAssetException(
        'GLB GET failed: ${error.message ?? error.type}',
      );
    }

    final status = response.statusCode ?? 0;
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
    } catch (error) {
      await sink.close();
      throw Pain3dAssetException('GLB download interrupted: $error');
    }
    await sink.close();
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
