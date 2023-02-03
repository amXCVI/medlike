import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/error_models/error_models.dart';
import 'package:medlike/data/models/notification_models/notification_models.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/firebase_analitics/firebase_analitics.dart';
import 'package:medlike/utils/notifications/push_notifications_service.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'user_state.dart';

class UserCubit extends MediatorCubit<UserState, UserMediatorEvent> {
  UserCubit(this.userRepository, mediator) : super(UserState(), mediator) {
    mediator.register(this);
  }

  @override
  void receive(String from, UserMediatorEvent event) {
    if (event == UserMediatorEvent.logout) {
      forceLogout();
    } else if (event == UserMediatorEvent.pushNotification) {
      getLastNotReadNotification(true);
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    if (error is DioError &&
        error.message ==
            'CertificateNotVerifiedException: Connection is not secure') {
      AppToast.showAppToast(
          msg:
              'Просроченный ssl-сертификат. Пожалуйста, обратитесь к администратору');
      throw ('Просроченный ssl-сертификат');
    }

    super.onError(error, stacktrace);
  }

  final UserRepository userRepository;

  /// Сохраняет в кубит токен из UserStorage
  void saveAccessToken() async {
    String? accessToken =
        await UserSecureStorage.getField(AppConstants.accessToken);
    emit(state.copyWith(token: accessToken));
  }

  /// Сохраняем номер для последующей проверки
  void tempSavePhoneNumber(String phone) {
    emit(state.copyWith(
      userPhoneNumber: phone
    ));
  }

  /// Обновляем количество секунд до 
  void setTimer(DateTime time) {
    emit(state.copyWith(timerEnd: time));
  }

  /// Сохраняем номер телефона в кубит
  void savePhoneNumber(String phone) {
    emit(state.copyWith(
        authScreen: UserAuthScreens.inputPassword,
        checkUserAccountStatus: CheckUserAccountStatuses.continued,
    ));
    UserSecureStorage.setField(AppConstants.userPhoneNumber, phone);
  }

  void getPhoneNumber() async {
    String? phone = await UserSecureStorage.getField(AppConstants.userPhoneNumber);
    emit(state.copyWith(userPhoneNumber: phone));
  }

  /// Сохраняем номер телефона в кубит
  void cleanPhoneNumber(String phone) {
    emit(state.copyWith(
        checkUserAccountStatus: CheckUserAccountStatuses.loading));
    UserSecureStorage.setField(AppConstants.userPhoneNumber, phone);
  }

  /// Юзер ввел пароль и нажал Go на клавиатуре
  Future<AuthTokenResponseError?> handleSubmitPassword(String password) async {
    if (state.userPhoneNumber != null &&
        state.userPhoneNumber.toString().length == 11) {
      return signIn(state.userPhoneNumber.toString(), password);
    } else {
      emit(state.copyWith(authScreen: UserAuthScreens.inputPhone));
      return Future(() => null);
    }
  }

  /// Авторизация по номеру телефона и паролю
  Future<AuthTokenResponseError?> signIn(String phone, String password) async {
    emit(state.copyWith(
        authStatus: UserAuthStatuses.loadingAuth,
        authScreen: state.authScreen));
    try {
      final response =
          await userRepository.signIn(phone: phone, password: password);
      if (response.token.isEmpty) {
        emit(state.copyWith(
          tryCount: response.tryCount,
          authStatus: UserAuthStatuses.failureAuth,
        ));
        return Future(() => null);
      }
      UserSecureStorage.setField(AppConstants.accessToken, response.token);
      UserSecureStorage.setField(
          AppConstants.refreshToken, response.refreshToken);
      UserSecureStorage.setField(AppConstants.userPhoneNumber, phone);
      emit(state.copyWith(
        authStatus: UserAuthStatuses.successAuth,
        token: response.token,
        refreshToken: response.refreshToken,
        tryCount: 5,
      ));
      /// Обновляем токен, есть вероятность, что он устарел
      Future.delayed(Duration.zero, () async {
        /// Запрашиваем токен фоном, чтобы не тормозить переход на следующий экран
        if(kDebugMode) {
          await deleteFirebaseDeviceId();
        }
        await addFirebaseDeviceId();
      });
      await FirebaseAnalyticsService.registerAppLoginEvent();

      getUserProfiles(true);
      return Future(() => null);
    } on DioError catch (e) {
      emit(state.copyWith(
        authStatus: UserAuthStatuses.failureAuth,
        tryCount: AuthTokenResponseError.fromJson(e.response?.data).tryCount,
      ));
      addError(e);
      return AuthTokenResponseError.fromJson(e.response?.data);
    } catch (e) {
      emit(state.copyWith(
        authStatus: UserAuthStatuses.failureAuth,
      ));
      addError(e);
      rethrow;
    }
  }

  /// Лайтовый выход из приложения. Заблокировать сессию
  void signOut() async {
    UserSecureStorage.setField(AppConstants.isAuth, 'false');
    UserSecureStorage.deleteField(AppConstants.selectedUserId);
    mediator?.sendTo<DiaryCubit>(this, UserMediatorEvent.logout);

    emit(state.copyWith(
      authStatus: UserAuthStatuses.unAuth,
      authScreen: UserAuthScreens.inputPhone,
      userProfiles: null,
      selectedUserId: null,
    ));
  }

  /// Выход из приложения с удалением данных сессии
  void forceLogout() async {
    UserSecureStorage.setField(AppConstants.isAuth, 'false');
    UserSecureStorage.deleteField(AppConstants.selectedUserId);
    UserSecureStorage.deleteField(AppConstants.accessToken);
    UserSecureStorage.deleteField(AppConstants.refreshToken);
    UserSecureStorage.deleteField(AppConstants.authPinCode);
    UserSecureStorage.deleteField(AppConstants.isAcceptedAgreements);

    mediator?.sendTo<DiaryCubit>(this, UserMediatorEvent.logout);

    FCMService.cleanFCMToken();

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
    /// Обновляем токен, есть вероятность, что он устарел
    Future.delayed(Duration.zero, () async {
      /// Запрашиваем токен фоном, чтобы не тормозить переход на следующий экран
      if(kDebugMode) {
        await deleteFirebaseDeviceId();
      }
      await addFirebaseDeviceId();
    });
  }

  /// Сохраняет deviceId устройства на бэке
  Future<void> addFirebaseDeviceId() async {
    try {

      String fcmToken = await FirebaseMessaging.instance.getToken() as String;
      Sentry.configureScope((scope) {
        scope.setExtra('fcmToken', fcmToken);
      });
      userRepository.registerDeviceFirebaseToken(token: fcmToken);
      Sentry.captureMessage('FCM Token: $fcmToken');
    } catch (e) {
      Sentry.captureException(e);
    }
  }

  /// Удаляет deviceId устройства на бэке
  Future<void> deleteFirebaseDeviceId() async {
    try {
      String fcmToken = await FirebaseMessaging.instance.getToken() as String;
      userRepository.deleteDeviceFirebaseToken(token: fcmToken);
      Sentry.captureMessage(
        'Удаляем токен $fcmToken'
      );
      await FirebaseMessaging.instance.deleteToken();
    } catch (e) {
      Sentry.captureException(e);
    }
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

      final defaultUserId = response[0].id;
      if (currentSelectedUserId == null) {
        await UserSecureStorage.setField(
            AppConstants.selectedUserId, defaultUserId);
      }

      emit(state.copyWith(
        getUserProfileStatus: GetUserProfilesStatusesList.success,
        userProfiles: response,
        selectedUserId: (currentSelectedUserId ?? defaultUserId).toString(),
        token: await UserSecureStorage.getField(AppConstants.accessToken),
      ));
    } catch (e) {
      emit(state.copyWith(
        getUserProfileStatus: GetUserProfilesStatusesList.failure,
      ));
      addError(e);
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
  void setPinCodeToStorage(List<int> pinCode) async {
    UserSecureStorage.setField(
        AppConstants.authPinCode, sha256.convert(pinCode).toString());
    UserSecureStorage.setField(AppConstants.isSavedPinCodeForAuth, 'true');
    UserSecureStorage.setField(AppConstants.isAuth, 'true');

    await FirebaseAnalyticsService.registerCustomEvent(
        name: 'авторизация по пин-коду');
  }

  /// Сравнить хэш введенного кода с ъэшем сохраненного
  Future<bool> checkPinCodeToStorage(List<int> pinCode, int count) async {
    String sha256savedCode =
        '${await UserSecureStorage.getField(AppConstants.authPinCode)}';
    if (sha256savedCode == sha256.convert(pinCode).toString()) {
      UserSecureStorage.setField(AppConstants.isAuth, 'true');
      emit(state.copyWith(authStatus: UserAuthStatuses.successAuth));
      /// Обновляем токен, есть вероятность, что он устарел
      Future.delayed(Duration.zero, () async {
        /// Запрашиваем токен фоном, чтобы не тормозить переход на следующий экран
        if(kDebugMode) {
          await deleteFirebaseDeviceId();
        }
        await addFirebaseDeviceId();
      });
      return true;
    } else {
      AppToast.showAppToast(msg: 'Неверный пин-код,\nОсталось попыток $count');
      return false;
    }
  }

  /// Запрашивает смс для сброса пароля
  Future<DefaultErrorModel?> getNewSmsForRecoverPassword(
      {required String phoneNumber}) async {
    CheckUserAccountResponse checkUser =
        await checkUserAccount(phoneNumber: phoneNumber);
    if (checkUser.found != true) {
      return const DefaultErrorModel(
          message: 'Не найден пользователь с введенным номером телефона');
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
    } on DioError catch (e) {
      addError(e);
      return DefaultErrorModel.fromJson(e.response?.data);
    } catch (e) {
      emit(state.copyWith(
        getNewSmsCodeStatus: GetNewSmsCodeStatuses.failed,
      ));
      addError(e);
    }
    return null;
  }

  /// Проверяет код из смс для сброса пароля
  Future<DefaultErrorModel?> sendResetPasswordCode(
      {required String phoneNumber, required String smsToken}) async {
    emit(state.copyWith(
      sendingResetPasswordCodeStatus: SendingResetPasswordCodeStatuses.loading,
    ));
    // s
    try {
      await userRepository.sendResetPasswordCode(
        phoneNumber: phoneNumber,
        smsToken: smsToken,
      );
      emit(state.copyWith(
        sendingResetPasswordCodeStatus:
            SendingResetPasswordCodeStatuses.success,
      ));
      return null;
    } on DioError catch (e) {
      addError(e);
      return DefaultErrorModel.fromJson(e.response?.data);
    } catch (e) {
      emit(state.copyWith(
        sendingResetPasswordCodeStatus: SendingResetPasswordCodeStatuses.failed,
      ));
      addError(e);
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
      addError(e);
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
      addError(e);
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

      if (response.found != true) {
        return const CheckUserAccountResponse(
            found: false,
            message: 'Не найден пользователь с введенным номером телефона');
      }

      /// Если телефон не совпадает с кубитом, то сбрасываем таймер
      if (state.userPhoneNumber != phoneNumber) {
        setTimer(DateTime.now().subtract(
          const Duration(minutes: 5)
        ));
      }


      emit(state.copyWith(
          checkUserAccountStatus: CheckUserAccountStatuses.success,
          userPhoneNumber: phoneNumber,
          isFound: response.found));
      return response;
    } on DioError catch (e) {
      addError(e);
      if(e.type == DioErrorType.other) {
        return const CheckUserAccountResponse(
            found: false, message: 'Ошибка соединения с сервером');
      }
      return CheckUserAccountResponse.fromJson(e.response?.data);
    } catch (e) {
      emit(state.copyWith(
        checkUserAccountStatus: CheckUserAccountStatuses.failed,
      ));
      addError(e);
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
      addError(e);
      rethrow;
    }
  }

  /// Получает список всех пользовательских соглашений.
  /// Или конкретный файлик с соглашениями
  void getUserAgreementDocument({
    int? idFile,
    required String typeAgreement,
  }) async {
    emit(state.copyWith(
      getUserAgreementDocumentStatus: GetUserAgreementDocumentStatuses.loading,
    ));
    try {
      UserAgreementDocumentModel response =
          await userRepository.getUserAgreementDocument(
        idFile: idFile,
        typeAgreement: typeAgreement,
      );
      emit(state.copyWith(
        getUserAgreementDocumentStatus:
            GetUserAgreementDocumentStatuses.success,
        userAgreementDocument: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        getUserAgreementDocumentStatus: GetUserAgreementDocumentStatuses.failed,
      ));
      addError(e);
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
      userProfiles: state.userProfiles!
          .map((e) => e.id == userId ? e.copyWith(avatar: 'loading') : e)
          .toList(),
    ));
    try {
      UserUploadAvatarResponseModel response =
          await userRepository.uploadUserAvatar(
        userId: userId,
        file: file,
      );
      Future.delayed(const Duration(seconds: 1), () {
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
      addError(e);
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
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      techInfo = 'Устройство: ${androidInfo.brand} ${androidInfo.model}\n'
          'Версия Android: ${androidInfo.version.release}, SDK: ${androidInfo.version.sdkInt}, security path: ${androidInfo.version.securityPatch}\n'
          'Окружение: ${ApiConstants.env}\n';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      techInfo = 'Устройство: ${iosInfo.name}\n'
          'Версия ${iosInfo.systemName} ${iosInfo.systemVersion}\n'
          'Окружение: ${ApiConstants.baseUrl}\n';
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
      addError(e);
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
      addError(e);
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
      UserAgreementItemModel? actualUserAgreement = response.firstWhere(
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
      addError(e);
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
      await UserSecureStorage.setField(
          AppConstants.isAcceptedAgreements, 'true');
    } catch (e) {
      emit(state.copyWith(
        acceptedAgreementsStatus: AcceptedAgreementsStatuses.failed,
      ));
      addError(e);
      rethrow;
    }
  }

  /// Отправить сообщение в техподдержку от авторизованного пользователя
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
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      techInfo = 'Версия приложения: ${ApiConstants.appVersion}\n'
          'Устройство: ${androidInfo.brand} ${androidInfo.model}\n'
          'Версия Android: ${androidInfo.version.release}, SDK: ${androidInfo.version.sdkInt}, security path: ${androidInfo.version.securityPatch}\n'
          'Окружение: ${ApiConstants.env}\n';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      techInfo = 'Версия приложения: ${ApiConstants.appVersion}\n'
          'Устройство: ${iosInfo.name}\n'
          'Версия ${iosInfo.systemName} ${iosInfo.systemVersion}\n'
          'Окружение: ${ApiConstants.env}\n';
    }

    try {
      await userRepository.sendEmail(
        email: email,
        subject: subject,
        message: message,
        techInfo: techInfo,
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
      addError(e);
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
      techInfo = 'Версия приложения: ${ApiConstants.appVersion}\n'
          'Устройство: ${androidInfo.brand} ${androidInfo.model}\n'
          'Версия Android: ${androidInfo.version.release}, SDK: ${androidInfo.version.sdkInt}, security path: ${androidInfo.version.securityPatch}\n'
          'Окружение: ${ApiConstants.env}\n';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      techInfo = 'Версия приложения: ${ApiConstants.appVersion}\n'
          'Устройство: ${iosInfo.name}\n'
          'Версия ${iosInfo.systemName} ${iosInfo.systemVersion}\n'
          'Окружение: ${ApiConstants.env}\n';
    }

    try {
      await userRepository.sendUnauthEmail(
        email: email,
        message: message,
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
      addError(e);
      rethrow;
    }
  }

  /// Получить последнее непочитанное уведомление
  Future<void> getLastNotReadNotification(bool isRefresh) async {
    if (!isRefresh &&
        state.getLastNotReadEventStatus ==
            GetLastNotReadEventStatuses.success &&
        state.lastNotification != null) {
      return;
    }
    if (state.getLastNotReadEventStatus ==
        GetLastNotReadEventStatuses.loading) {
      return;
    }
    emit(state.copyWith(
      getLastNotReadEventStatus: GetLastNotReadEventStatuses.loading,
    ));
    try {
      NotificationModel? lastNotification =
          await userRepository.getLastNotReadedEvent();
      emit(state.copyWith(
          getLastNotReadEventStatus: GetLastNotReadEventStatuses.success,
          lastNotification: lastNotification,
          isLastNotificationShow: lastNotification == null ? false : true));
    } catch (e) {
      emit(state.copyWith(
        getLastNotReadEventStatus: GetLastNotReadEventStatuses.failed,
      ));
      addError(e);
      rethrow;
    }
  }

  /// Пометить событие как прочитанное
  Future<void> updateNotificationStatus(String eventId) async {
    emit(state.copyWith(
        updatingNotificationStatusStatus:
            UpdatingNotificationStatusStatuses.loading,
        isLastNotificationShow: false));
    try {
      await userRepository.updateNotificationStatus(eventId);
      emit(state.copyWith(
          lastNotification: null, isLastNotificationShow: false));
      await getLastNotReadNotification(true);
      emit(state.copyWith(
        updatingNotificationStatusStatus:
            UpdatingNotificationStatusStatuses.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        updatingNotificationStatusStatus:
            UpdatingNotificationStatusStatuses.failed,
      ));
      addError(e);
      rethrow;
    }
  }
}
