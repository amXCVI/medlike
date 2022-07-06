import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

enum UserAuthenticationStatus {
  unknown,
  signedIn,
  signedOut,
}

class UserRepository {
  final _dioClient = Api().dio;

  Future<AuthTokenResponse> signIn(
      {required String phone, required String password}) async {
    try {
      final response = await _dioClient.post('/api/v1.0/auth/token',
          data: {'UserName': phone, 'Password': password});
      return AuthTokenResponse.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<AuthTokenResponse> refreshToken(
      {required String token, required String refreshToken}) async {
    try {
      final response = await _dioClient.post('/api/v1.0/auth/token',
          data: {'Token': token, 'RefreshToken': refreshToken});
      return response.data;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> signOut() async {}

  Future<List<UserProfile>> getProfiles() async {
    try {
      final response = await _dioClient.get('/api/v1.0/profile');
      final List profilesList = response.data;
      return profilesList.map((e) => UserProfile.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> getNewSmsCodeRecoverPassword(
      {required String phoneNumber}) async {
    try {
      await _dioClient.get('/api/v1.0/auth/password/forgot/$phoneNumber');
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> sendResetPasswordCode(
      {required String smsToken, required String phoneNumber}) async {
    try {
      final response = await _dioClient.post('/api/v1.0/auth/sms/check',
          data: {'Token': smsToken, 'UserName': phoneNumber});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> resetPassword({
    required String smsToken,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response =
          await _dioClient.post('/api/v1.0/auth/password/reset', data: {
        'Token': smsToken,
        'UserName': phoneNumber,
        'Password': password,
        'ConfirmPassword': confirmPassword,
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<CheckUserAccountResponse> checkUserAccount({
    required String phoneNumber,
  }) async {
    try {
      final response =
          await _dioClient.get('/api/v1.0/auth/check/$phoneNumber');
      return CheckUserAccountResponse.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
