import 'package:equatable/equatable.dart';
import '/models/edt_model.dart';

class EnUso extends Equatable {
  final List<Edt> edts;

  const EnUso({this.edts = const <Edt>[]});

  @override
  List<Object?> get props => [edts];
}
