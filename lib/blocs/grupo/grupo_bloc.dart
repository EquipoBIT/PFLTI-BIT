import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';
import '/repositories/grupo/grupo_repository.dart';

part 'grupo_event.dart';
part 'grupo_state.dart';

class GrupoBloc extends Bloc<GrupoEvent, GrupoState> {
  final GrupoRepository _grupoRepository;
  StreamSubscription? _grupoSubscription;

  GrupoBloc({required GrupoRepository grupoRepository})
      : _grupoRepository = grupoRepository,
        super(GrupoLoading()) {
    on<LoadGrupos>(_onLoadGrupos);
    on<UpdateGrupos>(_onUpdateGrupos);
  }

  void _onLoadGrupos(
    LoadGrupos event,
    Emitter<GrupoState> emit,
  ) {
    _grupoSubscription?.cancel();
    _grupoSubscription = _grupoRepository.getAllGrupos().listen(
          (grupos) => add(
            UpdateGrupos(grupos),
          ),
        );
  }

  void _onUpdateGrupos(
    UpdateGrupos event,
    Emitter<GrupoState> emit,
  ) {
    emit(
      GrupoLoaded(grupos: event.grupos),
    );
  }
}
