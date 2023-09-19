// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DocumentModelModel _$$_DocumentModelModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentModelModel(
      id: json['id'] as String,
      name: json['name'] as String,
      lpu: DocumentMetaLpuModel.fromJson(json['lpu'] as Map<String, dynamic>),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      patient: json['patient'] == null
          ? null
          : DocumentPatientModel.fromJson(
              json['patient'] as Map<String, dynamic>),
      isSignByPatient: json['isSignByPatient'] as bool,
      signedByPatientAt: json['signedByPatientAt'] == null
          ? null
          : DateTime.parse(json['signedByPatientAt'] as String),
      isSignByEmployee: json['isSignByEmployee'] as bool,
      signedByEmployeeAt: json['signedByEmployeeAt'] == null
          ? null
          : DateTime.parse(json['signedByEmployeeAt'] as String),
      isSignByClinic: json['isSignByClinic'] as bool,
      signedByClinicAt: json['signedByClinicAt'] == null
          ? null
          : DateTime.parse(json['signedByClinicAt'] as String),
    );

Map<String, dynamic> _$$_DocumentModelModelToJson(
        _$_DocumentModelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lpu': instance.lpu,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'patient': instance.patient,
      'isSignByPatient': instance.isSignByPatient,
      'signedByPatientAt': instance.signedByPatientAt?.toIso8601String(),
      'isSignByEmployee': instance.isSignByEmployee,
      'signedByEmployeeAt': instance.signedByEmployeeAt?.toIso8601String(),
      'isSignByClinic': instance.isSignByClinic,
      'signedByClinicAt': instance.signedByClinicAt?.toIso8601String(),
    };

_$_DocumentMetaModel _$$_DocumentMetaModelFromJson(Map<String, dynamic> json) =>
    _$_DocumentMetaModel(
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      lpu: DocumentMetaLpuModel.fromJson(json['lpu'] as Map<String, dynamic>),
      patient: DocumentMetaPatientModel.fromJson(
          json['patient'] as Map<String, dynamic>),
      documentCreator: json['documentCreator'] == null
          ? null
          : DocumentMetaDocumentCreatorModel.fromJson(
              json['documentCreator'] as Map<String, dynamic>),
      signEmployee: json['signEmployee'] == null
          ? null
          : DocumentMetaSignEmployerModel.fromJson(
              json['signEmployee'] as Map<String, dynamic>),
      signClinic: json['signClinic'] == null
          ? null
          : DocumentMetaSignClinicModel.fromJson(
              json['signClinic'] as Map<String, dynamic>),
      isSignByPatient: json['isSignByPatient'] as bool,
      signedByPatientAt: json['signedByPatientAt'] == null
          ? null
          : DateTime.parse(json['signedByPatientAt'] as String),
      isSignByEmployee: json['isSignByEmployee'] as bool,
      signedByEmployeeAt: json['signedByEmployeeAt'] == null
          ? null
          : DateTime.parse(json['signedByEmployeeAt'] as String),
      isSignByClinic: json['isSignByClinic'] as bool,
      signedByClinicAt: json['signedByClinicAt'] == null
          ? null
          : DateTime.parse(json['signedByClinicAt'] as String),
      signType: json['signType'] as int?,
      isAllowedToSign: json['isAllowedToSign'] as bool,
    );

Map<String, dynamic> _$$_DocumentMetaModelToJson(
        _$_DocumentMetaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'lpu': instance.lpu,
      'patient': instance.patient,
      'documentCreator': instance.documentCreator,
      'signEmployee': instance.signEmployee,
      'signClinic': instance.signClinic,
      'isSignByPatient': instance.isSignByPatient,
      'signedByPatientAt': instance.signedByPatientAt?.toIso8601String(),
      'isSignByEmployee': instance.isSignByEmployee,
      'signedByEmployeeAt': instance.signedByEmployeeAt?.toIso8601String(),
      'isSignByClinic': instance.isSignByClinic,
      'signedByClinicAt': instance.signedByClinicAt?.toIso8601String(),
      'signType': instance.signType,
      'isAllowedToSign': instance.isAllowedToSign,
    };

_$_DocumentMetaLpuModel _$$_DocumentMetaLpuModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentMetaLpuModel(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$_DocumentMetaLpuModelToJson(
        _$_DocumentMetaLpuModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };

_$_DocumentMetaPatientModel _$$_DocumentMetaPatientModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentMetaPatientModel(
      id: json['id'] as String,
      lastname: json['lastname'] as String,
      firstname: json['firstname'] as String,
      middlename: json['middlename'] as String,
      adresses: json['adresses'] as String?,
      birthday: DateTime.parse(json['birthday'] as String),
      sex: json['sex'] as String,
    );

Map<String, dynamic> _$$_DocumentMetaPatientModelToJson(
        _$_DocumentMetaPatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'middlename': instance.middlename,
      'adresses': instance.adresses,
      'birthday': instance.birthday.toIso8601String(),
      'sex': instance.sex,
    };

_$_DocumentMetaDocumentCreatorModel
    _$$_DocumentMetaDocumentCreatorModelFromJson(Map<String, dynamic> json) =>
        _$_DocumentMetaDocumentCreatorModel(
          firstname: json['firstname'] as String,
          middlename: json['middlename'] as String,
          lastname: json['lastname'] as String,
          jobTitle: json['jobTitle'] as String,
        );

Map<String, dynamic> _$$_DocumentMetaDocumentCreatorModelToJson(
        _$_DocumentMetaDocumentCreatorModel instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'middlename': instance.middlename,
      'lastname': instance.lastname,
      'jobTitle': instance.jobTitle,
    };

_$_DocumentMetaSignEmployerModel _$$_DocumentMetaSignEmployerModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentMetaSignEmployerModel(
      firstname: json['firstname'] as String,
      middlename: json['middlename'] as String,
      lastname: json['lastname'] as String,
      validFrom: DateTime.parse(json['validFrom'] as String),
      validTo: DateTime.parse(json['validTo'] as String),
      organization: json['organization'] as String,
      certNumber: json['certNumber'] as String,
    );

Map<String, dynamic> _$$_DocumentMetaSignEmployerModelToJson(
        _$_DocumentMetaSignEmployerModel instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'middlename': instance.middlename,
      'lastname': instance.lastname,
      'validFrom': instance.validFrom.toIso8601String(),
      'validTo': instance.validTo.toIso8601String(),
      'organization': instance.organization,
      'certNumber': instance.certNumber,
    };

_$_DocumentMetaSignClinicModel _$$_DocumentMetaSignClinicModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentMetaSignClinicModel(
      owner: json['owner'] as String,
      validFrom: DateTime.parse(json['validFrom'] as String),
      validTo: DateTime.parse(json['validTo'] as String),
      certNumber: json['certNumber'] as String,
      organization: json['organization'] as String,
    );

Map<String, dynamic> _$$_DocumentMetaSignClinicModelToJson(
        _$_DocumentMetaSignClinicModel instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'validFrom': instance.validFrom.toIso8601String(),
      'validTo': instance.validTo.toIso8601String(),
      'certNumber': instance.certNumber,
      'organization': instance.organization,
    };

_$_DocumentPatientModel _$$_DocumentPatientModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentPatientModel(
      id: json['id'] as String,
      firstname: json['firstname'] as String,
      middlename: json['middlename'] as String,
      lastname: json['lastname'] as String,
    );

Map<String, dynamic> _$$_DocumentPatientModelToJson(
        _$_DocumentPatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'middlename': instance.middlename,
      'lastname': instance.lastname,
    };

_$_DocumentFilterItemModel _$$_DocumentFilterItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentFilterItemModel(
      label: json['label'] as String,
      value: json['value'] as String,
      categoryLabel: json['categoryLabel'] as String,
    );

Map<String, dynamic> _$$_DocumentFilterItemModelToJson(
        _$_DocumentFilterItemModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'categoryLabel': instance.categoryLabel,
    };

_$_DocumentFilterModel _$$_DocumentFilterModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentFilterModel(
      title: json['title'] as String,
      value: json['value'] as String,
      filters: (json['filters'] as List<dynamic>)
          .map((e) =>
              DocumentFilterItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DocumentFilterModelToJson(
        _$_DocumentFilterModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
      'filters': instance.filters,
    };
