import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'smartapp_models.freezed.dart';
part 'smartapp_models.g.dart';

@freezed
class SmartappSendBotEventResponseModel
    with _$SmartappSendBotEventResponseModel {
  const factory SmartappSendBotEventResponseModel({
    required List<dynamic>? files,
    required SmartappSendBotEventPayloadModel payload,
    required String ref,
    required String type,
  }) = _SmartappSendBotEventResponseModel;

  factory SmartappSendBotEventResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventResponseModelFromJson(json);
}

@freezed
class SmartappSendBotEventPayloadModel with _$SmartappSendBotEventPayloadModel {
  const factory SmartappSendBotEventPayloadModel({
    required SmartappSendBotEventPayloadResultModel result,
    required String? status,
    required int? status_code,
  }) = _SmartappSendBotEventPayloadModel;

  factory SmartappSendBotEventPayloadModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventPayloadModelFromJson(json);
}

@freezed
class SmartappSendBotEventPayloadResultModel
    with _$SmartappSendBotEventPayloadResultModel {
  const factory SmartappSendBotEventPayloadResultModel({
    required dynamic content,
    required String status,
    required int status_code,
  }) = _SmartappSendBotEventPayloadResultModel;

  factory SmartappSendBotEventPayloadResultModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventPayloadResultModelFromJson(json);
}

@freezed
class SmartappSendBotEventTokenResponseModel
    with _$SmartappSendBotEventTokenResponseModel {
  const factory SmartappSendBotEventTokenResponseModel({
    required List<dynamic>? files,
    required SmartappSendBotEventTokenPayloadModel payload,
    required String? ref,
    required String? type,
  }) = _SmartappSendBotEventTokenResponseModel;

  factory SmartappSendBotEventTokenResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventTokenResponseModelFromJson(json);
}

@freezed
class SmartappSendBotEventTokenPayloadModel
    with _$SmartappSendBotEventTokenPayloadModel {
  const factory SmartappSendBotEventTokenPayloadModel({
    required dynamic result,
    required String? status,
  }) = _SmartappSendBotEventTokenPayloadModel;

  factory SmartappSendBotEventTokenPayloadModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventTokenPayloadModelFromJson(json);
}
