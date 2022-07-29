import 'dart:io';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class MedcardRepository {
  final _dioClient = Api().dio;

  Future<List<MedcardDocsModel>> getMedcardDocsList(
      {required String userId}) async {
    try {
      final response = await _dioClient.get('/api/v1.0/profile/$userId/mdocs');
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
}
