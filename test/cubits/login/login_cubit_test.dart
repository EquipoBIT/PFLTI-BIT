import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pfltibit/repositories/repositories.dart';
import 'package:pfltibit/cubits/cubits.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('LoginCubit', () {
    late AuthRepository authRepository;

    setUp(() {
      authRepository = MockAuthRepository();
      when(
        () => authRepository.logInWithGoogle(),
      ).thenAnswer((_) async {});
    });

    test('initial state is LoginState', () {
      expect(LoginCubit(authRepository: authRepository).state,
          LoginState.initial());
    });

    group('logInWithGoogle', () {
      blocTest<LoginCubit, LoginState>(
        'calls logInWithGoogle',
        build: () => LoginCubit(authRepository: authRepository),
        act: (cubit) => cubit.logInWithGoogle(),
        verify: (_) {
          verify(() => authRepository.logInWithGoogle()).called(1);
        },
      );

      blocTest<LoginCubit, LoginState>(
        'emits [LoginStatus.submitting, LoginStatus.success] '
        'when logInWithGoogle succeeds',
        build: () => LoginCubit(authRepository: authRepository),
        act: (cubit) => cubit.logInWithGoogle(),
        expect: () => const <LoginState>[
          LoginState(
            email: '',
            password: '',
            status: LoginStatus.submitting,
            user: null,
          ),
          LoginState(
            email: '',
            password: '',
            status: LoginStatus.success,
            user: null,
          ),
        ],
      );

      blocTest<LoginCubit, LoginState>(
        'emits [LoginStatus.submitting, LoginStatus.error] '
        'when logInWithGoogle fails',
        setUp: () {
          when(
            () => authRepository.logInWithGoogle(),
          ).thenThrow(Exception('oops'));
        },
        build: () => LoginCubit(authRepository: authRepository),
        act: (cubit) => cubit.logInWithGoogle(),
        expect: () => const <LoginState>[
          LoginState(
            email: '',
            password: '',
            status: LoginStatus.submitting,
            user: null,
          ),
          LoginState(
            email: '',
            password: '',
            status: LoginStatus.error,
            user: null,
          ),
        ],
      );
    });
  });
}
