import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

class ClinicsRepository {
  final _dioClient = Api().dio;

  Future<List<ClinicModel>> getAllClinicsList() async {
    try {
      final response = await _dioClient.get('/api/v1.0/clinics');
      final List clinicsList = response.data;
      return clinicsList.map((e) => ClinicModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<List<PriceItemModel>> getPriceList(
      clinicId, List<String>? categories) async {
    try {
      String categoriesStr = categories!.join('&category=');
      final response = await _dioClient.get(
          '/api/v1.0/clinics/$clinicId/prices?${categoriesStr.isNotEmpty ? 'category=$categoriesStr' : ''}');
      final List priceList = response.data;
      return priceList.map((e) => PriceItemModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<List<ClinicPromotionModel>> getPromotionsList(
      {required String clinicId}) async {
    try {
      final response =
          await _dioClient.get('/api/v1.0/promotions?clinicId=$clinicId');
      final List priceList = response.data;
      return priceList.map((e) => ClinicPromotionModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<List<MainscreenPromotionModel>> getMainscreenPromotionsList() async {
    try {
      final response = await _dioClient.get('/api/v1.0/promotions/mainscreen');
      final List priceList = response.data;
      return priceList
          .map((e) => MainscreenPromotionModel.fromJson(e))
          .toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<List<RecommendationByServiceModel>> getRecommendationsByServiceIds({
    required List<String> serviceIds,
  }) async {
    try {
      List<String> servicesList =
          serviceIds.map((e) => 'serviceIds=$e').toList();
      final response = await _dioClient.get(
          '/api/v1.0/schedule/appointments/recommendations?${servicesList.join('&')}');
      final List recommendationsList = response.data;
      return recommendationsList
          .map((e) => RecommendationByServiceModel.fromJson(e))
          .toList();
    } catch (err) {
      rethrow;
    }
  }
}
