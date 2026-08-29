import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../pain_localization/models/pain_selection.dart';
import '../models/anamnesis_models.dart';
import '../providers/anamnesis_providers.dart';
import '../repositories/anamnesis_repository.dart';
import '../services/anamnesis_answer_queue.dart';
import '../widgets/anamnesis_progress_bar.dart';
import '../widgets/anamnesis_question_view.dart';
import '../widgets/anamnesis_score_banner.dart';

class AnamnesisQcmScreen extends ConsumerStatefulWidget {
  const AnamnesisQcmScreen({required this.selection, super.key});

  final PainSelection selection;

  @override
  ConsumerState<AnamnesisQcmScreen> createState() => _AnamnesisQcmScreenState();
}

class _AnamnesisQcmScreenState extends ConsumerState<AnamnesisQcmScreen> {
  AnamnesisSession? _session;
  AnamnesisQuestion? _question;
  var _loading = true;
  var _submitting = false;
  String? _error;
  var _complete = false;
  AnamnesisSessionScore? _score;

  @override
  void initState() {
    super.initState();
    unawaited(_bootstrap());
  }

  Future<void> _bootstrap() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final repo = ref.read(anamnesisRepositoryProvider);
      final session = await repo.createSession(
        zoneCode: widget.selection.code,
        bodyModel: widget.selection.model,
        painSelection: painSelectionToApi(widget.selection),
      );
      await _flushQueue(repo, session.id);
      final question = await repo.fetchNextQuestion(session.id);
      if (!mounted) return;
      setState(() {
        _session = session;
        _question = question;
        _complete = question == null;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _flushQueue(AnamnesisRepository repo, String sessionId) async {
    final queue = ref.read(anamnesisAnswerQueueProvider);
    final pending = [
      for (final item in await queue.readAll())
        if (item.sessionId == sessionId) item,
    ];
    for (final item in pending) {
      await repo.submitAnswer(
        sessionId: item.sessionId,
        questionId: item.questionId,
        value: item.value,
        answeredAt: item.answeredAt,
        clientNonce: item.clientNonce,
      );
      await queue.removeNonce(item.clientNonce);
    }
  }

  Future<void> _submitAnswer(Map<String, dynamic> value) async {
    final session = _session;
    final question = _question;
    if (session == null || question == null) return;

    setState(() => _submitting = true);
    final repo = ref.read(anamnesisRepositoryProvider);
    final queue = ref.read(anamnesisAnswerQueueProvider);
    final answeredAt = DateTime.now().toUtc();
    final nonce =
        '${session.id}-${question.id}-${answeredAt.microsecondsSinceEpoch}';

    try {
      final connectivity = await Connectivity().checkConnectivity();
      final offline = connectivity.contains(ConnectivityResult.none);

      if (offline) {
        await queue.enqueue(
          QueuedAnamnesisAnswer(
            sessionId: session.id,
            questionId: question.id,
            value: value,
            clientNonce: nonce,
            answeredAt: answeredAt,
          ),
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.anamnesisOfflineQueued),
          ),
        );
        setState(() => _submitting = false);
        return;
      }

      final result = await repo.submitAnswer(
        sessionId: session.id,
        questionId: question.id,
        value: value,
        answeredAt: answeredAt,
        clientNonce: nonce,
      );
      if (!mounted) return;
      setState(() {
        _session = result.session;
        _question = result.nextQuestion;
        _complete = result.sessionComplete;
        _score = result.score;
        _submitting = false;
      });
    } on AnamnesisApiException catch (e) {
      if (e.message == 'network') {
        await queue.enqueue(
          QueuedAnamnesisAnswer(
            sessionId: session.id,
            questionId: question.id,
            value: value,
            clientNonce: nonce,
            answeredAt: answeredAt,
          ),
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.anamnesisOfflineQueued),
          ),
        );
        setState(() => _submitting = false);
        return;
      }
      if (!mounted) return;
      setState(() {
        _error = e.message;
        _submitting = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _submitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.anamnesisTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: _buildBody(context, l10n),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, AppLocalizations l10n) {
    if (_loading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: GpsSpacing.md),
            Text(l10n.anamnesisLoading),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.anamnesisError, textAlign: TextAlign.center),
            const SizedBox(height: GpsSpacing.sm),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: GpsSpacing.md),
            FilledButton(
              onPressed: () => unawaited(_bootstrap()),
              child: Text(l10n.anamnesisRetry),
            ),
          ],
        ),
      );
    }

    if (_complete || _question == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.anamnesisCompleteTitle,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GpsSpacing.sm),
            if (_score != null) ...[
              AnamnesisScoreBanner(
                score: _score!,
                scoreLabel: l10n.anamnesisScoreLabel,
              ),
              const SizedBox(height: GpsSpacing.md),
            ],
            Text(l10n.anamnesisCompleteMessage, textAlign: TextAlign.center),
            const SizedBox(height: GpsSpacing.lg),
            FilledButton(
              onPressed: () => context.go(GpsRoutes.discover),
              child: Text(l10n.anamnesisDone),
            ),
          ],
        ),
      );
    }

    final session = _session!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnamnesisProgressBar(progress: session.progress),
        if (_score != null) ...[
          const SizedBox(height: GpsSpacing.sm),
          AnamnesisScoreBanner(
            score: _score!,
            scoreLabel: l10n.anamnesisScoreLabel,
          ),
        ],
        const SizedBox(height: GpsSpacing.sm),
        Text(
          l10n.anamnesisDisclaimer,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: GpsSpacing.lg),
        Expanded(
          child: SingleChildScrollView(
            child: AnamnesisQuestionView(
              question: _question!,
              submitting: _submitting,
              onSubmit: (value) => unawaited(_submitAnswer(value)),
            ),
          ),
        ),
      ],
    );
  }
}
