part of 'user_cubit.dart';

/// Статусы при авторизации. Для авторизации с номером-паролем
enum UserAuthStatuses { unAuth, successAuth, failureAuth, loadingAuth }
/// Экраны авторизации. Ввод номера, ввод пароля
enum UserAuthScreens { inputPhone, inputPassword }

class UserState {
  final UserAuthStatuses authStatus;
  final UserAuthScreens authScreen;
  final String? userPhoneNumber;
  final String? token;
  final String? refreshToken;

  UserState({
    this.authStatus = UserAuthStatuses.unAuth,
    this.authScreen = UserAuthScreens.inputPhone,
    this.userPhoneNumber,
    this.token,
    this.refreshToken,
  });

  UserState copyWith({
    required UserAuthStatuses authStatus,
    required UserAuthScreens authScreen,
    String? userPhoneNumber,
    String? token,
    String? refreshToken,
  }) {
    return UserState(
      authStatus: authStatus,
      authScreen: authScreen,
      userPhoneNumber: userPhoneNumber,
      token: token,
      refreshToken: refreshToken,
    );
  }

  List<Object?> get props => [authStatus, authScreen];
}
