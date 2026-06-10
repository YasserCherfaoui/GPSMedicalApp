import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/dependents_list.provider.dart';
import '../utils/dependent_display.dart';

class DependentsListScreen extends ConsumerWidget {
  const DependentsListScreen({super.key});

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Dependent dependent,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dependentsDeleteTitle),
        content: Text(l10n.dependentsDeleteMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.mapNearbyPermissionRationaleCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dependentsDeleteConfirm),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    try {
      await ref.read(dependentsListProvider.notifier).delete(dependent.id!);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.dependentDeleteError)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dependentsAsync = ref.watch(dependentsListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.dependentsTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(GpsRoutes.profileDependentNew),
        icon: const Icon(Icons.person_add_outlined),
        label: Text(l10n.dependentsAdd),
      ),
      body: dependentsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.networkError),
              const SizedBox(height: GpsSpacing.md),
              FilledButton(
                onPressed: () =>
                    ref.read(dependentsListProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
        data: (dependents) {
          if (dependents.isEmpty) {
            return Center(child: Text(l10n.dependentsEmpty));
          }

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(dependentsListProvider.notifier).refresh(),
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                GpsSpacing.md,
                GpsSpacing.md,
                GpsSpacing.md,
                GpsSpacing.xxl * 2,
              ),
              itemCount: dependents.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: GpsSpacing.sm),
              itemBuilder: (context, index) {
                final dependent = dependents[index];
                final age = dependentAgeYears(dependent.birthDate);

                return GpsCard(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      child: Icon(dependentGenderIcon(dependent.gender)),
                    ),
                    title: Text(dependent.fullName ?? ''),
                    subtitle: Text(
                      '${dependentRelationLabel(dependent.relation, l10n)} · ${l10n.dependentAgeYears(age)}',
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'edit' && dependent.id != null) {
                          context.push(
                            GpsRoutes.profileDependentEdit(dependent.id!),
                          );
                        } else if (value == 'delete') {
                          _confirmDelete(context, ref, dependent);
                        }
                      },
                      itemBuilder: (ctx) => [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text(l10n.profileEdit),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text(
                            l10n.dependentsDeleteConfirm,
                            style: TextStyle(
                              color: Theme.of(ctx).colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: dependent.id == null
                        ? null
                        : () => context.push(
                            GpsRoutes.profileDependentEdit(dependent.id!),
                          ),
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
