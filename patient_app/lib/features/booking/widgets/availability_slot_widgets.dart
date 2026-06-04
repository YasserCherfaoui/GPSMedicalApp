import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/booking_dates.dart';
import '../utils/booking_enums.dart';
import 'mode_badge.dart';

/// Week pager with icon buttons and a visible date range.
class AvailabilityWeekBar extends StatelessWidget {
  const AvailabilityWeekBar({
    required this.rangeLabel,
    required this.canGoBack,
    required this.canGoForward,
    required this.onPrevious,
    required this.onNext,
    super.key,
  });

  final String rangeLabel;
  final bool canGoBack;
  final bool canGoForward;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        GpsSpacing.md,
        GpsSpacing.sm,
        GpsSpacing.md,
        GpsSpacing.xs,
      ),
      child: Material(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(GpsRadii.lg),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: GpsSpacing.xs,
            vertical: GpsSpacing.xs,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: canGoBack ? onPrevious : null,
                icon: const Icon(Icons.chevron_left_rounded),
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              ),
              Expanded(
                child: Text(
                  rangeLabel,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              IconButton(
                onPressed: canGoForward ? onNext : null,
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// In-person / telehealth / all filter when the API returns both modes.
class AvailabilityModeFilter extends StatelessWidget {
  const AvailabilityModeFilter({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        GpsSpacing.md,
        0,
        GpsSpacing.md,
        GpsSpacing.sm,
      ),
      child: SegmentedButton<String>(
        segments: [
          ButtonSegment(
            value: 'both',
            label: Text(l10n.bookingModeAll),
            icon: const Icon(Icons.calendar_month_outlined, size: 18),
          ),
          ButtonSegment(
            value: 'in_person',
            label: Text(l10n.bookingModeInPerson),
            icon: const Icon(Icons.person_outline, size: 18),
          ),
          ButtonSegment(
            value: 'telehealth',
            label: Text(l10n.bookingModeTelehealth),
            icon: const Icon(Icons.videocam_outlined, size: 18),
          ),
        ],
        selected: {selected},
        onSelectionChanged: (set) => onSelected(set.first),
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: WidgetStatePropertyAll(
            BorderSide(color: colorScheme.outlineVariant),
          ),
        ),
      ),
    );
  }
}

class AvailabilityDayCard extends StatelessWidget {
  const AvailabilityDayCard({
    required this.title,
    required this.slotCountLabel,
    required this.groups,
    required this.locale,
    required this.onSlotTap,
    super.key,
  });

  final String title;
  final String slotCountLabel;
  final List<({DateTime startAt, List<AvailabilitySlot> variants})> groups;
  final String locale;
  final void Function(AvailabilitySlot) onSlotTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: GpsSpacing.md),
      child: GpsCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(GpsSpacing.sm),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(GpsRadii.md),
                  ),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    size: 22,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: GpsSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _capitalize(title),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        slotCountLabel,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: GpsSpacing.md),
            ...groups.map(
              (g) => Padding(
                padding: const EdgeInsets.only(bottom: GpsSpacing.sm),
                child: _SlotTimeRow(
                  startAt: g.startAt,
                  variants: g.variants,
                  locale: locale,
                  onSlotTap: onSlotTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return '${s[0].toUpperCase()}${s.substring(1)}';
  }
}

class _SlotTimeRow extends StatelessWidget {
  const _SlotTimeRow({
    required this.startAt,
    required this.variants,
    required this.locale,
    required this.onSlotTap,
  });

  final DateTime startAt;
  final List<AvailabilitySlot> variants;
  final String locale;
  final void Function(AvailabilitySlot) onSlotTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final timeLabel = formatSlotTime(startAt, locale);
    final minutes = variants.isNotEmpty
        ? slotDurationMinutes(variants.first)
        : 0;

    if (variants.length == 1) {
      final slot = variants.first;
      return _SlotTile(
        timeLabel: timeLabel,
        minutes: minutes,
        mode: slot.mode,
        onTap: () => onSlotTap(slot),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(GpsRadii.md),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      padding: const EdgeInsets.all(GpsSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                timeLabel,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (minutes > 0) ...[
                const SizedBox(width: GpsSpacing.sm),
                Text(
                  '$minutes min',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: GpsSpacing.sm),
          Row(
            children: [
              for (var i = 0; i < variants.length; i++) ...[
                if (i > 0) const SizedBox(width: GpsSpacing.sm),
                Expanded(
                  child: _ModeChoiceButton(
                    slot: variants[i],
                    onTap: () => onSlotTap(variants[i]),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _SlotTile extends StatelessWidget {
  const _SlotTile({
    required this.timeLabel,
    required this.minutes,
    required this.mode,
    required this.onTap,
  });

  final String timeLabel;
  final int minutes;
  final AvailabilitySlotModeEnum? mode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(GpsRadii.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(GpsRadii.md),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: GpsSpacing.md,
            vertical: GpsSpacing.md,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      timeLabel,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (minutes > 0) ...[
                      const SizedBox(height: 2),
                      Text(
                        '$minutes min',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (mode != null) ModeBadge(mode: slotModeWire(mode)),
              const SizedBox(width: GpsSpacing.sm),
              Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeChoiceButton extends StatelessWidget {
  const _ModeChoiceButton({required this.slot, required this.onTap});

  final AvailabilitySlot slot;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isTelehealth = slot.mode == AvailabilitySlotModeEnum.telehealth;
    final l10n = AppLocalizations.of(context)!;
    final label = isTelehealth
        ? l10n.bookingModeTelehealth
        : l10n.bookingModeInPerson;

    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(
        isTelehealth ? Icons.videocam_outlined : Icons.person_outline,
        size: 18,
      ),
      label: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.labelMedium,
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: GpsSpacing.sm,
          vertical: GpsSpacing.sm,
        ),
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.primary.withValues(alpha: 0.4)),
      ),
    );
  }
}

/// Bottom sheet to confirm a slot before booking.
class SlotConfirmSheet extends StatelessWidget {
  const SlotConfirmSheet({
    required this.slot,
    required this.doctorName,
    required this.onConfirm,
    super.key,
  });

  final AvailabilitySlot slot;
  final String doctorName;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final locale = Localizations.localeOf(context).languageCode;
    final start = slot.startAt?.toLocal();
    final minutes = slotDurationMinutes(slot);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          GpsSpacing.lg,
          GpsSpacing.sm,
          GpsSpacing.lg,
          GpsSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: GpsSpacing.lg),
            Text(
              l10n.bookingReserve,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: GpsSpacing.xs),
            Text(
              doctorName,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GpsSpacing.lg),
            GpsCard(
              showAccentBorder: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (start != null)
                    Text(
                      '${formatDaySectionTitle(Date(start.year, start.month, start.day), locale)} · ${formatSlotTime(start, locale)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(height: GpsSpacing.sm),
                  if (slot.mode != null)
                    ModeBadge(mode: slotModeWire(slot.mode)),
                  if (minutes > 0) ...[
                    const SizedBox(height: GpsSpacing.sm),
                    Text(
                      l10n.bookingSlotDuration(minutes),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: GpsSpacing.lg),
            PrimaryButton(label: l10n.bookingReserve, onPressed: onConfirm),
          ],
        ),
      ),
    );
  }
}

void showSlotConfirmSheet({
  required BuildContext context,
  required AvailabilitySlot slot,
  required String doctorName,
  required VoidCallback onConfirm,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: false,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(GpsRadii.lg)),
    ),
    builder: (ctx) => SlotConfirmSheet(
      slot: slot,
      doctorName: doctorName,
      onConfirm: onConfirm,
    ),
  );
}
