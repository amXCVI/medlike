import 'package:intl/intl.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
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
          DoctorsResponseModel.fromJson(response.data).doctors as List<Doctor>;
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

  Future<List<FavoriteDoctor>> getFavoriteDoctorsList({
    required String userId,
    required String buildingId,
  }) async {
    try {
      final response = await _dioClient.get(
          '/api/v1.0/doctors/favorites?UserId=$userId&BuildingId=$buildingId');
      final List favoriteDoctors = response.data;
      return favoriteDoctors.map((e) => FavoriteDoctor.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<List<CalendarModel>> getCalendarList({
    required String userId,
    required String buildingId,
    required String clinicId,
    required DateTime startDate,
    required DateTime endDate,
    required String categoryType,
    required String dynamicParams,
  }) async {
    // ! Добавить поддержку часовых поясов !!
    String formatDate(DateTime date) =>
        DateFormat("yyyy-MM-ddThh:mm:ss").format(date);
    String startDateStr = formatDate(startDate);
    String endDateStr = formatDate(endDate);

    try {
      final response = await _dioClient.get(
          '/api/v1.0/schedule/calendar?clinicId=$clinicId&buildingId=$buildingId&userId=$userId&startDate=$startDateStr&endDate=$endDateStr&categoryType=$categoryType&appointmentStatusesToShow=Scheduled&appointmentStatusesToShow=Awaiting$dynamicParams');
      final List daysList = response.data;
      return daysList.map((e) => CalendarModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<TimetableResponseModel> getScheduleCellsList({
    required String userId,
    required String buildingId,
    required String clinicId,
    required String categoryType,
    required String dynamicParams,
    required DateTime selectedDate,
  }) async {
    // ! Добавить поддержку часовых поясов !!
    String formatDate(DateTime date) => DateFormat("yyyy-MM-dd").format(date);
    String selectedDateStr = formatDate(selectedDate);

    try {
      final response = await _dioClient.get(
          '/api/v1.0/schedule/timetable?clinicId=$clinicId&buildingId=$buildingId&userId=$userId&date=$selectedDateStr&categoryType=$categoryType$dynamicParams');
      return TimetableResponseModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<AppointmentInfoModel> getAppointmentInfo({
    required String userId,
    required String scheduleId,
    required DateTime appointmentDate,
    required List<String> researchIds,
  }) async {
    try {
      String researchIdsStr = researchIds.join('&ResearchIds=');
      final response = await _dioClient.get(
          '/api/v1.0/schedule/appointments/info?userId=$userId&scheduleId=$scheduleId${researchIds.isNotEmpty ? '&researchIds=$researchIdsStr' : ''}');
      return AppointmentInfoModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<CheckAndLockCellModel> checkAndLockAvailableCell({
    required String userId,
    required String scheduleId,
    required DateTime appointmentDate,
    required String clinicId,
  }) async {
    try {
      String appointmentDateStr =
          DateFormat("yyyy-MM-ddTHH:mm:ss").format(appointmentDate);
      final response = await _dioClient.get(
          '/api/v1.0/schedule/timetable/check-and-lock-cell?scheduleId=$scheduleId&appointmentDate=$appointmentDateStr&userId=$userId&clinicId=$clinicId');
      return CheckAndLockCellModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<UnlockCellModel> unlockCell({
    required String userId,
    required String scheduleId,
  }) async {
    try {
      final response = await _dioClient.get(
          '/api/v1.0/schedule/timetable/unlock-cell?scheduleId=$scheduleId&userId=$userId');
      return UnlockCellModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<CreateNewAppointmentResponseModel> createNewAppointment(
      {required dynamic data}) async {
    try {
      final response = await _dioClient.post(
        '/api/v1.0/schedule/appointments',
        data: data,
      );
      return CreateNewAppointmentResponseModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<RegisterOrderResponseModel> registerOrder({
    required String userId,
    required List<String> appointmentIds,
  }) async {
    try {
      final response = await _dioClient.post(
        '/api/v1.0/order',
        data: {
          'userId': userId,
          'items': [
            ...appointmentIds.map((e) => {'appointmentId': e})
          ]
        },
      );
      return RegisterOrderResponseModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<AvailableDoctor> getAvailableDoctor(
      {required String scheduleId, required String clinicId}) async {
    try {
      final response = await _dioClient.get(
          '/api/v1.0/schedule/available-doctor?scheduleId=$scheduleId&clinicId=$clinicId');
      return AvailableDoctor.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  /// Добавить доктора в список избранных
  Future<bool> setDoctorToFavorites({
    required String userId,
    required String buildingId,
    required String clinicId,
    required String doctorId,
    required String categoryType,
  }) async {
    try {
      final response = await _dioClient.post(
        '/api/v1.0/profile/favorite-doctor',
        data: {
          'doctorId': doctorId,
          'categoryType': categoryType,
          'userId': userId,
          'clinicId': clinicId,
          'buildingId': buildingId,
        },
      );
      return response.statusCode == 200 ? true : false;
    } catch (err) {
      rethrow;
    }
  }

  /// Удалить доктора из избранного
  Future<bool> deleteDoctorFromFavorites({
    required String userId,
    required String doctorId,
    required String categoryType,
  }) async {
    try {
      final response = await _dioClient.delete(
          '/api/v1.0/profile/favorite-doctor/$doctorId?userId=$userId&categoryType=$categoryType');
      return response.statusCode == 200 ? true : false;
    } catch (err) {
      rethrow;
    }
  }

  Future<DoctorInfoDataModel> getDoctorInfoData({
    required String doctorId,
    required int categoryTypeId,
  }) async {
    try {
      final response = await _dioClient
          .get('/api/v1.0/doctors/$doctorId?categoryTypeId=$categoryTypeId');
      return DoctorInfoDataModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
