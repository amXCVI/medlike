// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DoctorsResponseModel _$DoctorsResponseModelFromJson(Map<String, dynamic> json) {
  return _DoctorsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$DoctorsResponseModel {
  @JsonKey(name: 'navigationItems')
  List<NavigationItem>? get navigationItems =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'doctors')
  List<Doctor>? get doctors => throw _privateConstructorUsedError;
  @JsonKey(name: 'researches')
  List<Research>? get researches => throw _privateConstructorUsedError;
  @JsonKey(name: 'cabinets')
  List<Cabinet>? get cabinets => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorsResponseModelCopyWith<DoctorsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorsResponseModelCopyWith<$Res> {
  factory $DoctorsResponseModelCopyWith(DoctorsResponseModel value,
          $Res Function(DoctorsResponseModel) then) =
      _$DoctorsResponseModelCopyWithImpl<$Res, DoctorsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'navigationItems') List<NavigationItem>? navigationItems,
      @JsonKey(name: 'doctors') List<Doctor>? doctors,
      @JsonKey(name: 'researches') List<Research>? researches,
      @JsonKey(name: 'cabinets') List<Cabinet>? cabinets,
      int? price});
}

/// @nodoc
class _$DoctorsResponseModelCopyWithImpl<$Res,
        $Val extends DoctorsResponseModel>
    implements $DoctorsResponseModelCopyWith<$Res> {
  _$DoctorsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navigationItems = freezed,
    Object? doctors = freezed,
    Object? researches = freezed,
    Object? cabinets = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      navigationItems: freezed == navigationItems
          ? _value.navigationItems
          : navigationItems // ignore: cast_nullable_to_non_nullable
              as List<NavigationItem>?,
      doctors: freezed == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Doctor>?,
      researches: freezed == researches
          ? _value.researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<Research>?,
      cabinets: freezed == cabinets
          ? _value.cabinets
          : cabinets // ignore: cast_nullable_to_non_nullable
              as List<Cabinet>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DoctorsResponseModelCopyWith<$Res>
    implements $DoctorsResponseModelCopyWith<$Res> {
  factory _$$_DoctorsResponseModelCopyWith(_$_DoctorsResponseModel value,
          $Res Function(_$_DoctorsResponseModel) then) =
      __$$_DoctorsResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'navigationItems') List<NavigationItem>? navigationItems,
      @JsonKey(name: 'doctors') List<Doctor>? doctors,
      @JsonKey(name: 'researches') List<Research>? researches,
      @JsonKey(name: 'cabinets') List<Cabinet>? cabinets,
      int? price});
}

/// @nodoc
class __$$_DoctorsResponseModelCopyWithImpl<$Res>
    extends _$DoctorsResponseModelCopyWithImpl<$Res, _$_DoctorsResponseModel>
    implements _$$_DoctorsResponseModelCopyWith<$Res> {
  __$$_DoctorsResponseModelCopyWithImpl(_$_DoctorsResponseModel _value,
      $Res Function(_$_DoctorsResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navigationItems = freezed,
    Object? doctors = freezed,
    Object? researches = freezed,
    Object? cabinets = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_DoctorsResponseModel(
      navigationItems: freezed == navigationItems
          ? _value._navigationItems
          : navigationItems // ignore: cast_nullable_to_non_nullable
              as List<NavigationItem>?,
      doctors: freezed == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Doctor>?,
      researches: freezed == researches
          ? _value._researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<Research>?,
      cabinets: freezed == cabinets
          ? _value._cabinets
          : cabinets // ignore: cast_nullable_to_non_nullable
              as List<Cabinet>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DoctorsResponseModel implements _DoctorsResponseModel {
  const _$_DoctorsResponseModel(
      {@JsonKey(name: 'navigationItems')
      final List<NavigationItem>? navigationItems,
      @JsonKey(name: 'doctors') final List<Doctor>? doctors,
      @JsonKey(name: 'researches') final List<Research>? researches,
      @JsonKey(name: 'cabinets') final List<Cabinet>? cabinets,
      this.price})
      : _navigationItems = navigationItems,
        _doctors = doctors,
        _researches = researches,
        _cabinets = cabinets;

  factory _$_DoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_DoctorsResponseModelFromJson(json);

  final List<NavigationItem>? _navigationItems;
  @override
  @JsonKey(name: 'navigationItems')
  List<NavigationItem>? get navigationItems {
    final value = _navigationItems;
    if (value == null) return null;
    if (_navigationItems is EqualUnmodifiableListView) return _navigationItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Doctor>? _doctors;
  @override
  @JsonKey(name: 'doctors')
  List<Doctor>? get doctors {
    final value = _doctors;
    if (value == null) return null;
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Research>? _researches;
  @override
  @JsonKey(name: 'researches')
  List<Research>? get researches {
    final value = _researches;
    if (value == null) return null;
    if (_researches is EqualUnmodifiableListView) return _researches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Cabinet>? _cabinets;
  @override
  @JsonKey(name: 'cabinets')
  List<Cabinet>? get cabinets {
    final value = _cabinets;
    if (value == null) return null;
    if (_cabinets is EqualUnmodifiableListView) return _cabinets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? price;

  @override
  String toString() {
    return 'DoctorsResponseModel(navigationItems: $navigationItems, doctors: $doctors, researches: $researches, cabinets: $cabinets, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoctorsResponseModel &&
            const DeepCollectionEquality()
                .equals(other._navigationItems, _navigationItems) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            const DeepCollectionEquality()
                .equals(other._researches, _researches) &&
            const DeepCollectionEquality().equals(other._cabinets, _cabinets) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_navigationItems),
      const DeepCollectionEquality().hash(_doctors),
      const DeepCollectionEquality().hash(_researches),
      const DeepCollectionEquality().hash(_cabinets),
      price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoctorsResponseModelCopyWith<_$_DoctorsResponseModel> get copyWith =>
      __$$_DoctorsResponseModelCopyWithImpl<_$_DoctorsResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoctorsResponseModelToJson(
      this,
    );
  }
}

abstract class _DoctorsResponseModel implements DoctorsResponseModel {
  const factory _DoctorsResponseModel(
      {@JsonKey(name: 'navigationItems')
      final List<NavigationItem>? navigationItems,
      @JsonKey(name: 'doctors') final List<Doctor>? doctors,
      @JsonKey(name: 'researches') final List<Research>? researches,
      @JsonKey(name: 'cabinets') final List<Cabinet>? cabinets,
      final int? price}) = _$_DoctorsResponseModel;

  factory _DoctorsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_DoctorsResponseModel.fromJson;

  @override
  @JsonKey(name: 'navigationItems')
  List<NavigationItem>? get navigationItems;
  @override
  @JsonKey(name: 'doctors')
  List<Doctor>? get doctors;
  @override
  @JsonKey(name: 'researches')
  List<Research>? get researches;
  @override
  @JsonKey(name: 'cabinets')
  List<Cabinet>? get cabinets;
  @override
  int? get price;
  @override
  @JsonKey(ignore: true)
  _$$_DoctorsResponseModelCopyWith<_$_DoctorsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Cabinet _$CabinetFromJson(Map<String, dynamic> json) {
  return _Cabinet.fromJson(json);
}

/// @nodoc
mixin _$Cabinet {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cabinet_name')
  String? get cabinetName => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CabinetCopyWith<Cabinet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CabinetCopyWith<$Res> {
  factory $CabinetCopyWith(Cabinet value, $Res Function(Cabinet) then) =
      _$CabinetCopyWithImpl<$Res, Cabinet>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'cabinet_name') String? cabinetName,
      int? price});
}

/// @nodoc
class _$CabinetCopyWithImpl<$Res, $Val extends Cabinet>
    implements $CabinetCopyWith<$Res> {
  _$CabinetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cabinetName = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: freezed == cabinetName
          ? _value.cabinetName
          : cabinetName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CabinetCopyWith<$Res> implements $CabinetCopyWith<$Res> {
  factory _$$_CabinetCopyWith(
          _$_Cabinet value, $Res Function(_$_Cabinet) then) =
      __$$_CabinetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'cabinet_name') String? cabinetName,
      int? price});
}

/// @nodoc
class __$$_CabinetCopyWithImpl<$Res>
    extends _$CabinetCopyWithImpl<$Res, _$_Cabinet>
    implements _$$_CabinetCopyWith<$Res> {
  __$$_CabinetCopyWithImpl(_$_Cabinet _value, $Res Function(_$_Cabinet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cabinetName = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_Cabinet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: freezed == cabinetName
          ? _value.cabinetName
          : cabinetName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cabinet implements _Cabinet {
  const _$_Cabinet(
      {required this.id,
      @JsonKey(name: 'cabinet_name') this.cabinetName,
      this.price});

  factory _$_Cabinet.fromJson(Map<String, dynamic> json) =>
      _$$_CabinetFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'cabinet_name')
  final String? cabinetName;
  @override
  final int? price;

  @override
  String toString() {
    return 'Cabinet(id: $id, cabinetName: $cabinetName, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cabinet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cabinetName, cabinetName) ||
                other.cabinetName == cabinetName) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, cabinetName, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CabinetCopyWith<_$_Cabinet> get copyWith =>
      __$$_CabinetCopyWithImpl<_$_Cabinet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CabinetToJson(
      this,
    );
  }
}

abstract class _Cabinet implements Cabinet {
  const factory _Cabinet(
      {required final String id,
      @JsonKey(name: 'cabinet_name') final String? cabinetName,
      final int? price}) = _$_Cabinet;

  factory _Cabinet.fromJson(Map<String, dynamic> json) = _$_Cabinet.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'cabinet_name')
  String? get cabinetName;
  @override
  int? get price;
  @override
  @JsonKey(ignore: true)
  _$$_CabinetCopyWith<_$_Cabinet> get copyWith =>
      throw _privateConstructorUsedError;
}

NavigationItemCabinet _$NavigationItemCabinetFromJson(
    Map<String, dynamic> json) {
  return _NavigationItemCabinet.fromJson(json);
}

/// @nodoc
mixin _$NavigationItemCabinet {
  String get oid => throw _privateConstructorUsedError;
  @JsonKey(name: 'cabinet_name')
  String? get cabinetName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigationItemCabinetCopyWith<NavigationItemCabinet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationItemCabinetCopyWith<$Res> {
  factory $NavigationItemCabinetCopyWith(NavigationItemCabinet value,
          $Res Function(NavigationItemCabinet) then) =
      _$NavigationItemCabinetCopyWithImpl<$Res, NavigationItemCabinet>;
  @useResult
  $Res call({String oid, @JsonKey(name: 'cabinet_name') String? cabinetName});
}

/// @nodoc
class _$NavigationItemCabinetCopyWithImpl<$Res,
        $Val extends NavigationItemCabinet>
    implements $NavigationItemCabinetCopyWith<$Res> {
  _$NavigationItemCabinetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oid = null,
    Object? cabinetName = freezed,
  }) {
    return _then(_value.copyWith(
      oid: null == oid
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: freezed == cabinetName
          ? _value.cabinetName
          : cabinetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NavigationItemCabinetCopyWith<$Res>
    implements $NavigationItemCabinetCopyWith<$Res> {
  factory _$$_NavigationItemCabinetCopyWith(_$_NavigationItemCabinet value,
          $Res Function(_$_NavigationItemCabinet) then) =
      __$$_NavigationItemCabinetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String oid, @JsonKey(name: 'cabinet_name') String? cabinetName});
}

/// @nodoc
class __$$_NavigationItemCabinetCopyWithImpl<$Res>
    extends _$NavigationItemCabinetCopyWithImpl<$Res, _$_NavigationItemCabinet>
    implements _$$_NavigationItemCabinetCopyWith<$Res> {
  __$$_NavigationItemCabinetCopyWithImpl(_$_NavigationItemCabinet _value,
      $Res Function(_$_NavigationItemCabinet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oid = null,
    Object? cabinetName = freezed,
  }) {
    return _then(_$_NavigationItemCabinet(
      oid: null == oid
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: freezed == cabinetName
          ? _value.cabinetName
          : cabinetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NavigationItemCabinet implements _NavigationItemCabinet {
  const _$_NavigationItemCabinet(
      {required this.oid, @JsonKey(name: 'cabinet_name') this.cabinetName});

  factory _$_NavigationItemCabinet.fromJson(Map<String, dynamic> json) =>
      _$$_NavigationItemCabinetFromJson(json);

  @override
  final String oid;
  @override
  @JsonKey(name: 'cabinet_name')
  final String? cabinetName;

  @override
  String toString() {
    return 'NavigationItemCabinet(oid: $oid, cabinetName: $cabinetName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationItemCabinet &&
            (identical(other.oid, oid) || other.oid == oid) &&
            (identical(other.cabinetName, cabinetName) ||
                other.cabinetName == cabinetName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, oid, cabinetName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavigationItemCabinetCopyWith<_$_NavigationItemCabinet> get copyWith =>
      __$$_NavigationItemCabinetCopyWithImpl<_$_NavigationItemCabinet>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NavigationItemCabinetToJson(
      this,
    );
  }
}

abstract class _NavigationItemCabinet implements NavigationItemCabinet {
  const factory _NavigationItemCabinet(
          {required final String oid,
          @JsonKey(name: 'cabinet_name') final String? cabinetName}) =
      _$_NavigationItemCabinet;

  factory _NavigationItemCabinet.fromJson(Map<String, dynamic> json) =
      _$_NavigationItemCabinet.fromJson;

  @override
  String get oid;
  @override
  @JsonKey(name: 'cabinet_name')
  String? get cabinetName;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationItemCabinetCopyWith<_$_NavigationItemCabinet> get copyWith =>
      throw _privateConstructorUsedError;
}

NavigationItem _$NavigationItemFromJson(Map<String, dynamic> json) {
  return _NavigationItem.fromJson(json);
}

/// @nodoc
mixin _$NavigationItem {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get categoryType => throw _privateConstructorUsedError;
  bool? get personalSchedule => throw _privateConstructorUsedError;
  bool? get cabinetSchedule => throw _privateConstructorUsedError;
  List<NavigationItemCabinet>? get cabinets =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigationItemCopyWith<NavigationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationItemCopyWith<$Res> {
  factory $NavigationItemCopyWith(
          NavigationItem value, $Res Function(NavigationItem) then) =
      _$NavigationItemCopyWithImpl<$Res, NavigationItem>;
  @useResult
  $Res call(
      {String id,
      String? name,
      int? count,
      int? categoryType,
      bool? personalSchedule,
      bool? cabinetSchedule,
      List<NavigationItemCabinet>? cabinets});
}

/// @nodoc
class _$NavigationItemCopyWithImpl<$Res, $Val extends NavigationItem>
    implements $NavigationItemCopyWith<$Res> {
  _$NavigationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? count = freezed,
    Object? categoryType = freezed,
    Object? personalSchedule = freezed,
    Object? cabinetSchedule = freezed,
    Object? cabinets = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int?,
      personalSchedule: freezed == personalSchedule
          ? _value.personalSchedule
          : personalSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
      cabinetSchedule: freezed == cabinetSchedule
          ? _value.cabinetSchedule
          : cabinetSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
      cabinets: freezed == cabinets
          ? _value.cabinets
          : cabinets // ignore: cast_nullable_to_non_nullable
              as List<NavigationItemCabinet>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NavigationItemCopyWith<$Res>
    implements $NavigationItemCopyWith<$Res> {
  factory _$$_NavigationItemCopyWith(
          _$_NavigationItem value, $Res Function(_$_NavigationItem) then) =
      __$$_NavigationItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      int? count,
      int? categoryType,
      bool? personalSchedule,
      bool? cabinetSchedule,
      List<NavigationItemCabinet>? cabinets});
}

/// @nodoc
class __$$_NavigationItemCopyWithImpl<$Res>
    extends _$NavigationItemCopyWithImpl<$Res, _$_NavigationItem>
    implements _$$_NavigationItemCopyWith<$Res> {
  __$$_NavigationItemCopyWithImpl(
      _$_NavigationItem _value, $Res Function(_$_NavigationItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? count = freezed,
    Object? categoryType = freezed,
    Object? personalSchedule = freezed,
    Object? cabinetSchedule = freezed,
    Object? cabinets = freezed,
  }) {
    return _then(_$_NavigationItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int?,
      personalSchedule: freezed == personalSchedule
          ? _value.personalSchedule
          : personalSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
      cabinetSchedule: freezed == cabinetSchedule
          ? _value.cabinetSchedule
          : cabinetSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
      cabinets: freezed == cabinets
          ? _value._cabinets
          : cabinets // ignore: cast_nullable_to_non_nullable
              as List<NavigationItemCabinet>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NavigationItem implements _NavigationItem {
  const _$_NavigationItem(
      {required this.id,
      required this.name,
      required this.count,
      required this.categoryType,
      required this.personalSchedule,
      required this.cabinetSchedule,
      required final List<NavigationItemCabinet>? cabinets})
      : _cabinets = cabinets;

  factory _$_NavigationItem.fromJson(Map<String, dynamic> json) =>
      _$$_NavigationItemFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final int? count;
  @override
  final int? categoryType;
  @override
  final bool? personalSchedule;
  @override
  final bool? cabinetSchedule;
  final List<NavigationItemCabinet>? _cabinets;
  @override
  List<NavigationItemCabinet>? get cabinets {
    final value = _cabinets;
    if (value == null) return null;
    if (_cabinets is EqualUnmodifiableListView) return _cabinets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NavigationItem(id: $id, name: $name, count: $count, categoryType: $categoryType, personalSchedule: $personalSchedule, cabinetSchedule: $cabinetSchedule, cabinets: $cabinets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.personalSchedule, personalSchedule) ||
                other.personalSchedule == personalSchedule) &&
            (identical(other.cabinetSchedule, cabinetSchedule) ||
                other.cabinetSchedule == cabinetSchedule) &&
            const DeepCollectionEquality().equals(other._cabinets, _cabinets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      count,
      categoryType,
      personalSchedule,
      cabinetSchedule,
      const DeepCollectionEquality().hash(_cabinets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavigationItemCopyWith<_$_NavigationItem> get copyWith =>
      __$$_NavigationItemCopyWithImpl<_$_NavigationItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NavigationItemToJson(
      this,
    );
  }
}

abstract class _NavigationItem implements NavigationItem {
  const factory _NavigationItem(
          {required final String id,
          required final String? name,
          required final int? count,
          required final int? categoryType,
          required final bool? personalSchedule,
          required final bool? cabinetSchedule,
          required final List<NavigationItemCabinet>? cabinets}) =
      _$_NavigationItem;

  factory _NavigationItem.fromJson(Map<String, dynamic> json) =
      _$_NavigationItem.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  int? get count;
  @override
  int? get categoryType;
  @override
  bool? get personalSchedule;
  @override
  bool? get cabinetSchedule;
  @override
  List<NavigationItemCabinet>? get cabinets;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationItemCopyWith<_$_NavigationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return _Doctor.fromJson(json);
}

/// @nodoc
mixin _$Doctor {
  String get id => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get middleName => throw _privateConstructorUsedError;
  String get specializationId => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int get categoryType => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  List<int> get categories => throw _privateConstructorUsedError;
  String? get imagePreviewLocation => throw _privateConstructorUsedError;
  String? get imageFullSizeLocation => throw _privateConstructorUsedError;
  num get avergareRating =>
      throw _privateConstructorUsedError; // required List<AssessmentModel> assessments,
  String? get shortinfo => throw _privateConstructorUsedError;
  num get rateAsSotr => throw _privateConstructorUsedError;
  num get rateAsUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorCopyWith<Doctor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) then) =
      _$DoctorCopyWithImpl<$Res, Doctor>;
  @useResult
  $Res call(
      {String id,
      String lastName,
      String firstName,
      String middleName,
      String specializationId,
      String specialization,
      int? price,
      int categoryType,
      bool isFavorite,
      List<int> categories,
      String? imagePreviewLocation,
      String? imageFullSizeLocation,
      num avergareRating,
      String? shortinfo,
      num rateAsSotr,
      num rateAsUser});
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res, $Val extends Doctor>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? specializationId = null,
    Object? specialization = null,
    Object? price = freezed,
    Object? categoryType = null,
    Object? isFavorite = null,
    Object? categories = null,
    Object? imagePreviewLocation = freezed,
    Object? imageFullSizeLocation = freezed,
    Object? avergareRating = null,
    Object? shortinfo = freezed,
    Object? rateAsSotr = null,
    Object? rateAsUser = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      specializationId: null == specializationId
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: null == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>,
      imagePreviewLocation: freezed == imagePreviewLocation
          ? _value.imagePreviewLocation
          : imagePreviewLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFullSizeLocation: freezed == imageFullSizeLocation
          ? _value.imageFullSizeLocation
          : imageFullSizeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      avergareRating: null == avergareRating
          ? _value.avergareRating
          : avergareRating // ignore: cast_nullable_to_non_nullable
              as num,
      shortinfo: freezed == shortinfo
          ? _value.shortinfo
          : shortinfo // ignore: cast_nullable_to_non_nullable
              as String?,
      rateAsSotr: null == rateAsSotr
          ? _value.rateAsSotr
          : rateAsSotr // ignore: cast_nullable_to_non_nullable
              as num,
      rateAsUser: null == rateAsUser
          ? _value.rateAsUser
          : rateAsUser // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DoctorCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$$_DoctorCopyWith(_$_Doctor value, $Res Function(_$_Doctor) then) =
      __$$_DoctorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String lastName,
      String firstName,
      String middleName,
      String specializationId,
      String specialization,
      int? price,
      int categoryType,
      bool isFavorite,
      List<int> categories,
      String? imagePreviewLocation,
      String? imageFullSizeLocation,
      num avergareRating,
      String? shortinfo,
      num rateAsSotr,
      num rateAsUser});
}

/// @nodoc
class __$$_DoctorCopyWithImpl<$Res>
    extends _$DoctorCopyWithImpl<$Res, _$_Doctor>
    implements _$$_DoctorCopyWith<$Res> {
  __$$_DoctorCopyWithImpl(_$_Doctor _value, $Res Function(_$_Doctor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? specializationId = null,
    Object? specialization = null,
    Object? price = freezed,
    Object? categoryType = null,
    Object? isFavorite = null,
    Object? categories = null,
    Object? imagePreviewLocation = freezed,
    Object? imageFullSizeLocation = freezed,
    Object? avergareRating = null,
    Object? shortinfo = freezed,
    Object? rateAsSotr = null,
    Object? rateAsUser = null,
  }) {
    return _then(_$_Doctor(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      specializationId: null == specializationId
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: null == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>,
      imagePreviewLocation: freezed == imagePreviewLocation
          ? _value.imagePreviewLocation
          : imagePreviewLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFullSizeLocation: freezed == imageFullSizeLocation
          ? _value.imageFullSizeLocation
          : imageFullSizeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      avergareRating: null == avergareRating
          ? _value.avergareRating
          : avergareRating // ignore: cast_nullable_to_non_nullable
              as num,
      shortinfo: freezed == shortinfo
          ? _value.shortinfo
          : shortinfo // ignore: cast_nullable_to_non_nullable
              as String?,
      rateAsSotr: null == rateAsSotr
          ? _value.rateAsSotr
          : rateAsSotr // ignore: cast_nullable_to_non_nullable
              as num,
      rateAsUser: null == rateAsUser
          ? _value.rateAsUser
          : rateAsUser // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Doctor implements _Doctor {
  const _$_Doctor(
      {required this.id,
      required this.lastName,
      required this.firstName,
      required this.middleName,
      required this.specializationId,
      required this.specialization,
      required this.price,
      required this.categoryType,
      required this.isFavorite,
      required final List<int> categories,
      required this.imagePreviewLocation,
      required this.imageFullSizeLocation,
      required this.avergareRating,
      required this.shortinfo,
      required this.rateAsSotr,
      required this.rateAsUser})
      : _categories = categories;

  factory _$_Doctor.fromJson(Map<String, dynamic> json) =>
      _$$_DoctorFromJson(json);

  @override
  final String id;
  @override
  final String lastName;
  @override
  final String firstName;
  @override
  final String middleName;
  @override
  final String specializationId;
  @override
  final String specialization;
  @override
  final int? price;
  @override
  final int categoryType;
  @override
  final bool isFavorite;
  final List<int> _categories;
  @override
  List<int> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? imagePreviewLocation;
  @override
  final String? imageFullSizeLocation;
  @override
  final num avergareRating;
// required List<AssessmentModel> assessments,
  @override
  final String? shortinfo;
  @override
  final num rateAsSotr;
  @override
  final num rateAsUser;

  @override
  String toString() {
    return 'Doctor(id: $id, lastName: $lastName, firstName: $firstName, middleName: $middleName, specializationId: $specializationId, specialization: $specialization, price: $price, categoryType: $categoryType, isFavorite: $isFavorite, categories: $categories, imagePreviewLocation: $imagePreviewLocation, imageFullSizeLocation: $imageFullSizeLocation, avergareRating: $avergareRating, shortinfo: $shortinfo, rateAsSotr: $rateAsSotr, rateAsUser: $rateAsUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Doctor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.specializationId, specializationId) ||
                other.specializationId == specializationId) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.imagePreviewLocation, imagePreviewLocation) ||
                other.imagePreviewLocation == imagePreviewLocation) &&
            (identical(other.imageFullSizeLocation, imageFullSizeLocation) ||
                other.imageFullSizeLocation == imageFullSizeLocation) &&
            (identical(other.avergareRating, avergareRating) ||
                other.avergareRating == avergareRating) &&
            (identical(other.shortinfo, shortinfo) ||
                other.shortinfo == shortinfo) &&
            (identical(other.rateAsSotr, rateAsSotr) ||
                other.rateAsSotr == rateAsSotr) &&
            (identical(other.rateAsUser, rateAsUser) ||
                other.rateAsUser == rateAsUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lastName,
      firstName,
      middleName,
      specializationId,
      specialization,
      price,
      categoryType,
      isFavorite,
      const DeepCollectionEquality().hash(_categories),
      imagePreviewLocation,
      imageFullSizeLocation,
      avergareRating,
      shortinfo,
      rateAsSotr,
      rateAsUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoctorCopyWith<_$_Doctor> get copyWith =>
      __$$_DoctorCopyWithImpl<_$_Doctor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoctorToJson(
      this,
    );
  }
}

abstract class _Doctor implements Doctor {
  const factory _Doctor(
      {required final String id,
      required final String lastName,
      required final String firstName,
      required final String middleName,
      required final String specializationId,
      required final String specialization,
      required final int? price,
      required final int categoryType,
      required final bool isFavorite,
      required final List<int> categories,
      required final String? imagePreviewLocation,
      required final String? imageFullSizeLocation,
      required final num avergareRating,
      required final String? shortinfo,
      required final num rateAsSotr,
      required final num rateAsUser}) = _$_Doctor;

  factory _Doctor.fromJson(Map<String, dynamic> json) = _$_Doctor.fromJson;

  @override
  String get id;
  @override
  String get lastName;
  @override
  String get firstName;
  @override
  String get middleName;
  @override
  String get specializationId;
  @override
  String get specialization;
  @override
  int? get price;
  @override
  int get categoryType;
  @override
  bool get isFavorite;
  @override
  List<int> get categories;
  @override
  String? get imagePreviewLocation;
  @override
  String? get imageFullSizeLocation;
  @override
  num get avergareRating;
  @override // required List<AssessmentModel> assessments,
  String? get shortinfo;
  @override
  num get rateAsSotr;
  @override
  num get rateAsUser;
  @override
  @JsonKey(ignore: true)
  _$$_DoctorCopyWith<_$_Doctor> get copyWith =>
      throw _privateConstructorUsedError;
}

Research _$ResearchFromJson(Map<String, dynamic> json) {
  return _Research.fromJson(json);
}

/// @nodoc
mixin _$Research {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int get categoryType => throw _privateConstructorUsedError;
  int get scheduleType => throw _privateConstructorUsedError;
  String get buildingId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResearchCopyWith<Research> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResearchCopyWith<$Res> {
  factory $ResearchCopyWith(Research value, $Res Function(Research) then) =
      _$ResearchCopyWithImpl<$Res, Research>;
  @useResult
  $Res call(
      {String id,
      String name,
      int? price,
      int categoryType,
      int scheduleType,
      String buildingId});
}

/// @nodoc
class _$ResearchCopyWithImpl<$Res, $Val extends Research>
    implements $ResearchCopyWith<$Res> {
  _$ResearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = freezed,
    Object? categoryType = null,
    Object? scheduleType = null,
    Object? buildingId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as int,
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResearchCopyWith<$Res> implements $ResearchCopyWith<$Res> {
  factory _$$_ResearchCopyWith(
          _$_Research value, $Res Function(_$_Research) then) =
      __$$_ResearchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int? price,
      int categoryType,
      int scheduleType,
      String buildingId});
}

/// @nodoc
class __$$_ResearchCopyWithImpl<$Res>
    extends _$ResearchCopyWithImpl<$Res, _$_Research>
    implements _$$_ResearchCopyWith<$Res> {
  __$$_ResearchCopyWithImpl(
      _$_Research _value, $Res Function(_$_Research) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = freezed,
    Object? categoryType = null,
    Object? scheduleType = null,
    Object? buildingId = null,
  }) {
    return _then(_$_Research(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as int,
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Research implements _Research {
  const _$_Research(
      {required this.id,
      required this.name,
      required this.price,
      required this.categoryType,
      required this.scheduleType,
      required this.buildingId});

  factory _$_Research.fromJson(Map<String, dynamic> json) =>
      _$$_ResearchFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int? price;
  @override
  final int categoryType;
  @override
  final int scheduleType;
  @override
  final String buildingId;

  @override
  String toString() {
    return 'Research(id: $id, name: $name, price: $price, categoryType: $categoryType, scheduleType: $scheduleType, buildingId: $buildingId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Research &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.scheduleType, scheduleType) ||
                other.scheduleType == scheduleType) &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, price, categoryType, scheduleType, buildingId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResearchCopyWith<_$_Research> get copyWith =>
      __$$_ResearchCopyWithImpl<_$_Research>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResearchToJson(
      this,
    );
  }
}

abstract class _Research implements Research {
  const factory _Research(
      {required final String id,
      required final String name,
      required final int? price,
      required final int categoryType,
      required final int scheduleType,
      required final String buildingId}) = _$_Research;

  factory _Research.fromJson(Map<String, dynamic> json) = _$_Research.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int? get price;
  @override
  int get categoryType;
  @override
  int get scheduleType;
  @override
  String get buildingId;
  @override
  @JsonKey(ignore: true)
  _$$_ResearchCopyWith<_$_Research> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteDoctor _$FavoriteDoctorFromJson(Map<String, dynamic> json) {
  return _FavoriteDoctor.fromJson(json);
}

/// @nodoc
mixin _$FavoriteDoctor {
  String get id => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get middleName => throw _privateConstructorUsedError;
  String get specializationId => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  int get categoryType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteDoctorCopyWith<FavoriteDoctor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteDoctorCopyWith<$Res> {
  factory $FavoriteDoctorCopyWith(
          FavoriteDoctor value, $Res Function(FavoriteDoctor) then) =
      _$FavoriteDoctorCopyWithImpl<$Res, FavoriteDoctor>;
  @useResult
  $Res call(
      {String id,
      String lastName,
      String firstName,
      String middleName,
      String specializationId,
      String specialization,
      int categoryType});
}

/// @nodoc
class _$FavoriteDoctorCopyWithImpl<$Res, $Val extends FavoriteDoctor>
    implements $FavoriteDoctorCopyWith<$Res> {
  _$FavoriteDoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? specializationId = null,
    Object? specialization = null,
    Object? categoryType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      specializationId: null == specializationId
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: null == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteDoctorCopyWith<$Res>
    implements $FavoriteDoctorCopyWith<$Res> {
  factory _$$_FavoriteDoctorCopyWith(
          _$_FavoriteDoctor value, $Res Function(_$_FavoriteDoctor) then) =
      __$$_FavoriteDoctorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String lastName,
      String firstName,
      String middleName,
      String specializationId,
      String specialization,
      int categoryType});
}

/// @nodoc
class __$$_FavoriteDoctorCopyWithImpl<$Res>
    extends _$FavoriteDoctorCopyWithImpl<$Res, _$_FavoriteDoctor>
    implements _$$_FavoriteDoctorCopyWith<$Res> {
  __$$_FavoriteDoctorCopyWithImpl(
      _$_FavoriteDoctor _value, $Res Function(_$_FavoriteDoctor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? specializationId = null,
    Object? specialization = null,
    Object? categoryType = null,
  }) {
    return _then(_$_FavoriteDoctor(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      specializationId: null == specializationId
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: null == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteDoctor implements _FavoriteDoctor {
  const _$_FavoriteDoctor(
      {required this.id,
      required this.lastName,
      required this.firstName,
      required this.middleName,
      required this.specializationId,
      required this.specialization,
      required this.categoryType});

  factory _$_FavoriteDoctor.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteDoctorFromJson(json);

  @override
  final String id;
  @override
  final String lastName;
  @override
  final String firstName;
  @override
  final String middleName;
  @override
  final String specializationId;
  @override
  final String specialization;
  @override
  final int categoryType;

  @override
  String toString() {
    return 'FavoriteDoctor(id: $id, lastName: $lastName, firstName: $firstName, middleName: $middleName, specializationId: $specializationId, specialization: $specialization, categoryType: $categoryType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteDoctor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.specializationId, specializationId) ||
                other.specializationId == specializationId) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, lastName, firstName,
      middleName, specializationId, specialization, categoryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteDoctorCopyWith<_$_FavoriteDoctor> get copyWith =>
      __$$_FavoriteDoctorCopyWithImpl<_$_FavoriteDoctor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteDoctorToJson(
      this,
    );
  }
}

abstract class _FavoriteDoctor implements FavoriteDoctor {
  const factory _FavoriteDoctor(
      {required final String id,
      required final String lastName,
      required final String firstName,
      required final String middleName,
      required final String specializationId,
      required final String specialization,
      required final int categoryType}) = _$_FavoriteDoctor;

  factory _FavoriteDoctor.fromJson(Map<String, dynamic> json) =
      _$_FavoriteDoctor.fromJson;

  @override
  String get id;
  @override
  String get lastName;
  @override
  String get firstName;
  @override
  String get middleName;
  @override
  String get specializationId;
  @override
  String get specialization;
  @override
  int get categoryType;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteDoctorCopyWith<_$_FavoriteDoctor> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentModel _$AssessmentModelFromJson(Map<String, dynamic> json) {
  return _AssessmentModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentModel {
  int get rating => throw _privateConstructorUsedError;
  String get header => throw _privateConstructorUsedError;
  String get assessment => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentModelCopyWith<AssessmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentModelCopyWith<$Res> {
  factory $AssessmentModelCopyWith(
          AssessmentModel value, $Res Function(AssessmentModel) then) =
      _$AssessmentModelCopyWithImpl<$Res, AssessmentModel>;
  @useResult
  $Res call(
      {int rating,
      String header,
      String assessment,
      bool isPublic,
      String user});
}

/// @nodoc
class _$AssessmentModelCopyWithImpl<$Res, $Val extends AssessmentModel>
    implements $AssessmentModelCopyWith<$Res> {
  _$AssessmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? header = null,
    Object? assessment = null,
    Object? isPublic = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      assessment: null == assessment
          ? _value.assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssessmentModelCopyWith<$Res>
    implements $AssessmentModelCopyWith<$Res> {
  factory _$$_AssessmentModelCopyWith(
          _$_AssessmentModel value, $Res Function(_$_AssessmentModel) then) =
      __$$_AssessmentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rating,
      String header,
      String assessment,
      bool isPublic,
      String user});
}

/// @nodoc
class __$$_AssessmentModelCopyWithImpl<$Res>
    extends _$AssessmentModelCopyWithImpl<$Res, _$_AssessmentModel>
    implements _$$_AssessmentModelCopyWith<$Res> {
  __$$_AssessmentModelCopyWithImpl(
      _$_AssessmentModel _value, $Res Function(_$_AssessmentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? header = null,
    Object? assessment = null,
    Object? isPublic = null,
    Object? user = null,
  }) {
    return _then(_$_AssessmentModel(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      assessment: null == assessment
          ? _value.assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssessmentModel implements _AssessmentModel {
  const _$_AssessmentModel(
      {required this.rating,
      required this.header,
      required this.assessment,
      required this.isPublic,
      required this.user});

  factory _$_AssessmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_AssessmentModelFromJson(json);

  @override
  final int rating;
  @override
  final String header;
  @override
  final String assessment;
  @override
  final bool isPublic;
  @override
  final String user;

  @override
  String toString() {
    return 'AssessmentModel(rating: $rating, header: $header, assessment: $assessment, isPublic: $isPublic, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssessmentModel &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.assessment, assessment) ||
                other.assessment == assessment) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rating, header, assessment, isPublic, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssessmentModelCopyWith<_$_AssessmentModel> get copyWith =>
      __$$_AssessmentModelCopyWithImpl<_$_AssessmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssessmentModelToJson(
      this,
    );
  }
}

abstract class _AssessmentModel implements AssessmentModel {
  const factory _AssessmentModel(
      {required final int rating,
      required final String header,
      required final String assessment,
      required final bool isPublic,
      required final String user}) = _$_AssessmentModel;

  factory _AssessmentModel.fromJson(Map<String, dynamic> json) =
      _$_AssessmentModel.fromJson;

  @override
  int get rating;
  @override
  String get header;
  @override
  String get assessment;
  @override
  bool get isPublic;
  @override
  String get user;
  @override
  @JsonKey(ignore: true)
  _$$_AssessmentModelCopyWith<_$_AssessmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
