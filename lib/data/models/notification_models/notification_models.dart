import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'notification_models.freezed.dart';

part 'notification_models.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String title,
    required String description,
    required DateTime eventDate,
    required int eventsCount,
    required String userId,
    required String eventType,
    required String entityId,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?> json) =>
      _$NotificationModelFromJson(json);
}
