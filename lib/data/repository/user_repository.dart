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
}
