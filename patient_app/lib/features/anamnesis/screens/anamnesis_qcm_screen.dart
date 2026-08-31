import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../bilan/providers/bilan_providers.dart';
import '../../bilan/repositories/bilan_repository.dart';
import '../../pain_localization/models/pain_selection.dart';
import '../models/anamnesis_models.dart';
import '../providers/anamnesis_providers.dart';
import '../repositories/anamnesis_repository.dart';
import '../services/anamnesis_answer_queue.dart';
import '../widgets/anamnesis_progress_bar.dart';
import '../widgets/anamnesis_question_view.dart';
import '../widgets/anamnesis_score_banner.dart';
import 'anamnesis_urgence_screen.dart';

class AnamnesisQcmScreen extends ConsumerStatefulWidget {
  const AnamnesisQcmScreen({required this.selection, super.key});

  final PainSelection selection;

  @override
  ConsumerState<AnamnesisQcmScreen> createState() => _AnamnesisQcmScreenState();
}

class _AnamnesisQcmScreenState extends ConsumerState<AnamnesisQcmScreen> {
  AnamnesisSession? _session;
  bool _generatingBilan = false;
  AnamnesisQuestion? _question;
  var _loading = true;
  var _submitting = false;
  String? _error;
  var _complete = false;
  var _followUpMode = false;
  int? _followUpIndex;
  int? _followUpMax;
  AnamnesisSessionScore? _score;
  AnamnesisRedFlag? _redFlag;
  var _urgent = false;

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
      if (question == null) {
        setState(() {
          _session = session;
          _loading = false;
        });
        await _enterFollowUpOrFinish(repo, session.id);
        return;
      }
      setState(() {
        _session = session;
        _question = question;
        _complete = false;
        _followUpMode = false;
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

  Future<void> _enterFollowUpOrFinish(
    AnamnesisRepository repo,
    String sessionId,
  ) async {
    setState(() => _loading = true);
    try {
      final next = await repo.fetchFollowUpNext(sessionId);
      if (!mounted) return;
      if (next == null) {
        final score = await repo.fetchScore(sessionId);
        if (!mounted) return;
        setState(() {
          _followUpMode = false;
          _question = null;
          _complete = true;
          _score = score ?? _score;
          _loading = false;
        });
        return;
      }
      setState(() {
        _followUpMode = true;
        _question = next.question;
        _followUpIndex = next.index;
        _followUpMax = next.maxQuestions;
        _complete = false;
        _loading = false;
      });
    } catch (_) {
      // AI down → finish with tree score only.
      try {
        final score = await repo.fetchScore(sessionId);
        if (!mounted) return;
        setState(() {
          _score = score ?? _score;
          _followUpMode = false;
          _question = null;
          _complete = true;
          _loading = false;
        });
      } catch (e) {
        if (!mounted) return;
        setState(() {
          _followUpMode = false;
          _question = null;
          _complete = true;
          _loading = false;
        });
      }
    }
  }

  Future<void> _submitAnswer(Map<String, dynamic> value) async {
    final session = _session;
    final question = _question;
    if (session == null || question == null) return;

    if (_followUpMode) {
      await _submitFollowUp(value);
      return;
    }

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
      if (result.redFlag != null || result.session.status == 'urgent') {
        setState(() {
          _session = result.session;
          _score = result.score;
          _redFlag = result.redFlag;
          _urgent = true;
          _question = null;
          _complete = true;
          _submitting = false;
        });
        return;
      }
      if (result.sessionComplete) {
        setState(() {
          _session = result.session;
          _score = result.score;
          _submitting = false;
        });
        await _enterFollowUpOrFinish(repo, session.id);
        return;
      }
      setState(() {
        _session = result.session;
        _question = result.nextQuestion;
        _complete = false;
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

  Future<void> _submitFollowUp(Map<String, dynamic> value) async {
    final session = _session;
    final question = _question;
    if (session == null || question == null) return;

    setState(() => _submitting = true);
    final repo = ref.read(anamnesisRepositoryProvider);
    try {
      final result = await repo.submitFollowUpAnswer(
        sessionId: session.id,
        questionId: question.id,
        value: value,
        answeredAt: DateTime.now().toUtc(),
      );
      if (!mounted) return;
      if (result.followUpComplete || result.nextQuestion == null) {
        setState(() {
          _score = result.score ?? _score;
          _question = null;
          _followUpMode = false;
          _complete = true;
          _submitting = false;
        });
        return;
      }
      setState(() {
        _question = result.nextQuestion;
        _followUpIndex = (_followUpIndex ?? 1) + 1;
        _score = result.score ?? _score;
        _submitting = false;
      });
    } catch (e) {
      if (!mounted) return;
      // Skip remaining follow-ups on error; still show score.
      try {
        final score = await repo.fetchScore(session.id);
        if (!mounted) return;
        setState(() {
          _score = score ?? _score;
          _question = null;
          _followUpMode = false;
          _complete = true;
          _submitting = false;
        });
      } catch (_) {
        setState(() {
          _error = e.toString();
          _submitting = false;
        });
      }
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
            Text(
              _followUpMode
                  ? l10n.anamnesisFollowUpLoading
                  : l10n.anamnesisLoading,
            ),
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
            SecondaryButton(
              label: l10n.anamnesisRetry,
              onPressed: () => unawaited(_bootstrap()),
            ),
          ],
        ),
      );
    }

    if (_urgent && _redFlag != null) {
      return AnamnesisUrgenceScreen(
        redFlag: _redFlag!,
        onDismiss: () => context.go(GpsRoutes.discover),
      );
    }

    if (_complete || _question == null) {
      final regenerative = _session?.status == 'regenerative';
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              regenerative
                  ? l10n.anamnesisRegenerativeTitle
                  : l10n.anamnesisCompleteTitle,
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
            Text(
              regenerative
                  ? l10n.anamnesisRegenerativeMessage
                  : l10n.anamnesisCompleteMessage,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GpsSpacing.lg),
            if (regenerative) ...[
              PrimaryButton(
                label: l10n.anamnesisParcoursCta,
                isLoading: _generatingBilan,
                onPressed: _generatingBilan || _session == null
                    ? null
                    : () => _generateBilan(context),
              ),
              const SizedBox(height: GpsSpacing.sm),
            ],
            if (_session != null) ...[
              SecondaryButton(
                label: l10n.anamnesisDocsCta,
                onPressed: () => context.push(
                  '${GpsRoutes.anamnesisDocuments}/${_session!.id}',
                ),
              ),
              const SizedBox(height: GpsSpacing.sm),
            ],
            PrimaryButton(
              label: l10n.anamnesisDone,
              onPressed: () => context.go(GpsRoutes.discover),
            ),
          ],
        ),
      );
    }

    final session = _session!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!_followUpMode) AnamnesisProgressBar(progress: session.progress),
        if (_followUpMode) ...[
          Text(
            l10n.anamnesisFollowUpTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (_followUpIndex != null && _followUpMax != null)
            Text(
              l10n.anamnesisFollowUpProgress(_followUpIndex!, _followUpMax!),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          const SizedBox(height: GpsSpacing.xs),
          Text(
            l10n.anamnesisFollowUpHint,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
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

  Future<void> _generateBilan(BuildContext context) async {
    final sessionId = _session?.id;
    if (sessionId == null) return;
    final l10n = AppLocalizations.of(context)!;
    setState(() => _generatingBilan = true);
    try {
      final repo = ref.read(bilanRepositoryProvider);
      final bilan = await repo.createBilan(sessionId: sessionId);
      ref.invalidate(bilanListProvider);
      if (mounted) {
        context.push(GpsRoutes.bilanDetail(bilan.id));
      }
    } on BilanApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.bilanLoadError)),
        );
      }
    } finally {
      if (mounted) setState(() => _generatingBilan = false);
    }
  }
}
