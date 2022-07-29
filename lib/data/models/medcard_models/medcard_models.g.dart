// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medcard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilterDateItemModel _$$_FilterDateItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_FilterDateItemModel(
      label: json['label'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      duration: Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$$_FilterDateItemModelToJson(
        _$_FilterDateItemModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
    };

_$_FilterCategoryItemModel _$$_FilterCategoryItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_FilterCategoryItemModel(
      label: json['label'] as String,
      categoryName: json['categoryName'] as String,
    );

Map<String, dynamic> _$$_FilterCategoryItemModelToJson(
        _$_FilterCategoryItemModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'categoryName': instance.categoryName,
    };

_$_MedcardFiltersItemModel _$$_MedcardFiltersItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_MedcardFiltersItemModel(
      label: json['label'] as String,
      categoryName: json['categoryName'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$$_MedcardFiltersItemModelToJson(
        _$_MedcardFiltersItemModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'categoryName': instance.categoryName,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'duration': instance.duration?.inMicroseconds,
    };

_$_MedcardDocsModel _$$_MedcardDocsModelFromJson(Map<String, dynamic> json) =>
    _$_MedcardDocsModel(
      mdocId: json['mdocId'] as String,
      section: json['section'] as String,
      prescId: json['prescId'] as String,
      nameDoc: json['nameDoc'] as String,
      dateSign: DateTime.parse(json['dateSign'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_MedcardDocsModelToJson(_$_MedcardDocsModel instance) =>
    <String, dynamic>{
      'mdocId': instance.mdocId,
      'section': instance.section,
      'prescId': instance.prescId,
      'nameDoc': instance.nameDoc,
      'dateSign': instance.dateSign.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
    };

_$_MedcardUserFileModel _$$_MedcardUserFileModelFromJson(
        Map<String, dynamic> json) =>
    _$_MedcardUserFileModel(
      id: json['id'] as String,
      filename: json['filename'] as String,
      type: json['type'] as String,
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      length: json['length'] as int,
      hasPreview: json['hasPreview'] as bool,
    );

Map<String, dynamic> _$$_MedcardUserFileModelToJson(
        _$_MedcardUserFileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'type': instance.type,
      'uploadDate': instance.uploadDate.toIso8601String(),
      'length': instance.length,
      'hasPreview': instance.hasPreview,
    };
