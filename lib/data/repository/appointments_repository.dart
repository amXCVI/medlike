import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

class AppointmentsRepository {
  final _dioClient = Api().dio;

  Future<List<AppointmentModel>> getAppointmentsList() async {
    try {
      final response =
      await _dioClient.get('/api/v1.0/schedule/appointments');
      final List appointmentsList = response.data;
      return appointmentsList.map((e) => AppointmentModel.fromJson(e)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
