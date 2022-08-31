part of 'grupo_bloc.dart';

abstract class GrupoState extends Equatable {
  const GrupoState();

  @override
  List<Object> get props => [];
}

class GrupoLoading extends GrupoState {}

class GrupoLoaded extends GrupoState {
  final List<Grupo> grupos;

  GrupoLoaded({this.grupos = const <Grupo>[]});

  @override
  List<Object> get props => [grupos];
}
