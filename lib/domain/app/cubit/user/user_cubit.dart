import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserState());

  final UserRepository userRepository;

  /// Сохраняем номер телефона в кубит
  void savePhoneNumber(String phone) {
    emit(state.copyWith(
        userPhoneNumber: phone, authScreen: UserAuthScreens.inputPassword));
  }

  /// Юзер ввел пароль и нажал Go на клавиатуре
  void handleSubmitPassword(String password) {
    if (state.userPhoneNumber != null &&
        state.userPhoneNumber.toString().length == 11) {
      signIn(state.userPhoneNumber.toString(), password);
    } else {
      emit(state.copyWith(authScreen: UserAuthScreens.inputPhone));
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
      UserSecureStorage.setField(AppConstants.accessToken, response.token);
      UserSecureStorage.setField(
          AppConstants.refreshToken, response.refreshToken);
      emit(state.copyWith(
        authStatus: UserAuthStatuses.successAuth,
        token: response.token,
        refreshToken: response.refreshToken,
      ));
    } catch (e) {
      emit(state.copyWith(
        authStatus: UserAuthStatuses.failureAuth,
      ));
    }
  }

  void signOut() async {
    UserSecureStorage.setField(AppConstants.isAuth, 'false');
    emit(state.copyWith(
      authStatus: UserAuthStatuses.unAuth,
      authScreen: UserAuthScreens.inputPhone,
    ));
  }

  /// Получает список профилей из всех МО
  void getUserProfiles() async {
    if (state.getUserProfileStatus == GetUserProfilesStatusesList.success &&
        state.userProfiles != null) {
      return;
    }
    emit(state.copyWith(
      getUserProfileStatus: GetUserProfilesStatusesList.loading,
    ));
    try {
      final currentSelectedUserId =
          await UserSecureStorage.getField(AppConstants.selectedUserId);
      final List<UserProfile> response;
      response = await userRepository.getProfiles();
      emit(state.copyWith(
        getUserProfileStatus: GetUserProfilesStatusesList.success,
        userProfiles: response,
        selectedUserId: currentSelectedUserId?.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        getUserProfileStatus: GetUserProfilesStatusesList.failure,
      ));
    }
  }

  /// Сохраняет id выбранного профиля
  void setSelectedUserId(String userId) {
    emit(state.copyWith(
      selectedUserId: userId,
    ));
    UserSecureStorage.setField(AppConstants.selectedUserId, userId);
  }

  String getShortUserName(String userId) {
    UserProfile userProfile =
        state.userProfiles!.firstWhere((element) => element.id == userId);
    return '${userProfile.firstName} ${userProfile.lastName?[0]}.';
  }

  /// Сохраняет хэш созданного при авторизации пин-кода
  void setPinCodeToStorage(List<int> pinCode) {
    UserSecureStorage.setField(
        AppConstants.authPinCode, sha256.convert(pinCode).toString());
    UserSecureStorage.setField(AppConstants.isSavedPinCodeForAuth, 'true');
    UserSecureStorage.setField(AppConstants.isAuth, 'true');
  }

  /// Сравнить хэш введенного кода с ъэшем сохраненного
  Future<bool> checkPinCodeToStorage(List<int> pinCode) async {
    String sha256savedCode =
        '${await UserSecureStorage.getField(AppConstants.authPinCode)}';
    if (sha256savedCode == sha256.convert(pinCode).toString()) {
      UserSecureStorage.setField(AppConstants.isAuth, 'true');
      return true;
    } else {
      AppToast.showAppToast(msg: 'Неверный пин-код');
      return false;
    }
  }

  /// Запрашивает смс для сброса пароля
  void getNewSmsForRecoverPassword({required String phoneNumber}) async {
    CheckUserAccountResponse checkUser =
        await checkUserAccount(phoneNumber: phoneNumber);
    if (!checkUser.found) {
      AppToast.showAppToast(
          msg: 'Не найден пользователь с введенным номером телефона');
      return;
    }
    emit(state.copyWith(
      getNewSmsCodeStatus: GetNewSmsCodeStatuses.loading,
    ));
    try {
      await userRepository.getNewSmsCodeRecoverPassword(
          phoneNumber: phoneNumber.isNotEmpty
              ? phoneNumber
              : state.userPhoneNumber as String);
      emit(state.copyWith(
        getNewSmsCodeStatus: GetNewSmsCodeStatuses.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        getNewSmsCodeStatus: GetNewSmsCodeStatuses.failed,
      ));
    }
  }

  /// Проверяет код из смс для сброса пароля
  Future<bool> sendResetPasswordCode(
      {required String phoneNumber, required String smsToken}) async {
    emit(state.copyWith(
      sendingResetPasswordCodeStatus: SendingResetPasswordCodeStatuses.loading,
    ));
    try {
      await userRepository.sendResetPasswordCode(
        phoneNumber: phoneNumber,
        smsToken: smsToken,
      );
      emit(state.copyWith(
        sendingResetPasswordCodeStatus:
            SendingResetPasswordCodeStatuses.success,
      ));
      return true;
    } catch (e) {
      emit(state.copyWith(
        sendingResetPasswordCodeStatus: SendingResetPasswordCodeStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Сбрасывает старый пароль и задает новый
  Future<bool> resetPassword({
    required String phoneNumber,
    required String smsToken,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      AppToast.showAppToast(msg: 'Введенные пароли не совпадают');
      return false;
    }
    emit(state.copyWith(
      resetPasswordStatus: ResetPasswordStatuses.loading,
    ));
    try {
      await userRepository.resetPassword(
        phoneNumber: phoneNumber,
        smsToken: smsToken,
        password: password,
        confirmPassword: confirmPassword,
      );
      emit(state.copyWith(
        resetPasswordStatus: ResetPasswordStatuses.success,
      ));

      Future.delayed(const Duration(seconds: 2), () {
        emit(
          state.copyWith(
            resetPasswordStatus: ResetPasswordStatuses.initial,
          ),
        );
      });
      return true;
    } catch (e) {
      emit(state.copyWith(
        resetPasswordStatus: ResetPasswordStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Проверяет, есть ли пользователь с таким номером телефона
  Future<CheckUserAccountResponse> checkUserAccount(
      {required String phoneNumber}) async {
    emit(state.copyWith(
      checkUserAccountStatus: CheckUserAccountStatuses.loading,
    ));
    try {
      CheckUserAccountResponse response = await userRepository.checkUserAccount(
        phoneNumber: phoneNumber,
      );
      emit(state.copyWith(
        checkUserAccountStatus: CheckUserAccountStatuses.success,
      ));
      return response;
    } catch (e) {
      emit(state.copyWith(
        checkUserAccountStatus: CheckUserAccountStatuses.failed,
      ));
      rethrow;
    }
  }
}
