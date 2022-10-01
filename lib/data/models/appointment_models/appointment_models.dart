import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'appointment_models.freezed.dart';

part 'appointment_models.g.dart';

@freezed
class AppointmentModel with _$AppointmentModel {
  const factory AppointmentModel({
    required int status,
    required bool needConfirmation,
    required String? comment,
    required String researchPlace,
    required String id,
    required DateTime appointmentDateTime,
    required PatientInfoModel patientInfo,
    required ClinicInfoModel clinicInfo,
    required DoctorInfoModel doctorInfo,
    required List<ResearchesModel> researches,
    required int categoryType,
    required bool isVideo,
    required String payType,
    required bool isDraft,
    required String? orderId,
    required String scheduleId,
    required int paymentStatus,
    required String? recommendations,
  }) = _AppointmentModel;

  factory AppointmentModel.fromJson(Map<String, Object?> json) =>
      _$AppointmentModelFromJson(json);
}

@freezed
class PatientInfoModel with _$PatientInfoModel {
  const factory PatientInfoModel({
    required String? id,
    required String? name,
  }) = _PatientInfoModel;

  factory PatientInfoModel.fromJson(Map<String, Object?> json) =>
      _$PatientInfoModelFromJson(json);
}

@freezed
class ClinicInfoModel with _$ClinicInfoModel {
  const factory ClinicInfoModel({
    required String? id,
    required String? name,
    required String? address,
  }) = _ClinicInfoModel;

  factory ClinicInfoModel.fromJson(Map<String, Object?> json) =>
      _$ClinicInfoModelFromJson(json);
}

@freezed
class DoctorInfoModel with _$DoctorInfoModel {
  const factory DoctorInfoModel({
    required String? id,
    required String? firstName,
    required String? middleName,
    required String? lastName,
    required String? specializationId,
    required String? specialization,
  }) = _DoctorInfoModel;

  factory DoctorInfoModel.fromJson(Map<String, Object?> json) =>
      _$DoctorInfoModelFromJson(json);
}

@freezed
class ResearchesModel with _$ResearchesModel {
  const factory ResearchesModel({
    required String? id,
    required String? name,
  }) = _ResearchesModel;

  factory ResearchesModel.fromJson(Map<String, Object?> json) =>
      _$ResearchesModelFromJson(json);
}

@freezed
class AppointmentInfoModel with _$AppointmentInfoModel {
  const factory AppointmentInfoModel({
    required int price,
    required bool noPayment,
    required String serviceName,
    required String payType,
    required List<RecommendationItemModel> recommendations,
  }) = _AppointmentInfoModel;

  factory AppointmentInfoModel.fromJson(Map<String, Object?> json) =>
      _$AppointmentInfoModelFromJson(json);
}

@freezed
class RecommendationItemModel with _$RecommendationItemModel {
  const factory RecommendationItemModel({
    required String serviceId,
    required String serviceName,
    required String recommendation,
  }) = _RecommendationItemModel;

  factory RecommendationItemModel.fromJson(Map<String, Object?> json) =>
      _$RecommendationItemModelFromJson(json);
}

@freezed
class CreateNewAppointmentResponseModel with _$CreateNewAppointmentResponseModel {
  const factory CreateNewAppointmentResponseModel({
    required String result,
    required String information,
  }) = _CreateNewAppointmentResponseModel;

  factory CreateNewAppointmentResponseModel.fromJson(Map<String, Object?> json) =>
      _$CreateNewAppointmentResponseModelFromJson(json);
}

@freezed
class RegisterOrderResponseModel with _$RegisterOrderResponseModel {
  const factory RegisterOrderResponseModel({
    required bool result,
    required String paymentUrl,
    required String? error,
  }) = _RegisterOrderResponseModel;

  factory RegisterOrderResponseModel.fromJson(Map<String, Object?> json) =>
      _$RegisterOrderResponseModelFromJson(json);
}