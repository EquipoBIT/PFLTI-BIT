part of 'edt_bloc.dart';

abstract class EdtState extends Equatable {
  const EdtState();

  @override
  List<Object> get props => [];
}

class EdtLoading extends EdtState {}

class EdtLoaded extends EdtState {
  final List<Edt> edts;

  EdtLoaded({this.edts = const <Edt>[]});

  @override
  List<Object> get props => [edts];
}
