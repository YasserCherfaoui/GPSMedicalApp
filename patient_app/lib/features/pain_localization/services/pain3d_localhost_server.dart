import 'dart:async';
import 'dart:io';

import '../pain3d_log.dart';

/// Serves a directory on disk at `http://127.0.0.1:<port>/`.
///
/// [InAppLocalhostServer] only reads Flutter bundle assets, so it cannot serve
/// the downloaded GLB that [Pain3dWwwRoot] copies into Application Support.
class Pain3dLocalhostServer {
  Pain3dLocalhostServer({
    required Directory documentRoot,
    this.port = 8098,
    this.directoryIndex = 'pain_viewer.html',
  }) : _documentRoot = documentRoot;

  static const _mimeByExt = <String, String>{
    '.html': 'text/html; charset=utf-8',
    '.js': 'application/javascript; charset=utf-8',
    '.json': 'application/json; charset=utf-8',
    '.png': 'image/png',
    '.glb': 'model/gltf-binary',
    '.wasm': 'application/wasm',
  };

  final Directory _documentRoot;
  final int port;
  final String directoryIndex;

  HttpServer? _server;
  int? _boundPort;

  /// Port the server is listening on after [start] (useful when [port] is 0).
  int get boundPort => _boundPort ?? port;

  Future<void> start() async {
    if (_server != null) {
      throw StateError('Server already started on http://127.0.0.1:$port');
    }
    final server = await HttpServer.bind(
      InternetAddress.loopbackIPv4,
      port,
      shared: true,
    );
    _server = server;
    _boundPort = server.port;
    pain3dLog(
      'localhost listening on http://127.0.0.1:$_boundPort root=${_documentRoot.path}',
    );
    server.listen(_handle);
  }

  Future<void> close() async {
    final server = _server;
    _server = null;
    if (server == null) return;
    await server.close(force: true);
    pain3dLog('localhost closed port=$port');
  }

  Future<void> _handle(HttpRequest request) async {
    try {
      final file = _resolveFile(request.uri.path);
      if (file == null) {
        pain3dLog('localhost 404 ${request.uri.path}');
        request.response.statusCode = HttpStatus.notFound;
        await request.response.close();
        return;
      }
      final bytes = await file.readAsBytes();
      request.response.headers.contentType = ContentType.parse(
        _contentTypeFor(file.path),
      );
      request.response.add(bytes);
      await request.response.close();
    } on Object catch (error, stack) {
      pain3dLog('localhost request failed ${request.uri.path}', error, stack);
      request.response.statusCode = HttpStatus.internalServerError;
      await request.response.close();
    }
  }

  File? _resolveFile(String rawPath) {
    var rel = rawPath.startsWith('/') ? rawPath.substring(1) : rawPath;
    if (rel.isEmpty || rel.endsWith('/')) {
      rel = rel.isEmpty ? directoryIndex : '$rel$directoryIndex';
    }
    final normalized = _normalizeRelativePath(rel);
    if (normalized == null) return null;
    final file = File('${_documentRoot.path}/$normalized');
    return file.existsSync() ? file : null;
  }

  String? _normalizeRelativePath(String rel) {
    final segments = <String>[];
    for (final part in rel.split('/')) {
      if (part.isEmpty || part == '.') continue;
      if (part == '..') return null;
      segments.add(part);
    }
    return segments.join('/');
  }

  static String _contentTypeFor(String path) {
    final dot = path.lastIndexOf('.');
    if (dot == -1) return 'application/octet-stream';
    final ext = path.substring(dot).toLowerCase();
    return _mimeByExt[ext] ?? 'application/octet-stream';
  }
}
