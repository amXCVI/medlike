import 'package:freezed_annotation'
    '/freezed_annotation.dart';
import 'package:medlike/utils/helpers/timestamp_converter.dart';

part 'notification_models.freezed.dart';

part 'notification_models.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String title,
    required String description,
    @TimestampConverter() required DateTime eventDate,
    required int eventsCount,
    required String userId,
    required String eventType,
    String? entityId,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?> json) =>
      _$NotificationModelFromJson(json);
}
