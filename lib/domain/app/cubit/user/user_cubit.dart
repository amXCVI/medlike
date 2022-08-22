import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:device_info_plus/device_info_plus.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserState());

  final UserRepository userRepository;

  /// Сохраняет в кубит токен из UserStorage
  void saveAccessToken() async {
    String? accessToken =
        await UserSecureStorage.getField(AppConstants.accessToken);
    emit(state.copyWith(token: accessToken));
  }

  /// Сохраняем номер телефона в кубит
  void savePhoneNumber(String phone) {
    emit(state.copyWith(
        userPhoneNumber: phone, authScreen: UserAuthScreens.inputPassword));
  }

  /// Юзер ввел пароль и нажал Go на клавиатуре
  Future<bool> handleSubmitPassword(String password) async {
    if (state.userPhoneNumber != null &&
        state.userPhoneNumber.toString().length == 11) {
      return signIn(state.userPhoneNumber.toString(), password);
    } else {
      emit(state.copyWith(authScreen: UserAuthScreens.inputPhone));
      return Future(() => false);
    }
  }

  /// Авторизация по номеру телефона и паролю
  Future<bool> signIn(String phone, String password) async {
    emit(state.copyWith(
        authStatus: UserAuthStatuses.loadingAuth,
        authScreen: state.authScreen));
    try {
      final response =
          await userRepository.signIn(phone: phone, password: password);
      UserSecureStorage.setField(AppConstants.accessToken, response.token);
      UserSecureStorage.setField(
          AppConstants.refreshToken, response.refreshToken);
      UserSecureStorage.setField(AppConstants.userPhoneNumber, phone);
      emit(state.copyWith(
        authStatus: UserAuthStatuses.successAuth,
        token: response.token,
        refreshToken: response.refreshToken,
      ));
      return true;
    } catch (e) {
      emit(state.copyWith(
        authStatus: UserAuthStatuses.failureAuth,
      ));
      return false;
    }
  }

  /// logout
  void signOut() async {
    UserSecureStorage.setField(AppConstants.isAuth, 'false');
    UserSecureStorage.deleteField(AppConstants.selectedUserId);
    emit(state.copyWith(
      authStatus: UserAuthStatuses.unAuth,
      authScreen: UserAuthScreens.inputPhone,
      userProfiles: null,
      selectedUserId: null,
    ));
  }

  /// Авторизация по биометрии
  /// Просто ставим флаг в кубите и UserStorage
  void signInBiometric() async {
    UserSecureStorage.setField(AppConstants.isAuth, 'true');
    emit(state.copyWith(
      authStatus: UserAuthStatuses.successAuth,
    ));
  }

  /// Получает список профилей из всех МО
  void getUserProfiles(bool isRefresh) async {
    cleanSelectedUserId();
    if (!isRefresh &&
        state.getUserProfileStatus == GetUserProfilesStatusesList.success &&
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
        token: await UserSecureStorage.getField(AppConstants.accessToken),
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

  /// Возвращает короткое имя пользователя по id
  String getShortUserName(String userId) {
    UserProfile userProfile =
        state.userProfiles!.firstWhere((element) => element.id == userId);
    return '${userProfile.firstName} ${userProfile.lastName?[0]}.';
  }

  /// Сбрасывает id выбранного профиля
  //? Опасная штука, чел может сбросить id, а новый не выбрать. И будем мы страдать
  //? и искать, где бы взять id для кучи запросов
  void cleanSelectedUserId() {
    emit(state.copyWith(
      selectedUserId: '',
    ));
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
      emit(state.copyWith(authStatus: UserAuthStatuses.successAuth));
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

  /// Сбрасывает старый пароль и задает новый через приложение
  /// (с авторизацией)
  Future<bool> changePassword({
    required String userName,
    required String newPassword,
  }) async {
    emit(state.copyWith(
      changePasswordStatus: ChangePasswordStatuses.loading,
    ));
    try {
      await userRepository.changePassword(
        userName: userName,
        newPassword: newPassword,
      );
      emit(state.copyWith(
        changePasswordStatus: ChangePasswordStatuses.success,
      ));

      Future.delayed(const Duration(seconds: 2), () {
        emit(
          state.copyWith(
            changePasswordStatus: ChangePasswordStatuses.initial,
          ),
        );
      });
      return true;
    } catch (e) {
      emit(state.copyWith(
        changePasswordStatus: ChangePasswordStatuses.failed,
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

  /// Получает список всех пользовательских соглашений.
  /// подписанные и неподписанные
  void getUserAgreements() async {
    emit(state.copyWith(
      getUserAgreementsStatus: GetUserAgreementsStatuses.loading,
    ));
    try {
      List<UserAgreementsModel> response =
          await userRepository.getUserAgreements();
      emit(state.copyWith(
        getUserAgreementsStatus: GetUserAgreementsStatuses.success,
        userAgreementsList: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        getUserAgreementsStatus: GetUserAgreementsStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Получает список всех пользовательских соглашений.
  /// Или конкретный файлик с соглашениями
  void getUserAgreementDocument({
    required int idFile,
    String? typeAgreement,
  }) async {
    emit(state.copyWith(
      getUserAgreementDocumentStatus: GetUserAgreementDocumentStatuses.loading,
    ));
    try {
      UserAgreementDocumentModel response =
          await userRepository.getUserAgreementDocument(idFile: idFile);
      emit(state.copyWith(
        getUserAgreementDocumentStatus:
            GetUserAgreementDocumentStatuses.success,
        userAgreementDocument: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        getUserAgreementDocumentStatus: GetUserAgreementDocumentStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Загрузить аватар пользователя
  Future<void> uploadUserAvatar({
    PlatformFile? file,
    required String userId,
    required String fileName,
  }) async {
    emit(state.copyWith(
      uploadUserAvatarStatus: UploadUserAvatarStatuses.loading,
    ));
    try {
      UserUploadAvatarResponseModel response =
          await userRepository.uploadUserAvatar(
        userId: userId,
        file: file,
      );
      Future.delayed(const Duration(milliseconds: 500), () {
        emit(state.copyWith(
            uploadUserAvatarStatus: UploadUserAvatarStatuses.success,
            userProfiles: state.userProfiles
                ?.map((e) =>
                    e.id == userId ? e.copyWith(avatar: response.result) : e)
                .toList()));
      });
    } catch (e) {
      emit(state.copyWith(
        uploadUserAvatarStatus: UploadUserAvatarStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Удалить профиль пользователя
  Future<void> deleteUserAccount({
    String? userId,
    String techInfo = '',
  }) async {
    emit(state.copyWith(
      deletingUserAccountStatus: DeletingUserAccountStatuses.loading,
    ));
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String techInfo = '';
    UserProfile? selectedUser =
        state.selectedUserId == null || state.selectedUserId!.isEmpty
            ? state.userProfiles![0]
            : state.userProfiles
                ?.firstWhere((element) => element.id == state.selectedUserId);
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      techInfo = 'Устройство: ${androidInfo.brand} ${androidInfo.model}\n'
          'Версия Android: ${androidInfo.version.codename}, SDK: ${androidInfo.version.sdkInt}, security path: ${androidInfo.version.securityPatch}\n'
          'ФИО пользлвателя: ${selectedUser!.firstName} ${selectedUser.middleName} ${selectedUser.lastName}\n'
          'Телефон пользователя: ${state.userPhoneNumber}\n'
          'Окружение: ${ApiConstants.baseUrl}\n'
          'Клиника: \n'
          'Идентификация бэка: \n';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      techInfo = 'Устройство: ${iosInfo.name}\n'
          'Версия ${iosInfo.systemName} ${iosInfo.systemVersion}\n'
          'ФИО пользлвателя: ${selectedUser!.firstName} ${selectedUser.middleName} ${selectedUser.lastName}\n'
          'Телефон пользователя: ${state.userPhoneNumber}\n'
          'Окружение: ${ApiConstants.baseUrl}\n'
          'Клиника: \n'
          'Идентификация бэка: \n';
    }

    try {
      await userRepository.deleteAccount(
        userId: userId,
        techInfo: techInfo + '\n',
      );
      emit(state.copyWith(
        deletingUserAccountStatus: DeletingUserAccountStatuses.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        deletingUserAccountStatus: DeletingUserAccountStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Получить список всех соглашений пользователя (с которыми он согласился и не согласился)
  /// После успешной авторизации
  Future<List<UserAgreementItemModel>> getAllUserAgreements() async {
    emit(state.copyWith(
      getAllUserAgreementsStatus: GetAllUserAgreementsStatuses.loading,
    ));
    try {
      List<UserAgreementItemModel> response =
          await userRepository.getUserAllAgreements();
      emit(state.copyWith(
        getAllUserAgreementsStatus: GetAllUserAgreementsStatuses.success,
      ));
      return response;
    } catch (e) {
      emit(state.copyWith(
        getAllUserAgreementsStatus: GetAllUserAgreementsStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Проверить согласие пользователя
  /// После успешной авторизации
  Future<bool> checkUserAgreements() async {
    emit(state.copyWith(
      getAllUserAgreementsStatus: GetAllUserAgreementsStatuses.loading,
    ));
    try {
      List<UserAgreementItemModel> response =
          await userRepository.getUserAllAgreements();
      UserAgreementItemModel actualUserAgreement = response.firstWhere(
          (element) => element.id == AppConstants.actualUserAgreement);
      emit(state.copyWith(
        getAllUserAgreementsStatus: GetAllUserAgreementsStatuses.success,
      ));

      if (actualUserAgreement != null && actualUserAgreement.accepted) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      emit(state.copyWith(
        getAllUserAgreementsStatus: GetAllUserAgreementsStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Подтвердить согласие пользователя
  Future<void> acceptedAgreements({
    required int agreementId,
  }) async {
    emit(state.copyWith(
      acceptedAgreementsStatus: AcceptedAgreementsStatuses.loading,
    ));
    try {
      await userRepository.acceptedAgreement(agreementId: agreementId);
      emit(state.copyWith(
        acceptedAgreementsStatus: AcceptedAgreementsStatuses.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        acceptedAgreementsStatus: AcceptedAgreementsStatuses.failed,
      ));
      rethrow;
    }
  }

  Future<void> sendEmailToSupport({
    required String email,
    required String subject,
    required String message,
    List<File>? files,
  }) async {
    emit(state.copyWith(
      sendingEmailToSupportStatus: SendingEmailToSupportStatuses.loading,
    ));

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String techInfo = '';
    UserProfile? selectedUser =
        state.selectedUserId == null || state.selectedUserId!.isEmpty
            ? state.userProfiles![0]
            : state.userProfiles
                ?.firstWhere((element) => element.id == state.selectedUserId);
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      techInfo = 'Устройство: ${androidInfo.brand} ${androidInfo.model}\n'
          'Версия Android: ${androidInfo.version.codename}, SDK: ${androidInfo.version.sdkInt}, security path: ${androidInfo.version.securityPatch}\n'
          'ФИО пользлвателя: ${selectedUser!.firstName} ${selectedUser.middleName} ${selectedUser.lastName}\n'
          'Телефон пользователя: ${state.userPhoneNumber}\n'
          'Окружение: ${ApiConstants.baseUrl}\n'
          'Клиника: \n'
          'Идентификация бэка: \n';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      techInfo = 'Устройство: ${iosInfo.name}\n'
          'Версия ${iosInfo.systemName} ${iosInfo.systemVersion}\n'
          'ФИО пользователя: ${selectedUser!.firstName} ${selectedUser.middleName} ${selectedUser.lastName}\n'
          'Телефон пользователя: ${state.userPhoneNumber}\n'
          'Окружение: ${ApiConstants.baseUrl}\n'
          'Клиника: \n'
          'Идентификация бэка: \n';
    }

    try {
      await userRepository.sendEmail(
        email: email,
        subject: subject,
        message: message,
        techInfo: techInfo,
        personFio:
            '${selectedUser!.firstName} ${selectedUser.middleName} ${selectedUser.lastName}',
        personPhone: '${state.userPhoneNumber}',
        files: files,
      );
      emit(state.copyWith(
        sendingEmailToSupportStatus: SendingEmailToSupportStatuses.success,
      ));
      AppToast.showAppToast(
          msg: 'Ваше обращение успешно доставлено. Ожидайте ответ');
    } catch (e) {
      emit(state.copyWith(
        sendingEmailToSupportStatus: SendingEmailToSupportStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Отправить сообщение в техподдержку от неавторизованного пользователя
  Future<void> sendUnauthEmailToSupport({
    required String email,
    required String message,
  }) async {
    emit(state.copyWith(
      sendingEmailToSupportStatus: SendingEmailToSupportStatuses.loading,
    ));

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String techInfo = '';

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      techInfo = 'Устройство: ${androidInfo.brand} ${androidInfo.model}\n'
          'Версия Android: ${androidInfo.version.codename}, SDK: ${androidInfo.version.sdkInt}, security path: ${androidInfo.version.securityPatch}\n'
          'Пользователь не авторизован\n'
          'Телефон пользователя: ${state.userPhoneNumber ?? 'Не обнаружен'}\n'
          'Окружение: ${ApiConstants.baseUrl}\n';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      techInfo = 'Устройство: ${iosInfo.name}\n'
          'Версия ${iosInfo.systemName} ${iosInfo.systemVersion}\n'
          'Пользователь не авторизован\n'
          'Телефон пользователя: ${state.userPhoneNumber ?? 'Не обнаружен'}\n'
          'Окружение: ${ApiConstants.baseUrl}\n';
    }

    try {
      await userRepository.sendUnauthEmail(
        email: email,
        message: message,
        subject: '',
        techInfo: techInfo,
        personFio: 'Пользователь не авторизован',
        personPhone: '${state.userPhoneNumber}',
      );
      emit(state.copyWith(
        sendingEmailToSupportStatus: SendingEmailToSupportStatuses.success,
      ));
      AppToast.showAppToast(
          msg: 'Ваше обращение успешно доставлено. Ожидайте ответ');
    } catch (e) {
      emit(state.copyWith(
        sendingEmailToSupportStatus: SendingEmailToSupportStatuses.failed,
      ));
      rethrow;
    }
  }
}
