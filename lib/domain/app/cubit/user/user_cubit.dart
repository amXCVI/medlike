import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medlike/data/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserState());

  final UserRepository userRepository;

  /// Сохраняем номер телефона в кубит
  void savePhoneNumber(String phone) {
    emit(state.copyWith(
        authStatus: state.authStatus,
        userPhoneNumber: phone,
        authScreen: UserAuthScreens.inputPassword));
  }

  /// Юзер ввел пароль и нажал Go на клавиатуре
  void handleSubmitPassword(String password) {
    if (state.userPhoneNumber != null &&
        state.userPhoneNumber.toString().length == 11) {
      signIn(state.userPhoneNumber.toString(), password);
    } else {
      emit(state.copyWith(
          authStatus: state.authStatus,
          authScreen: UserAuthScreens.inputPhone));
    }
  }

  void signIn(String phone, String password) async {
    const storage = FlutterSecureStorage();

    emit(state.copyWith(
        authStatus: UserAuthStatuses.loadingAuth,
        authScreen: state.authScreen));
    try {
      final response =
          await userRepository.signIn(phone: phone, password: password);
      await storage.write(key: 'accessToken', value: response.token);
      await storage.write(key: 'refreshToken', value: response.refreshToken);
      emit(state.copyWith(
          authStatus: UserAuthStatuses.successAuth,
          token: response.token,
          refreshToken: response.refreshToken,
          authScreen: state.authScreen));
    } catch (e) {
      emit(state.copyWith(
          authStatus: UserAuthStatuses.failureAuth,
          authScreen: state.authScreen));
    }
  }

  void signOut() async {
    const storage = FlutterSecureStorage();

    await storage.delete(key: 'accessToken');
    await storage.delete(key: 'refreshToken');
    emit(state.copyWith(
        authStatus: UserAuthStatuses.unAuth,
        authScreen: UserAuthScreens.inputPhone));
  }
}
