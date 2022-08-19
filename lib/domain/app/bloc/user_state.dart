part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class UserLoginLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoginLoadedState extends UserState {
  final AuthTokenResponse authTokens;

  UserLoginLoadedState(this.authTokens);

  @override
  List<Object?> get props => [authTokens];
}

class UnAuthenticated extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoginErrorState extends UserState {
  final String error;

  UserLoginErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class UserCounter extends UserState {
  final int counter;

  UserCounter(this.counter);

  @override
  List<Object?> get props => [counter];
}


