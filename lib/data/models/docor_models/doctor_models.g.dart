// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DoctorsResponseModel _$$_DoctorsResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_DoctorsResponseModel(
      navigationItems: (json['navigationItems'] as List<dynamic>?)
          ?.map((e) => NavigationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      researches: (json['researches'] as List<dynamic>?)
          ?.map((e) => Research.fromJson(e as Map<String, dynamic>))
          .toList(),
      cabinets: (json['cabinets'] as List<dynamic>?)
          ?.map((e) => Cabinet.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as int?,
    );

Map<String, dynamic> _$$_DoctorsResponseModelToJson(
        _$_DoctorsResponseModel instance) =>
    <String, dynamic>{
      'navigationItems': instance.navigationItems,
      'doctors': instance.doctors,
      'researches': instance.researches,
      'cabinets': instance.cabinets,
      'price': instance.price,
    };

_$_Cabinet _$$_CabinetFromJson(Map<String, dynamic> json) => _$_Cabinet(
      id: json['id'] as String,
      cabinetName: json['cabinet_name'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$$_CabinetToJson(_$_Cabinet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cabinet_name': instance.cabinetName,
      'price': instance.price,
    };

_$_NavigationItemCabinet _$$_NavigationItemCabinetFromJson(
        Map<String, dynamic> json) =>
    _$_NavigationItemCabinet(
      oid: json['oid'] as String,
      cabinetName: json['cabinet_name'] as String?,
    );

Map<String, dynamic> _$$_NavigationItemCabinetToJson(
        _$_NavigationItemCabinet instance) =>
    <String, dynamic>{
      'oid': instance.oid,
      'cabinet_name': instance.cabinetName,
    };

_$_NavigationItem _$$_NavigationItemFromJson(Map<String, dynamic> json) =>
    _$_NavigationItem(
      id: json['id'] as String,
      name: json['name'] as String?,
      count: json['count'] as int?,
      categoryType: json['categoryType'] as int?,
      personalSchedule: json['personalSchedule'] as bool?,
      cabinetSchedule: json['cabinetSchedule'] as bool?,
      cabinets: (json['cabinets'] as List<dynamic>?)
          ?.map(
              (e) => NavigationItemCabinet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NavigationItemToJson(_$_NavigationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'categoryType': instance.categoryType,
      'personalSchedule': instance.personalSchedule,
      'cabinetSchedule': instance.cabinetSchedule,
      'cabinets': instance.cabinets,
    };

_$_Doctor _$$_DoctorFromJson(Map<String, dynamic> json) => _$_Doctor(
      id: json['id'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      specializationId: json['specializationId'] as String,
      specialization: json['specialization'] as String,
      price: json['price'] as int?,
      categoryType: json['categoryType'] as int,
      isFavorite: json['isFavorite'] as bool,
      categories:
          (json['categories'] as List<dynamic>).map((e) => e as int).toList(),
      imagePreviewLocation: json['imagePreviewLocation'] as String?,
      imageFullSizeLocation: json['imageFullSizeLocation'] as String?,
      avergareRating: json['avergareRating'] as num,
      shortinfo: json['shortinfo'] as String?,
      rateAsSotr: json['rateAsSotr'] as num,
      rateAsUser: json['rateAsUser'] as num,
    );

Map<String, dynamic> _$$_DoctorToJson(_$_Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'specializationId': instance.specializationId,
      'specialization': instance.specialization,
      'price': instance.price,
      'categoryType': instance.categoryType,
      'isFavorite': instance.isFavorite,
      'categories': instance.categories,
      'imagePreviewLocation': instance.imagePreviewLocation,
      'imageFullSizeLocation': instance.imageFullSizeLocation,
      'avergareRating': instance.avergareRating,
      'shortinfo': instance.shortinfo,
      'rateAsSotr': instance.rateAsSotr,
      'rateAsUser': instance.rateAsUser,
    };

_$_Research _$$_ResearchFromJson(Map<String, dynamic> json) => _$_Research(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as int?,
      categoryType: json['categoryType'] as int,
      scheduleType: json['scheduleType'] as int,
      buildingId: json['buildingId'] as String,
    );

Map<String, dynamic> _$$_ResearchToJson(_$_Research instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'categoryType': instance.categoryType,
      'scheduleType': instance.scheduleType,
      'buildingId': instance.buildingId,
    };

_$_FavoriteDoctor _$$_FavoriteDoctorFromJson(Map<String, dynamic> json) =>
    _$_FavoriteDoctor(
      id: json['id'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      specializationId: json['specializationId'] as String,
      specialization: json['specialization'] as String,
      categoryType: json['categoryType'] as int,
    );

Map<String, dynamic> _$$_FavoriteDoctorToJson(_$_FavoriteDoctor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'specializationId': instance.specializationId,
      'specialization': instance.specialization,
      'categoryType': instance.categoryType,
    };

_$_AssessmentModel _$$_AssessmentModelFromJson(Map<String, dynamic> json) =>
    _$_AssessmentModel(
      rating: json['rating'] as int,
      header: json['header'] as String,
      assessment: json['assessment'] as String,
      isPublic: json['isPublic'] as bool,
      user: json['user'] as String,
    );

Map<String, dynamic> _$$_AssessmentModelToJson(_$_AssessmentModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'header': instance.header,
      'assessment': instance.assessment,
      'isPublic': instance.isPublic,
      'user': instance.user,
    };
