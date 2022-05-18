part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class Loading extends UserState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends UserState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends UserState {
  @override
  List<Object?> get props => [];
}

class AuthError extends UserState {
  final String error;

  AuthError(this.error);

  @override
  List<Object?> get props => [];
}


