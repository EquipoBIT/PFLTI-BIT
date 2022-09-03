import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfltibit/blocs/auth/auth_bloc.dart';
import 'package:pfltibit/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pfltibit/repositories/repositories.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('LoginScreen', () {
    late AuthRepository authRepository;

    setUp(() {
      authRepository = MockAuthRepository();
      when(
        () => authRepository.logInWithGoogle(),
      ).thenAnswer((_) async {});
    });

    testWidgets('Testing LoginScreen', (tester) async {
      await tester.pumpWidget(const LoginScreen());
      expect(find.text('LOG IN WITH UTEC'), findsOneWidget);
    });
  });
}
