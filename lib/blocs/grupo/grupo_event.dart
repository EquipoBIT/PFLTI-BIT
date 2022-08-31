part of 'grupo_bloc.dart';

abstract class GrupoEvent extends Equatable {
  const GrupoEvent();

  @override
  List<Object> get props => [];
}

class LoadGrupos extends GrupoEvent {}

class UpdateGrupos extends GrupoEvent {
  final List<Grupo> grupos;

  UpdateGrupos(this.grupos);

  @override
  List<Object> get props => [grupos];
}
