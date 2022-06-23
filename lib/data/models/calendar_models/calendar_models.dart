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

@freezed
class TimetableCellModel with _$TimetableCellModel {
  const factory TimetableCellModel({
    required DateTime time,
    required String scheduleId,
    required String cabinetName,
    required String buildingId,
    required bool doctorAvailable,
  }) = _TimetableCellModel;

  factory TimetableCellModel.fromJson(Map<String, Object?> json) =>
      _$TimetableCellModelFromJson(json);
}

@freezed
class TimetableLogModel with _$TimetableLogModel {
  const factory TimetableLogModel({
    required DateTime date,
    required String description,
  }) = _TimetableLogModel;

  factory TimetableLogModel.fromJson(Map<String, Object?> json) =>
      _$TimetableLogModelFromJson(json);
}

@freezed
class TimetableResponseModel with _$TimetableResponseModel {
  const factory TimetableResponseModel({
    required List<TimetableCellModel> cells,
    required List<TimetableLogModel> logs,
  }) = _TimetableResponseModel;

  factory TimetableResponseModel.fromJson(Map<String, Object?> json) =>
      _$TimetableResponseModelFromJson(json);
}
