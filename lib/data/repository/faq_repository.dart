import 'package:medlike/data/models/faq_models/faq_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

class FAQRepository {
  final _dioClient = Api().dio;

  Future<List<FAQItemModel>> getFAQList() async {
    try {
      final response = await _dioClient.get('/api/v1.0/support/faq');
      final List clinicsList = response.data;
      return clinicsList.map((e) => FAQItemModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
