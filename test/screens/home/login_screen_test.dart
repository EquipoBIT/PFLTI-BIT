import 'package:pfltibit/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginScreen', () {
    setUp(() async {});

    Widget makeTestableWidget({required Widget child}) {
      return MaterialApp(home: child);
    }

    testWidgets('Testing LoginScreen', (tester) async {
      GoogleLoginButton page = const GoogleLoginButton();
      await tester.pumpWidget(makeTestableWidget(child: page));
      expect(find.text('LOG IN WITH UTEC'), findsOneWidget);
    });
  });
}
