import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

class DocumentsRepository {
  final _dioClient = Api().dio;

  Future<DocumentMetaModel> getDocumentMetaData({
    required String documentId,
  }) async {
    try {
      final response =
          await _dioClient.get('/api/v1.0/profile/document/$documentId');
      return DocumentMetaModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
