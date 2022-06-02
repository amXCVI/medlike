import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

class SubscribeRepository {
  final _dioClient = Api().dio;

  Future<List<AvailableClinic>> getAvailableClinicsList(
      {required String userId}) async {
    try {
      final response = await _dioClient.get('/api/v1.0/profile/$userId/clinics');
      final List availableClinicsList = response.data;
      return availableClinicsList.map((e) => AvailableClinic.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
