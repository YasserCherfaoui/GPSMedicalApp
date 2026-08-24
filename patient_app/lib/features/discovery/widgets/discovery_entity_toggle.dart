import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/doctor_search.provider.dart';

class DiscoveryEntityToggle extends StatelessWidget {
  const DiscoveryEntityToggle({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final DiscoveryEntity value;
  final ValueChanged<DiscoveryEntity> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SegmentedButton<DiscoveryEntity>(
      segments: [
        ButtonSegment(
          value: DiscoveryEntity.doctors,
          label: Text(l10n.searchEntityDoctors),
        ),
        ButtonSegment(
          value: DiscoveryEntity.clinics,
          label: Text(l10n.searchEntityClinics),
        ),
      ],
      selected: {value},
      showSelectedIcon: false,
      onSelectionChanged: (selected) {
        if (selected.isEmpty) return;
        onChanged(selected.first);
      },
    );
  }
}
