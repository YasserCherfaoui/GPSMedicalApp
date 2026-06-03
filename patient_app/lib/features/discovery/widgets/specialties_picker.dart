import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import '../providers/specialties.provider.dart';

class SpecialtiesPicker extends ConsumerWidget {
  const SpecialtiesPicker({
    required this.onSpecialtySelected,
    this.selectedSpecialtyId,
    super.key,
  });

  final void Function(Specialty specialty) onSpecialtySelected;
  final String? selectedSpecialtyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specialtiesAsync = ref.watch(specialtiesProvider);
    final locale = Localizations.localeOf(context).languageCode;
    final isAr = locale == 'ar';

    return specialtiesAsync.when(
      data: (specialties) {
        if (specialties.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(GpsSpacing.md),
              child: Text('Aucune spécialité trouvée.'),
            ),
          );
        }

        // Separate roots and children
        final roots = specialties.where((s) => s.parentId == null).toList();
        final childrenMap = <String, List<Specialty>>{};
        for (final s in specialties) {
          if (s.parentId != null) {
            childrenMap.putIfAbsent(s.parentId!, () => []).add(s);
          }
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: roots.length,
          itemBuilder: (context, index) {
            final root = roots[index];
            final rootName = isAr
                ? (root.nameAr ?? root.nameFr ?? '')
                : (root.nameFr ?? '');
            final hasChildren = childrenMap.containsKey(root.id);

            if (!hasChildren) {
              final isSelected = root.id == selectedSpecialtyId;
              return ListTile(
                title: Text(rootName),
                selected: isSelected,
                selectedTileColor: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withValues(alpha: 0.1),
                selectedColor: Theme.of(context).colorScheme.primary,
                trailing: isSelected ? const Icon(Icons.check) : null,
                onTap: () => onSpecialtySelected(root),
              );
            }

            final children = childrenMap[root.id]!;
            final isRootOrChildSelected =
                root.id == selectedSpecialtyId ||
                children.any((c) => c.id == selectedSpecialtyId);

            return ExpansionTile(
              initiallyExpanded: isRootOrChildSelected,
              title: Text(
                rootName,
                style: TextStyle(
                  fontWeight: isRootOrChildSelected
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: isRootOrChildSelected
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    isAr ? 'Tout $rootName' : 'Toute la spécialité ($rootName)',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  selected: root.id == selectedSpecialtyId,
                  selectedTileColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withValues(alpha: 0.1),
                  selectedColor: Theme.of(context).colorScheme.primary,
                  trailing: root.id == selectedSpecialtyId
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () => onSpecialtySelected(root),
                ),
                ...children.map((child) {
                  final childName = isAr
                      ? (child.nameAr ?? child.nameFr ?? '')
                      : (child.nameFr ?? '');
                  final isSelected = child.id == selectedSpecialtyId;

                  return Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: GpsSpacing.md,
                    ),
                    child: ListTile(
                      title: Text(childName),
                      selected: isSelected,
                      selectedTileColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer.withValues(alpha: 0.1),
                      selectedColor: Theme.of(context).colorScheme.primary,
                      trailing: isSelected ? const Icon(Icons.check) : null,
                      onTap: () => onSpecialtySelected(child),
                    ),
                  );
                }),
              ],
            );
          },
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: GpsSpacing.xxl),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Padding(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: ErrorState(
          title: 'Erreur',
          message: 'Impossible de charger les spécialités.',
          onRetry: () => ref.read(specialtiesProvider.notifier).refresh(),
        ),
      ),
    );
  }
}
