// ignore_for_file: constant_identifier_names

part of 'user_cubit.dart';

/// Статусы при авторизации. Для авторизации с номером-паролем
enum UserAuthStatuses { unAuth, successAuth, failureAuth, loadingAuth }

/// Экраны авторизации. Ввод номера, ввод пароля
enum UserAuthScreens { inputPhone, inputPassword }

/// Загрузка профилей из всех МО
enum GetUserProfilesStatusesList { initial, loading, success, failure }

enum GetNewSmsCodeStatuses { initial, loading, success, failed }

enum SendingResetPasswordCodeStatuses { initial, loading, success, failed }

enum ResetPasswordStatuses { initial, loading, success, failed }

enum CheckUserAccountStatuses { initial, loading, success, failed }

enum GetUserAgreementsStatuses { initial, loading, success, failed }

enum GetUserAgreementDocumentStatuses { initial, loading, success, failed }

enum ChangePasswordStatuses { initial, loading, success, failed }

enum UploadUserAvatarStatuses { initial, loading, success, failed }

enum DeletingUserAccountStatuses { initial, loading, success, failed }

enum GetAllUserAgreementsStatuses { initial, loading, success, failed }

enum AcceptedAgreementsStatuses { initial, loading, success, failed }

enum SendingEmailToSupportStatuses { initial, loading, success, failed }

enum GetLastNotReadEventStatuses { initial, loading, success, failed }

enum UpdatingNotificationStatusStatuses { initial, loading, success, failed }

enum NotificationEventType { 
  AppointmentCompleted, 
  AppointmentCanceled, 
  NewMedcardEventPdf, 
  NewMedcardEventJson, 
  AppointmentScheduled
}

class UserState {
  final UserAuthStatuses? authStatus;
  final UserAuthScreens? authScreen;
  final String? userPhoneNumber;
  final String? token;
  final String? refreshToken;
  final GetUserProfilesStatusesList? getUserProfileStatus;
  final List<UserProfile>? userProfiles;
  final String? selectedUserId;
  final GetNewSmsCodeStatuses? getNewSmsCodeStatus;
  final SendingResetPasswordCodeStatuses? sendingResetPasswordCodeStatus;
  final ResetPasswordStatuses? resetPasswordStatus;
  final CheckUserAccountStatuses? checkUserAccountStatus;
  final GetUserAgreementsStatuses? getUserAgreementsStatus;
  final List<UserAgreementsModel>? userAgreementsList;
  final GetUserAgreementDocumentStatuses? getUserAgreementDocumentStatus;
  final UserAgreementDocumentModel? userAgreementDocument;
  final ChangePasswordStatuses? changePasswordStatus;
  final UploadUserAvatarStatuses? uploadUserAvatarStatus;
  final DeletingUserAccountStatuses? deletingUserAccountStatus;
  final GetAllUserAgreementsStatuses? getAllUserAgreementsStatus;
  final AcceptedAgreementsStatuses? acceptedAgreementsStatus;
  final SendingEmailToSupportStatuses? sendingEmailToSupportStatus;
  final GetLastNotReadEventStatuses? getLastNotReadEventStatus;
  final NotificationModel? lastNotification;
  final bool? isLastNotificationShow;
  final UpdatingNotificationStatusStatuses? updatingNotificationStatusStatus;

  UserState({
    this.authStatus = UserAuthStatuses.unAuth,
    this.authScreen = UserAuthScreens.inputPhone,
    this.userPhoneNumber,
    this.token,
    this.refreshToken,
    this.getUserProfileStatus,
    this.userProfiles,
    this.selectedUserId = '',
    this.getNewSmsCodeStatus = GetNewSmsCodeStatuses.initial,
    this.sendingResetPasswordCodeStatus =
        SendingResetPasswordCodeStatuses.initial,
    this.resetPasswordStatus,
    this.checkUserAccountStatus,
    this.getUserAgreementsStatus,
    this.userAgreementsList,
    this.getUserAgreementDocumentStatus =
        GetUserAgreementDocumentStatuses.initial,
    this.userAgreementDocument,
    this.changePasswordStatus,
    this.uploadUserAvatarStatus,
    this.deletingUserAccountStatus,
    this.getAllUserAgreementsStatus = GetAllUserAgreementsStatuses.initial,
    this.acceptedAgreementsStatus,
    this.sendingEmailToSupportStatus,
    this.getLastNotReadEventStatus,
    this.lastNotification,
    this.isLastNotificationShow,
    this.updatingNotificationStatusStatus,
  });

  UserState copyWith({
    UserAuthStatuses? authStatus,
    UserAuthScreens? authScreen,
    String? userPhoneNumber,
    String? token,
    String? refreshToken,
    GetUserProfilesStatusesList? getUserProfileStatus,
    List<UserProfile>? userProfiles,
    String? selectedUserId,
    GetNewSmsCodeStatuses? getNewSmsCodeStatus,
    SendingResetPasswordCodeStatuses? sendingResetPasswordCodeStatus,
    ResetPasswordStatuses? resetPasswordStatus,
    CheckUserAccountStatuses? checkUserAccountStatus,
    GetUserAgreementsStatuses? getUserAgreementsStatus,
    List<UserAgreementsModel>? userAgreementsList,
    GetUserAgreementDocumentStatuses? getUserAgreementDocumentStatus,
    UserAgreementDocumentModel? userAgreementDocument,
    ChangePasswordStatuses? changePasswordStatus,
    UploadUserAvatarStatuses? uploadUserAvatarStatus,
    DeletingUserAccountStatuses? deletingUserAccountStatus,
    GetAllUserAgreementsStatuses? getAllUserAgreementsStatus,
    AcceptedAgreementsStatuses? acceptedAgreementsStatus,
    SendingEmailToSupportStatuses? sendingEmailToSupportStatus,
    GetLastNotReadEventStatuses? getLastNotReadEventStatus,
    NotificationModel? lastNotification,
    bool? isLastNotificationShow,
    UpdatingNotificationStatusStatuses? updatingNotificationStatusStatus,
  }) {
    return UserState(
      authStatus: authStatus ?? this.authStatus,
      authScreen: authScreen ?? this.authScreen,
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      getUserProfileStatus: getUserProfileStatus ?? this.getUserProfileStatus,
      userProfiles: userProfiles ?? this.userProfiles,
      selectedUserId: selectedUserId ?? this.selectedUserId,
      getNewSmsCodeStatus: getNewSmsCodeStatus ?? this.getNewSmsCodeStatus,
      sendingResetPasswordCodeStatus:
          sendingResetPasswordCodeStatus ?? this.sendingResetPasswordCodeStatus,
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
      checkUserAccountStatus:
          checkUserAccountStatus ?? this.checkUserAccountStatus,
      getUserAgreementsStatus:
          getUserAgreementsStatus ?? this.getUserAgreementsStatus,
      userAgreementsList: userAgreementsList ?? userAgreementsList,
      getUserAgreementDocumentStatus:
          getUserAgreementDocumentStatus ?? this.getUserAgreementDocumentStatus,
      userAgreementDocument:
          userAgreementDocument ?? this.userAgreementDocument,
      changePasswordStatus: changePasswordStatus ?? this.changePasswordStatus,
      uploadUserAvatarStatus:
          uploadUserAvatarStatus ?? this.uploadUserAvatarStatus,
      deletingUserAccountStatus:
          deletingUserAccountStatus ?? this.deletingUserAccountStatus,
      getAllUserAgreementsStatus:
          getAllUserAgreementsStatus ?? this.getAllUserAgreementsStatus,
      acceptedAgreementsStatus:
          acceptedAgreementsStatus ?? this.acceptedAgreementsStatus,
      sendingEmailToSupportStatus:
          sendingEmailToSupportStatus ?? this.sendingEmailToSupportStatus,
      getLastNotReadEventStatus:
          getLastNotReadEventStatus ?? this.getLastNotReadEventStatus,
      lastNotification: lastNotification ?? this.lastNotification,
      isLastNotificationShow: isLastNotificationShow ?? this.isLastNotificationShow,
      updatingNotificationStatusStatus: updatingNotificationStatusStatus ??
          this.updatingNotificationStatusStatus,
    );
  }

  List<Object?> get props => [];
}
