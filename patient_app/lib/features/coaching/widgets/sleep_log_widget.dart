import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/coaching_providers.dart';
import '../repositories/coaching_repository.dart';

class SleepLogWidget extends ConsumerStatefulWidget {
  const SleepLogWidget({required this.planId, super.key});

  final String planId;

  @override
  ConsumerState<SleepLogWidget> createState() => _SleepLogWidgetState();
}

class _SleepLogWidgetState extends ConsumerState<SleepLogWidget> {
  double _hours = 7;
  int _quality = 3;
  bool _logging = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sleepAsync = ref.watch(coachingSleepListProvider(widget.planId));

    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.coachingSleepTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: GpsSpacing.sm),
        Text(l10n.coachingSleepHoursLabel(_hours.toStringAsFixed(1))),
        Slider(
          value: _hours,
          min: 0,
          max: 12,
          divisions: 24,
          label: _hours.toStringAsFixed(1),
          onChanged: _logging ? null : (v) => setState(() => _hours = v),
        ),
        Text(l10n.coachingSleepQualityLabel),
        const SizedBox(height: GpsSpacing.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            final value = index + 1;
            final selected = _quality == value;
            return ChoiceChip(
              label: Text('$value'),
              selected: selected,
              selectedColor: colorScheme.primaryContainer,
              onSelected: _logging
                  ? null
                  : (_) => setState(() => _quality = value),
            );
          }),
        ),
        const SizedBox(height: GpsSpacing.md),
        PrimaryButton(
          label: l10n.coachingSleepLogCta,
          isLoading: _logging,
          onPressed: _logging ? null : _logSleep,
        ),
        const SizedBox(height: GpsSpacing.md),
        sleepAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => Text(l10n.coachingSleepError),
          data: (entries) {
            if (entries.isEmpty) {
              return Text(
                l10n.coachingSleepEmpty,
                style: Theme.of(context).textTheme.bodySmall,
              );
            }
            final latest = entries.first;
            return Text(
              l10n.coachingSleepLastEntry(
                latest.loggedOn,
                latest.hours,
                latest.quality,
              ),
              style: Theme.of(context).textTheme.bodySmall,
            );
          },
        ),
      ],
    );
  }

  Future<void> _logSleep() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _logging = true);
    try {
      final repo = ref.read(coachingRepositoryProvider);
      await repo.logSleep(
        widget.planId,
        hours: _hours,
        quality: _quality,
      );
      ref.invalidate(coachingSleepListProvider(widget.planId));
      ref.invalidate(coachingProgressProvider(widget.planId));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.coachingSleepLogged)),
        );
      }
    } on CoachingApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } finally {
      if (mounted) setState(() => _logging = false);
    }
  }
}
