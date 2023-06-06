import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:mocktail/mocktail.dart';

class AppointmentsRepository {
  final _dioClient = Api().dio;

  Future<AppointmentModel> getLastAppointment() async {
    try {
      final response =
          await _dioClient.get('/api/v1.0/schedule/appointments/mainscreen');
      final appointment = response.data;
      return AppointmentModel.fromJson(appointment);
    } catch (err) {
      rethrow;
    }
  }

  Future<List<AppointmentModel>> getAppointmentsList() async {
    try {
      final response = await _dioClient.get('/api/v1.0/schedule/appointments');
      final List appointmentsList = response.data;
      return appointmentsList.map((e) => AppointmentModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> confirmAppointment({
    required String appointmentId,
    required String userId,
  }) async {
    try {
      final response = await _dioClient.put(
          '/api/v1.0/schedule/appointments/$appointmentId/confirm?userId=$userId');
      return response.statusCode == 200 ? true : false;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> deleteAppointment({
    required String appointmentId,
    required String userId,
  }) async {
    try {
      final response = await _dioClient.delete(
          '/api/v1.0/schedule/appointments/$appointmentId?userId=$userId');
      return response.statusCode == 200 ? true : false;
    } catch (err) {
      rethrow;
    }
  }

  Future<AppointmentModel> getAppointmentById({
    required String appointmentId,
    required String userId,
  }) async {
    try {
      final response = await _dioClient
          .get('/api/v1.0/schedule/appointments/$appointmentId?userId=$userId');
      final appointment = response.data;
      return AppointmentModel.fromJson(appointment);
    } catch (err) {
      rethrow;
    }
  }
}

class MockAppointmentsRepository extends Mock
    implements AppointmentsRepository {}
