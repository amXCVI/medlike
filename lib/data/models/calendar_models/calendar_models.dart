import 'package:freezed_annotation'
    '/freezed_annotation.dart';
import 'package:intl/intl.dart';

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
    @TimestampConverter() required DateTime time,
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

@freezed
class CheckAndLockCellModel with _$CheckAndLockCellModel {
  const factory CheckAndLockCellModel({
    required int duration,
    required String? information,
  }) = _CheckAndLockCellModel;

  factory CheckAndLockCellModel.fromJson(Map<String, Object?> json) =>
      _$CheckAndLockCellModelFromJson(json);
}

@freezed
class UnlockCellModel with _$UnlockCellModel {
  const factory UnlockCellModel({
    required bool result,
    required String? information,
  }) = _UnlockCellModel;

  factory UnlockCellModel.fromJson(Map<String, Object?> json) =>
      _$UnlockCellModelFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime, String> {
  const TimestampConverter();

  @override
  DateTime fromJson(String timestamp) {
    var df = DateFormat("yyyy-mm-ddTHH:mm:ssz");
    return df.parse(timestamp);
  }

  @override
  String toJson(DateTime date) => date.toIso8601String();
}
