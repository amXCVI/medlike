// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarModel _$$_CalendarModelFromJson(Map<String, dynamic> json) =>
    _$_CalendarModel(
      date: DateTime.parse(json['date'] as String),
      hasAvailableCells: json['hasAvailableCells'] as bool,
      hasLogs: json['hasLogs'] as bool,
    );

Map<String, dynamic> _$$_CalendarModelToJson(_$_CalendarModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'hasAvailableCells': instance.hasAvailableCells,
      'hasLogs': instance.hasLogs,
    };

_$_TimetableCellModel _$$_TimetableCellModelFromJson(
        Map<String, dynamic> json) =>
    _$_TimetableCellModel(
      time: const TimestampConverter().fromJson(json['time'] as String),
      scheduleId: json['scheduleId'] as String,
      cabinetName: json['cabinetName'] as String,
      buildingId: json['buildingId'] as String,
      doctorAvailable: json['doctorAvailable'] as bool,
    );

Map<String, dynamic> _$$_TimetableCellModelToJson(
        _$_TimetableCellModel instance) =>
    <String, dynamic>{
      'time': const TimestampConverter().toJson(instance.time),
      'scheduleId': instance.scheduleId,
      'cabinetName': instance.cabinetName,
      'buildingId': instance.buildingId,
      'doctorAvailable': instance.doctorAvailable,
    };

_$_TimetableLogModel _$$_TimetableLogModelFromJson(Map<String, dynamic> json) =>
    _$_TimetableLogModel(
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_TimetableLogModelToJson(
        _$_TimetableLogModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'description': instance.description,
    };

_$_TimetableResponseModel _$$_TimetableResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_TimetableResponseModel(
      cells: (json['cells'] as List<dynamic>)
          .map((e) => TimetableCellModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      logs: (json['logs'] as List<dynamic>)
          .map((e) => TimetableLogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TimetableResponseModelToJson(
        _$_TimetableResponseModel instance) =>
    <String, dynamic>{
      'cells': instance.cells,
      'logs': instance.logs,
    };

_$_CheckAndLockCellModel _$$_CheckAndLockCellModelFromJson(
        Map<String, dynamic> json) =>
    _$_CheckAndLockCellModel(
      duration: json['duration'] as int,
      information: json['information'] as String?,
    );

Map<String, dynamic> _$$_CheckAndLockCellModelToJson(
        _$_CheckAndLockCellModel instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'information': instance.information,
    };

_$_UnlockCellModel _$$_UnlockCellModelFromJson(Map<String, dynamic> json) =>
    _$_UnlockCellModel(
      result: json['result'] as bool,
      information: json['information'] as String?,
    );

Map<String, dynamic> _$$_UnlockCellModelToJson(_$_UnlockCellModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'information': instance.information,
    };
