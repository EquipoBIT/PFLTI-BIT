part of 'terms_bloc.dart';

abstract class TermsEvent extends Equatable {
  const TermsEvent();

  @override
  List<Object?> get props => [];
}

class LoadTerms extends TermsEvent {
  final auth.User? authUser;

  const LoadTerms(this.authUser);

  @override
  List<Object?> get props => [authUser];
}

class UpdateTerms extends TermsEvent {
  final Usuario user;

  const UpdateTerms({required this.user});

  @override
  List<Object?> get props => [user];
}
