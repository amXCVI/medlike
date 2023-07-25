// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarModel _$CalendarModelFromJson(Map<String, dynamic> json) {
  return _CalendarModel.fromJson(json);
}

/// @nodoc
mixin _$CalendarModel {
  DateTime get date => throw _privateConstructorUsedError;
  bool get hasAvailableCells => throw _privateConstructorUsedError;
  bool get hasLogs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarModelCopyWith<CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarModelCopyWith<$Res> {
  factory $CalendarModelCopyWith(
          CalendarModel value, $Res Function(CalendarModel) then) =
      _$CalendarModelCopyWithImpl<$Res, CalendarModel>;
  @useResult
  $Res call({DateTime date, bool hasAvailableCells, bool hasLogs});
}

/// @nodoc
class _$CalendarModelCopyWithImpl<$Res, $Val extends CalendarModel>
    implements $CalendarModelCopyWith<$Res> {
  _$CalendarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? hasAvailableCells = null,
    Object? hasLogs = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasAvailableCells: null == hasAvailableCells
          ? _value.hasAvailableCells
          : hasAvailableCells // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLogs: null == hasLogs
          ? _value.hasLogs
          : hasLogs // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarModelCopyWith<$Res>
    implements $CalendarModelCopyWith<$Res> {
  factory _$$_CalendarModelCopyWith(
          _$_CalendarModel value, $Res Function(_$_CalendarModel) then) =
      __$$_CalendarModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, bool hasAvailableCells, bool hasLogs});
}

/// @nodoc
class __$$_CalendarModelCopyWithImpl<$Res>
    extends _$CalendarModelCopyWithImpl<$Res, _$_CalendarModel>
    implements _$$_CalendarModelCopyWith<$Res> {
  __$$_CalendarModelCopyWithImpl(
      _$_CalendarModel _value, $Res Function(_$_CalendarModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? hasAvailableCells = null,
    Object? hasLogs = null,
  }) {
    return _then(_$_CalendarModel(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasAvailableCells: null == hasAvailableCells
          ? _value.hasAvailableCells
          : hasAvailableCells // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLogs: null == hasLogs
          ? _value.hasLogs
          : hasLogs // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalendarModel implements _CalendarModel {
  const _$_CalendarModel(
      {required this.date,
      required this.hasAvailableCells,
      required this.hasLogs});

  factory _$_CalendarModel.fromJson(Map<String, dynamic> json) =>
      _$$_CalendarModelFromJson(json);

  @override
  final DateTime date;
  @override
  final bool hasAvailableCells;
  @override
  final bool hasLogs;

  @override
  String toString() {
    return 'CalendarModel(date: $date, hasAvailableCells: $hasAvailableCells, hasLogs: $hasLogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hasAvailableCells, hasAvailableCells) ||
                other.hasAvailableCells == hasAvailableCells) &&
            (identical(other.hasLogs, hasLogs) || other.hasLogs == hasLogs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, hasAvailableCells, hasLogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarModelCopyWith<_$_CalendarModel> get copyWith =>
      __$$_CalendarModelCopyWithImpl<_$_CalendarModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalendarModelToJson(
      this,
    );
  }
}

abstract class _CalendarModel implements CalendarModel {
  const factory _CalendarModel(
      {required final DateTime date,
      required final bool hasAvailableCells,
      required final bool hasLogs}) = _$_CalendarModel;

  factory _CalendarModel.fromJson(Map<String, dynamic> json) =
      _$_CalendarModel.fromJson;

  @override
  DateTime get date;
  @override
  bool get hasAvailableCells;
  @override
  bool get hasLogs;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarModelCopyWith<_$_CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TimetableCellModel _$TimetableCellModelFromJson(Map<String, dynamic> json) {
  return _TimetableCellModel.fromJson(json);
}

/// @nodoc
mixin _$TimetableCellModel {
  @TimestampConverter()
  DateTime get time => throw _privateConstructorUsedError;
  String get scheduleId => throw _privateConstructorUsedError;
  String get cabinetName => throw _privateConstructorUsedError;
  String get buildingId => throw _privateConstructorUsedError;
  bool get doctorAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableCellModelCopyWith<TimetableCellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableCellModelCopyWith<$Res> {
  factory $TimetableCellModelCopyWith(
          TimetableCellModel value, $Res Function(TimetableCellModel) then) =
      _$TimetableCellModelCopyWithImpl<$Res, TimetableCellModel>;
  @useResult
  $Res call(
      {@TimestampConverter() DateTime time,
      String scheduleId,
      String cabinetName,
      String buildingId,
      bool doctorAvailable});
}

/// @nodoc
class _$TimetableCellModelCopyWithImpl<$Res, $Val extends TimetableCellModel>
    implements $TimetableCellModelCopyWith<$Res> {
  _$TimetableCellModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? scheduleId = null,
    Object? cabinetName = null,
    Object? buildingId = null,
    Object? doctorAvailable = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: null == cabinetName
          ? _value.cabinetName
          : cabinetName // ignore: cast_nullable_to_non_nullable
              as String,
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorAvailable: null == doctorAvailable
          ? _value.doctorAvailable
          : doctorAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimetableCellModelCopyWith<$Res>
    implements $TimetableCellModelCopyWith<$Res> {
  factory _$$_TimetableCellModelCopyWith(_$_TimetableCellModel value,
          $Res Function(_$_TimetableCellModel) then) =
      __$$_TimetableCellModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampConverter() DateTime time,
      String scheduleId,
      String cabinetName,
      String buildingId,
      bool doctorAvailable});
}

/// @nodoc
class __$$_TimetableCellModelCopyWithImpl<$Res>
    extends _$TimetableCellModelCopyWithImpl<$Res, _$_TimetableCellModel>
    implements _$$_TimetableCellModelCopyWith<$Res> {
  __$$_TimetableCellModelCopyWithImpl(
      _$_TimetableCellModel _value, $Res Function(_$_TimetableCellModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? scheduleId = null,
    Object? cabinetName = null,
    Object? buildingId = null,
    Object? doctorAvailable = null,
  }) {
    return _then(_$_TimetableCellModel(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: null == cabinetName
          ? _value.cabinetName
          : cabinetName // ignore: cast_nullable_to_non_nullable
              as String,
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorAvailable: null == doctorAvailable
          ? _value.doctorAvailable
          : doctorAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimetableCellModel implements _TimetableCellModel {
  const _$_TimetableCellModel(
      {@TimestampConverter() required this.time,
      required this.scheduleId,
      required this.cabinetName,
      required this.buildingId,
      required this.doctorAvailable});

  factory _$_TimetableCellModel.fromJson(Map<String, dynamic> json) =>
      _$$_TimetableCellModelFromJson(json);

  @override
  @TimestampConverter()
  final DateTime time;
  @override
  final String scheduleId;
  @override
  final String cabinetName;
  @override
  final String buildingId;
  @override
  final bool doctorAvailable;

  @override
  String toString() {
    return 'TimetableCellModel(time: $time, scheduleId: $scheduleId, cabinetName: $cabinetName, buildingId: $buildingId, doctorAvailable: $doctorAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimetableCellModel &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.cabinetName, cabinetName) ||
                other.cabinetName == cabinetName) &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId) &&
            (identical(other.doctorAvailable, doctorAvailable) ||
                other.doctorAvailable == doctorAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, time, scheduleId, cabinetName, buildingId, doctorAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimetableCellModelCopyWith<_$_TimetableCellModel> get copyWith =>
      __$$_TimetableCellModelCopyWithImpl<_$_TimetableCellModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimetableCellModelToJson(
      this,
    );
  }
}

abstract class _TimetableCellModel implements TimetableCellModel {
  const factory _TimetableCellModel(
      {@TimestampConverter() required final DateTime time,
      required final String scheduleId,
      required final String cabinetName,
      required final String buildingId,
      required final bool doctorAvailable}) = _$_TimetableCellModel;

  factory _TimetableCellModel.fromJson(Map<String, dynamic> json) =
      _$_TimetableCellModel.fromJson;

  @override
  @TimestampConverter()
  DateTime get time;
  @override
  String get scheduleId;
  @override
  String get cabinetName;
  @override
  String get buildingId;
  @override
  bool get doctorAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_TimetableCellModelCopyWith<_$_TimetableCellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TimetableLogModel _$TimetableLogModelFromJson(Map<String, dynamic> json) {
  return _TimetableLogModel.fromJson(json);
}

/// @nodoc
mixin _$TimetableLogModel {
  DateTime get date => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableLogModelCopyWith<TimetableLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableLogModelCopyWith<$Res> {
  factory $TimetableLogModelCopyWith(
          TimetableLogModel value, $Res Function(TimetableLogModel) then) =
      _$TimetableLogModelCopyWithImpl<$Res, TimetableLogModel>;
  @useResult
  $Res call({DateTime date, String description});
}

/// @nodoc
class _$TimetableLogModelCopyWithImpl<$Res, $Val extends TimetableLogModel>
    implements $TimetableLogModelCopyWith<$Res> {
  _$TimetableLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimetableLogModelCopyWith<$Res>
    implements $TimetableLogModelCopyWith<$Res> {
  factory _$$_TimetableLogModelCopyWith(_$_TimetableLogModel value,
          $Res Function(_$_TimetableLogModel) then) =
      __$$_TimetableLogModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, String description});
}

/// @nodoc
class __$$_TimetableLogModelCopyWithImpl<$Res>
    extends _$TimetableLogModelCopyWithImpl<$Res, _$_TimetableLogModel>
    implements _$$_TimetableLogModelCopyWith<$Res> {
  __$$_TimetableLogModelCopyWithImpl(
      _$_TimetableLogModel _value, $Res Function(_$_TimetableLogModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? description = null,
  }) {
    return _then(_$_TimetableLogModel(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimetableLogModel implements _TimetableLogModel {
  const _$_TimetableLogModel({required this.date, required this.description});

  factory _$_TimetableLogModel.fromJson(Map<String, dynamic> json) =>
      _$$_TimetableLogModelFromJson(json);

  @override
  final DateTime date;
  @override
  final String description;

  @override
  String toString() {
    return 'TimetableLogModel(date: $date, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimetableLogModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimetableLogModelCopyWith<_$_TimetableLogModel> get copyWith =>
      __$$_TimetableLogModelCopyWithImpl<_$_TimetableLogModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimetableLogModelToJson(
      this,
    );
  }
}

abstract class _TimetableLogModel implements TimetableLogModel {
  const factory _TimetableLogModel(
      {required final DateTime date,
      required final String description}) = _$_TimetableLogModel;

  factory _TimetableLogModel.fromJson(Map<String, dynamic> json) =
      _$_TimetableLogModel.fromJson;

  @override
  DateTime get date;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_TimetableLogModelCopyWith<_$_TimetableLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TimetableResponseModel _$TimetableResponseModelFromJson(
    Map<String, dynamic> json) {
  return _TimetableResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TimetableResponseModel {
  List<TimetableCellModel> get cells => throw _privateConstructorUsedError;
  List<TimetableLogModel> get logs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableResponseModelCopyWith<TimetableResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableResponseModelCopyWith<$Res> {
  factory $TimetableResponseModelCopyWith(TimetableResponseModel value,
          $Res Function(TimetableResponseModel) then) =
      _$TimetableResponseModelCopyWithImpl<$Res, TimetableResponseModel>;
  @useResult
  $Res call({List<TimetableCellModel> cells, List<TimetableLogModel> logs});
}

/// @nodoc
class _$TimetableResponseModelCopyWithImpl<$Res,
        $Val extends TimetableResponseModel>
    implements $TimetableResponseModelCopyWith<$Res> {
  _$TimetableResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cells = null,
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      cells: null == cells
          ? _value.cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<TimetableCellModel>,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<TimetableLogModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimetableResponseModelCopyWith<$Res>
    implements $TimetableResponseModelCopyWith<$Res> {
  factory _$$_TimetableResponseModelCopyWith(_$_TimetableResponseModel value,
          $Res Function(_$_TimetableResponseModel) then) =
      __$$_TimetableResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TimetableCellModel> cells, List<TimetableLogModel> logs});
}

/// @nodoc
class __$$_TimetableResponseModelCopyWithImpl<$Res>
    extends _$TimetableResponseModelCopyWithImpl<$Res,
        _$_TimetableResponseModel>
    implements _$$_TimetableResponseModelCopyWith<$Res> {
  __$$_TimetableResponseModelCopyWithImpl(_$_TimetableResponseModel _value,
      $Res Function(_$_TimetableResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cells = null,
    Object? logs = null,
  }) {
    return _then(_$_TimetableResponseModel(
      cells: null == cells
          ? _value._cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<TimetableCellModel>,
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<TimetableLogModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimetableResponseModel implements _TimetableResponseModel {
  const _$_TimetableResponseModel(
      {required final List<TimetableCellModel> cells,
      required final List<TimetableLogModel> logs})
      : _cells = cells,
        _logs = logs;

  factory _$_TimetableResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_TimetableResponseModelFromJson(json);

  final List<TimetableCellModel> _cells;
  @override
  List<TimetableCellModel> get cells {
    if (_cells is EqualUnmodifiableListView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cells);
  }

  final List<TimetableLogModel> _logs;
  @override
  List<TimetableLogModel> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  String toString() {
    return 'TimetableResponseModel(cells: $cells, logs: $logs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimetableResponseModel &&
            const DeepCollectionEquality().equals(other._cells, _cells) &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cells),
      const DeepCollectionEquality().hash(_logs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimetableResponseModelCopyWith<_$_TimetableResponseModel> get copyWith =>
      __$$_TimetableResponseModelCopyWithImpl<_$_TimetableResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimetableResponseModelToJson(
      this,
    );
  }
}

abstract class _TimetableResponseModel implements TimetableResponseModel {
  const factory _TimetableResponseModel(
      {required final List<TimetableCellModel> cells,
      required final List<TimetableLogModel> logs}) = _$_TimetableResponseModel;

  factory _TimetableResponseModel.fromJson(Map<String, dynamic> json) =
      _$_TimetableResponseModel.fromJson;

  @override
  List<TimetableCellModel> get cells;
  @override
  List<TimetableLogModel> get logs;
  @override
  @JsonKey(ignore: true)
  _$$_TimetableResponseModelCopyWith<_$_TimetableResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckAndLockCellModel _$CheckAndLockCellModelFromJson(
    Map<String, dynamic> json) {
  return _CheckAndLockCellModel.fromJson(json);
}

/// @nodoc
mixin _$CheckAndLockCellModel {
  int get duration => throw _privateConstructorUsedError;
  String? get information => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckAndLockCellModelCopyWith<CheckAndLockCellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckAndLockCellModelCopyWith<$Res> {
  factory $CheckAndLockCellModelCopyWith(CheckAndLockCellModel value,
          $Res Function(CheckAndLockCellModel) then) =
      _$CheckAndLockCellModelCopyWithImpl<$Res, CheckAndLockCellModel>;
  @useResult
  $Res call({int duration, String? information});
}

/// @nodoc
class _$CheckAndLockCellModelCopyWithImpl<$Res,
        $Val extends CheckAndLockCellModel>
    implements $CheckAndLockCellModelCopyWith<$Res> {
  _$CheckAndLockCellModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? information = freezed,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      information: freezed == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckAndLockCellModelCopyWith<$Res>
    implements $CheckAndLockCellModelCopyWith<$Res> {
  factory _$$_CheckAndLockCellModelCopyWith(_$_CheckAndLockCellModel value,
          $Res Function(_$_CheckAndLockCellModel) then) =
      __$$_CheckAndLockCellModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int duration, String? information});
}

/// @nodoc
class __$$_CheckAndLockCellModelCopyWithImpl<$Res>
    extends _$CheckAndLockCellModelCopyWithImpl<$Res, _$_CheckAndLockCellModel>
    implements _$$_CheckAndLockCellModelCopyWith<$Res> {
  __$$_CheckAndLockCellModelCopyWithImpl(_$_CheckAndLockCellModel _value,
      $Res Function(_$_CheckAndLockCellModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? information = freezed,
  }) {
    return _then(_$_CheckAndLockCellModel(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      information: freezed == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckAndLockCellModel implements _CheckAndLockCellModel {
  const _$_CheckAndLockCellModel(
      {required this.duration, required this.information});

  factory _$_CheckAndLockCellModel.fromJson(Map<String, dynamic> json) =>
      _$$_CheckAndLockCellModelFromJson(json);

  @override
  final int duration;
  @override
  final String? information;

  @override
  String toString() {
    return 'CheckAndLockCellModel(duration: $duration, information: $information)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckAndLockCellModel &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.information, information) ||
                other.information == information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, duration, information);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckAndLockCellModelCopyWith<_$_CheckAndLockCellModel> get copyWith =>
      __$$_CheckAndLockCellModelCopyWithImpl<_$_CheckAndLockCellModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckAndLockCellModelToJson(
      this,
    );
  }
}

abstract class _CheckAndLockCellModel implements CheckAndLockCellModel {
  const factory _CheckAndLockCellModel(
      {required final int duration,
      required final String? information}) = _$_CheckAndLockCellModel;

  factory _CheckAndLockCellModel.fromJson(Map<String, dynamic> json) =
      _$_CheckAndLockCellModel.fromJson;

  @override
  int get duration;
  @override
  String? get information;
  @override
  @JsonKey(ignore: true)
  _$$_CheckAndLockCellModelCopyWith<_$_CheckAndLockCellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UnlockCellModel _$UnlockCellModelFromJson(Map<String, dynamic> json) {
  return _UnlockCellModel.fromJson(json);
}

/// @nodoc
mixin _$UnlockCellModel {
  bool get result => throw _privateConstructorUsedError;
  String? get information => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnlockCellModelCopyWith<UnlockCellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnlockCellModelCopyWith<$Res> {
  factory $UnlockCellModelCopyWith(
          UnlockCellModel value, $Res Function(UnlockCellModel) then) =
      _$UnlockCellModelCopyWithImpl<$Res, UnlockCellModel>;
  @useResult
  $Res call({bool result, String? information});
}

/// @nodoc
class _$UnlockCellModelCopyWithImpl<$Res, $Val extends UnlockCellModel>
    implements $UnlockCellModelCopyWith<$Res> {
  _$UnlockCellModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? information = freezed,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      information: freezed == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnlockCellModelCopyWith<$Res>
    implements $UnlockCellModelCopyWith<$Res> {
  factory _$$_UnlockCellModelCopyWith(
          _$_UnlockCellModel value, $Res Function(_$_UnlockCellModel) then) =
      __$$_UnlockCellModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool result, String? information});
}

/// @nodoc
class __$$_UnlockCellModelCopyWithImpl<$Res>
    extends _$UnlockCellModelCopyWithImpl<$Res, _$_UnlockCellModel>
    implements _$$_UnlockCellModelCopyWith<$Res> {
  __$$_UnlockCellModelCopyWithImpl(
      _$_UnlockCellModel _value, $Res Function(_$_UnlockCellModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? information = freezed,
  }) {
    return _then(_$_UnlockCellModel(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      information: freezed == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnlockCellModel implements _UnlockCellModel {
  const _$_UnlockCellModel({required this.result, required this.information});

  factory _$_UnlockCellModel.fromJson(Map<String, dynamic> json) =>
      _$$_UnlockCellModelFromJson(json);

  @override
  final bool result;
  @override
  final String? information;

  @override
  String toString() {
    return 'UnlockCellModel(result: $result, information: $information)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnlockCellModel &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.information, information) ||
                other.information == information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, information);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnlockCellModelCopyWith<_$_UnlockCellModel> get copyWith =>
      __$$_UnlockCellModelCopyWithImpl<_$_UnlockCellModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnlockCellModelToJson(
      this,
    );
  }
}

abstract class _UnlockCellModel implements UnlockCellModel {
  const factory _UnlockCellModel(
      {required final bool result,
      required final String? information}) = _$_UnlockCellModel;

  factory _UnlockCellModel.fromJson(Map<String, dynamic> json) =
      _$_UnlockCellModel.fromJson;

  @override
  bool get result;
  @override
  String? get information;
  @override
  @JsonKey(ignore: true)
  _$$_UnlockCellModelCopyWith<_$_UnlockCellModel> get copyWith =>
      throw _privateConstructorUsedError;
}
