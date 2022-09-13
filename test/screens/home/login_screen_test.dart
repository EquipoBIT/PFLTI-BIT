import 'package:pfltibit/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginScreen', () {
    setUp(() {});

    Widget makeTestableWidget({required Widget child}) {
      return MaterialApp(home: child);
    }

    testWidgets('Testing LoginScreen', (tester) async {
      LoginPage page = const LoginPage();
      await tester.pumpWidget(makeTestableWidget(child: page));
      expect(find.text('LOG IN WITH UTEC'), findsOneWidget);
    });
  });
}
