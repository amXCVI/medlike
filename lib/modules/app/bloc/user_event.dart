part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginWithPasswordRequestedEvent extends UserEvent {
  late final String phone;
  late final String password;

  LoginWithPasswordRequestedEvent(this.phone, this.password);
}

class LogoutRequestedEvent extends UserEvent {}

class IncrementCounter extends UserEvent {}


