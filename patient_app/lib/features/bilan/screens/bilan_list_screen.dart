import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/bilan_providers.dart';

class BilanListScreen extends ConsumerWidget {
  const BilanListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final bilansAsync = ref.watch(bilanListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.bilanListTitle)),
      body: bilansAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.bilanLoadError),
              const SizedBox(height: GpsSpacing.md),
              SecondaryButton(
                label: l10n.retry,
                onPressed: () =>
                    ref.read(bilanListProvider.notifier).refresh(),
              ),
            ],
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return Center(child: Text(l10n.bilanListEmpty));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(bilanListProvider.notifier).refresh(),
            child: ListView.separated(
              padding: const EdgeInsets.all(GpsSpacing.md),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: GpsSpacing.sm),
              itemBuilder: (context, index) {
                final item = items[index];
                return GpsCard(
                  onTap: () => context.push(GpsRoutes.bilanDetail(item.id)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.bilanListItemTitle(item.zoneCode)),
                            const SizedBox(height: GpsSpacing.xs),
                            Text(
                              l10n.bilanListItemSubtitle(
                                item.finalScore.round(),
                                item.createdAt,
                              ),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
