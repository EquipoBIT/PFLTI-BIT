part of 'enuso_bloc.dart';

@immutable
abstract class EnUsoEvent extends Equatable {
  const EnUsoEvent();
}

class StartEnUso extends EnUsoEvent {
  @override
  List<Object> get props => [];
}

class AddEdtToEnUso extends EnUsoEvent {
  final Edt edt;

  const AddEdtToEnUso(this.edt);

  @override
  List<Object> get props => [edt];
}

class RemoveEdtFromEnUso extends EnUsoEvent {
  final Edt edt;

  const RemoveEdtFromEnUso(this.edt);

  @override
  List<Object> get props => [edt];
}
