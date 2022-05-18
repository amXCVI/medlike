import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medlike/modules/app/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UnAuthenticated()) {

    /// Авторизация по номеру телефона и паролю
    on<SignInWithPasswordRequested>((event, emit) async {
      emit(Loading());
      try {
        await userRepository.signInWithPassword(phone: event.phone, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    /// Разлогинивание. Просто удаляется токен
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await userRepository.deleteToken();
      emit(UnAuthenticated());
    });
  }
}
