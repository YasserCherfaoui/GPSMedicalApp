import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/pain3d_body.dart';
import '../providers/pain_localization_flag.provider.dart';
import '../services/pain3d_analytics.dart';
import 'pain_body_chooser_screen.dart';
import 'pain_localization_screen.dart';

/// First open → chooser. Later opens → last explicit body (K-10).
class PainLocalizationGate extends ConsumerStatefulWidget {
  const PainLocalizationGate({this.modelQuery, super.key});

  final String? modelQuery;

  @override
  ConsumerState<PainLocalizationGate> createState() =>
      _PainLocalizationGateState();
}

class _PainLocalizationGateState extends ConsumerState<PainLocalizationGate> {
  Pain3dBody? _body;
  var _loading = true;
  var _loggedOpen = false;

  @override
  void initState() {
    super.initState();
    _resolve();
  }

  @override
  void didUpdateWidget(PainLocalizationGate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.modelQuery != widget.modelQuery) {
      _resolve();
    }
  }

  Future<void> _resolve() async {
    setState(() => _loading = true);
    final fromQuery = switch (widget.modelQuery) {
      'male' => Pain3dBody.male,
      'female' => Pain3dBody.female,
      _ => null,
    };
    if (fromQuery != null) {
      await ref.read(pain3dBodyStoreProvider).write(fromQuery);
      if (!mounted) return;
      _logOpenOnce();
      setState(() {
        _body = fromQuery;
        _loading = false;
      });
      return;
    }
    final remembered = await ref.read(pain3dBodyStoreProvider).read();
    if (!mounted) return;
    _logOpenOnce();
    setState(() {
      _body = remembered;
      _loading = false;
    });
  }

  void _logOpenOnce() {
    if (_loggedOpen) return;
    _loggedOpen = true;
    ref.read(pain3dAnalyticsProvider).log(Pain3dAnalytics.screenOpen);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final body = _body;
    if (body == null) {
      return const PainBodyChooserScreen();
    }
    return PainLocalizationScreen(body: body);
  }
}
