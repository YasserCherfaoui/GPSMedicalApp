import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/booking/providers/booking_draft.provider.dart';
import 'package:patient_app/features/booking/widgets/slot_lock_banner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _BannerHarness extends ConsumerStatefulWidget {
  const _BannerHarness({
    required this.onExpired,
    this.lockDuration,
    this.expiredLock = false,
  });

  final Duration? lockDuration;
  final bool expiredLock;
  final VoidCallback onExpired;

  @override
  ConsumerState<_BannerHarness> createState() => _BannerHarnessState();
}

class _BannerHarnessState extends ConsumerState<_BannerHarness> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookingDraftProvider.notifier).state = BookingDraftState(
        doctorId: 'doc-banner-1',
        selectedSlot: AvailabilitySlot(
          (b) => b
            ..startAt = DateTime.utc(2026, 6, 10, 9)
            ..endAt = DateTime.utc(2026, 6, 10, 9, 30)
            ..mode = AvailabilitySlotModeEnum.inPerson
            ..slotLockToken = 'lock-banner',
        ),
        slotLockExpiresAt: widget.expiredLock
            ? DateTime.now().subtract(const Duration(seconds: 1))
            : DateTime.now().add(widget.lockDuration!),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlotLockBanner(onExpired: widget.onExpired);
  }
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Widget wrap({
    required VoidCallback onExpired,
    Duration? lockDuration,
    bool expiredLock = false,
  }) {
    return ProviderScope(
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Scaffold(
          body: _BannerHarness(
            lockDuration: lockDuration,
            expiredLock: expiredLock,
            onExpired: onExpired,
          ),
        ),
      ),
    );
  }

  testWidgets('is hidden when no active slot lock is held', (tester) async {
    var expired = false;

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: GpsTheme.light(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('fr'),
          home: Scaffold(
            body: SlotLockBanner(onExpired: () => expired = true),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.textContaining('expire dans'), findsNothing);
    expect(expired, isFalse);
  });

  testWidgets('shows mm:ss countdown while lock is active', (tester) async {
    await tester.pumpWidget(
      wrap(
        lockDuration: const Duration(minutes: 4, seconds: 7),
        onExpired: () {},
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.textContaining('04:0'), findsOneWidget);
    expect(find.textContaining('expire dans'), findsOneWidget);
  });

  testWidgets('uses warning colours below 60 seconds', (tester) async {
    await tester.pumpWidget(
      wrap(
        lockDuration: const Duration(seconds: 45),
        onExpired: () {},
      ),
    );
    await tester.pump();
    await tester.pump();

    final banner = find.byType(SlotLockBanner);
    final materialFinder = find.descendant(
      of: banner,
      matching: find.byType(Material),
    );
    final material = tester.widget<Material>(materialFinder);
    final colorScheme = Theme.of(
      tester.element(banner),
    ).colorScheme;

    expect(material.color, colorScheme.errorContainer);
  });

  testWidgets('calls onExpired once when the lock has elapsed', (tester) async {
    var expiredCount = 0;

    await tester.pumpWidget(
      wrap(
        expiredLock: true,
        onExpired: () => expiredCount++,
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(expiredCount, 1);
    expect(find.textContaining('expire dans'), findsNothing);
  });
}
