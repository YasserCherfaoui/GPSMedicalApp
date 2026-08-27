import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/connectivity.provider.dart';
import '../models/pain3d_body.dart';
import '../models/pain3d_download_progress.dart';
import '../pain3d_constants.dart';
import '../pain3d_host_prep.dart';
import '../pain_viewer_controller.dart';
import '../providers/pain3d_download.provider.dart';
import '../providers/pain_localization_flag.provider.dart';
import '../providers/pain_selection.provider.dart';
import '../services/asset_download_service.dart';
import '../services/pain3d_analytics.dart';
import '../services/pain3d_www_root.dart';

class PainLocalizationScreen extends ConsumerStatefulWidget {
  const PainLocalizationScreen({
    this.body = Pain3dBody.male,
    this.hostWebView = true,
    this.store,
    this.forceOnline,
    super.key,
  });

  final Pain3dBody body;

  /// Tests set this false so [InAppWebView] is not created.
  final bool hostWebView;

  /// Test seam: skip [pain3dGlbStoreProvider] when non-null.
  final Pain3dGlbStore? store;

  /// Test seam: skip [isOnlineProvider] when non-null.
  final bool? forceOnline;

  @override
  ConsumerState<PainLocalizationScreen> createState() =>
      _PainLocalizationScreenState();
}

enum _Phase { preparing, downloading, offline, webglUnsupported, error, ready }

class _PainLocalizationScreenState
    extends ConsumerState<PainLocalizationScreen> {
  static const _localhostPort = 8098;

  _Phase _phase = _Phase.preparing;
  Pain3dDownloadProgress? _download;
  PainViewerController? _viewer;
  InAppLocalhostServer? _server;
  bool _serverStarted = false;
  String? _wwwPath;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => unawaited(_bootstrap()),
    );
  }

  @override
  void dispose() {
    _viewer?.markNotReady();
    final server = _server;
    _server = null;
    if (server != null && _serverStarted) {
      unawaited(server.close());
    }
    super.dispose();
  }

  Future<void> _bootstrap() async {
    setState(() {
      _phase = _Phase.preparing;
      _download = null;
    });
    final downloadWatch = Stopwatch()..start();
    var downloaded = false;
    try {
      final injectedStore = widget.store;
      final Pain3dGlbStore store =
          injectedStore ?? await ref.read(pain3dGlbStoreProvider.future);
      final prep = await Pain3dHostPrep.resolve(
        store: store,
        isOnline: () async {
          return widget.forceOnline ?? await ref.read(isOnlineProvider.future);
        },
        body: widget.body,
        onProgress: (progress) {
          downloaded = true;
          if (!mounted) return;
          setState(() {
            _phase = _Phase.downloading;
            _download = progress;
          });
        },
      );
      switch (prep.status) {
        case Pain3dHostPrepStatus.offline:
          if (!mounted) return;
          setState(() => _phase = _Phase.offline);
          return;
        case Pain3dHostPrepStatus.missing:
          throw const Pain3dBootstrapException('GLB missing after download');
        case Pain3dHostPrepStatus.ready:
          break;
      }
      if (downloaded) {
        ref
            .read(pain3dAnalyticsProvider)
            .log(
              Pain3dAnalytics.downloadCompleted,
              properties: {
                'model': widget.body.name,
                'duration_ms': downloadWatch.elapsedMilliseconds,
                'success': true,
              },
            );
      }
      final glb = prep.file;
      if (glb == null) {
        throw const Pain3dBootstrapException('GLB missing after download');
      }
      if (!widget.hostWebView) {
        if (!mounted) return;
        setState(() => _phase = _Phase.ready);
        return;
      }
      final support = await ref.read(pain3dSupportDirProvider.future);
      final www = await Pain3dWwwRoot(
        supportDir: support,
      ).prepare(glb: glb, body: widget.body);
      await _startServer(www);
      if (!mounted) return;
      setState(() {
        _wwwPath = www.path;
        _phase = _Phase.ready;
      });
    } catch (_) {
      if (downloaded) {
        ref
            .read(pain3dAnalyticsProvider)
            .log(
              Pain3dAnalytics.downloadCompleted,
              properties: {
                'model': widget.body.name,
                'duration_ms': downloadWatch.elapsedMilliseconds,
                'success': false,
              },
            );
      }
      if (!mounted) return;
      setState(() => _phase = _Phase.error);
    }
  }

  Future<void> _startServer(Directory www) async {
    final existing = _server;
    if (existing != null && _serverStarted) {
      await existing.close();
      _serverStarted = false;
    }
    final server = InAppLocalhostServer(
      documentRoot: www.path,
      port: _localhostPort,
      directoryIndex: 'pain_viewer.html',
    );
    _server = server;
    await server.start();
    _serverStarted = true;
  }

  void _onWebViewCreated(InAppWebViewController controller) {
    _viewer = PainViewerController(
      evaluate: (source) => controller.evaluateJavascript(source: source),
    );
    controller.addJavaScriptHandler(
      handlerName: 'zoneSelected',
      callback: (args) {
        if (args.isEmpty) return null;
        ref.read(painSelectionProvider.notifier).addFromJs(args.first);
        return null;
      },
    );
    controller.addJavaScriptHandler(
      handlerName: 'viewerReady',
      callback: (args) {
        _onViewerReady();
        return null;
      },
    );
    controller.addJavaScriptHandler(
      handlerName: 'viewerError',
      callback: (args) {
        if (!mounted) return null;
        setState(() => _phase = _Phase.webglUnsupported);
        return null;
      },
    );
  }

  void _onViewerReady() {
    _viewer?.markReady();
    final lang = pain3dViewerLanguageCode(
      ref.read(appLocaleProvider).locale.languageCode,
    );
    unawaited(_viewer?.setLanguage(lang));
  }

  Future<void> _onLoadStop(
    InAppWebViewController controller,
    WebUri? url,
  ) async {
    final gl = await controller.evaluateJavascript(
      source: '''
        (function() {
          try {
            var c = document.createElement('canvas');
            var ctx = c.getContext('webgl') || c.getContext('experimental-webgl');
            return ctx ? 'ok' : 'no';
          } catch (e) { return 'no'; }
        })();
      ''',
    );
    if (gl != 'ok') {
      if (!mounted) return;
      setState(() => _phase = _Phase.webglUnsupported);
      return;
    }
    _onViewerReady();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    ref.listen(appLocaleProvider, (previous, next) {
      if (_viewer?.isReady ?? false) {
        unawaited(
          _viewer?.setLanguage(
            pain3dViewerLanguageCode(next.locale.languageCode),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.painLocalizationTitle),
        actions: [
          TextButton(
            onPressed: () {
              final next = widget.body == Pain3dBody.male
                  ? Pain3dBody.female
                  : Pain3dBody.male;
              context.go(GpsRoutes.painLocalizationBody(next.name));
            },
            child: Text(l10n.painLocalizationSwitchBody),
          ),
        ],
      ),
      body: switch (_phase) {
        _Phase.preparing => const Center(child: CircularProgressIndicator()),
        _Phase.downloading => PainLocalizationDownloadView(progress: _download),
        _Phase.offline => ErrorState(
          title: l10n.painLocalizationOfflineTitle,
          message: l10n.painLocalizationOfflineMessage,
          retryLabel: l10n.painLocalizationRetry,
          onRetry: () => unawaited(_bootstrap()),
        ),
        _Phase.webglUnsupported => ErrorState(
          title: l10n.painLocalizationWebGlTitle,
          message: l10n.painLocalizationWebGlMessage,
        ),
        _Phase.error => ErrorState(
          title: l10n.painLocalizationErrorTitle,
          message: l10n.painLocalizationErrorMessage,
          retryLabel: l10n.painLocalizationRetry,
          onRetry: () => unawaited(_bootstrap()),
        ),
        _Phase.ready => _buildReady(context),
      },
    );
  }

  Widget _buildReady(BuildContext context) {
    if (!widget.hostWebView) {
      return const Center(child: Text('viewer-ready'));
    }
    final www = _wwwPath;
    if (www == null || !_serverStarted) {
      return const Center(child: CircularProgressIndicator());
    }
    final model = widget.body.name;
    return InAppWebView(
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
        transparentBackground: true,
        isInspectable: kDebugMode,
        allowFileAccessFromFileURLs: true,
        mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
      ),
      initialUrlRequest: URLRequest(
        url: WebUri(
          'http://127.0.0.1:$_localhostPort/pain_viewer.html?model=$model',
        ),
      ),
      onWebViewCreated: _onWebViewCreated,
      onLoadStop: _onLoadStop,
      shouldInterceptRequest: (controller, action) async {
        final host = action.url.host;
        if (host == 'localhost' || host == '127.0.0.1') return null;
        return WebResourceResponse(
          statusCode: 403,
          reasonPhrase: 'blocked',
          data: Uint8List(0),
        );
      },
    );
  }
}

class Pain3dBootstrapException implements Exception {
  const Pain3dBootstrapException(this.message);
  final String message;
}

class PainLocalizationDownloadView extends StatelessWidget {
  const PainLocalizationDownloadView({this.progress, super.key});

  final Pain3dDownloadProgress? progress;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final fraction = progress?.fraction;
    final percent = fraction == null ? 0 : (fraction * 100).round();
    return Padding(
      padding: const EdgeInsets.all(GpsSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(value: fraction),
          const SizedBox(height: GpsSpacing.md),
          Text(
            l10n.painLocalizationDownloadProgress(percent),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
