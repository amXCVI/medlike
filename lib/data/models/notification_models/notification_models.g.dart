// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      eventDate:
          const TimestampConverter().fromJson(json['eventDate'] as String),
      eventsCount: json['eventsCount'] as int,
      userId: json['userId'] as String,
      eventType: json['eventType'] as String,
      entityId: json['entityId'] as String,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'eventDate': const TimestampConverter().toJson(instance.eventDate),
      'eventsCount': instance.eventsCount,
      'userId': instance.userId,
      'eventType': instance.eventType,
      'entityId': instance.entityId,
    };
