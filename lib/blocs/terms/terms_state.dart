part of 'terms_bloc.dart';

abstract class TermsState extends Equatable {
  const TermsState();

  @override
  List<Object> get props => [];
}

class TermsLoading extends TermsState {}

class TermsLoaded extends TermsState {
  final Usuario user;

  const TermsLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class TermsUnauthenticated extends TermsState {}
