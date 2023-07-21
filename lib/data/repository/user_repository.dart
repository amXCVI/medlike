import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/notification_models/notification_models.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/helpers/platform_helper.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:mime/mime.dart';

enum UserAuthenticationStatus {
  unknown,
  signedIn,
  signedOut,
}

class UserRepository {
  final _dioClient = Api().dio;
  final _noErrorClient = Api().dio..interceptors.removeAt(0);

  Future<AuthTokenResponse> signIn(
      {required String phone, required String password}) async {
    try {
      final response = await _noErrorClient.post('/api/v1.0/auth/token',
          data: {'UserName': phone, 'Password': password});
      return AuthTokenResponse.fromJson(response.data);
    } catch (err) {
      rethrow;
      /*
      if ((err as DioError).response?.statusCode != 400 &&
          (err as DioError).response?.statusCode != 406) {
        rethrow;
      }
      int tryCount =
          AuthTokenResponseError.fromJson((err as DioError).response!.data)
              .tryCount;
      String message = 
          AuthTokenResponseError.fromJson((err as DioError).response!.data)
              .message;

      return AuthTokenResponse(token: '', refreshToken: '', tryCount: tryCount);
      */
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
      final response = await _noErrorClient.post('/api/v1.0/auth/sms/check',
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
      final response = await _dioClient.post('уesi', data: {
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
          await _noErrorClient.get('/api/v1.0/auth/check/$phoneNumber');
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
    int? idFile,
    required String typeAgreement,
  }) async {
    try {
      final response = await _dioClient.get(
          '/api/v1.0/profile/agreement-document?${idFile != null ? 'idFile=$idFile' : ''}&typeAgreement=$typeAgreement');
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

  Future<List<UserAgreementItemModel>> getUserAllAgreements() async {
    try {
      final response = await _dioClient.get('/api/v1.0/profile/agreement/all');
      final List agreementsList = response.data;
      return agreementsList
          .map((e) => UserAgreementItemModel.fromJson(e))
          .toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> acceptedAgreement({
    required int agreementId,
  }) async {
    try {
      final response =
          await _dioClient.post('/api/v1.0/profile/agreement', data: {
        'AgreementId': agreementId,
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

  Future<bool> sendEmail({
    required String email,
    required String subject,
    required String message,
    required String techInfo,
    List<File>? files,
  }) async {
    List uploadFilesList = [];
    if (files != null) {
      for (var file in files) {
        var multipartFile = await MultipartFile.fromFile(file.path);
        uploadFilesList.add(multipartFile);
      }
    }

    FormData formData = FormData.fromMap({
      "Files": uploadFilesList,
      'Email': email,
      'Subject': subject,
      'Message': message,
      'TechInfo': techInfo,
    });

    try {
      final response = await _dioClient.post('/api/v1.0/support/email',
          data: formData,
          options: Options(
            contentType: 'multipart/form-data',
            headers: {
              'Authorization':
                  'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
            },
          ));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> sendUnauthEmail({
    required String email,
    required String message,
    required String techInfo,
    required String personFio,
    required String personPhone,
    List<File>? files,
  }) async {
    List uploadFilesList = [];
    if (files != null) {
      for (var file in files) {
        var multipartFile = await MultipartFile.fromFile(file.path);
        uploadFilesList.add(multipartFile);
      }
    }

    FormData formData = FormData.fromMap({
      "Files": uploadFilesList,
      'Email': email,
      'Message': message,
      'TechInfo': techInfo,
      'PersonFio': personFio,
      'PersonPhone': personPhone,
    });

    try {
      final response =
          await _dioClient.post('/api/v1.0/support/emailWithoutAuth',
              data: formData,
              options: Options(
                contentType: 'multipart/form-data',
              ));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<void> registerDeviceFirebaseToken({
    required String token,
  }) async {
    try {
      await _dioClient.post('/api/v1.0/profile/devices', data: {
        "DeviceId": token,
        "ClientPlatform": PlatformHelper.getPlatform(),
        "AppBuildType": kDebugMode ? "Dev" : "Prod",
      });
    } catch (err) {
      rethrow;
    }
  }

  Future<void> deleteDeviceFirebaseToken({
    required String token,
  }) async {
    try {
      await _dioClient.delete('/api/v1.0/profile/devices/$token');
    } catch (err) {
      rethrow;
    }
  }

  Future<NotificationModel?> getLastNotReadedEvent() async {
    try {
      final response = await _dioClient.get('/api/v1.0/events/mainscreen');
      if (response.data is! Map<String, Object?>) {
        return null;
      }
      return NotificationModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> updateNotificationStatus(String eventId) async {
    try {
      final response = await _dioClient.put(
        '/api/v1.0/events/$eventId/seen',
        data: {},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<EsiaTokenAuthRequest> esiaGetTokenOrUserData({
    required String esiaToken,
  }) async {
    try {
      final response = await _dioClient.post(
        '/api/v1.0/auth/token-esia',
        data: {},
        options: Options(headers: {'Authorization': 'Bearer $esiaToken'}),
      );
      return EsiaTokenAuthRequest.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<CreateUserProfileAndMedicalCardRequestModel>
      createUserProfileAndMedicalCard({
    required String firstName,
    required String lastName,
    required String middleName,
    required String phoneNumber,
    required String snils,
    required int sex,
    required String birthday,
  }) async {
    try {
      final response = await _dioClient.post(
        '/api/v1.0/auth/CreateUserProfileAndMedicalCard',
        data: {
          "PersonFIO": {
            "FirstName": firstName,
            "MiddleName": middleName,
            "LastName": lastName,
          },
          "PhoneNumber": phoneNumber,
          "Birthday": birthday,
          "Sex": sex,
          "Snils": snils,
        },
      );
      return CreateUserProfileAndMedicalCardRequestModel.fromJson(
          response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> createUserAndProfile({
    required String firstName,
    required String lastName,
    required String middleName,
    required String phoneNumber,
    required String snils,
    required int sex,
    required DateTime birthday,
    required String passportSerial,
    required String passportNumber,
    required DateTime passportIssueDate,
    required String passportIssueId,
    required String esiaToken,
  }) async {
    try {
      await _dioClient.post(
        '/api/v1.0/auth/create-misanduser-profiles',
        data: {
          "FirstName": firstName,
          "MiddleName": middleName,
          "LastName": lastName,
          "Phone": phoneNumber,
          "Birthday": birthday.toString(),
          "Sex": sex,
          "Snils": snils,
          "PassportSerial": passportSerial,
          "PassportNumber": passportNumber,
          "PassportIssueDate": passportIssueDate.toString(),
          "PassportIssueId": passportIssueId,
        },
        options: Options(headers: {'Authorization': 'Bearer $esiaToken'}),
      );
      return true;
    } catch (err) {
      rethrow;
    }
  }
}
