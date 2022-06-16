import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'calendar_models.freezed.dart';

part 'calendar_models.g.dart';

@freezed
class CalendarModel with _$CalendarModel {
  const factory CalendarModel({
    required DateTime date,
    required bool hasAvailableCells,
    required bool hasLogs,
  }) = _CalendarModel;

  factory CalendarModel.fromJson(Map<String, Object?> json) =>
      _$CalendarModelFromJson(json);
}
