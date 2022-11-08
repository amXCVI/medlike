import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:mime/mime.dart';

class MedcardRepository {
  final _dioClient = Api().dio;

  Future<List<MedcardDocsModel>> getMedcardDocsList(
      {required String userId, required String filters}) async {
    try {
      final response =
          await _dioClient.get('/api/v1.0/profile/$userId/mdocs?$filters');
      final List clinicsList = response.data;
      return clinicsList.map((e) => MedcardDocsModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<List<MedcardUserFileModel>> getUserFilesList(
      {required String userId}) async {
    try {
      final response =
          await _dioClient.get('/api/v1.0/profile/files?userId=$userId');
      final List clinicsList = response.data;
      return clinicsList.map((e) => MedcardUserFileModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<dynamic> downloadFile({required String url}) async {
    try {
      var request = await HttpClient().getUrl(Uri.parse(url));
      request.headers.add('Authorization',
          'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}');
      var response = await request.close();
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<MedcardUserFileModel> uploadFile({
    required String userId,
    File? file,
    Uint8List? fileBytes,
    required String fileName,
    required String fileType,
  }) async {
    FormData formData;
    if (file != null) {
      formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType.parse(lookupMimeType(file.path) as String),
        ),
      });
    } else {
      formData = FormData.fromMap({
        "file": MultipartFile.fromBytes(
          fileBytes!,
          filename: fileName,
          contentType: MediaType(fileType, fileType),
        )
      });
    }

    try {
      var response = await _dioClient.post('/api/v1.0/profile/$userId/files',
          data: formData,
          options: Options(
            contentType: 'multipart/form-data',
            headers: {
              'Authorization':
                  'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
            },
          ));
      return MedcardUserFileModel.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  Future<DeleteUserFileResponseModel> deleteUserFile(
      {required String userId, required String fileId}) async {
    try {
      final response = await _dioClient
          .delete('/api/v1.0/profile/files/$fileId?userId=$userId');
      return DeleteUserFileResponseModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
