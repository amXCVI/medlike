import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

class SubscribeRepository {
  final _dioClient = Api().dio;

  Future<List<AvailableClinic>> getAvailableClinicsList(
      {required String userId}) async {
    try {
      final response =
          await _dioClient.get('/api/v1.0/profile/$userId/clinics');
      final List availableClinicsList = response.data;
      return availableClinicsList
          .map((e) => AvailableClinic.fromJson(e))
          .toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<List<NavigationItem>> getServicesList(
      {required String userId,
      required String clinicId,
      required String buildingId}) async {
    try {
      final response = await _dioClient.get(
          '/api/v1.0/doctors?UserId=$userId&BuildingId=$buildingId&ClinicId=$clinicId');
      final List<NavigationItem> navigationItems =
          DoctorsResponseModel.fromJson(response.data).navigationItems
              as List<NavigationItem>;
      return navigationItems;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<Research>> getResearchesList({
    required String userId,
    required String clinicId,
    required String buildingId,
    required String categoryType,
  }) async {
    try {
      final response = await _dioClient.get(
          '/api/v1.0/doctors?UserId=$userId&BuildingId=$buildingId&ClinicId=$clinicId&CategoryType=$categoryType');
      final List<Research> researches =
          DoctorsResponseModel.fromJson(response.data).researches
              as List<Research>;
      return researches;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<NavigationItem>> getSpecialisationsList({
    required String userId,
    required String clinicId,
    required String buildingId,
    required String categoryType,
  }) async {
    try {
      final response = await _dioClient.get(
          '/api/v1.0/doctors?UserId=$userId&BuildingId=$buildingId&ClinicId=$clinicId&CategoryType=$categoryType');
      final List<NavigationItem> navigationItems =
          DoctorsResponseModel.fromJson(response.data).navigationItems
              as List<NavigationItem>;
      return navigationItems;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<Doctor>> getDoctorsList({
    required String userId,
    required String clinicId,
    required String buildingId,
    required String categoryType,
    String specialisationId = '',
  }) async {
    try {
      final response = await _dioClient.get(
          '/api/v1.0/doctors?UserId=$userId&BuildingId=$buildingId&ClinicId=$clinicId&CategoryType=$categoryType&SpecializationId=$specialisationId&OnlyPersonalSchedule=true');
      final List<Doctor> doctors =
          DoctorsResponseModel.fromJson(response.data).doctors
              as List<Doctor>;
      return doctors;
    } catch (err) {
      rethrow;
    }
  }

  Future<DoctorsResponseModel> getCabinetsList({
    required String userId,
    required String clinicId,
    required String buildingId,
    required String categoryType,
    required List<String> researchIds,
  }) async {
    try {
      String researchIdsStr = researchIds.join('&ResearchIds=');
      final response = await _dioClient.get(
          '/api/v1.0/doctors?UserId=$userId&BuildingId=$buildingId&ClinicId=$clinicId&CategoryType=$categoryType&ResearchIds=$researchIdsStr');
      return DoctorsResponseModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
