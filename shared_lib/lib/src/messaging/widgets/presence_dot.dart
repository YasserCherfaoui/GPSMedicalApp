import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../theme/gps_colors.dart';
import '../../theme/gps_spacing.dart';
import '../presence.provider.dart';

/// Small online/offline indicator (D-39.3 — no last-seen copy).
class PresenceDot extends StatelessWidget {
  const PresenceDot({
    required this.presence,
    this.size = 10,
    this.showOffline = false,
    super.key,
  });

  final PresenceStatus? presence;
  final double size;

  /// When false, [PresenceStatus.offline] and unknown render nothing.
  final bool showOffline;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final status = presence;
    if (status == null) return const SizedBox.shrink();
    if (status == PresenceStatus.offline && !showOffline) {
      return const SizedBox.shrink();
    }

    final color = switch (status) {
      PresenceStatus.online => GpsColors.green,
      PresenceStatus.offline => GpsColors.outline,
    };
    final label = switch (status) {
      PresenceStatus.online => l10n?.presenceOnline ?? 'Online',
      PresenceStatus.offline => l10n?.presenceOffline ?? 'Offline',
    };

    return Semantics(
      label: label,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
        ),
      ),
    );
  }
}

/// Title row with optional presence dot for messaging app bars.
class PresenceTitle extends StatelessWidget {
  const PresenceTitle({
    required this.label,
    this.presence,
    this.showOffline = false,
    super.key,
  });

  final String label;
  final PresenceStatus? presence;
  final bool showOffline;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(label, overflow: TextOverflow.ellipsis),
        ),
        if (presence != null) ...[
          const SizedBox(width: GpsSpacing.sm),
          PresenceDot(presence: presence, showOffline: showOffline),
        ],
      ],
    );
  }
}
