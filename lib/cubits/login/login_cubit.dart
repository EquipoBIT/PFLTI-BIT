import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '/repositories/repositories.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.logInWithGoogle();
      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
