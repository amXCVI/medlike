part of 'user_cubit.dart';

enum UserAuthStatuses { unAuth, successAuth, failureAuth, loadingAuth }
enum GetUserProfilesStatuses { initial, success, failure, loading }

@immutable
class UserAuthState extends Equatable {
  const UserAuthState._({
    this.status = UserAuthStatuses.unAuth,
    this.token,
    this.refreshToken,
    this.error,
  });

  const UserAuthState.unAuth() : this._();

  const UserAuthState.successAuth(String token, String refreshToken)
      : this._(
            status: UserAuthStatuses.successAuth,
            token: token,
            refreshToken: refreshToken);

  const UserAuthState.failureAuth(String error)
      : this._(status: UserAuthStatuses.failureAuth, error: error);

  const UserAuthState.loadingAuth() : this._(status: UserAuthStatuses.loadingAuth);

  final UserAuthStatuses status;
  final String? token;
  final String? refreshToken;
  final String? error;

  @override
  List<Object?> get props => [status, token, refreshToken, error];
}

