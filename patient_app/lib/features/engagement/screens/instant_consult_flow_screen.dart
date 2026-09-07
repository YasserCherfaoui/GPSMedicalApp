import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../discovery/providers/specialties.provider.dart';

/// Discover home card → Telehealth Now flow.
class InstantConsultHomeCard extends StatelessWidget {
  const InstantConsultHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return GpsCard(
      onTap: () => context.push(GpsRoutes.instantConsult),
      child: Row(
        children: [
          Icon(Icons.bolt, color: theme.colorScheme.primary, size: 32),
          const SizedBox(width: GpsSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.engagementInstantHomeTitle,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: GpsSpacing.xs),
                Text(
                  l10n.engagementInstantHomeSubtitle,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }
}

/// Specialty → triage → available-now → wait for accept.
class InstantConsultFlowScreen extends ConsumerStatefulWidget {
  const InstantConsultFlowScreen({super.key});

  @override
  ConsumerState<InstantConsultFlowScreen> createState() =>
      _InstantConsultFlowScreenState();
}

class _InstantConsultFlowScreenState
    extends ConsumerState<InstantConsultFlowScreen> {
  var _step = 0; // 0 specialty, 1 triage, 2 list, 3 waiting
  String? _specialtyId;
  String? _triageId;
  InstantConsultRequest? _pendingRequest;
  var _busy = false;
  StreamSubscription<MessagingRealtimeEvent>? _wsSub;
  Timer? _waitTimer;
  final _answers = <String, bool>{
    'rf_chest_pain': false,
    'rf_breathing': false,
    'rf_unconscious': false,
  };

  @override
  void dispose() {
    _wsSub?.cancel();
    _waitTimer?.cancel();
    super.dispose();
  }

  void _listenForAccept(String requestId) {
    _wsSub?.cancel();
    _waitTimer?.cancel();
    final ws = ref.read(messagingWebSocketClientProvider);
    if (ws != null) {
      _wsSub = ws.events.listen((event) {
        if (event.type != 'instant.accepted') return;
        final payload = event.payload;
        final id = payload['id'] as String? ??
            (payload['request'] is Map
                ? (payload['request'] as Map)['id'] as String?
                : null);
        if (id != null && id != requestId) return;
        final appointmentId = payload['appointment_id'] as String? ??
            (payload['request'] is Map
                ? (payload['request'] as Map)['appointment_id'] as String?
                : null);
        if (!mounted) return;
        _waitTimer?.cancel();
        if (appointmentId != null && appointmentId.isNotEmpty) {
          context.go(GpsRoutes.appointmentDetail(appointmentId));
        } else {
          setState(() => _step = 2);
        }
      });
    }
    _waitTimer = Timer(const Duration(seconds: 90), () {
      if (!mounted || _step != 3) return;
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.engagementInstantTimeout)),
      );
      setState(() => _step = 2);
      _wsSub?.cancel();
    });
  }

  Future<void> _runTriage() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _busy = true);
    try {
      final answers = _answers.entries
          .map(
            (e) => {
              'question_id': e.key,
              'value': e.value ? 'yes' : 'no',
            },
          )
          .toList();
      final result = await ref
          .read(engagementRepositoryProvider)
          .createInstantTriage(answers: answers);
      if (!mounted) return;
      if (result.blocked) {
        await showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(l10n.engagementInstantTriageBlockedTitle),
            content: Text(l10n.engagementInstantTriageBlockedBody),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(l10n.retry),
              ),
            ],
          ),
        );
        return;
      }
      setState(() {
        _triageId = result.id;
        _step = 2;
      });
    } on DioException catch (e) {
      if (!mounted) return;
      final msg = e.response?.statusCode == 503
          ? l10n.engagementInstantDisabled
          : l10n.networkError;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.networkError)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _requestDoctor(AvailableNowDoctor doctor) async {
    final l10n = AppLocalizations.of(context)!;
    final triageId = _triageId;
    if (triageId == null) return;
    setState(() => _busy = true);
    try {
      final req = await ref
          .read(engagementRepositoryProvider)
          .createInstantConsultRequest(
            doctorId: doctor.id,
            triageId: triageId,
          );
      if (!mounted) return;
      setState(() {
        _pendingRequest = req;
        _step = 3;
        _busy = false;
      });
      _listenForAccept(req.id);
      return;
    } on DioException catch (e) {
      if (!mounted) return;
      final msg = e.response?.statusCode == 503
          ? l10n.engagementInstantDisabled
          : l10n.networkError;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.networkError)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.engagementInstantHomeTitle)),
      body: switch (_step) {
        0 => _SpecialtyStep(
          busy: _busy,
          onSelected: (id) => setState(() {
            _specialtyId = id;
            _step = 1;
          }),
        ),
        1 => _TriageStep(
          answers: _answers,
          busy: _busy,
          onChanged: (k, v) => setState(() => _answers[k] = v),
          onContinue: _runTriage,
        ),
        2 => _AvailableNowStep(
          specialtyId: _specialtyId!,
          busy: _busy,
          onPick: _requestDoctor,
        ),
        _ => Center(
          child: Padding(
            padding: const EdgeInsets.all(GpsSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: GpsSpacing.md),
                Text(
                  l10n.engagementInstantRequestSent,
                  textAlign: TextAlign.center,
                ),
                if (_pendingRequest != null) ...[
                  const SizedBox(height: GpsSpacing.sm),
                  Text(
                    _pendingRequest!.id,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ),
        ),
      },
    );
  }
}

class _SpecialtyStep extends ConsumerWidget {
  const _SpecialtyStep({required this.busy, required this.onSelected});

  final bool busy;
  final void Function(String id) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final languageCode = Localizations.localeOf(context).languageCode;
    final specialtiesAsync = ref.watch(specialtiesProvider);

    return specialtiesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => ErrorState(
        title: l10n.networkError,
        onRetry: () => ref.read(specialtiesProvider.notifier).refresh(),
      ),
      data: (specialties) {
        final usable = specialties
            .where((s) => (s.id ?? '').isNotEmpty)
            .toList();
        if (usable.isEmpty) {
          return EmptyState(
            title: l10n.engagementSpecialtyRequired,
            icon: Icons.medical_services_outlined,
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(GpsSpacing.md),
          itemCount: usable.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: GpsSpacing.xs),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: GpsSpacing.sm),
                child: Text(
                  l10n.engagementSpecialtyRequired,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }
            final s = usable[index - 1];
            final label = languageCode.startsWith('ar')
                ? (s.nameAr?.trim().isNotEmpty == true
                    ? s.nameAr!
                    : (s.nameFr ?? s.id!))
                : (s.nameFr ?? s.nameAr ?? s.id!);
            return ListTile(
              title: Text(label),
              trailing: const Icon(Icons.chevron_right),
              onTap: busy ? null : () => onSelected(s.id!),
            );
          },
        );
      },
    );
  }
}

class _TriageStep extends StatelessWidget {
  const _TriageStep({
    required this.answers,
    required this.busy,
    required this.onChanged,
    required this.onContinue,
  });

  final Map<String, bool> answers;
  final bool busy;
  final void Function(String key, bool value) onChanged;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = {
      'rf_chest_pain': 'Douleur thoracique intense ?',
      'rf_breathing': 'Détresse respiratoire ?',
      'rf_unconscious': 'Perte de connaissance ?',
    };
    return ListView(
      padding: const EdgeInsets.all(GpsSpacing.lg),
      children: [
        Text(
          l10n.engagementInstantTriageTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: GpsSpacing.md),
        for (final e in labels.entries)
          SwitchListTile(
            title: Text(e.value),
            value: answers[e.key] ?? false,
            onChanged: busy ? null : (v) => onChanged(e.key, v),
          ),
        const SizedBox(height: GpsSpacing.lg),
        PrimaryButton(
          label: l10n.engagementInstantTriageContinue,
          onPressed: busy ? null : onContinue,
        ),
      ],
    );
  }
}

class _AvailableNowStep extends ConsumerWidget {
  const _AvailableNowStep({
    required this.specialtyId,
    required this.busy,
    required this.onPick,
  });

  final String specialtyId;
  final bool busy;
  final void Function(AvailableNowDoctor doctor) onPick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return FutureBuilder<List<AvailableNowDoctor>>(
      future: ref
          .read(engagementRepositoryProvider)
          .listAvailableNow(specialtyId: specialtyId),
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          final err = snap.error;
          final msg = err is DioException && err.response?.statusCode == 503
              ? l10n.engagementInstantDisabled
              : l10n.networkError;
          return ErrorState(title: msg, onRetry: () => (context as Element).markNeedsBuild());
        }
        final doctors = snap.data ?? const [];
        if (doctors.isEmpty) {
          return EmptyState(
            title: l10n.engagementInstantEmpty,
            icon: Icons.videocam_off_outlined,
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(GpsSpacing.md),
          itemCount: doctors.length,
          separatorBuilder: (_, __) => const SizedBox(height: GpsSpacing.sm),
          itemBuilder: (context, i) {
            final d = doctors[i];
            final price = d.instantPriceMinor;
            final cur = d.instantCurrency ?? '';
            return ListTile(
              leading: PresenceDot(
                presence: d.presence == 'online'
                    ? PresenceStatus.online
                    : PresenceStatus.offline,
                showOffline: true,
              ),
              title: Text(d.fullName),
              subtitle: price != null ? Text('$price $cur') : null,
              trailing: const Icon(Icons.chevron_right),
              onTap: busy ? null : () => onPick(d),
            );
          },
        );
      },
    );
  }
}
