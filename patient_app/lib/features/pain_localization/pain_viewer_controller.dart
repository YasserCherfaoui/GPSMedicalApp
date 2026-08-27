/// Outbound JS API for the sealed pain viewer. No-ops until [markReady].
class PainViewerController {
  PainViewerController({
    required Future<dynamic> Function(String source) evaluate,
  }) : _evaluate = evaluate;

  final Future<dynamic> Function(String source) _evaluate;
  bool _ready = false;

  bool get isReady => _ready;

  void markReady() => _ready = true;

  void markNotReady() => _ready = false;

  Future<void> setLanguage(String language) {
    final lang = language == 'ar' ? 'ar' : 'fr';
    return _run('setLanguage(${_jsString(lang)});');
  }

  Future<void> setModel(String model) {
    if (model != 'male' && model != 'female') return Future<void>.value();
    return _run('setModel(${_jsString(model)});');
  }

  Future<void> setLayerOpacity(String system, double value) {
    final v = value.clamp(0.0, 1.0);
    return _run('setLayerOpacity(${_jsString(system)}, $v);');
  }

  Future<void> resetView() => _run('resetView();');

  Future<void> _run(String source) async {
    if (!_ready) return;
    await _evaluate(source);
  }

  static String _jsString(String value) {
    return "'${value.replaceAll(r'\', r'\\').replaceAll("'", r"\'")}'";
  }
}
