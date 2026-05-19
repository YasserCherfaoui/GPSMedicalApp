import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

Widget _wrap(Widget child, {ThemeData? theme}) {
  return MaterialApp(
    theme: theme ?? GpsTheme.light(),
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
}
