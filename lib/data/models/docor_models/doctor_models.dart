import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'doctor_models.freezed.dart';
part 'doctor_models.g.dart';

@freezed
class DoctorsResponseModel with _$DoctorsResponseModel {
  const factory DoctorsResponseModel({
    @JsonKey(name: 'navigationItems') List<NavigationItem>? navigationItems,
    @JsonKey(name: 'doctors') List<Doctor>? doctors,
    @JsonKey(name: 'researches') List<Research>? researches,
    @JsonKey(name: 'cabinets') List<Cabinet>? cabinets,
    int? price,
  }) = _DoctorsResponseModel;

  factory DoctorsResponseModel.fromJson(Map<String, Object?> json) =>
      _$DoctorsResponseModelFromJson(json);
}

@freezed
class Cabinet with _$Cabinet {
  const factory Cabinet({
    required String id,
    @JsonKey(name: 'cabinet_name') String? cabinetName,
    int? price,
}) = _Cabinet;

  factory Cabinet.fromJson(Map<String, Object?> json) =>
      _$CabinetFromJson(json);
}

@freezed
class NavigationItemCabinet with _$NavigationItemCabinet {
  const factory NavigationItemCabinet({
    required String oid,
    @JsonKey(name: 'cabinet_name') String? cabinetName,
  }) = _NavigationItemCabinet;

  factory NavigationItemCabinet.fromJson(Map<String, Object?> json) =>
      _$NavigationItemCabinetFromJson(json);
}

@freezed
class NavigationItem with _$NavigationItem {
  const factory NavigationItem({
    required String id,
    required String? name,
    required int? count,
    required int? categoryType,
    required bool? personalSchedule,
    required List<NavigationItemCabinet>? cabinets,
  }) = _NavigationItem;

  factory NavigationItem.fromJson(Map<String, Object?> json) =>
      _$NavigationItemFromJson(json);
}

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required String id,
    required String lastName,
    required String firstName,
    required String middleName,
    required String specializationId,
    required String specialization,
    required int price,
    required int categoryType,
    required bool isFavorite,
    required List<int> categories,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, Object?> json) =>
      _$DoctorFromJson(json);
}

@freezed
class Research with _$Research {
  const factory Research({
    required String id,
    required String name,
    required int price,
    required int categoryType,
    required int scheduleType,
    required String buildingId,
  }) = _Research;

  factory Research.fromJson(Map<String, Object?> json) =>
      _$ResearchFromJson(json);
}

@freezed
class FavoriteDoctor with _$FavoriteDoctor {
  const factory FavoriteDoctor({
    required String id,
    required String lastName,
    required String firstName,
    required String middleName,
    required String specializationId,
    required String specialization,
    required int categoryType,
  }) = _FavoriteDoctor;

  factory FavoriteDoctor.fromJson(Map<String, Object?> json) =>
      _$FavoriteDoctorFromJson(json);
}