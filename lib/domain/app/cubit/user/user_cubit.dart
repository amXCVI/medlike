import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

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

  /// Авторизация по номеру телефона и паролю
  void signIn(String phone, String password) async {
    emit(state.copyWith(
        authStatus: UserAuthStatuses.loadingAuth,
        authScreen: state.authScreen));
    try {
      final response =
          await userRepository.signIn(phone: phone, password: password);
      UserSecureStorage.setField(AppConstants().accessToken, response.token);
      UserSecureStorage.setField(
          AppConstants().refreshToken, response.refreshToken);
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

  /// Получает список профилей из всех МО
  void getUserProfiles() async {
    if (state.getUserProfileStatus == GetUserProfilesStatusesList.success &&
        state.userProfiles != null) {
      emit(state.copyWith(
        authStatus: state.authStatus,
        authScreen: state.authScreen,
        getUserProfileStatus: GetUserProfilesStatusesList.success,
        userProfiles: state.userProfiles,
        selectedUserId: state.selectedUserId,
      ));
      return;
    }
    emit(state.copyWith(
      authStatus: state.authStatus,
      authScreen: state.authScreen,
      getUserProfileStatus: GetUserProfilesStatusesList.loading,
    ));
    try {
      final currentSelectedUserId =
          await UserSecureStorage.getField(AppConstants().selectedUserId);
      final List<UserProfile> response;
      response = await userRepository.getProfiles();
      emit(state.copyWith(
        authStatus: state.authStatus,
        authScreen: state.authScreen,
        getUserProfileStatus: GetUserProfilesStatusesList.success,
        userProfiles: response,
        selectedUserId: currentSelectedUserId != null
            ? currentSelectedUserId.toString()
            : response[0].id.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        authStatus: state.authStatus,
        authScreen: state.authScreen,
        userProfiles: state.userProfiles,
        getUserProfileStatus: GetUserProfilesStatusesList.failure,
      ));
    }
  }

  /// Сохраняет id выбранного профиля
  void setSelectedUserId(String userId) {
    emit(state.copyWith(
      authStatus: state.authStatus,
      authScreen: state.authScreen,
      selectedUserId: userId,
      userProfiles: state.userProfiles,
      getUserProfileStatus: state.getUserProfileStatus,
    ));
    UserSecureStorage.setField(AppConstants().selectedUserId, userId);
  }
}
