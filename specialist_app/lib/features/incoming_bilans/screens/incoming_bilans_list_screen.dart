import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../routing/specialist_routes.dart';
import '../providers/incoming_bilan_providers.dart';

class IncomingBilansListScreen extends ConsumerWidget {
  const IncomingBilansListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final async = ref.watch(incomingBilansProvider);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.specialistIncomingBilansError),
            FilledButton(
              onPressed: () =>
                  ref.read(incomingBilansProvider.notifier).refresh(),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
      data: (items) {
        if (items.isEmpty) {
          return Center(child: Text(l10n.specialistIncomingBilansEmpty));
        }
        return RefreshIndicator(
          onRefresh: () => ref.read(incomingBilansProvider.notifier).refresh(),
          child: ListView.separated(
            padding: const EdgeInsets.all(GpsSpacing.md),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: GpsSpacing.sm),
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(l10n.specialistIncomingBilanItem(item.bilanId)),
                subtitle: Text(item.transmittedAt.toLocal().toString()),
                trailing: item.isOpen
                    ? const Icon(Icons.fiber_new_outlined)
                    : const Icon(Icons.check_circle_outline),
                onTap: () => context.push(
                  SpecialistRoutes.incomingBilanDetail(item.id),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
