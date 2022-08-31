part of 'edt_bloc.dart';

abstract class EdtEvent extends Equatable {
  const EdtEvent();

  @override
  List<Object> get props => [];
}

class LoadEdts extends EdtEvent {}

class UpdateEdts extends EdtEvent {
  final List<Edt> edts;

  UpdateEdts(this.edts);

  @override
  List<Object> get props => [edts];
}
