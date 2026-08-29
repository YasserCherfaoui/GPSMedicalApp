import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/anamnesis_models.dart';

typedef AnamnesisAnswerSubmit = void Function(Map<String, dynamic> value);

class AnamnesisQuestionView extends StatefulWidget {
  const AnamnesisQuestionView({
    required this.question,
    required this.onSubmit,
    this.submitting = false,
    super.key,
  });

  final AnamnesisQuestion question;
  final AnamnesisAnswerSubmit onSubmit;
  final bool submitting;

  @override
  State<AnamnesisQuestionView> createState() => _AnamnesisQuestionViewState();
}

class _AnamnesisQuestionViewState extends State<AnamnesisQuestionView> {
  String? _singleChoice;
  final Set<String> _multiChoice = {};
  double? _scaleValue;
  int _durationValue = 1;
  String? _durationUnit;

  @override
  void initState() {
    super.initState();
    final scale = widget.question.scale;
    if (scale != null) {
      _scaleValue = scale.min.toDouble();
    }
    final duration = widget.question.duration;
    if (duration != null && duration.allowedUnits.isNotEmpty) {
      _durationUnit = duration.allowedUnits.first;
    }
  }

  @override
  void didUpdateWidget(covariant AnamnesisQuestionView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question.id != widget.question.id) {
      _singleChoice = null;
      _multiChoice.clear();
      final scale = widget.question.scale;
      _scaleValue = scale?.min.toDouble();
      final duration = widget.question.duration;
      _durationUnit = duration?.allowedUnits.isNotEmpty == true
          ? duration!.allowedUnits.first
          : null;
      _durationValue = 1;
    }
  }

  void _submit() {
    final q = widget.question;
    final value = switch (q.type) {
      'single_choice' => buildAnswerValue(
          type: q.type,
          optionId: _singleChoice,
        ),
      'multi_choice' => buildAnswerValue(
          type: q.type,
          optionIds: _multiChoice.toList()..sort(),
        ),
      'scale' => buildAnswerValue(type: q.type, number: _scaleValue),
      'duration' => buildAnswerValue(
          type: q.type,
          durationValue: _durationValue,
          durationUnit: _durationUnit,
        ),
      _ => {'type': q.type},
    };
    widget.onSubmit(value);
  }

  bool get _canSubmit {
    final q = widget.question;
    return switch (q.type) {
      'single_choice' => _singleChoice != null,
      'multi_choice' => _multiChoice.isNotEmpty,
      'scale' => _scaleValue != null,
      'duration' =>
        _durationUnit != null && _durationValue >= 0 && !widget.submitting,
      _ => false,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final q = widget.question;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(q.promptFr, style: theme.textTheme.titleMedium),
        if (q.helpFr != null) ...[
          const SizedBox(height: GpsSpacing.xs),
          Text(
            q.helpFr!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        const SizedBox(height: GpsSpacing.md),
        switch (q.type) {
          'single_choice' => Column(
              children: [
                for (final opt in q.options)
                  RadioListTile<String>(
                    value: opt.id,
                    groupValue: _singleChoice,
                    title: Text(opt.labelFr),
                    onChanged: widget.submitting
                        ? null
                        : (v) => setState(() => _singleChoice = v),
                  ),
              ],
            ),
          'multi_choice' => Column(
              children: [
                for (final opt in q.options)
                  CheckboxListTile(
                    value: _multiChoice.contains(opt.id),
                    title: Text(opt.labelFr),
                    onChanged: widget.submitting
                        ? null
                        : (checked) {
                            setState(() {
                              if (checked == true) {
                                _multiChoice.add(opt.id);
                              } else {
                                _multiChoice.remove(opt.id);
                              }
                            });
                          },
                  ),
              ],
            ),
          'scale' => _buildScale(q),
          'duration' => _buildDuration(q),
          _ => Text(l10n.anamnesisUnsupportedQuestion),
        },
        const SizedBox(height: GpsSpacing.lg),
        FilledButton(
          onPressed: _canSubmit && !widget.submitting ? _submit : null,
          child: widget.submitting
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l10n.anamnesisContinue),
        ),
      ],
    );
  }

  Widget _buildScale(AnamnesisQuestion q) {
    final scale = q.scale!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          min: scale.min.toDouble(),
          max: scale.max.toDouble(),
          divisions: ((scale.max - scale.min) / scale.step).round(),
          label: _scaleValue?.round().toString(),
          value: _scaleValue ?? scale.min.toDouble(),
          onChanged: widget.submitting
              ? null
              : (v) => setState(() => _scaleValue = v),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(scale.minLabelFr ?? '${scale.min}'),
            Text('${_scaleValue?.round() ?? scale.min}'),
            Text(scale.maxLabelFr ?? '${scale.max}'),
          ],
        ),
      ],
    );
  }

  Widget _buildDuration(AnamnesisQuestion q) {
    final duration = q.duration!;
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: '$_durationValue',
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.anamnesisDurationValue,
            ),
            enabled: !widget.submitting,
            onChanged: (raw) {
              final parsed = int.tryParse(raw);
              if (parsed != null) setState(() => _durationValue = parsed);
            },
          ),
        ),
        const SizedBox(width: GpsSpacing.sm),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: _durationUnit,
            items: [
              for (final unit in duration.allowedUnits)
                DropdownMenuItem(value: unit, child: Text(unit)),
            ],
            onChanged: widget.submitting
                ? null
                : (v) => setState(() => _durationUnit = v),
          ),
        ),
      ],
    );
  }
}
