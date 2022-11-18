// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartapp_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SmartappSendBotEventResponseModel
    _$$_SmartappSendBotEventResponseModelFromJson(Map<String, dynamic> json) =>
        _$_SmartappSendBotEventResponseModel(
          files: json['files'] as List<dynamic>,
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
          result: json['result'],
          status: json['status'] as String,
        );

Map<String, dynamic> _$$_SmartappSendBotEventPayloadModelToJson(
        _$_SmartappSendBotEventPayloadModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'status': instance.status,
    };
