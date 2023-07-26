import 'package:dio/dio.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

class DocumentsRepository {
  final _dioClient = Api().dio;

  Future<List<DocumentModel>> getDocumentsList() async {
    try {
      final response = await _dioClient.get('/api/v1.0/profile/documents');
      final List documentsList = response.data;
      return documentsList.map((e) => DocumentModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<DocumentMetaModel> getDocumentMetaData({
    required String documentId,
  }) async {
    try {
      final response =
          await _dioClient.get('/api/v1.0/profile/documents/$documentId');
      return DocumentMetaModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> subscribeDocument({
    required String documentId,
    required String userId,
    required String lpuId,
    required String esiaToken,
  }) async {
    try {
      final response = await _dioClient.post('/api/v1.0/profile/documents/sign',
          data: {
            'documentId': documentId,
            'userId': userId,
            'lpuId': lpuId,
          },
          options: Options(headers: {'Authorization': 'Bearer $esiaToken'}));
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
