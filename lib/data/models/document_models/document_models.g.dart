// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DocumentModelModel _$$_DocumentModelModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentModelModel(
      documentName: json['documentName'] as String,
      documentURL: json['documentURL'] as String,
      status: json['status'] as int,
      clinicAddress: json['clinicAddress'] as String,
      documentSubscribeDate:
          DateTime.parse(json['documentSubscribeDate'] as String),
      documentCreateDate: DateTime.parse(json['documentCreateDate'] as String),
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$$_DocumentModelModelToJson(
        _$_DocumentModelModel instance) =>
    <String, dynamic>{
      'documentName': instance.documentName,
      'documentURL': instance.documentURL,
      'status': instance.status,
      'clinicAddress': instance.clinicAddress,
      'documentSubscribeDate': instance.documentSubscribeDate.toIso8601String(),
      'documentCreateDate': instance.documentCreateDate.toIso8601String(),
      'userName': instance.userName,
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
