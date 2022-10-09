import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '/blocs/blocs.dart';
import '/models/models.dart';
import '/repositories/repositories.dart';

part 'terms_event.dart';
part 'terms_state.dart';

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  final AuthBloc _authBloc;
  final UserRepository _userRepository;
  StreamSubscription? _authSubscription;

  TermsBloc({
    required AuthBloc authBloc,
    required UserRepository userRepository,
  })  : _authBloc = authBloc,
        _userRepository = userRepository,
        super(TermsLoading()) {
    on<LoadTerms>(_onLoadTerms);
    on<UpdateTerms>(_onUpdateTerms);

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.user is AuthUserChanged) {
        if (state.user != null) {
          add(LoadTerms(state.authUser));
        }
      }
    });
  }

  void _onLoadTerms(
    LoadTerms event,
    Emitter<TermsState> emit,
  ) {
    if (event.authUser != null) {
      _userRepository.getUser(event.authUser!.uid).listen((user) {
        add(
          UpdateTerms(user: user),
        );
      });
    } else {
      emit(TermsUnauthenticated());
    }
  }

  void _onUpdateTerms(
    UpdateTerms event,
    Emitter<TermsState> emit,
  ) {
    emit(TermsLoaded(user: event.user));
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}
