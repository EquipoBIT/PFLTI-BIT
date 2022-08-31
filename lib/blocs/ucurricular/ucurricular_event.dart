part of 'ucurricular_bloc.dart';

abstract class UCurricularEvent extends Equatable {
  const UCurricularEvent();

  @override
  List<Object> get props => [];
}

class LoadUCurriculares extends UCurricularEvent {}

class UpdateUCurriculares extends UCurricularEvent {
  final List<UCurricular> ucurriculares;

  UpdateUCurriculares(this.ucurriculares);

  @override
  List<Object> get props => [ucurriculares];
}
