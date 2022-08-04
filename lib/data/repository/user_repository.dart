import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:mime/mime.dart';

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

  Future<bool> changePassword({
    required String userName,
    required String newPassword,
  }) async {
    try {
      final response =
          await _dioClient.post('/api/v1.0/auth/password/change', data: {
        'userName': userName,
        'newPassword': newPassword,
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

  Future<List<UserAgreementsModel>> getUserAgreements() async {
    try {
      final response = await _dioClient.get('/api/v1.0/profile/agreement/all');
      final List agreementsList = response.data;
      return agreementsList
          .map((e) => UserAgreementsModel.fromJson(e))
          .toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<UserAgreementDocumentModel> getUserAgreementDocument({
    required int idFile,
    String? typeAgreement,
  }) async {
    try {
      final response = await _dioClient
          .get('/api/v1.0/profile/agreement-document?idFile=$idFile');
      return UserAgreementDocumentModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<UserUploadAvatarResponseModel> uploadUserAvatar({
    required String userId,
    PlatformFile? file,
  }) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file?.path ?? '',
          filename: file?.name ?? '',
          contentType:
              MediaType.parse(lookupMimeType(file?.path as String) as String)),
    });

    try {
      var response = await _dioClient.post('/api/v1.0/profile/$userId/avatar',
          data: formData,
          options: Options(
            contentType: 'multipart/form-data',
            headers: {
              'Content-Type': 'multipart/form-data',
              'Authorization':
                  'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
            },
          ));
      return UserUploadAvatarResponseModel.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> deleteAccount({
    String? userId,
    required String techInfo,
  }) async {
    try {
      final response =
      await _dioClient.delete('/api/v1.0/auth/delete-account', data: {
        'techInfo': techInfo,
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
}
