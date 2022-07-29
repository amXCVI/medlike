// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$FilterDateItemModelCopyWithImpl<$Res>;
  $Res call(
      {String label, DateTime startDate, DateTime endDate, Duration duration});
}

/// @nodoc
class _$FilterDateItemModelCopyWithImpl<$Res>
    implements $FilterDateItemModelCopyWith<$Res> {
  _$FilterDateItemModelCopyWithImpl(this._value, this._then);

  final FilterDateItemModel _value;
  // ignore: unused_field
  final $Res Function(FilterDateItemModel) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
abstract class _$$_FilterDateItemModelCopyWith<$Res>
    implements $FilterDateItemModelCopyWith<$Res> {
  factory _$$_FilterDateItemModelCopyWith(_$_FilterDateItemModel value,
          $Res Function(_$_FilterDateItemModel) then) =
      __$$_FilterDateItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label, DateTime startDate, DateTime endDate, Duration duration});
}

/// @nodoc
class __$$_FilterDateItemModelCopyWithImpl<$Res>
    extends _$FilterDateItemModelCopyWithImpl<$Res>
    implements _$$_FilterDateItemModelCopyWith<$Res> {
  __$$_FilterDateItemModelCopyWithImpl(_$_FilterDateItemModel _value,
      $Res Function(_$_FilterDateItemModel) _then)
      : super(_value, (v) => _then(v as _$_FilterDateItemModel));

  @override
  _$_FilterDateItemModel get _value => super._value as _$_FilterDateItemModel;

  @override
  $Res call({
    Object? label = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_FilterDateItemModel(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: duration == freezed
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
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_FilterDateItemModelCopyWith<_$_FilterDateItemModel> get copyWith =>
      __$$_FilterDateItemModelCopyWithImpl<_$_FilterDateItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterDateItemModelToJson(this);
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
  String get label => throw _privateConstructorUsedError;
  @override
  DateTime get startDate => throw _privateConstructorUsedError;
  @override
  DateTime get endDate => throw _privateConstructorUsedError;
  @override
  Duration get duration => throw _privateConstructorUsedError;
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
      _$FilterCategoryItemModelCopyWithImpl<$Res>;
  $Res call({String label, String categoryName});
}

/// @nodoc
class _$FilterCategoryItemModelCopyWithImpl<$Res>
    implements $FilterCategoryItemModelCopyWith<$Res> {
  _$FilterCategoryItemModelCopyWithImpl(this._value, this._then);

  final FilterCategoryItemModel _value;
  // ignore: unused_field
  final $Res Function(FilterCategoryItemModel) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FilterCategoryItemModelCopyWith<$Res>
    implements $FilterCategoryItemModelCopyWith<$Res> {
  factory _$$_FilterCategoryItemModelCopyWith(_$_FilterCategoryItemModel value,
          $Res Function(_$_FilterCategoryItemModel) then) =
      __$$_FilterCategoryItemModelCopyWithImpl<$Res>;
  @override
  $Res call({String label, String categoryName});
}

/// @nodoc
class __$$_FilterCategoryItemModelCopyWithImpl<$Res>
    extends _$FilterCategoryItemModelCopyWithImpl<$Res>
    implements _$$_FilterCategoryItemModelCopyWith<$Res> {
  __$$_FilterCategoryItemModelCopyWithImpl(_$_FilterCategoryItemModel _value,
      $Res Function(_$_FilterCategoryItemModel) _then)
      : super(_value, (v) => _then(v as _$_FilterCategoryItemModel));

  @override
  _$_FilterCategoryItemModel get _value =>
      super._value as _$_FilterCategoryItemModel;

  @override
  $Res call({
    Object? label = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_$_FilterCategoryItemModel(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
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
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(categoryName));

  @JsonKey(ignore: true)
  @override
  _$$_FilterCategoryItemModelCopyWith<_$_FilterCategoryItemModel>
      get copyWith =>
          __$$_FilterCategoryItemModelCopyWithImpl<_$_FilterCategoryItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterCategoryItemModelToJson(this);
  }
}

abstract class _FilterCategoryItemModel implements FilterCategoryItemModel {
  const factory _FilterCategoryItemModel(
      {required final String label,
      required final String categoryName}) = _$_FilterCategoryItemModel;

  factory _FilterCategoryItemModel.fromJson(Map<String, dynamic> json) =
      _$_FilterCategoryItemModel.fromJson;

  @override
  String get label => throw _privateConstructorUsedError;
  @override
  String get categoryName => throw _privateConstructorUsedError;
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
      _$MedcardFiltersItemModelCopyWithImpl<$Res>;
  $Res call(
      {String label,
      String? categoryName,
      DateTime? startDate,
      DateTime? endDate,
      Duration? duration});
}

/// @nodoc
class _$MedcardFiltersItemModelCopyWithImpl<$Res>
    implements $MedcardFiltersItemModelCopyWith<$Res> {
  _$MedcardFiltersItemModelCopyWithImpl(this._value, this._then);

  final MedcardFiltersItemModel _value;
  // ignore: unused_field
  final $Res Function(MedcardFiltersItemModel) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? categoryName = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
abstract class _$$_MedcardFiltersItemModelCopyWith<$Res>
    implements $MedcardFiltersItemModelCopyWith<$Res> {
  factory _$$_MedcardFiltersItemModelCopyWith(_$_MedcardFiltersItemModel value,
          $Res Function(_$_MedcardFiltersItemModel) then) =
      __$$_MedcardFiltersItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label,
      String? categoryName,
      DateTime? startDate,
      DateTime? endDate,
      Duration? duration});
}

/// @nodoc
class __$$_MedcardFiltersItemModelCopyWithImpl<$Res>
    extends _$MedcardFiltersItemModelCopyWithImpl<$Res>
    implements _$$_MedcardFiltersItemModelCopyWith<$Res> {
  __$$_MedcardFiltersItemModelCopyWithImpl(_$_MedcardFiltersItemModel _value,
      $Res Function(_$_MedcardFiltersItemModel) _then)
      : super(_value, (v) => _then(v as _$_MedcardFiltersItemModel));

  @override
  _$_MedcardFiltersItemModel get _value =>
      super._value as _$_MedcardFiltersItemModel;

  @override
  $Res call({
    Object? label = freezed,
    Object? categoryName = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_MedcardFiltersItemModel(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: duration == freezed
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
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(categoryName),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_MedcardFiltersItemModelCopyWith<_$_MedcardFiltersItemModel>
      get copyWith =>
          __$$_MedcardFiltersItemModelCopyWithImpl<_$_MedcardFiltersItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedcardFiltersItemModelToJson(this);
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
  String get label => throw _privateConstructorUsedError;
  @override
  String? get categoryName => throw _privateConstructorUsedError;
  @override
  DateTime? get startDate => throw _privateConstructorUsedError;
  @override
  DateTime? get endDate => throw _privateConstructorUsedError;
  @override
  Duration? get duration => throw _privateConstructorUsedError;
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
      _$MedcardDocsModelCopyWithImpl<$Res>;
  $Res call(
      {String mdocId,
      String section,
      String prescId,
      String nameDoc,
      DateTime dateSign,
      DateTime lastModifiedDate});
}

/// @nodoc
class _$MedcardDocsModelCopyWithImpl<$Res>
    implements $MedcardDocsModelCopyWith<$Res> {
  _$MedcardDocsModelCopyWithImpl(this._value, this._then);

  final MedcardDocsModel _value;
  // ignore: unused_field
  final $Res Function(MedcardDocsModel) _then;

  @override
  $Res call({
    Object? mdocId = freezed,
    Object? section = freezed,
    Object? prescId = freezed,
    Object? nameDoc = freezed,
    Object? dateSign = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      mdocId: mdocId == freezed
          ? _value.mdocId
          : mdocId // ignore: cast_nullable_to_non_nullable
              as String,
      section: section == freezed
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      prescId: prescId == freezed
          ? _value.prescId
          : prescId // ignore: cast_nullable_to_non_nullable
              as String,
      nameDoc: nameDoc == freezed
          ? _value.nameDoc
          : nameDoc // ignore: cast_nullable_to_non_nullable
              as String,
      dateSign: dateSign == freezed
          ? _value.dateSign
          : dateSign // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedDate: lastModifiedDate == freezed
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_MedcardDocsModelCopyWith<$Res>
    implements $MedcardDocsModelCopyWith<$Res> {
  factory _$$_MedcardDocsModelCopyWith(
          _$_MedcardDocsModel value, $Res Function(_$_MedcardDocsModel) then) =
      __$$_MedcardDocsModelCopyWithImpl<$Res>;
  @override
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
    extends _$MedcardDocsModelCopyWithImpl<$Res>
    implements _$$_MedcardDocsModelCopyWith<$Res> {
  __$$_MedcardDocsModelCopyWithImpl(
      _$_MedcardDocsModel _value, $Res Function(_$_MedcardDocsModel) _then)
      : super(_value, (v) => _then(v as _$_MedcardDocsModel));

  @override
  _$_MedcardDocsModel get _value => super._value as _$_MedcardDocsModel;

  @override
  $Res call({
    Object? mdocId = freezed,
    Object? section = freezed,
    Object? prescId = freezed,
    Object? nameDoc = freezed,
    Object? dateSign = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_$_MedcardDocsModel(
      mdocId: mdocId == freezed
          ? _value.mdocId
          : mdocId // ignore: cast_nullable_to_non_nullable
              as String,
      section: section == freezed
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      prescId: prescId == freezed
          ? _value.prescId
          : prescId // ignore: cast_nullable_to_non_nullable
              as String,
      nameDoc: nameDoc == freezed
          ? _value.nameDoc
          : nameDoc // ignore: cast_nullable_to_non_nullable
              as String,
      dateSign: dateSign == freezed
          ? _value.dateSign
          : dateSign // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedDate: lastModifiedDate == freezed
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
            const DeepCollectionEquality().equals(other.mdocId, mdocId) &&
            const DeepCollectionEquality().equals(other.section, section) &&
            const DeepCollectionEquality().equals(other.prescId, prescId) &&
            const DeepCollectionEquality().equals(other.nameDoc, nameDoc) &&
            const DeepCollectionEquality().equals(other.dateSign, dateSign) &&
            const DeepCollectionEquality()
                .equals(other.lastModifiedDate, lastModifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mdocId),
      const DeepCollectionEquality().hash(section),
      const DeepCollectionEquality().hash(prescId),
      const DeepCollectionEquality().hash(nameDoc),
      const DeepCollectionEquality().hash(dateSign),
      const DeepCollectionEquality().hash(lastModifiedDate));

  @JsonKey(ignore: true)
  @override
  _$$_MedcardDocsModelCopyWith<_$_MedcardDocsModel> get copyWith =>
      __$$_MedcardDocsModelCopyWithImpl<_$_MedcardDocsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedcardDocsModelToJson(this);
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
  String get mdocId => throw _privateConstructorUsedError;
  @override
  String get section => throw _privateConstructorUsedError;
  @override
  String get prescId => throw _privateConstructorUsedError;
  @override
  String get nameDoc => throw _privateConstructorUsedError;
  @override
  DateTime get dateSign => throw _privateConstructorUsedError;
  @override
  DateTime get lastModifiedDate => throw _privateConstructorUsedError;
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
      _$MedcardUserFileModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String filename,
      String type,
      DateTime uploadDate,
      int length,
      bool hasPreview});
}

/// @nodoc
class _$MedcardUserFileModelCopyWithImpl<$Res>
    implements $MedcardUserFileModelCopyWith<$Res> {
  _$MedcardUserFileModelCopyWithImpl(this._value, this._then);

  final MedcardUserFileModel _value;
  // ignore: unused_field
  final $Res Function(MedcardUserFileModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? filename = freezed,
    Object? type = freezed,
    Object? uploadDate = freezed,
    Object? length = freezed,
    Object? hasPreview = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: uploadDate == freezed
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreview: hasPreview == freezed
          ? _value.hasPreview
          : hasPreview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MedcardUserFileModelCopyWith<$Res>
    implements $MedcardUserFileModelCopyWith<$Res> {
  factory _$$_MedcardUserFileModelCopyWith(_$_MedcardUserFileModel value,
          $Res Function(_$_MedcardUserFileModel) then) =
      __$$_MedcardUserFileModelCopyWithImpl<$Res>;
  @override
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
    extends _$MedcardUserFileModelCopyWithImpl<$Res>
    implements _$$_MedcardUserFileModelCopyWith<$Res> {
  __$$_MedcardUserFileModelCopyWithImpl(_$_MedcardUserFileModel _value,
      $Res Function(_$_MedcardUserFileModel) _then)
      : super(_value, (v) => _then(v as _$_MedcardUserFileModel));

  @override
  _$_MedcardUserFileModel get _value => super._value as _$_MedcardUserFileModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? filename = freezed,
    Object? type = freezed,
    Object? uploadDate = freezed,
    Object? length = freezed,
    Object? hasPreview = freezed,
  }) {
    return _then(_$_MedcardUserFileModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: uploadDate == freezed
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreview: hasPreview == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.filename, filename) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.uploadDate, uploadDate) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality()
                .equals(other.hasPreview, hasPreview));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(filename),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(uploadDate),
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(hasPreview));

  @JsonKey(ignore: true)
  @override
  _$$_MedcardUserFileModelCopyWith<_$_MedcardUserFileModel> get copyWith =>
      __$$_MedcardUserFileModelCopyWithImpl<_$_MedcardUserFileModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedcardUserFileModelToJson(this);
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
  String get id => throw _privateConstructorUsedError;
  @override
  String get filename => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  DateTime get uploadDate => throw _privateConstructorUsedError;
  @override
  int get length => throw _privateConstructorUsedError;
  @override
  bool get hasPreview => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MedcardUserFileModelCopyWith<_$_MedcardUserFileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
