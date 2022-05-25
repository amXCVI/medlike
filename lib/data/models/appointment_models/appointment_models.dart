import 'package:json_annotation/json_annotation.dart';

part 'appointment_models.g.dart';

@JsonSerializable()
class GetAppointmentsRequest {
  GetAppointmentsRequest(this.userId);

  final String userId;
}
