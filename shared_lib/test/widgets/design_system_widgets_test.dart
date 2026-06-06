import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

Widget _wrap(Widget child, {ThemeData? theme, Locale locale = const Locale('fr')}) {
  return MaterialApp(
    theme: theme ?? GpsTheme.light(),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: locale,
    home: Scaffold(body: SingleChildScrollView(child: child)),
  );
}

void main() {
  group('PrimaryButton', () {
    testWidgets('renders label and fires onPressed', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          PrimaryButton(label: 'Continuer', onPressed: () => tapped = true),
        ),
      );

      expect(find.text('Continuer'), findsOneWidget);
      await tester.tap(find.text('Continuer'));
      expect(tapped, isTrue);
    });
  });

  group('SecondaryButton', () {
    testWidgets('renders outlined label', (tester) async {
      await tester.pumpWidget(
        _wrap(SecondaryButton(label: 'Annuler', onPressed: () {})),
      );
      expect(find.text('Annuler'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });
  });

  group('GpsTextField', () {
    testWidgets('shows label and hint', (tester) async {
      await tester.pumpWidget(
        _wrap(const GpsTextField(label: 'NIN', hint: '18 chiffres')),
      );

      expect(find.text('NIN'), findsOneWidget);
      expect(find.text('18 chiffres'), findsOneWidget);
    });
  });

  group('GpsCard', () {
    testWidgets('renders child content', (tester) async {
      await tester.pumpWidget(
        _wrap(const GpsCard(child: Text('Contenu carte'))),
      );
      expect(find.text('Contenu carte'), findsOneWidget);
    });
  });

  group('GpsModal', () {
    testWidgets('shows dialog with actions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: GpsTheme.light(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('fr'),
          home: Builder(
            builder: (context) => Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  GpsModal.show<void>(
                    context: context,
                    title: 'Titre',
                    message: 'Message',
                    primaryActionLabel: 'OK',
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      expect(find.text('Titre'), findsOneWidget);
      expect(find.text('Message'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
    });
  });

  group('GpsBadge', () {
    testWidgets('renders chip label', (tester) async {
      await tester.pumpWidget(_wrap(const GpsBadge(label: 'Urgent')));
      expect(find.text('Urgent'), findsOneWidget);
      expect(find.byType(Chip), findsOneWidget);
    });
  });

  group('LoadingSkeleton', () {
    testWidgets('renders placeholder box', (tester) async {
      await tester.pumpWidget(_wrap(const LoadingSkeleton(height: 40)));
      expect(find.byType(LoadingSkeleton), findsOneWidget);
    });
  });

  group('LoadingShimmer', () {
    testWidgets('is an alias for LoadingSkeleton', (tester) async {
      await tester.pumpWidget(_wrap(const LoadingShimmer.card()));
      expect(find.byType(LoadingSkeleton), findsOneWidget);
    });
  });

  group('EmptyState', () {
    testWidgets('renders title and action', (tester) async {
      await tester.pumpWidget(
        _wrap(
          EmptyState(
            title: 'Vide',
            message: 'Rien ici',
            actionLabel: 'Ajouter',
            onAction: () {},
          ),
        ),
      );

      expect(find.text('Vide'), findsOneWidget);
      expect(find.text('Ajouter'), findsOneWidget);
    });
  });

  group('ErrorState', () {
    testWidgets('renders error and retry', (tester) async {
      var retried = false;
      await tester.pumpWidget(
        _wrap(ErrorState(title: 'Erreur', onRetry: () => retried = true)),
      );

      expect(find.text('Erreur'), findsOneWidget);
      await tester.tap(find.text('Réessayer'));
      expect(retried, isTrue);
    });
  });

  group('GpsTheme', () {
    test('light and dark themes use brand primary', () {
      expect(GpsTheme.light().colorScheme.primary, GpsColors.primary);
      expect(GpsTheme.dark().brightness, Brightness.dark);
    });
  });

  group('SpecialtyChip', () {
    testWidgets('renders specialty label', (tester) async {
      await tester.pumpWidget(_wrap(const SpecialtyChip(label: 'Pédiatrie')));
      expect(find.text('Pédiatrie'), findsOneWidget);
    });
  });

  group('RatingDisplay', () {
    testWidgets('renders rating average and count', (tester) async {
      await tester.pumpWidget(
        _wrap(const RatingDisplay(rating: 4.8, count: 12)),
      );
      expect(find.text('4.8'), findsOneWidget);
      expect(find.text('(12)'), findsOneWidget);
    });
  });

  group('DoctorCard', () {
    testWidgets('list variant renders doctor details and handles actions', (
      tester,
    ) async {
      var booked = false;
      var favorited = false;
      await tester.pumpWidget(
        _wrap(
          DoctorCard(
            name: 'Dr. Karim Benali',
            specialty: 'Cardiologie',
            rating: 4.9,
            reviewCount: 42,
            city: 'Alger',
            fee: 2500,
            isVerified: true,
            offersTelehealth: true,
            matchPercentage: 95,
            onBookPressed: () => booked = true,
            onFavoritePressed: () => favorited = true,
          ),
        ),
      );

      expect(find.text('Dr. Karim Benali'), findsOneWidget);
      expect(find.text('Cardiologie'), findsOneWidget);
      expect(find.text('95% de compatibilité'), findsOneWidget);
      expect(find.text('2500 DZD'), findsOneWidget);
      expect(find.text('Téléconsultation'), findsOneWidget);
      expect(find.byIcon(Icons.verified), findsOneWidget);

      await tester.tap(find.text('Prendre RDV'));
      expect(booked, isTrue);

      await tester.tap(find.byIcon(Icons.favorite_border));
      expect(favorited, isTrue);
    });

    testWidgets('list variant renders specialty chips', (tester) async {
      await tester.pumpWidget(
        _wrap(
          DoctorCard(
            name: 'Dr. A',
            specialty: 'Cardiologie',
            specialtyChips: const ['Cardiologie', 'Médecine interne'],
            rating: 4.0,
            reviewCount: 1,
            city: 'Alger',
            fee: 2000,
            onBookPressed: () {},
          ),
        ),
      );

      expect(find.text('Cardiologie'), findsOneWidget);
      expect(find.text('Médecine interne'), findsOneWidget);
    });

    testWidgets('map variant renders compact card without favorite', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          DoctorCard(
            variant: DoctorCardVariant.map,
            name: 'Dr. Amira S.',
            specialty: 'Cardiologie',
            rating: 4.9,
            reviewCount: 12,
            city: 'Alger',
            fee: 2500,
            distanceKm: 2.1,
            isVerified: true,
            matchPercentage: 96,
            onBookPressed: () {},
            onTap: () {},
          ),
        ),
      );

      expect(find.text('Dr. Amira S.'), findsOneWidget);
      expect(find.text('Agréé'), findsOneWidget);
      expect(find.textContaining('Cardiologie • 2.1 km'), findsOneWidget);
      expect(find.text('96% de compatibilité'), findsOneWidget);
      expect(find.text('2500 DZD'), findsNothing);
      expect(find.byIcon(Icons.favorite_border), findsNothing);
    });
  });
}
