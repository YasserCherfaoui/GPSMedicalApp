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
import '../models/pain_selection.dart';
import '../pain3d_constants.dart';
import '../pain3d_host_prep.dart';
import '../pain3d_log.dart';
import '../pain_viewer_controller.dart';
import '../../anamnesis/anamnesis_constants.dart';
import '../providers/pain3d_download.provider.dart';
import '../providers/pain_localization_flag.provider.dart';
import '../providers/pain_selection.provider.dart';
import '../services/asset_download_service.dart';
import '../services/pain3d_analytics.dart';
import '../services/pain3d_localhost_server.dart';
import '../services/pain3d_www_root.dart';
import '../services/pain_label_catalog.dart';
import '../widgets/pain_selection_review_bar.dart';

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
  Pain3dLocalhostServer? _server;
  bool _serverStarted = false;
  String? _wwwPath;
  PainSelection? _pendingSelection;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(painSelectionProvider.notifier).hydrate();
      if (mounted) unawaited(_bootstrap());
    });
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
    pain3dLog(
      'bootstrap body=${widget.body.name} version=$pain3dAssetVersion '
      'origin=${pain3dAssetsBaseUrl()} hostWebView=${widget.hostWebView}',
    );
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
          pain3dLog('bootstrap → offline');
          if (!mounted) return;
          setState(() => _phase = _Phase.offline);
          return;
        case Pain3dHostPrepStatus.missing:
          throw const Pain3dBootstrapException('GLB missing after download');
        case Pain3dHostPrepStatus.ready:
          pain3dLog('bootstrap prep ready');
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
        pain3dLog('bootstrap skip WebView (test seam)');
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
      pain3dLog('bootstrap ready www=${www.path}');
    } catch (error, stack) {
      pain3dLog('bootstrap failed', error, stack);
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
    final server = Pain3dLocalhostServer(
      documentRoot: www,
      port: _localhostPort,
      directoryIndex: 'pain_viewer.html',
    );
    _server = server;
    pain3dLog('localhost start port=$_localhostPort root=${www.path}');
    await server.start();
    _serverStarted = true;
    pain3dLog('localhost started');
  }

  void _onWebViewCreated(InAppWebViewController controller) {
    _viewer = PainViewerController(
      evaluate: (source) => controller.evaluateJavascript(source: source),
    );
    controller.addJavaScriptHandler(
      handlerName: 'zonePreviewed',
      callback: (args) {
        if (args.isEmpty) return null;
        if (!mounted) return null;
        setState(() {
          _pendingSelection = PainSelection.fromJs(args.first);
        });
        return null;
      },
    );
    controller.addJavaScriptHandler(
      handlerName: 'zoneCleared',
      callback: (args) {
        if (!mounted) return null;
        if (_pendingSelection == null) return null;
        setState(() => _pendingSelection = null);
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
        pain3dLog('viewerError args=$args');
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
    _restoreHighlight();
  }

  void _restoreHighlight() {
    PainSelection? match;
    for (final item in ref.read(painSelectionProvider)) {
      if (item.model == widget.body.name) match = item;
    }
    if (match == null) return;
    unawaited(
      _viewer?.restoreSelection(
        kind: match.kind,
        code: match.code,
        point: match.point,
      ),
    );
  }

  Future<void> _confirmSelections() async {
    if (ref.read(painSelectionProvider).isEmpty) return;
    await ref.read(painSelectionProvider.notifier).confirm();
    if (!mounted) return;

    final selections = ref.read(painSelectionProvider);
    final anamnesisOn = anamnesisEnabledFromEnv();
    if (anamnesisOn && selections.isNotEmpty) {
      context.push(GpsRoutes.anamnesisQcm, extra: selections.first);
      return;
    }

    final messenger = ScaffoldMessenger.of(context);
    final message = AppLocalizations.of(
      context,
    )!.painLocalizationConfirmedSnackbar;
    messenger.showSnackBar(SnackBar(content: Text(message)));
    context.go(GpsRoutes.discover);
  }

  Future<void> _confirmClearAll() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.painLocalizationClearAllTitle),
        content: Text(l10n.painLocalizationClearAllMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.painLocalizationCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.painLocalizationClearAll),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      ref.read(painSelectionProvider.notifier).clear();
      setState(() => _pendingSelection = null);
    }
  }

  void _addPendingSelection() {
    final pending = _pendingSelection;
    if (pending == null) return;
    ref.read(painSelectionProvider.notifier).add(pending);
    setState(() => _pendingSelection = null);
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
    pain3dLog('loadStop url=$url webgl=$gl');
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
        _Phase.ready => Column(
          children: [
            Expanded(child: _buildReady(context)),
            _buildReviewBar(context),
          ],
        ),
      },
    );
  }

  Widget _buildReviewBar(BuildContext context) {
    final selections = ref.watch(painSelectionProvider);
    final catalog =
        ref.watch(painLabelCatalogProvider).valueOrNull ??
        const PainLabelCatalog({});
    return PainSelectionReviewBar(
      selections: selections,
      pendingSelection: _pendingSelection,
      languageCode: Localizations.localeOf(context).languageCode,
      labels: catalog,
      onRemove: (item) {
        ref
            .read(painSelectionProvider.notifier)
            .remove(code: item.code, model: item.model);
      },
      onAddPending: _addPendingSelection,
      onConfirm: () => unawaited(_confirmSelections()),
      onClearAll: () => unawaited(_confirmClearAll()),
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
      onConsoleMessage: (controller, consoleMessage) {
        pain3dLog(
          'webview console ${consoleMessage.messageLevel} ${consoleMessage.message}',
        );
      },
      onReceivedError: (controller, request, error) {
        pain3dLog(
          'webview error type=${error.type} desc=${error.description} '
          'url=${request.url}',
        );
      },
      onReceivedHttpError: (controller, request, errorResponse) {
        pain3dLog(
          'webview HTTP ${errorResponse.statusCode} url=${request.url}',
        );
      },
      shouldInterceptRequest: (controller, action) async {
        final host = action.url.host;
        if (host == 'localhost' || host == '127.0.0.1') return null;
        pain3dLog('blocked request ${action.url}');
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
