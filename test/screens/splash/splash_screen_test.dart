import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pfltibit/screens/screens.dart';

void main() {
  group('SplashScreen', () {
    testWidgets('splash screen ...', (tester) async {
      await tester.pumpWidget(const SplashScreen());
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.text('UTEC Gestion de EDTs'), findsOneWidget);
      expect(find.image(const AssetImage('assets/images/logo_utec.png')),
          findsOneWidget);
      expect(find.image(const AssetImage('assets/images/logo_bit.png')),
          findsOneWidget);
    });
  });
}
