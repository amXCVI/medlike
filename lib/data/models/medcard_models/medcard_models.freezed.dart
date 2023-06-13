// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medcard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilterDateItemModel _$FilterDateItemModelFromJson(Map<String, dynamic> json) {
  return _FilterDateItemModel.fromJson(json);
}

/// @nodoc
mixin _$FilterDateItemModel {
  String get label => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterDateItemModelCopyWith<FilterDateItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterDateItemModelCopyWith<$Res> {
  factory $FilterDateItemModelCopyWith(
          FilterDateItemModel value, $Res Function(FilterDateItemModel) then) =
      _$FilterDateItemModelCopyWithImpl<$Res, FilterDateItemModel>;
  @useResult
  $Res call(
      {String label, DateTime startDate, DateTime endDate, Duration duration});
}

/// @nodoc
class _$FilterDateItemModelCopyWithImpl<$Res, $Val extends FilterDateItemModel>
    implements $FilterDateItemModelCopyWith<$Res> {
  _$FilterDateItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterDateItemModelCopyWith<$Res>
    implements $FilterDateItemModelCopyWith<$Res> {
  factory _$$_FilterDateItemModelCopyWith(_$_FilterDateItemModel value,
          $Res Function(_$_FilterDateItemModel) then) =
      __$$_FilterDateItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label, DateTime startDate, DateTime endDate, Duration duration});
}

/// @nodoc
class __$$_FilterDateItemModelCopyWithImpl<$Res>
    extends _$FilterDateItemModelCopyWithImpl<$Res, _$_FilterDateItemModel>
    implements _$$_FilterDateItemModelCopyWith<$Res> {
  __$$_FilterDateItemModelCopyWithImpl(_$_FilterDateItemModel _value,
      $Res Function(_$_FilterDateItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? duration = null,
  }) {
    return _then(_$_FilterDateItemModel(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FilterDateItemModel implements _FilterDateItemModel {
  const _$_FilterDateItemModel(
      {required this.label,
      required this.startDate,
      required this.endDate,
      required this.duration});

  factory _$_FilterDateItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_FilterDateItemModelFromJson(json);

  @override
  final String label;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'FilterDateItemModel(label: $label, startDate: $startDate, endDate: $endDate, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterDateItemModel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, label, startDate, endDate, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterDateItemModelCopyWith<_$_FilterDateItemModel> get copyWith =>
      __$$_FilterDateItemModelCopyWithImpl<_$_FilterDateItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterDateItemModelToJson(
      this,
    );
  }
}

abstract class _FilterDateItemModel implements FilterDateItemModel {
  const factory _FilterDateItemModel(
      {required final String label,
      required final DateTime startDate,
      required final DateTime endDate,
      required final Duration duration}) = _$_FilterDateItemModel;

  factory _FilterDateItemModel.fromJson(Map<String, dynamic> json) =
      _$_FilterDateItemModel.fromJson;

  @override
  String get label;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_FilterDateItemModelCopyWith<_$_FilterDateItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

FilterCategoryItemModel _$FilterCategoryItemModelFromJson(
    Map<String, dynamic> json) {
  return _FilterCategoryItemModel.fromJson(json);
}

/// @nodoc
mixin _$FilterCategoryItemModel {
  String get label => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterCategoryItemModelCopyWith<FilterCategoryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCategoryItemModelCopyWith<$Res> {
  factory $FilterCategoryItemModelCopyWith(FilterCategoryItemModel value,
          $Res Function(FilterCategoryItemModel) then) =
      _$FilterCategoryItemModelCopyWithImpl<$Res, FilterCategoryItemModel>;
  @useResult
  $Res call({String label, String categoryName});
}

/// @nodoc
class _$FilterCategoryItemModelCopyWithImpl<$Res,
        $Val extends FilterCategoryItemModel>
    implements $FilterCategoryItemModelCopyWith<$Res> {
  _$FilterCategoryItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? categoryName = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterCategoryItemModelCopyWith<$Res>
    implements $FilterCategoryItemModelCopyWith<$Res> {
  factory _$$_FilterCategoryItemModelCopyWith(_$_FilterCategoryItemModel value,
          $Res Function(_$_FilterCategoryItemModel) then) =
      __$$_FilterCategoryItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String categoryName});
}

/// @nodoc
class __$$_FilterCategoryItemModelCopyWithImpl<$Res>
    extends _$FilterCategoryItemModelCopyWithImpl<$Res,
        _$_FilterCategoryItemModel>
    implements _$$_FilterCategoryItemModelCopyWith<$Res> {
  __$$_FilterCategoryItemModelCopyWithImpl(_$_FilterCategoryItemModel _value,
      $Res Function(_$_FilterCategoryItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? categoryName = null,
  }) {
    return _then(_$_FilterCategoryItemModel(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FilterCategoryItemModel implements _FilterCategoryItemModel {
  const _$_FilterCategoryItemModel(
      {required this.label, required this.categoryName});

  factory _$_FilterCategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_FilterCategoryItemModelFromJson(json);

  @override
  final String label;
  @override
  final String categoryName;

  @override
  String toString() {
    return 'FilterCategoryItemModel(label: $label, categoryName: $categoryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterCategoryItemModel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, categoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterCategoryItemModelCopyWith<_$_FilterCategoryItemModel>
      get copyWith =>
          __$$_FilterCategoryItemModelCopyWithImpl<_$_FilterCategoryItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterCategoryItemModelToJson(
      this,
    );
  }
}

abstract class _FilterCategoryItemModel implements FilterCategoryItemModel {
  const factory _FilterCategoryItemModel(
      {required final String label,
      required final String categoryName}) = _$_FilterCategoryItemModel;

  factory _FilterCategoryItemModel.fromJson(Map<String, dynamic> json) =
      _$_FilterCategoryItemModel.fromJson;

  @override
  String get label;
  @override
  String get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$_FilterCategoryItemModelCopyWith<_$_FilterCategoryItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

MedcardFiltersItemModel _$MedcardFiltersItemModelFromJson(
    Map<String, dynamic> json) {
  return _MedcardFiltersItemModel.fromJson(json);
}

/// @nodoc
mixin _$MedcardFiltersItemModel {
  String get label => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedcardFiltersItemModelCopyWith<MedcardFiltersItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedcardFiltersItemModelCopyWith<$Res> {
  factory $MedcardFiltersItemModelCopyWith(MedcardFiltersItemModel value,
          $Res Function(MedcardFiltersItemModel) then) =
      _$MedcardFiltersItemModelCopyWithImpl<$Res, MedcardFiltersItemModel>;
  @useResult
  $Res call(
      {String label,
      String? categoryName,
      DateTime? startDate,
      DateTime? endDate,
      Duration? duration});
}

/// @nodoc
class _$MedcardFiltersItemModelCopyWithImpl<$Res,
        $Val extends MedcardFiltersItemModel>
    implements $MedcardFiltersItemModelCopyWith<$Res> {
  _$MedcardFiltersItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? categoryName = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedcardFiltersItemModelCopyWith<$Res>
    implements $MedcardFiltersItemModelCopyWith<$Res> {
  factory _$$_MedcardFiltersItemModelCopyWith(_$_MedcardFiltersItemModel value,
          $Res Function(_$_MedcardFiltersItemModel) then) =
      __$$_MedcardFiltersItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      String? categoryName,
      DateTime? startDate,
      DateTime? endDate,
      Duration? duration});
}

/// @nodoc
class __$$_MedcardFiltersItemModelCopyWithImpl<$Res>
    extends _$MedcardFiltersItemModelCopyWithImpl<$Res,
        _$_MedcardFiltersItemModel>
    implements _$$_MedcardFiltersItemModelCopyWith<$Res> {
  __$$_MedcardFiltersItemModelCopyWithImpl(_$_MedcardFiltersItemModel _value,
      $Res Function(_$_MedcardFiltersItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? categoryName = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_MedcardFiltersItemModel(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedcardFiltersItemModel implements _MedcardFiltersItemModel {
  const _$_MedcardFiltersItemModel(
      {required this.label,
      this.categoryName,
      this.startDate,
      this.endDate,
      this.duration});

  factory _$_MedcardFiltersItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_MedcardFiltersItemModelFromJson(json);

  @override
  final String label;
  @override
  final String? categoryName;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final Duration? duration;

  @override
  String toString() {
    return 'MedcardFiltersItemModel(label: $label, categoryName: $categoryName, startDate: $startDate, endDate: $endDate, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedcardFiltersItemModel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, label, categoryName, startDate, endDate, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedcardFiltersItemModelCopyWith<_$_MedcardFiltersItemModel>
      get copyWith =>
          __$$_MedcardFiltersItemModelCopyWithImpl<_$_MedcardFiltersItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedcardFiltersItemModelToJson(
      this,
    );
  }
}

abstract class _MedcardFiltersItemModel implements MedcardFiltersItemModel {
  const factory _MedcardFiltersItemModel(
      {required final String label,
      final String? categoryName,
      final DateTime? startDate,
      final DateTime? endDate,
      final Duration? duration}) = _$_MedcardFiltersItemModel;

  factory _MedcardFiltersItemModel.fromJson(Map<String, dynamic> json) =
      _$_MedcardFiltersItemModel.fromJson;

  @override
  String get label;
  @override
  String? get categoryName;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  Duration? get duration;
  @override
  @JsonKey(ignore: true)
  _$$_MedcardFiltersItemModelCopyWith<_$_MedcardFiltersItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

MedcardDocsModel _$MedcardDocsModelFromJson(Map<String, dynamic> json) {
  return _MedcardDocsModel.fromJson(json);
}

/// @nodoc
mixin _$MedcardDocsModel {
  String get mdocId => throw _privateConstructorUsedError;
  String get section => throw _privateConstructorUsedError;
  String get prescId => throw _privateConstructorUsedError;
  String get nameDoc => throw _privateConstructorUsedError;
  DateTime get dateSign => throw _privateConstructorUsedError;
  DateTime get lastModifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedcardDocsModelCopyWith<MedcardDocsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedcardDocsModelCopyWith<$Res> {
  factory $MedcardDocsModelCopyWith(
          MedcardDocsModel value, $Res Function(MedcardDocsModel) then) =
      _$MedcardDocsModelCopyWithImpl<$Res, MedcardDocsModel>;
  @useResult
  $Res call(
      {String mdocId,
      String section,
      String prescId,
      String nameDoc,
      DateTime dateSign,
      DateTime lastModifiedDate});
}

/// @nodoc
class _$MedcardDocsModelCopyWithImpl<$Res, $Val extends MedcardDocsModel>
    implements $MedcardDocsModelCopyWith<$Res> {
  _$MedcardDocsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mdocId = null,
    Object? section = null,
    Object? prescId = null,
    Object? nameDoc = null,
    Object? dateSign = null,
    Object? lastModifiedDate = null,
  }) {
    return _then(_value.copyWith(
      mdocId: null == mdocId
          ? _value.mdocId
          : mdocId // ignore: cast_nullable_to_non_nullable
              as String,
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      prescId: null == prescId
          ? _value.prescId
          : prescId // ignore: cast_nullable_to_non_nullable
              as String,
      nameDoc: null == nameDoc
          ? _value.nameDoc
          : nameDoc // ignore: cast_nullable_to_non_nullable
              as String,
      dateSign: null == dateSign
          ? _value.dateSign
          : dateSign // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedDate: null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedcardDocsModelCopyWith<$Res>
    implements $MedcardDocsModelCopyWith<$Res> {
  factory _$$_MedcardDocsModelCopyWith(
          _$_MedcardDocsModel value, $Res Function(_$_MedcardDocsModel) then) =
      __$$_MedcardDocsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mdocId,
      String section,
      String prescId,
      String nameDoc,
      DateTime dateSign,
      DateTime lastModifiedDate});
}

/// @nodoc
class __$$_MedcardDocsModelCopyWithImpl<$Res>
    extends _$MedcardDocsModelCopyWithImpl<$Res, _$_MedcardDocsModel>
    implements _$$_MedcardDocsModelCopyWith<$Res> {
  __$$_MedcardDocsModelCopyWithImpl(
      _$_MedcardDocsModel _value, $Res Function(_$_MedcardDocsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mdocId = null,
    Object? section = null,
    Object? prescId = null,
    Object? nameDoc = null,
    Object? dateSign = null,
    Object? lastModifiedDate = null,
  }) {
    return _then(_$_MedcardDocsModel(
      mdocId: null == mdocId
          ? _value.mdocId
          : mdocId // ignore: cast_nullable_to_non_nullable
              as String,
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      prescId: null == prescId
          ? _value.prescId
          : prescId // ignore: cast_nullable_to_non_nullable
              as String,
      nameDoc: null == nameDoc
          ? _value.nameDoc
          : nameDoc // ignore: cast_nullable_to_non_nullable
              as String,
      dateSign: null == dateSign
          ? _value.dateSign
          : dateSign // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedDate: null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedcardDocsModel implements _MedcardDocsModel {
  const _$_MedcardDocsModel(
      {required this.mdocId,
      required this.section,
      required this.prescId,
      required this.nameDoc,
      required this.dateSign,
      required this.lastModifiedDate});

  factory _$_MedcardDocsModel.fromJson(Map<String, dynamic> json) =>
      _$$_MedcardDocsModelFromJson(json);

  @override
  final String mdocId;
  @override
  final String section;
  @override
  final String prescId;
  @override
  final String nameDoc;
  @override
  final DateTime dateSign;
  @override
  final DateTime lastModifiedDate;

  @override
  String toString() {
    return 'MedcardDocsModel(mdocId: $mdocId, section: $section, prescId: $prescId, nameDoc: $nameDoc, dateSign: $dateSign, lastModifiedDate: $lastModifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedcardDocsModel &&
            (identical(other.mdocId, mdocId) || other.mdocId == mdocId) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.prescId, prescId) || other.prescId == prescId) &&
            (identical(other.nameDoc, nameDoc) || other.nameDoc == nameDoc) &&
            (identical(other.dateSign, dateSign) ||
                other.dateSign == dateSign) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mdocId, section, prescId,
      nameDoc, dateSign, lastModifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedcardDocsModelCopyWith<_$_MedcardDocsModel> get copyWith =>
      __$$_MedcardDocsModelCopyWithImpl<_$_MedcardDocsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedcardDocsModelToJson(
      this,
    );
  }
}

abstract class _MedcardDocsModel implements MedcardDocsModel {
  const factory _MedcardDocsModel(
      {required final String mdocId,
      required final String section,
      required final String prescId,
      required final String nameDoc,
      required final DateTime dateSign,
      required final DateTime lastModifiedDate}) = _$_MedcardDocsModel;

  factory _MedcardDocsModel.fromJson(Map<String, dynamic> json) =
      _$_MedcardDocsModel.fromJson;

  @override
  String get mdocId;
  @override
  String get section;
  @override
  String get prescId;
  @override
  String get nameDoc;
  @override
  DateTime get dateSign;
  @override
  DateTime get lastModifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_MedcardDocsModelCopyWith<_$_MedcardDocsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MedcardUserFileModel _$MedcardUserFileModelFromJson(Map<String, dynamic> json) {
  return _MedcardUserFileModel.fromJson(json);
}

/// @nodoc
mixin _$MedcardUserFileModel {
  String get id => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get uploadDate => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  bool get hasPreview => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedcardUserFileModelCopyWith<MedcardUserFileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedcardUserFileModelCopyWith<$Res> {
  factory $MedcardUserFileModelCopyWith(MedcardUserFileModel value,
          $Res Function(MedcardUserFileModel) then) =
      _$MedcardUserFileModelCopyWithImpl<$Res, MedcardUserFileModel>;
  @useResult
  $Res call(
      {String id,
      String filename,
      String type,
      DateTime uploadDate,
      int length,
      bool hasPreview});
}

/// @nodoc
class _$MedcardUserFileModelCopyWithImpl<$Res,
        $Val extends MedcardUserFileModel>
    implements $MedcardUserFileModelCopyWith<$Res> {
  _$MedcardUserFileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? type = null,
    Object? uploadDate = null,
    Object? length = null,
    Object? hasPreview = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreview: null == hasPreview
          ? _value.hasPreview
          : hasPreview // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedcardUserFileModelCopyWith<$Res>
    implements $MedcardUserFileModelCopyWith<$Res> {
  factory _$$_MedcardUserFileModelCopyWith(_$_MedcardUserFileModel value,
          $Res Function(_$_MedcardUserFileModel) then) =
      __$$_MedcardUserFileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String filename,
      String type,
      DateTime uploadDate,
      int length,
      bool hasPreview});
}

/// @nodoc
class __$$_MedcardUserFileModelCopyWithImpl<$Res>
    extends _$MedcardUserFileModelCopyWithImpl<$Res, _$_MedcardUserFileModel>
    implements _$$_MedcardUserFileModelCopyWith<$Res> {
  __$$_MedcardUserFileModelCopyWithImpl(_$_MedcardUserFileModel _value,
      $Res Function(_$_MedcardUserFileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? type = null,
    Object? uploadDate = null,
    Object? length = null,
    Object? hasPreview = null,
  }) {
    return _then(_$_MedcardUserFileModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreview: null == hasPreview
          ? _value.hasPreview
          : hasPreview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedcardUserFileModel implements _MedcardUserFileModel {
  const _$_MedcardUserFileModel(
      {required this.id,
      required this.filename,
      required this.type,
      required this.uploadDate,
      required this.length,
      required this.hasPreview});

  factory _$_MedcardUserFileModel.fromJson(Map<String, dynamic> json) =>
      _$$_MedcardUserFileModelFromJson(json);

  @override
  final String id;
  @override
  final String filename;
  @override
  final String type;
  @override
  final DateTime uploadDate;
  @override
  final int length;
  @override
  final bool hasPreview;

  @override
  String toString() {
    return 'MedcardUserFileModel(id: $id, filename: $filename, type: $type, uploadDate: $uploadDate, length: $length, hasPreview: $hasPreview)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedcardUserFileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.hasPreview, hasPreview) ||
                other.hasPreview == hasPreview));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, filename, type, uploadDate, length, hasPreview);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedcardUserFileModelCopyWith<_$_MedcardUserFileModel> get copyWith =>
      __$$_MedcardUserFileModelCopyWithImpl<_$_MedcardUserFileModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedcardUserFileModelToJson(
      this,
    );
  }
}

abstract class _MedcardUserFileModel implements MedcardUserFileModel {
  const factory _MedcardUserFileModel(
      {required final String id,
      required final String filename,
      required final String type,
      required final DateTime uploadDate,
      required final int length,
      required final bool hasPreview}) = _$_MedcardUserFileModel;

  factory _MedcardUserFileModel.fromJson(Map<String, dynamic> json) =
      _$_MedcardUserFileModel.fromJson;

  @override
  String get id;
  @override
  String get filename;
  @override
  String get type;
  @override
  DateTime get uploadDate;
  @override
  int get length;
  @override
  bool get hasPreview;
  @override
  @JsonKey(ignore: true)
  _$$_MedcardUserFileModelCopyWith<_$_MedcardUserFileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteUserFileResponseModel _$DeleteUserFileResponseModelFromJson(
    Map<String, dynamic> json) {
  return _DeleteUserFileResponseModel.fromJson(json);
}

/// @nodoc
mixin _$DeleteUserFileResponseModel {
  bool get result => throw _privateConstructorUsedError;
  String? get information => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteUserFileResponseModelCopyWith<DeleteUserFileResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserFileResponseModelCopyWith<$Res> {
  factory $DeleteUserFileResponseModelCopyWith(
          DeleteUserFileResponseModel value,
          $Res Function(DeleteUserFileResponseModel) then) =
      _$DeleteUserFileResponseModelCopyWithImpl<$Res,
          DeleteUserFileResponseModel>;
  @useResult
  $Res call({bool result, String? information});
}

/// @nodoc
class _$DeleteUserFileResponseModelCopyWithImpl<$Res,
        $Val extends DeleteUserFileResponseModel>
    implements $DeleteUserFileResponseModelCopyWith<$Res> {
  _$DeleteUserFileResponseModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_DeleteUserFileResponseModelCopyWith<$Res>
    implements $DeleteUserFileResponseModelCopyWith<$Res> {
  factory _$$_DeleteUserFileResponseModelCopyWith(
          _$_DeleteUserFileResponseModel value,
          $Res Function(_$_DeleteUserFileResponseModel) then) =
      __$$_DeleteUserFileResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool result, String? information});
}

/// @nodoc
class __$$_DeleteUserFileResponseModelCopyWithImpl<$Res>
    extends _$DeleteUserFileResponseModelCopyWithImpl<$Res,
        _$_DeleteUserFileResponseModel>
    implements _$$_DeleteUserFileResponseModelCopyWith<$Res> {
  __$$_DeleteUserFileResponseModelCopyWithImpl(
      _$_DeleteUserFileResponseModel _value,
      $Res Function(_$_DeleteUserFileResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? information = freezed,
  }) {
    return _then(_$_DeleteUserFileResponseModel(
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
class _$_DeleteUserFileResponseModel implements _DeleteUserFileResponseModel {
  const _$_DeleteUserFileResponseModel(
      {required this.result, required this.information});

  factory _$_DeleteUserFileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeleteUserFileResponseModelFromJson(json);

  @override
  final bool result;
  @override
  final String? information;

  @override
  String toString() {
    return 'DeleteUserFileResponseModel(result: $result, information: $information)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteUserFileResponseModel &&
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
  _$$_DeleteUserFileResponseModelCopyWith<_$_DeleteUserFileResponseModel>
      get copyWith => __$$_DeleteUserFileResponseModelCopyWithImpl<
          _$_DeleteUserFileResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeleteUserFileResponseModelToJson(
      this,
    );
  }
}

abstract class _DeleteUserFileResponseModel
    implements DeleteUserFileResponseModel {
  const factory _DeleteUserFileResponseModel(
      {required final bool result,
      required final String? information}) = _$_DeleteUserFileResponseModel;

  factory _DeleteUserFileResponseModel.fromJson(Map<String, dynamic> json) =
      _$_DeleteUserFileResponseModel.fromJson;

  @override
  bool get result;
  @override
  String? get information;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteUserFileResponseModelCopyWith<_$_DeleteUserFileResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

MedcardFilterItemModel _$MedcardFilterItemModelFromJson(
    Map<String, dynamic> json) {
  return _MedcardFilterItemModel.fromJson(json);
}

/// @nodoc
mixin _$MedcardFilterItemModel {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get categoryLabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedcardFilterItemModelCopyWith<MedcardFilterItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedcardFilterItemModelCopyWith<$Res> {
  factory $MedcardFilterItemModelCopyWith(MedcardFilterItemModel value,
          $Res Function(MedcardFilterItemModel) then) =
      _$MedcardFilterItemModelCopyWithImpl<$Res, MedcardFilterItemModel>;
  @useResult
  $Res call({String label, String value, String categoryLabel});
}

/// @nodoc
class _$MedcardFilterItemModelCopyWithImpl<$Res,
        $Val extends MedcardFilterItemModel>
    implements $MedcardFilterItemModelCopyWith<$Res> {
  _$MedcardFilterItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? categoryLabel = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      categoryLabel: null == categoryLabel
          ? _value.categoryLabel
          : categoryLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedcardFilterItemModelCopyWith<$Res>
    implements $MedcardFilterItemModelCopyWith<$Res> {
  factory _$$_MedcardFilterItemModelCopyWith(_$_MedcardFilterItemModel value,
          $Res Function(_$_MedcardFilterItemModel) then) =
      __$$_MedcardFilterItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value, String categoryLabel});
}

/// @nodoc
class __$$_MedcardFilterItemModelCopyWithImpl<$Res>
    extends _$MedcardFilterItemModelCopyWithImpl<$Res,
        _$_MedcardFilterItemModel>
    implements _$$_MedcardFilterItemModelCopyWith<$Res> {
  __$$_MedcardFilterItemModelCopyWithImpl(_$_MedcardFilterItemModel _value,
      $Res Function(_$_MedcardFilterItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? categoryLabel = null,
  }) {
    return _then(_$_MedcardFilterItemModel(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      categoryLabel: null == categoryLabel
          ? _value.categoryLabel
          : categoryLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedcardFilterItemModel implements _MedcardFilterItemModel {
  const _$_MedcardFilterItemModel(
      {required this.label, required this.value, required this.categoryLabel});

  factory _$_MedcardFilterItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_MedcardFilterItemModelFromJson(json);

  @override
  final String label;
  @override
  final String value;
  @override
  final String categoryLabel;

  @override
  String toString() {
    return 'MedcardFilterItemModel(label: $label, value: $value, categoryLabel: $categoryLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedcardFilterItemModel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.categoryLabel, categoryLabel) ||
                other.categoryLabel == categoryLabel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value, categoryLabel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedcardFilterItemModelCopyWith<_$_MedcardFilterItemModel> get copyWith =>
      __$$_MedcardFilterItemModelCopyWithImpl<_$_MedcardFilterItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedcardFilterItemModelToJson(
      this,
    );
  }
}

abstract class _MedcardFilterItemModel implements MedcardFilterItemModel {
  const factory _MedcardFilterItemModel(
      {required final String label,
      required final String value,
      required final String categoryLabel}) = _$_MedcardFilterItemModel;

  factory _MedcardFilterItemModel.fromJson(Map<String, dynamic> json) =
      _$_MedcardFilterItemModel.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  String get categoryLabel;
  @override
  @JsonKey(ignore: true)
  _$$_MedcardFilterItemModelCopyWith<_$_MedcardFilterItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MedcardFilterModel _$MedcardFilterModelFromJson(Map<String, dynamic> json) {
  return _MedcardFilterModel.fromJson(json);
}

/// @nodoc
mixin _$MedcardFilterModel {
  String get title => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  List<MedcardFilterItemModel> get filters =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedcardFilterModelCopyWith<MedcardFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedcardFilterModelCopyWith<$Res> {
  factory $MedcardFilterModelCopyWith(
          MedcardFilterModel value, $Res Function(MedcardFilterModel) then) =
      _$MedcardFilterModelCopyWithImpl<$Res, MedcardFilterModel>;
  @useResult
  $Res call({String title, String value, List<MedcardFilterItemModel> filters});
}

/// @nodoc
class _$MedcardFilterModelCopyWithImpl<$Res, $Val extends MedcardFilterModel>
    implements $MedcardFilterModelCopyWith<$Res> {
  _$MedcardFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? filters = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<MedcardFilterItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedcardFilterModelCopyWith<$Res>
    implements $MedcardFilterModelCopyWith<$Res> {
  factory _$$_MedcardFilterModelCopyWith(_$_MedcardFilterModel value,
          $Res Function(_$_MedcardFilterModel) then) =
      __$$_MedcardFilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String value, List<MedcardFilterItemModel> filters});
}

/// @nodoc
class __$$_MedcardFilterModelCopyWithImpl<$Res>
    extends _$MedcardFilterModelCopyWithImpl<$Res, _$_MedcardFilterModel>
    implements _$$_MedcardFilterModelCopyWith<$Res> {
  __$$_MedcardFilterModelCopyWithImpl(
      _$_MedcardFilterModel _value, $Res Function(_$_MedcardFilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? filters = null,
  }) {
    return _then(_$_MedcardFilterModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<MedcardFilterItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedcardFilterModel implements _MedcardFilterModel {
  const _$_MedcardFilterModel(
      {required this.title,
      required this.value,
      required final List<MedcardFilterItemModel> filters})
      : _filters = filters;

  factory _$_MedcardFilterModel.fromJson(Map<String, dynamic> json) =>
      _$$_MedcardFilterModelFromJson(json);

  @override
  final String title;
  @override
  final String value;
  final List<MedcardFilterItemModel> _filters;
  @override
  List<MedcardFilterItemModel> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  String toString() {
    return 'MedcardFilterModel(title: $title, value: $value, filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedcardFilterModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, value, const DeepCollectionEquality().hash(_filters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedcardFilterModelCopyWith<_$_MedcardFilterModel> get copyWith =>
      __$$_MedcardFilterModelCopyWithImpl<_$_MedcardFilterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedcardFilterModelToJson(
      this,
    );
  }
}

abstract class _MedcardFilterModel implements MedcardFilterModel {
  const factory _MedcardFilterModel(
          {required final String title,
          required final String value,
          required final List<MedcardFilterItemModel> filters}) =
      _$_MedcardFilterModel;

  factory _MedcardFilterModel.fromJson(Map<String, dynamic> json) =
      _$_MedcardFilterModel.fromJson;

  @override
  String get title;
  @override
  String get value;
  @override
  List<MedcardFilterItemModel> get filters;
  @override
  @JsonKey(ignore: true)
  _$$_MedcardFilterModelCopyWith<_$_MedcardFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
