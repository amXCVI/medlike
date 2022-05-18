part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInWithPasswordRequested extends UserEvent {
  late final String phone;
  late final String password;

  SignInWithPasswordRequested(this.phone, this.password);
}

class SignOutRequested extends UserEvent {}


