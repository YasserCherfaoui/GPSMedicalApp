import 'dart:convert';
import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Debug-only HTTP logs for `flutter run` / Xcode / Logcat / Cursor.
///
/// Disabled in release and in `flutter test` so CI stays quiet. Tokens and
/// cookies are redacted.
bool gpsHttpDebugLogsEnabled({bool? debugMode, bool? inTest}) {
  final debug = debugMode ?? kDebugMode;
  if (!debug) return false;
  if (inTest ?? _inFlutterTest) return false;
  return true;
}

bool get _inFlutterTest {
  if (kIsWeb) return false;
  return Platform.environment.containsKey('FLUTTER_TEST');
}

const _redactedHeaderKeys = {'authorization', 'cookie', 'set-cookie'};
const _redactedBodyKeys = {
  'access_token',
  'refresh_token',
  'password',
  'token',
  'credential',
  'otp',
  'nin',
};

const _maxBodyChars = 8000;

/// Prints request/response/error lines via [debugPrint].
class HttpDebugLogInterceptor extends Interceptor {
  HttpDebugLogInterceptor({
    this.label = 'http',
    void Function(String message)? log,
  }) : log = log ?? debugPrint;

  final String label;
  final void Function(String message) log;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final lines = <String>[
      '[GPS HTTP][$label] --> ${options.method} ${options.uri}',
      'headers: ${jsonEncode(redactHeaders(options.headers))}',
    ];
    if (options.data != null) {
      lines.add('body: ${redactBody(options.data)}');
    }
    log(lines.join('\n'));
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final req = response.requestOptions;
    final lines = <String>[
      '[GPS HTTP][$label] <-- ${response.statusCode} ${req.method} ${req.uri}',
      'body: ${redactBody(response.data)}',
    ];
    log(lines.join('\n'));
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final req = err.requestOptions;
    final lines = <String>[
      '[GPS HTTP][$label] !! ${err.type.name} ${req.method} ${req.uri}',
      'message: ${err.message}',
    ];
    final status = err.response?.statusCode;
    if (status != null) {
      lines.add('status: $status');
    }
    if (err.response?.data != null) {
      lines.add('body: ${redactBody(err.response!.data)}');
    }
    log(lines.join('\n'));
    handler.next(err);
  }
}

@visibleForTesting
Map<String, dynamic> redactHeaders(Map<String, dynamic> headers) {
  final out = <String, dynamic>{};
  headers.forEach((key, value) {
    if (_redactedHeaderKeys.contains(key.toLowerCase())) {
      out[key] = '<redacted>';
    } else {
      out[key] = value?.toString();
    }
  });
  return out;
}

@visibleForTesting
String redactBody(Object? data) {
  if (data == null) return 'null';
  if (data is FormData) {
    return 'FormData fields=${data.fields.map((e) => e.key).toList()} '
        'files=${data.files.map((e) => e.key).toList()}';
  }
  final decoded = _asJson(data);
  if (decoded != null) {
    return _truncate(const JsonEncoder.withIndent('  ').convert(decoded));
  }
  return _truncate(data.toString());
}

Object? _asJson(Object? data) {
  if (data is Map) {
    return _redactJsonMap(data);
  }
  if (data is List) {
    return data.map(_asJson).toList();
  }
  if (data is String) {
    final trimmed = data.trim();
    if (trimmed.isEmpty) return data;
    if (trimmed.startsWith('{') || trimmed.startsWith('[')) {
      try {
        return _asJson(jsonDecode(trimmed));
      } on FormatException {
        return data;
      }
    }
    return data;
  }
  return data;
}

Map<String, dynamic> _redactJsonMap(Map<dynamic, dynamic> input) {
  final out = <String, dynamic>{};
  input.forEach((key, value) {
    final name = key.toString();
    if (_redactedBodyKeys.contains(name.toLowerCase())) {
      out[name] = '<redacted>';
    } else {
      out[name] = _asJson(value);
    }
  });
  return out;
}

String _truncate(String value) {
  if (value.length <= _maxBodyChars) return value;
  return '${value.substring(0, _maxBodyChars)}… <truncated>';
}
