import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kemayur_uas_pemmob/main.dart';

void main() {
  testWidgets('Login screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(KemaYuRApp());

    // Verify that we start on the login screen.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Enter the email and password.
    await tester.enterText(find.byType(TextField).at(0), 'user');
    await tester.enterText(find.byType(TextField).at(1), 'password');

    // Tap the login button and trigger a frame.
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify that we are now on the home screen.
    expect(find.text('KemaYuR'), findsOneWidget);
    expect(find.text('Sayur'), findsOneWidget);
    expect(find.text('Paket Siap Masak'), findsOneWidget);
  });
}
