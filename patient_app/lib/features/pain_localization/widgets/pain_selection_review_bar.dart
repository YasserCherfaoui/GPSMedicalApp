import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/pain_selection.dart';
import '../services/pain_label_catalog.dart';

class PainSelectionReviewBar extends StatelessWidget {
  const PainSelectionReviewBar({
    required this.selections,
    required this.languageCode,
    required this.labels,
    required this.onRemove,
    required this.onConfirm,
    required this.onClearAll,
    this.pendingSelection,
    this.onAddPending,
    super.key,
  });

  final List<PainSelection> selections;
  final PainSelection? pendingSelection;
  final String languageCode;
  final PainLabelCatalog labels;
  final void Function(PainSelection selection) onRemove;
  final VoidCallback? onAddPending;
  final VoidCallback onConfirm;
  final VoidCallback onClearAll;

  bool get _mixed => selections.map((s) => s.model).toSet().length > 1;

  String _chipLabel(PainSelection item) {
    final mark = _mixed ? (item.model == 'female' ? '♀ ' : '♂ ') : '';
    return '$mark${labels.labelFor(item.code, languageCode)}';
  }

  String _pendingLabel(PainSelection item) {
    final mark = item.model == 'female' ? '♀ ' : '♂ ';
    return '$mark${labels.labelFor(item.code, languageCode)}';
  }

  bool _pendingAlreadyAdded(PainSelection? pending) {
    if (pending == null) return false;
    return selections.any(
      (item) => item.code == pending.code && item.model == pending.model,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final pending = pendingSelection;
    final pendingAdded = _pendingAlreadyAdded(pending);
    return Material(
      elevation: 4,
      color: theme.colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            GpsSpacing.md,
            GpsSpacing.sm,
            GpsSpacing.md,
            GpsSpacing.sm,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (pending != null) ...[
                Text(
                  _pendingLabel(pending),
                  style: theme.textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: GpsSpacing.xs),
                if (pendingAdded)
                  Text(
                    l10n.painLocalizationSelectionAlreadyAdded,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  )
                else
                  SecondaryButton(
                    label: l10n.painLocalizationAddSelection,
                    onPressed: onAddPending,
                  ),
                const SizedBox(height: GpsSpacing.sm),
              ] else if (selections.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: GpsSpacing.sm),
                  child: Text(
                    l10n.painLocalizationEmpty,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              if (selections.isNotEmpty)
                SizedBox(
                  height: 48,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var i = 0; i < selections.length; i++) ...[
                          if (i > 0) const SizedBox(width: GpsSpacing.xs),
                          InputChip(
                            label: Text(_chipLabel(selections[i])),
                            onDeleted: () => onRemove(selections[i]),
                            deleteButtonTooltipMessage:
                                l10n.painLocalizationRemoveChip,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              if (selections.isNotEmpty) const SizedBox(height: GpsSpacing.sm),
              PrimaryButton(
                label: l10n.painLocalizationConfirm,
                onPressed: selections.isEmpty ? null : onConfirm,
              ),
              if (selections.isNotEmpty)
                TextButton(
                  onPressed: onClearAll,
                  child: Text(l10n.painLocalizationClearAll),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
