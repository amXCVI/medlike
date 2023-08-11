// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentModel _$$_AppointmentModelFromJson(Map<String, dynamic> json) =>
    _$_AppointmentModel(
      status: json['status'] as int,
      needConfirmation: json['needConfirmation'] as bool,
      comment: json['comment'] as String?,
      researchPlace: json['researchPlace'] as String?,
      id: json['id'] as String,
      appointmentDateTime: json['appointmentDateTime'] as String,
      patientInfo: PatientInfoModel.fromJson(
          json['patientInfo'] as Map<String, dynamic>),
      clinicInfo:
          ClinicInfoModel.fromJson(json['clinicInfo'] as Map<String, dynamic>),
      doctorInfo:
          DoctorInfoModel.fromJson(json['doctorInfo'] as Map<String, dynamic>),
      researches: (json['researches'] as List<dynamic>)
          .map((e) => ResearchesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryType: json['categoryType'] as int,
      isVideo: json['isVideo'] as bool,
      payType: json['payType'] as String,
      isDraft: json['isDraft'] as bool,
      orderId: json['orderId'] as String?,
      scheduleId: json['scheduleId'] as String,
      paymentStatus: json['paymentStatus'] as int,
      recommendations: json['recommendations'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ResearchWidthPriceInAppointmentModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      checkURI: json['checkURI'] as String?,
      review: json['review'] == null
          ? null
          : AppointmentReviewModel.fromJson(
              json['review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppointmentModelToJson(_$_AppointmentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'needConfirmation': instance.needConfirmation,
      'comment': instance.comment,
      'researchPlace': instance.researchPlace,
      'id': instance.id,
      'appointmentDateTime': instance.appointmentDateTime,
      'patientInfo': instance.patientInfo,
      'clinicInfo': instance.clinicInfo,
      'doctorInfo': instance.doctorInfo,
      'researches': instance.researches,
      'categoryType': instance.categoryType,
      'isVideo': instance.isVideo,
      'payType': instance.payType,
      'isDraft': instance.isDraft,
      'orderId': instance.orderId,
      'scheduleId': instance.scheduleId,
      'paymentStatus': instance.paymentStatus,
      'recommendations': instance.recommendations,
      'items': instance.items,
      'checkURI': instance.checkURI,
      'review': instance.review,
    };

_$_AppointmentModelWithTimeZoneOffset
    _$$_AppointmentModelWithTimeZoneOffsetFromJson(Map<String, dynamic> json) =>
        _$_AppointmentModelWithTimeZoneOffset(
          status: json['status'] as int,
          needConfirmation: json['needConfirmation'] as bool,
          comment: json['comment'] as String?,
          researchPlace: json['researchPlace'] as String?,
          id: json['id'] as String,
          appointmentDateTime: const TimestampConverter()
              .fromJson(json['appointmentDateTime'] as String),
          timeZoneOffset: json['timeZoneOffset'] as int,
          patientInfo: PatientInfoModel.fromJson(
              json['patientInfo'] as Map<String, dynamic>),
          clinicInfo: ClinicInfoModel.fromJson(
              json['clinicInfo'] as Map<String, dynamic>),
          doctorInfo: DoctorInfoModel.fromJson(
              json['doctorInfo'] as Map<String, dynamic>),
          researches: (json['researches'] as List<dynamic>)
              .map((e) => ResearchesModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          categoryType: json['categoryType'] as int,
          isVideo: json['isVideo'] as bool,
          payType: json['payType'] as String,
          isDraft: json['isDraft'] as bool,
          orderId: json['orderId'] as String?,
          scheduleId: json['scheduleId'] as String,
          paymentStatus: json['paymentStatus'] as int,
          recommendations: json['recommendations'] as String?,
          items: (json['items'] as List<dynamic>?)
              ?.map((e) => ResearchWidthPriceInAppointmentModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          checkURI: json['checkURI'] as String?,
          review: json['review'] == null
              ? null
              : AppointmentReviewModel.fromJson(
                  json['review'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_AppointmentModelWithTimeZoneOffsetToJson(
        _$_AppointmentModelWithTimeZoneOffset instance) =>
    <String, dynamic>{
      'status': instance.status,
      'needConfirmation': instance.needConfirmation,
      'comment': instance.comment,
      'researchPlace': instance.researchPlace,
      'id': instance.id,
      'appointmentDateTime':
          const TimestampConverter().toJson(instance.appointmentDateTime),
      'timeZoneOffset': instance.timeZoneOffset,
      'patientInfo': instance.patientInfo,
      'clinicInfo': instance.clinicInfo,
      'doctorInfo': instance.doctorInfo,
      'researches': instance.researches,
      'categoryType': instance.categoryType,
      'isVideo': instance.isVideo,
      'payType': instance.payType,
      'isDraft': instance.isDraft,
      'orderId': instance.orderId,
      'scheduleId': instance.scheduleId,
      'paymentStatus': instance.paymentStatus,
      'recommendations': instance.recommendations,
      'items': instance.items,
      'checkURI': instance.checkURI,
      'review': instance.review,
    };

_$_PatientInfoModel _$$_PatientInfoModelFromJson(Map<String, dynamic> json) =>
    _$_PatientInfoModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_PatientInfoModelToJson(_$_PatientInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_ClinicInfoModel _$$_ClinicInfoModelFromJson(Map<String, dynamic> json) =>
    _$_ClinicInfoModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$_ClinicInfoModelToJson(_$_ClinicInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };

_$_AppointmentReviewModel _$$_AppointmentReviewModelFromJson(
        Map<String, dynamic> json) =>
    _$_AppointmentReviewModel(
      rate: json['rate'] as num,
      caption: json['caption'] as String,
      message: json['message'] as String,
      visibility: json['visibility'] as int,
    );

Map<String, dynamic> _$$_AppointmentReviewModelToJson(
        _$_AppointmentReviewModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'caption': instance.caption,
      'message': instance.message,
      'visibility': instance.visibility,
    };

_$_DoctorInfoModel _$$_DoctorInfoModelFromJson(Map<String, dynamic> json) =>
    _$_DoctorInfoModel(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      specializationId: json['specializationId'] as String?,
      specialization: json['specialization'] as String?,
      imageId: json['imageId'] as String?,
      shortInfo: json['shortInfo'] as String?,
      rateAsSotr: json['rateAsSotr'] as num?,
      rateAsUser: json['rateAsUser'] as num?,
    );

Map<String, dynamic> _$$_DoctorInfoModelToJson(_$_DoctorInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'specializationId': instance.specializationId,
      'specialization': instance.specialization,
      'imageId': instance.imageId,
      'shortInfo': instance.shortInfo,
      'rateAsSotr': instance.rateAsSotr,
      'rateAsUser': instance.rateAsUser,
    };

_$_ResearchesModel _$$_ResearchesModelFromJson(Map<String, dynamic> json) =>
    _$_ResearchesModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_ResearchesModelToJson(_$_ResearchesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_AppointmentInfoModel _$$_AppointmentInfoModelFromJson(
        Map<String, dynamic> json) =>
    _$_AppointmentInfoModel(
      price: json['price'] as int,
      noPayment: json['noPayment'] as bool,
      serviceName: json['serviceName'] as String,
      payType: json['payType'] as String,
      recommendations: (json['recommendations'] as List<dynamic>)
          .map((e) =>
              RecommendationItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AppointmentInfoModelToJson(
        _$_AppointmentInfoModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'noPayment': instance.noPayment,
      'serviceName': instance.serviceName,
      'payType': instance.payType,
      'recommendations': instance.recommendations,
    };

_$_RecommendationItemModel _$$_RecommendationItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_RecommendationItemModel(
      serviceId: json['serviceId'] as String,
      serviceName: json['serviceName'] as String,
      recommendation: json['recommendation'] as String,
    );

Map<String, dynamic> _$$_RecommendationItemModelToJson(
        _$_RecommendationItemModel instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'serviceName': instance.serviceName,
      'recommendation': instance.recommendation,
    };

_$_CreateNewAppointmentResponseModel
    _$$_CreateNewAppointmentResponseModelFromJson(Map<String, dynamic> json) =>
        _$_CreateNewAppointmentResponseModel(
          result: json['result'] as String,
          information: json['information'] as String,
        );

Map<String, dynamic> _$$_CreateNewAppointmentResponseModelToJson(
        _$_CreateNewAppointmentResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'information': instance.information,
    };

_$_RegisterOrderResponseModel _$$_RegisterOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_RegisterOrderResponseModel(
      result: json['result'] as bool,
      paymentUrl: json['paymentUrl'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_RegisterOrderResponseModelToJson(
        _$_RegisterOrderResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'paymentUrl': instance.paymentUrl,
      'error': instance.error,
    };

_$_ResearchWidthPriceInAppointmentModel
    _$$_ResearchWidthPriceInAppointmentModelFromJson(
            Map<String, dynamic> json) =>
        _$_ResearchWidthPriceInAppointmentModel(
          id: json['id'] as String?,
          service: json['service'] as String?,
          prescType: json['prescType'] as String?,
          price: json['price'] as int?,
          paid: json['paid'] as int?,
          billUslug: json['billUslug'] as String?,
          presc: json['presc'] as String?,
        );

Map<String, dynamic> _$$_ResearchWidthPriceInAppointmentModelToJson(
        _$_ResearchWidthPriceInAppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'prescType': instance.prescType,
      'price': instance.price,
      'paid': instance.paid,
      'billUslug': instance.billUslug,
      'presc': instance.presc,
    };
