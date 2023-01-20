import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'smartapp_models.freezed.dart';
part 'smartapp_models.g.dart';

// const response =  {
//   ref: 'string',
//   type: 'string',
//   payload: {
//     status: 'string',
//     result: {
//       status: 'string',
//       status_code: 'int',
//       content: 'data'
//     }
//   }
// }

@freezed
class SmartappFileDataModel with _$SmartappFileDataModel {
  const factory SmartappFileDataModel({
    required dynamic? caption,
    required int? chunkSize,
    required dynamic? duration,
    required String? file,
    required String? fileEncryptionAlgo,
    required String? fileHash,
    required String? fileId,
    required String? fileMimeType,
    required String? fileName,
    required String? filePreview,
    required dynamic? filePreviewHeight,
    required dynamic? filePreviewWidth,
    required int? fileSize,
    required String? type,
  }) = _SmartappFileDataModel;

  factory SmartappFileDataModel.fromJson(Map<String, Object?> json) =>
      _$SmartappFileDataModelFromJson(json);
}

@freezed
class SmartappSendBotEventResponseModel
    with _$SmartappSendBotEventResponseModel {
  const factory SmartappSendBotEventResponseModel({
    required List<SmartappFileDataModel>? files,
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
  }) = _SmartappSendBotEventPayloadModel;

  factory SmartappSendBotEventPayloadModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventPayloadModelFromJson(json);
}

@freezed
class SmartappSendBotEventPayloadResultModel
    with _$SmartappSendBotEventPayloadResultModel {
  const factory SmartappSendBotEventPayloadResultModel({
    required dynamic? content,
    required String status,
    required int? code,
  }) = _SmartappSendBotEventPayloadResultModel;

  factory SmartappSendBotEventPayloadResultModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventPayloadResultModelFromJson(json);
}

@freezed
class SmartappSendBotEventStaticResponseModel
    with _$SmartappSendBotEventStaticResponseModel {
  const factory SmartappSendBotEventStaticResponseModel({
    required List<dynamic>? files,
    required SmartappSendBotEventStaticPayloadModel payload,
    required String ref,
    required String type,
  }) = _SmartappSendBotEventStaticResponseModel;

  factory SmartappSendBotEventStaticResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventStaticResponseModelFromJson(json);
}

@freezed
class SmartappSendBotEventStaticPayloadModel
    with _$SmartappSendBotEventStaticPayloadModel {
  const factory SmartappSendBotEventStaticPayloadModel({
    required SmartappSendBotEventStaticPayloadResultModel result,
    required String? status,
  }) = _SmartappSendBotEventStaticPayloadModel;

  factory SmartappSendBotEventStaticPayloadModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventStaticPayloadModelFromJson(json);
}

@freezed
class SmartappSendBotEventStaticPayloadResultModel
    with _$SmartappSendBotEventStaticPayloadResultModel {
  const factory SmartappSendBotEventStaticPayloadResultModel({
    required String path,
  }) = _SmartappSendBotEventStaticPayloadResultModel;

  factory SmartappSendBotEventStaticPayloadResultModel.fromJson(
          Map<String, Object?> json) =>
      _$SmartappSendBotEventStaticPayloadResultModelFromJson(json);
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

@freezed
class SmartappGetFileResponseModel with _$SmartappGetFileResponseModel {
  const factory SmartappGetFileResponseModel({
    required String type,
    required String filename,
    required String size,
    @JsonKey(name: 'is_async_file') String? isAsyncFile,
    @JsonKey(name: '_file_id') String? fileId,
    @JsonKey(name: '_file_mimetype') String? fileMimetype,
    @JsonKey(name: '_file_url') String? fileUrl,
    @JsonKey(name: '_file_hash') String? fileHash,
  }) = _SmartappGetFileResponseModel;

  factory SmartappGetFileResponseModel.fromJson(Map<String, Object?> json) =>
      _$SmartappGetFileResponseModelFromJson(json);
}
