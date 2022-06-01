part of 'user_cubit.dart';

/// Статусы при авторизации. Для авторизации с номером-паролем
enum UserAuthStatuses { unAuth, successAuth, failureAuth, loadingAuth }

/// Экраны авторизации. Ввод номера, ввод пароля
enum UserAuthScreens { inputPhone, inputPassword }

/// Загрузка профилей из всех МО
enum GetUserProfilesStatusesList { initial, loading, success, failure }

class UserState {
  final UserAuthStatuses authStatus;
  final UserAuthScreens authScreen;
  final String? userPhoneNumber;
  final String? token;
  final String? refreshToken;
  final GetUserProfilesStatusesList? getUserProfileStatus;
  final List<UserProfile>? userProfiles;
  final String? selectedUserId;

  UserState({
    this.authStatus = UserAuthStatuses.unAuth,
    this.authScreen = UserAuthScreens.inputPhone,
    this.userPhoneNumber,
    this.token,
    this.refreshToken,
    this.getUserProfileStatus,
    this.userProfiles,
    this.selectedUserId = '',
  });

  UserState copyWith({
    required UserAuthStatuses authStatus,
    required UserAuthScreens authScreen,
    String? userPhoneNumber,
    String? token,
    String? refreshToken,
    GetUserProfilesStatusesList? getUserProfileStatus,
    List<UserProfile>? userProfiles,
    String? selectedUserId,
  }) {
    return UserState(
      authStatus: authStatus,
      authScreen: authScreen,
      userPhoneNumber: userPhoneNumber,
      token: token,
      refreshToken: refreshToken,
      getUserProfileStatus: getUserProfileStatus,
      userProfiles: userProfiles,
      selectedUserId: selectedUserId,
    );
  }

  List<Object?> get props => [
        authStatus,
        authScreen,
        getUserProfileStatus,
        userProfiles,
        selectedUserId,
      ];
}
