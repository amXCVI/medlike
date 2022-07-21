import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

class MedcardRepository {
  final _dioClient = Api().dio;

  Future<List<MedcardDocsModel>> getMedcardDocsList({required String userId}) async {
    try {
      final response = await _dioClient.get('/api/v1.0/profile/$userId/mdocs');
      final List clinicsList = response.data;
      return clinicsList.map((e) => MedcardDocsModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
