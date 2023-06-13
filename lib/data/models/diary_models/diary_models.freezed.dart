// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryCategoryModel _$DiaryCategoryModelFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$DiaryCategoryModel {
  String get synonim => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<double> get minValue => throw _privateConstructorUsedError;
  List<double> get maxValue => throw _privateConstructorUsedError;
  List<double> get minNormalValue => throw _privateConstructorUsedError;
  List<double> get maxNormalValue => throw _privateConstructorUsedError;
  String get categoryImg => throw _privateConstructorUsedError;
  String get filterImg => throw _privateConstructorUsedError;
  int get paramCount => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String get measureItem => throw _privateConstructorUsedError;
  List<String> get paramName => throw _privateConstructorUsedError;
  dynamic get values => throw _privateConstructorUsedError;
  List<dynamic> get appleSynCompare => throw _privateConstructorUsedError;
  int get decimalDigits => throw _privateConstructorUsedError;
  bool get avgByMaxCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryCategoryModelCopyWith<DiaryCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryCategoryModelCopyWith<$Res> {
  factory $DiaryCategoryModelCopyWith(
          DiaryCategoryModel value, $Res Function(DiaryCategoryModel) then) =
      _$DiaryCategoryModelCopyWithImpl<$Res, DiaryCategoryModel>;
  @useResult
  $Res call(
      {String synonim,
      String name,
      List<double> minValue,
      List<double> maxValue,
      List<double> minNormalValue,
      List<double> maxNormalValue,
      String categoryImg,
      String filterImg,
      int paramCount,
      int order,
      String measureItem,
      List<String> paramName,
      dynamic values,
      List<dynamic> appleSynCompare,
      int decimalDigits,
      bool avgByMaxCount});
}

/// @nodoc
class _$DiaryCategoryModelCopyWithImpl<$Res, $Val extends DiaryCategoryModel>
    implements $DiaryCategoryModelCopyWith<$Res> {
  _$DiaryCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? synonim = null,
    Object? name = null,
    Object? minValue = null,
    Object? maxValue = null,
    Object? minNormalValue = null,
    Object? maxNormalValue = null,
    Object? categoryImg = null,
    Object? filterImg = null,
    Object? paramCount = null,
    Object? order = null,
    Object? measureItem = null,
    Object? paramName = null,
    Object? values = freezed,
    Object? appleSynCompare = null,
    Object? decimalDigits = null,
    Object? avgByMaxCount = null,
  }) {
    return _then(_value.copyWith(
      synonim: null == synonim
          ? _value.synonim
          : synonim // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      minNormalValue: null == minNormalValue
          ? _value.minNormalValue
          : minNormalValue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      maxNormalValue: null == maxNormalValue
          ? _value.maxNormalValue
          : maxNormalValue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      categoryImg: null == categoryImg
          ? _value.categoryImg
          : categoryImg // ignore: cast_nullable_to_non_nullable
              as String,
      filterImg: null == filterImg
          ? _value.filterImg
          : filterImg // ignore: cast_nullable_to_non_nullable
              as String,
      paramCount: null == paramCount
          ? _value.paramCount
          : paramCount // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      measureItem: null == measureItem
          ? _value.measureItem
          : measureItem // ignore: cast_nullable_to_non_nullable
              as String,
      paramName: null == paramName
          ? _value.paramName
          : paramName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as dynamic,
      appleSynCompare: null == appleSynCompare
          ? _value.appleSynCompare
          : appleSynCompare // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      decimalDigits: null == decimalDigits
          ? _value.decimalDigits
          : decimalDigits // ignore: cast_nullable_to_non_nullable
              as int,
      avgByMaxCount: null == avgByMaxCount
          ? _value.avgByMaxCount
          : avgByMaxCount // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res>
    implements $DiaryCategoryModelCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String synonim,
      String name,
      List<double> minValue,
      List<double> maxValue,
      List<double> minNormalValue,
      List<double> maxNormalValue,
      String categoryImg,
      String filterImg,
      int paramCount,
      int order,
      String measureItem,
      List<String> paramName,
      dynamic values,
      List<dynamic> appleSynCompare,
      int decimalDigits,
      bool avgByMaxCount});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res>
    extends _$DiaryCategoryModelCopyWithImpl<$Res, _$_Category>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? synonim = null,
    Object? name = null,
    Object? minValue = null,
    Object? maxValue = null,
    Object? minNormalValue = null,
    Object? maxNormalValue = null,
    Object? categoryImg = null,
    Object? filterImg = null,
    Object? paramCount = null,
    Object? order = null,
    Object? measureItem = null,
    Object? paramName = null,
    Object? values = freezed,
    Object? appleSynCompare = null,
    Object? decimalDigits = null,
    Object? avgByMaxCount = null,
  }) {
    return _then(_$_Category(
      synonim: null == synonim
          ? _value.synonim
          : synonim // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minValue: null == minValue
          ? _value._minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      maxValue: null == maxValue
          ? _value._maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      minNormalValue: null == minNormalValue
          ? _value._minNormalValue
          : minNormalValue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      maxNormalValue: null == maxNormalValue
          ? _value._maxNormalValue
          : maxNormalValue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      categoryImg: null == categoryImg
          ? _value.categoryImg
          : categoryImg // ignore: cast_nullable_to_non_nullable
              as String,
      filterImg: null == filterImg
          ? _value.filterImg
          : filterImg // ignore: cast_nullable_to_non_nullable
              as String,
      paramCount: null == paramCount
          ? _value.paramCount
          : paramCount // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      measureItem: null == measureItem
          ? _value.measureItem
          : measureItem // ignore: cast_nullable_to_non_nullable
              as String,
      paramName: null == paramName
          ? _value._paramName
          : paramName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as dynamic,
      appleSynCompare: null == appleSynCompare
          ? _value._appleSynCompare
          : appleSynCompare // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      decimalDigits: null == decimalDigits
          ? _value.decimalDigits
          : decimalDigits // ignore: cast_nullable_to_non_nullable
              as int,
      avgByMaxCount: null == avgByMaxCount
          ? _value.avgByMaxCount
          : avgByMaxCount // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category(
      {required this.synonim,
      required this.name,
      required final List<double> minValue,
      required final List<double> maxValue,
      required final List<double> minNormalValue,
      required final List<double> maxNormalValue,
      required this.categoryImg,
      required this.filterImg,
      required this.paramCount,
      required this.order,
      required this.measureItem,
      required final List<String> paramName,
      required this.values,
      required final List<dynamic> appleSynCompare,
      required this.decimalDigits,
      required this.avgByMaxCount})
      : _minValue = minValue,
        _maxValue = maxValue,
        _minNormalValue = minNormalValue,
        _maxNormalValue = maxNormalValue,
        _paramName = paramName,
        _appleSynCompare = appleSynCompare;

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final String synonim;
  @override
  final String name;
  final List<double> _minValue;
  @override
  List<double> get minValue {
    if (_minValue is EqualUnmodifiableListView) return _minValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_minValue);
  }

  final List<double> _maxValue;
  @override
  List<double> get maxValue {
    if (_maxValue is EqualUnmodifiableListView) return _maxValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_maxValue);
  }

  final List<double> _minNormalValue;
  @override
  List<double> get minNormalValue {
    if (_minNormalValue is EqualUnmodifiableListView) return _minNormalValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_minNormalValue);
  }

  final List<double> _maxNormalValue;
  @override
  List<double> get maxNormalValue {
    if (_maxNormalValue is EqualUnmodifiableListView) return _maxNormalValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_maxNormalValue);
  }

  @override
  final String categoryImg;
  @override
  final String filterImg;
  @override
  final int paramCount;
  @override
  final int order;
  @override
  final String measureItem;
  final List<String> _paramName;
  @override
  List<String> get paramName {
    if (_paramName is EqualUnmodifiableListView) return _paramName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paramName);
  }

  @override
  final dynamic values;
  final List<dynamic> _appleSynCompare;
  @override
  List<dynamic> get appleSynCompare {
    if (_appleSynCompare is EqualUnmodifiableListView) return _appleSynCompare;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appleSynCompare);
  }

  @override
  final int decimalDigits;
  @override
  final bool avgByMaxCount;

  @override
  String toString() {
    return 'DiaryCategoryModel(synonim: $synonim, name: $name, minValue: $minValue, maxValue: $maxValue, minNormalValue: $minNormalValue, maxNormalValue: $maxNormalValue, categoryImg: $categoryImg, filterImg: $filterImg, paramCount: $paramCount, order: $order, measureItem: $measureItem, paramName: $paramName, values: $values, appleSynCompare: $appleSynCompare, decimalDigits: $decimalDigits, avgByMaxCount: $avgByMaxCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.synonim, synonim) || other.synonim == synonim) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._minValue, _minValue) &&
            const DeepCollectionEquality().equals(other._maxValue, _maxValue) &&
            const DeepCollectionEquality()
                .equals(other._minNormalValue, _minNormalValue) &&
            const DeepCollectionEquality()
                .equals(other._maxNormalValue, _maxNormalValue) &&
            (identical(other.categoryImg, categoryImg) ||
                other.categoryImg == categoryImg) &&
            (identical(other.filterImg, filterImg) ||
                other.filterImg == filterImg) &&
            (identical(other.paramCount, paramCount) ||
                other.paramCount == paramCount) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.measureItem, measureItem) ||
                other.measureItem == measureItem) &&
            const DeepCollectionEquality()
                .equals(other._paramName, _paramName) &&
            const DeepCollectionEquality().equals(other.values, values) &&
            const DeepCollectionEquality()
                .equals(other._appleSynCompare, _appleSynCompare) &&
            (identical(other.decimalDigits, decimalDigits) ||
                other.decimalDigits == decimalDigits) &&
            (identical(other.avgByMaxCount, avgByMaxCount) ||
                other.avgByMaxCount == avgByMaxCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      synonim,
      name,
      const DeepCollectionEquality().hash(_minValue),
      const DeepCollectionEquality().hash(_maxValue),
      const DeepCollectionEquality().hash(_minNormalValue),
      const DeepCollectionEquality().hash(_maxNormalValue),
      categoryImg,
      filterImg,
      paramCount,
      order,
      measureItem,
      const DeepCollectionEquality().hash(_paramName),
      const DeepCollectionEquality().hash(values),
      const DeepCollectionEquality().hash(_appleSynCompare),
      decimalDigits,
      avgByMaxCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(
      this,
    );
  }
}

abstract class _Category implements DiaryCategoryModel {
  const factory _Category(
      {required final String synonim,
      required final String name,
      required final List<double> minValue,
      required final List<double> maxValue,
      required final List<double> minNormalValue,
      required final List<double> maxNormalValue,
      required final String categoryImg,
      required final String filterImg,
      required final int paramCount,
      required final int order,
      required final String measureItem,
      required final List<String> paramName,
      required final dynamic values,
      required final List<dynamic> appleSynCompare,
      required final int decimalDigits,
      required final bool avgByMaxCount}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  String get synonim;
  @override
  String get name;
  @override
  List<double> get minValue;
  @override
  List<double> get maxValue;
  @override
  List<double> get minNormalValue;
  @override
  List<double> get maxNormalValue;
  @override
  String get categoryImg;
  @override
  String get filterImg;
  @override
  int get paramCount;
  @override
  int get order;
  @override
  String get measureItem;
  @override
  List<String> get paramName;
  @override
  dynamic get values;
  @override
  List<dynamic> get appleSynCompare;
  @override
  int get decimalDigits;
  @override
  bool get avgByMaxCount;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}

DiaryModel _$DiaryModelFromJson(Map<String, dynamic> json) {
  return _Diary.fromJson(json);
}

/// @nodoc
mixin _$DiaryModel {
  String get syn => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get firstValue => throw _privateConstructorUsedError;
  List<dynamic>? get currentValue => throw _privateConstructorUsedError;
  List<DiaryItem> get values => throw _privateConstructorUsedError;
  int get grouping => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryModelCopyWith<DiaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryModelCopyWith<$Res> {
  factory $DiaryModelCopyWith(
          DiaryModel value, $Res Function(DiaryModel) then) =
      _$DiaryModelCopyWithImpl<$Res, DiaryModel>;
  @useResult
  $Res call(
      {String syn,
      @TimestampConverter() DateTime firstValue,
      List<dynamic>? currentValue,
      List<DiaryItem> values,
      int grouping});
}

/// @nodoc
class _$DiaryModelCopyWithImpl<$Res, $Val extends DiaryModel>
    implements $DiaryModelCopyWith<$Res> {
  _$DiaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syn = null,
    Object? firstValue = null,
    Object? currentValue = freezed,
    Object? values = null,
    Object? grouping = null,
  }) {
    return _then(_value.copyWith(
      syn: null == syn
          ? _value.syn
          : syn // ignore: cast_nullable_to_non_nullable
              as String,
      firstValue: null == firstValue
          ? _value.firstValue
          : firstValue // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<DiaryItem>,
      grouping: null == grouping
          ? _value.grouping
          : grouping // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiaryCopyWith<$Res> implements $DiaryModelCopyWith<$Res> {
  factory _$$_DiaryCopyWith(_$_Diary value, $Res Function(_$_Diary) then) =
      __$$_DiaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String syn,
      @TimestampConverter() DateTime firstValue,
      List<dynamic>? currentValue,
      List<DiaryItem> values,
      int grouping});
}

/// @nodoc
class __$$_DiaryCopyWithImpl<$Res>
    extends _$DiaryModelCopyWithImpl<$Res, _$_Diary>
    implements _$$_DiaryCopyWith<$Res> {
  __$$_DiaryCopyWithImpl(_$_Diary _value, $Res Function(_$_Diary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syn = null,
    Object? firstValue = null,
    Object? currentValue = freezed,
    Object? values = null,
    Object? grouping = null,
  }) {
    return _then(_$_Diary(
      syn: null == syn
          ? _value.syn
          : syn // ignore: cast_nullable_to_non_nullable
              as String,
      firstValue: null == firstValue
          ? _value.firstValue
          : firstValue // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentValue: freezed == currentValue
          ? _value._currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<DiaryItem>,
      grouping: null == grouping
          ? _value.grouping
          : grouping // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Diary extends _Diary {
  const _$_Diary(
      {required this.syn,
      @TimestampConverter() required this.firstValue,
      required final List<dynamic>? currentValue,
      required final List<DiaryItem> values,
      required this.grouping})
      : _currentValue = currentValue,
        _values = values,
        super._();

  factory _$_Diary.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryFromJson(json);

  @override
  final String syn;
  @override
  @TimestampConverter()
  final DateTime firstValue;
  final List<dynamic>? _currentValue;
  @override
  List<dynamic>? get currentValue {
    final value = _currentValue;
    if (value == null) return null;
    if (_currentValue is EqualUnmodifiableListView) return _currentValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DiaryItem> _values;
  @override
  List<DiaryItem> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final int grouping;

  @override
  String toString() {
    return 'DiaryModel(syn: $syn, firstValue: $firstValue, currentValue: $currentValue, values: $values, grouping: $grouping)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Diary &&
            (identical(other.syn, syn) || other.syn == syn) &&
            (identical(other.firstValue, firstValue) ||
                other.firstValue == firstValue) &&
            const DeepCollectionEquality()
                .equals(other._currentValue, _currentValue) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.grouping, grouping) ||
                other.grouping == grouping));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      syn,
      firstValue,
      const DeepCollectionEquality().hash(_currentValue),
      const DeepCollectionEquality().hash(_values),
      grouping);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiaryCopyWith<_$_Diary> get copyWith =>
      __$$_DiaryCopyWithImpl<_$_Diary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryToJson(
      this,
    );
  }
}

abstract class _Diary extends DiaryModel {
  const factory _Diary(
      {required final String syn,
      @TimestampConverter() required final DateTime firstValue,
      required final List<dynamic>? currentValue,
      required final List<DiaryItem> values,
      required final int grouping}) = _$_Diary;
  const _Diary._() : super._();

  factory _Diary.fromJson(Map<String, dynamic> json) = _$_Diary.fromJson;

  @override
  String get syn;
  @override
  @TimestampConverter()
  DateTime get firstValue;
  @override
  List<dynamic>? get currentValue;
  @override
  List<DiaryItem> get values;
  @override
  int get grouping;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryCopyWith<_$_Diary> get copyWith =>
      throw _privateConstructorUsedError;
}

DiaryItem _$DiaryItemFromJson(Map<String, dynamic> json) {
  return _DiaryItem.fromJson(json);
}

/// @nodoc
mixin _$DiaryItem {
  @TimestampConverter()
  DateTime get date => throw _privateConstructorUsedError;
  List<List<dynamic>> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryItemCopyWith<DiaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryItemCopyWith<$Res> {
  factory $DiaryItemCopyWith(DiaryItem value, $Res Function(DiaryItem) then) =
      _$DiaryItemCopyWithImpl<$Res, DiaryItem>;
  @useResult
  $Res call({@TimestampConverter() DateTime date, List<List<dynamic>> data});
}

/// @nodoc
class _$DiaryItemCopyWithImpl<$Res, $Val extends DiaryItem>
    implements $DiaryItemCopyWith<$Res> {
  _$DiaryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiaryItemCopyWith<$Res> implements $DiaryItemCopyWith<$Res> {
  factory _$$_DiaryItemCopyWith(
          _$_DiaryItem value, $Res Function(_$_DiaryItem) then) =
      __$$_DiaryItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@TimestampConverter() DateTime date, List<List<dynamic>> data});
}

/// @nodoc
class __$$_DiaryItemCopyWithImpl<$Res>
    extends _$DiaryItemCopyWithImpl<$Res, _$_DiaryItem>
    implements _$$_DiaryItemCopyWith<$Res> {
  __$$_DiaryItemCopyWithImpl(
      _$_DiaryItem _value, $Res Function(_$_DiaryItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? data = null,
  }) {
    return _then(_$_DiaryItem(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryItem extends _DiaryItem {
  const _$_DiaryItem(
      {@TimestampConverter() required this.date,
      required final List<List<dynamic>> data})
      : _data = data,
        super._();

  factory _$_DiaryItem.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryItemFromJson(json);

  @override
  @TimestampConverter()
  final DateTime date;
  final List<List<dynamic>> _data;
  @override
  List<List<dynamic>> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'DiaryItem(date: $date, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryItem &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiaryItemCopyWith<_$_DiaryItem> get copyWith =>
      __$$_DiaryItemCopyWithImpl<_$_DiaryItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryItemToJson(
      this,
    );
  }
}

abstract class _DiaryItem extends DiaryItem {
  const factory _DiaryItem(
      {@TimestampConverter() required final DateTime date,
      required final List<List<dynamic>> data}) = _$_DiaryItem;
  const _DiaryItem._() : super._();

  factory _DiaryItem.fromJson(Map<String, dynamic> json) =
      _$_DiaryItem.fromJson;

  @override
  @TimestampConverter()
  DateTime get date;
  @override
  List<List<dynamic>> get data;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryItemCopyWith<_$_DiaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}
