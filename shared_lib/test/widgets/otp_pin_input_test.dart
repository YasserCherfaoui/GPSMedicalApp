import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  testWidgets('renders six digit fields', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OtpPinInput(onChanged: _noop, onCompleted: _noop),
        ),
      ),
    );

    expect(find.byType(TextField), findsNWidgets(6));
  });
}

void _noop(String _) {}
