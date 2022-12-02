// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartapp_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SmartappSendBotEventResponseModel
    _$$_SmartappSendBotEventResponseModelFromJson(Map<String, dynamic> json) =>
        _$_SmartappSendBotEventResponseModel(
          files: json['files'] as List<dynamic>?,
          payload: SmartappSendBotEventPayloadModel.fromJson(
              json['payload'] as Map<String, dynamic>),
          ref: json['ref'] as String,
          type: json['type'] as String,
        );

Map<String, dynamic> _$$_SmartappSendBotEventResponseModelToJson(
        _$_SmartappSendBotEventResponseModel instance) =>
    <String, dynamic>{
      'files': instance.files,
      'payload': instance.payload,
      'ref': instance.ref,
      'type': instance.type,
    };

_$_SmartappSendBotEventPayloadModel
    _$$_SmartappSendBotEventPayloadModelFromJson(Map<String, dynamic> json) =>
        _$_SmartappSendBotEventPayloadModel(
          result: SmartappSendBotEventPayloadResultModel.fromJson(
              json['result'] as Map<String, dynamic>),
          status: json['status'] as String?,
          status_code: json['status_code'] as int?,
        );

Map<String, dynamic> _$$_SmartappSendBotEventPayloadModelToJson(
        _$_SmartappSendBotEventPayloadModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'status': instance.status,
      'status_code': instance.status_code,
    };

_$_SmartappSendBotEventPayloadResultModel
    _$$_SmartappSendBotEventPayloadResultModelFromJson(
            Map<String, dynamic> json) =>
        _$_SmartappSendBotEventPayloadResultModel(
          content: json['content'],
          status: json['status'] as String,
          status_code: json['status_code'] as int,
        );

Map<String, dynamic> _$$_SmartappSendBotEventPayloadResultModelToJson(
        _$_SmartappSendBotEventPayloadResultModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'status': instance.status,
      'status_code': instance.status_code,
    };

_$_SmartappSendBotEventTokenResponseModel
    _$$_SmartappSendBotEventTokenResponseModelFromJson(
            Map<String, dynamic> json) =>
        _$_SmartappSendBotEventTokenResponseModel(
          files: json['files'] as List<dynamic>?,
          payload: SmartappSendBotEventTokenPayloadModel.fromJson(
              json['payload'] as Map<String, dynamic>),
          ref: json['ref'] as String?,
          type: json['type'] as String?,
        );

Map<String, dynamic> _$$_SmartappSendBotEventTokenResponseModelToJson(
        _$_SmartappSendBotEventTokenResponseModel instance) =>
    <String, dynamic>{
      'files': instance.files,
      'payload': instance.payload,
      'ref': instance.ref,
      'type': instance.type,
    };

_$_SmartappSendBotEventTokenPayloadModel
    _$$_SmartappSendBotEventTokenPayloadModelFromJson(
            Map<String, dynamic> json) =>
        _$_SmartappSendBotEventTokenPayloadModel(
          result: json['result'],
          status: json['status'] as String?,
        );

Map<String, dynamic> _$$_SmartappSendBotEventTokenPayloadModelToJson(
        _$_SmartappSendBotEventTokenPayloadModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'status': instance.status,
    };
