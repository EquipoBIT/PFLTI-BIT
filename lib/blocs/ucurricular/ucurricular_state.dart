part of 'ucurricular_bloc.dart';

abstract class UCurricularState extends Equatable {
  const UCurricularState();

  @override
  List<Object> get props => [];
}

class UCurricularLoading extends UCurricularState {}

class UCurricularLoaded extends UCurricularState {
  final List<UCurricular> ucurriculares;

  UCurricularLoaded({this.ucurriculares = const <UCurricular>[]});

  @override
  List<Object> get props => [ucurriculares];
}
