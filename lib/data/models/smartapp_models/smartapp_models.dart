import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'smartapp_models.freezed.dart';
part 'smartapp_models.g.dart';

@freezed
class SmartappSendBotEventResponseModel with _$SmartappSendBotEventResponseModel {
  const factory SmartappSendBotEventResponseModel({
    required List<dynamic>? files,
    required SmartappSendBotEventPayloadModel payload,
    required String? ref,
    required String? type,

  }) = _SmartappSendBotEventResponseModel;

  factory SmartappSendBotEventResponseModel.fromJson(Map<String, Object?> json) =>
      _$SmartappSendBotEventResponseModelFromJson(json);
}

@freezed
class SmartappSendBotEventPayloadModel with _$SmartappSendBotEventPayloadModel {
  const factory SmartappSendBotEventPayloadModel({
    required dynamic result,
    required String? status,
  }) = _SmartappSendBotEventPayloadModel;

  factory SmartappSendBotEventPayloadModel.fromJson(Map<String, Object?> json) =>
      _$SmartappSendBotEventPayloadModelFromJson(json);
}