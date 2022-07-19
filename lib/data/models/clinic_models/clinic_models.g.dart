// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AvailableClinic _$$_AvailableClinicFromJson(Map<String, dynamic> json) =>
    _$_AvailableClinic(
      name: json['name'] as String,
      departmentName: json['departmentName'] as String?,
      address: json['address'] as String,
      id: json['id'] as String,
      buildingId: json['buildingId'] as String,
      phone: (json['phone'] as List<dynamic>).map((e) => e as String).toList(),
      workTime:
          (json['workTime'] as List<dynamic>).map((e) => e as String).toList(),
      timeZoneOffset: json['timeZoneOffset'] as int,
    );

Map<String, dynamic> _$$_AvailableClinicToJson(_$_AvailableClinic instance) =>
    <String, dynamic>{
      'name': instance.name,
      'departmentName': instance.departmentName,
      'address': instance.address,
      'id': instance.id,
      'buildingId': instance.buildingId,
      'phone': instance.phone,
      'workTime': instance.workTime,
      'timeZoneOffset': instance.timeZoneOffset,
    };

_$_AvailableClinicsList _$$_AvailableClinicsListFromJson(
        Map<String, dynamic> json) =>
    _$_AvailableClinicsList(
      availableClinicsList: (json['availableClinicsList'] as List<dynamic>)
          .map((e) => AvailableClinic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AvailableClinicsListToJson(
        _$_AvailableClinicsList instance) =>
    <String, dynamic>{
      'availableClinicsList': instance.availableClinicsList,
    };

_$_ClinicModel _$$_ClinicModelFromJson(Map<String, dynamic> json) =>
    _$_ClinicModel(
      id: json['id'] as String,
      name: json['name'] as String,
      timeZoneOffset: json['timeZoneOffset'] as int?,
      buildings: (json['buildings'] as List<dynamic>)
          .map((e) => BuildingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ClinicModelToJson(_$_ClinicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'timeZoneOffset': instance.timeZoneOffset,
      'buildings': instance.buildings,
    };

_$_BuildingModel _$$_BuildingModelFromJson(Map<String, dynamic> json) =>
    _$_BuildingModel(
      name: json['name'] as String,
      departmentName: json['departmentName'] as String?,
      address: json['address'] as String,
      id: json['id'] as String,
      buildingId: json['buildingId'] as String,
      phone: (json['phone'] as List<dynamic>).map((e) => e as String).toList(),
      workTime:
          (json['workTime'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_BuildingModelToJson(_$_BuildingModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'departmentName': instance.departmentName,
      'address': instance.address,
      'id': instance.id,
      'buildingId': instance.buildingId,
      'phone': instance.phone,
      'workTime': instance.workTime,
    };

_$_PriceItemModel _$$_PriceItemModelFromJson(Map<String, dynamic> json) =>
    _$_PriceItemModel(
      title: json['title'] as String,
      price: json['price'] as int,
      haveRecommendations: json['haveRecommendations'] as bool,
      serviceId: json['serviceId'] as String,
    );

Map<String, dynamic> _$$_PriceItemModelToJson(_$_PriceItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'haveRecommendations': instance.haveRecommendations,
      'serviceId': instance.serviceId,
    };
