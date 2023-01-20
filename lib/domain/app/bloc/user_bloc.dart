import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserCounter(0)) {
    /// Авторизация по номеру телефона и паролю
    on<LoginWithPasswordRequestedEvent>((event, emit) async {
      const storage = FlutterSecureStorage();

      emit(UserLoginLoadingState());
      try {
        final response = await userRepository.signIn(
            phone: event.phone, password: event.password);
        await storage.write(key: 'accessToken', value: response.token);
        await storage.write(key: 'refreshToken', value: response.refreshToken);
        Sentry.configureScope((scope) {
          scope.setUser(
            SentryUser(id: event.phone)
          );
        });
        emit(UserLoginLoadedState(response));
      } catch (e) {
        emit(UserLoginErrorState(e.toString()));
        emit(UnAuthenticated());
      }
    });

    /// Разлогинивание. Просто удаляется токен
    on<LogoutRequestedEvent>((event, emit) async {
      await userRepository.signOut();
      emit(UnAuthenticated());
    });

    on<IncrementCounter>((event, emit)  {
      emit(UserCounter(1));
    });
  }
}
