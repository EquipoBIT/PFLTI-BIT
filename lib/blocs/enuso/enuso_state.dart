part of 'enuso_bloc.dart';

@immutable
abstract class EnUsoState extends Equatable {
  const EnUsoState();
}

class EnUsoLoading extends EnUsoState {
  @override
  List<Object> get props => [];
}

class EnUsoLoaded extends EnUsoState {
  final EnUso enuso;

  const EnUsoLoaded({this.enuso = const EnUso()});

  @override
  List<Object> get props => [enuso];
}

class EnUsoError extends EnUsoState {
  @override
  List<Object> get props => [];
}
