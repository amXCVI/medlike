// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartapp_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SmartappFileDataModel _$$_SmartappFileDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_SmartappFileDataModel(
      caption: json['caption'],
      chunkSize: json['chunkSize'] as int,
      duration: json['duration'],
      file: json['file'] as String,
      fileEncryptionAlgo: json['fileEncryptionAlgo'] as String,
      fileHash: json['fileHash'] as String,
      fileId: json['fileId'] as String,
      fileMimeType: json['fileMimeType'] as String,
      fileName: json['fileName'] as String,
      filePreview: json['filePreview'] as String?,
      filePreviewHeight: json['filePreviewHeight'] as String?,
      filePreviewWidth: json['filePreviewWidth'] as String?,
      fileSize: json['fileSize'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_SmartappFileDataModelToJson(
        _$_SmartappFileDataModel instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'chunkSize': instance.chunkSize,
      'duration': instance.duration,
      'file': instance.file,
      'fileEncryptionAlgo': instance.fileEncryptionAlgo,
      'fileHash': instance.fileHash,
      'fileId': instance.fileId,
      'fileMimeType': instance.fileMimeType,
      'fileName': instance.fileName,
      'filePreview': instance.filePreview,
      'filePreviewHeight': instance.filePreviewHeight,
      'filePreviewWidth': instance.filePreviewWidth,
      'fileSize': instance.fileSize,
      'type': instance.type,
    };

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
        );

Map<String, dynamic> _$$_SmartappSendBotEventPayloadModelToJson(
        _$_SmartappSendBotEventPayloadModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'status': instance.status,
    };

_$_SmartappSendBotEventPayloadResultModel
    _$$_SmartappSendBotEventPayloadResultModelFromJson(
            Map<String, dynamic> json) =>
        _$_SmartappSendBotEventPayloadResultModel(
          content: json['content'],
          status: json['status'] as String,
          statusCode: json['statusCode'] as int,
        );

Map<String, dynamic> _$$_SmartappSendBotEventPayloadResultModelToJson(
        _$_SmartappSendBotEventPayloadResultModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'status': instance.status,
      'statusCode': instance.statusCode,
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

_$_SmartappGetFileResponseModel _$$_SmartappGetFileResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SmartappGetFileResponseModel(
      type: json['type'] as String,
      filename: json['filename'] as String,
      size: json['size'] as String,
      isAsyncFile: json['is_async_file'] as String?,
      fileId: json['_file_id'] as String?,
      fileMimetype: json['_file_mimetype'] as String?,
      fileUrl: json['_file_url'] as String?,
      fileHash: json['_file_hash'] as String?,
    );

Map<String, dynamic> _$$_SmartappGetFileResponseModelToJson(
        _$_SmartappGetFileResponseModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'filename': instance.filename,
      'size': instance.size,
      'is_async_file': instance.isAsyncFile,
      '_file_id': instance.fileId,
      '_file_mimetype': instance.fileMimetype,
      '_file_url': instance.fileUrl,
      '_file_hash': instance.fileHash,
    };
