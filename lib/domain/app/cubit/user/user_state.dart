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
    );
  }

  List<Object?> get props => [];
}
