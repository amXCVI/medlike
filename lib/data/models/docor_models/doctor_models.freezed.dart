// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$DoctorsResponseModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'navigationItems') List<NavigationItem>? navigationItems,
      @JsonKey(name: 'doctors') List<Doctor>? doctors,
      @JsonKey(name: 'researches') List<Research>? researches,
      @JsonKey(name: 'cabinets') List<Cabinet>? cabinets,
      int? price});
}

/// @nodoc
class _$DoctorsResponseModelCopyWithImpl<$Res>
    implements $DoctorsResponseModelCopyWith<$Res> {
  _$DoctorsResponseModelCopyWithImpl(this._value, this._then);

  final DoctorsResponseModel _value;
  // ignore: unused_field
  final $Res Function(DoctorsResponseModel) _then;

  @override
  $Res call({
    Object? navigationItems = freezed,
    Object? doctors = freezed,
    Object? researches = freezed,
    Object? cabinets = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      navigationItems: navigationItems == freezed
          ? _value.navigationItems
          : navigationItems // ignore: cast_nullable_to_non_nullable
              as List<NavigationItem>?,
      doctors: doctors == freezed
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Doctor>?,
      researches: researches == freezed
          ? _value.researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<Research>?,
      cabinets: cabinets == freezed
          ? _value.cabinets
          : cabinets // ignore: cast_nullable_to_non_nullable
              as List<Cabinet>?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_DoctorsResponseModelCopyWith<$Res>
    implements $DoctorsResponseModelCopyWith<$Res> {
  factory _$$_DoctorsResponseModelCopyWith(_$_DoctorsResponseModel value,
          $Res Function(_$_DoctorsResponseModel) then) =
      __$$_DoctorsResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'navigationItems') List<NavigationItem>? navigationItems,
      @JsonKey(name: 'doctors') List<Doctor>? doctors,
      @JsonKey(name: 'researches') List<Research>? researches,
      @JsonKey(name: 'cabinets') List<Cabinet>? cabinets,
      int? price});
}

/// @nodoc
class __$$_DoctorsResponseModelCopyWithImpl<$Res>
    extends _$DoctorsResponseModelCopyWithImpl<$Res>
    implements _$$_DoctorsResponseModelCopyWith<$Res> {
  __$$_DoctorsResponseModelCopyWithImpl(_$_DoctorsResponseModel _value,
      $Res Function(_$_DoctorsResponseModel) _then)
      : super(_value, (v) => _then(v as _$_DoctorsResponseModel));

  @override
  _$_DoctorsResponseModel get _value => super._value as _$_DoctorsResponseModel;

  @override
  $Res call({
    Object? navigationItems = freezed,
    Object? doctors = freezed,
    Object? researches = freezed,
    Object? cabinets = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_DoctorsResponseModel(
      navigationItems: navigationItems == freezed
          ? _value._navigationItems
          : navigationItems // ignore: cast_nullable_to_non_nullable
              as List<NavigationItem>?,
      doctors: doctors == freezed
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Doctor>?,
      researches: researches == freezed
          ? _value._researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<Research>?,
      cabinets: cabinets == freezed
          ? _value._cabinets
          : cabinets // ignore: cast_nullable_to_non_nullable
              as List<Cabinet>?,
      price: price == freezed
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
      @JsonKey(name: 'doctors')
          final List<Doctor>? doctors,
      @JsonKey(name: 'researches')
          final List<Research>? researches,
      @JsonKey(name: 'cabinets')
          final List<Cabinet>? cabinets,
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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Doctor>? _doctors;
  @override
  @JsonKey(name: 'doctors')
  List<Doctor>? get doctors {
    final value = _doctors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Research>? _researches;
  @override
  @JsonKey(name: 'researches')
  List<Research>? get researches {
    final value = _researches;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Cabinet>? _cabinets;
  @override
  @JsonKey(name: 'cabinets')
  List<Cabinet>? get cabinets {
    final value = _cabinets;
    if (value == null) return null;
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
            const DeepCollectionEquality().equals(other.price, price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_navigationItems),
      const DeepCollectionEquality().hash(_doctors),
      const DeepCollectionEquality().hash(_researches),
      const DeepCollectionEquality().hash(_cabinets),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$_DoctorsResponseModelCopyWith<_$_DoctorsResponseModel> get copyWith =>
      __$$_DoctorsResponseModelCopyWithImpl<_$_DoctorsResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoctorsResponseModelToJson(this);
  }
}

abstract class _DoctorsResponseModel implements DoctorsResponseModel {
  const factory _DoctorsResponseModel(
      {@JsonKey(name: 'navigationItems')
          final List<NavigationItem>? navigationItems,
      @JsonKey(name: 'doctors')
          final List<Doctor>? doctors,
      @JsonKey(name: 'researches')
          final List<Research>? researches,
      @JsonKey(name: 'cabinets')
          final List<Cabinet>? cabinets,
      final int? price}) = _$_DoctorsResponseModel;

  factory _DoctorsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_DoctorsResponseModel.fromJson;

  @override
  @JsonKey(name: 'navigationItems')
  List<NavigationItem>? get navigationItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'doctors')
  List<Doctor>? get doctors => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'researches')
  List<Research>? get researches => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cabinets')
  List<Cabinet>? get cabinets => throw _privateConstructorUsedError;
  @override
  int? get price => throw _privateConstructorUsedError;
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
      _$CabinetCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'cabinet_name') String? cabinetName,
      int? price});
}

/// @nodoc
class _$CabinetCopyWithImpl<$Res> implements $CabinetCopyWith<$Res> {
  _$CabinetCopyWithImpl(this._value, this._then);

  final Cabinet _value;
  // ignore: unused_field
  final $Res Function(Cabinet) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cabinetName = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: cabinetName == freezed
          ? _value.cabinetName
          : cabinetName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_CabinetCopyWith<$Res> implements $CabinetCopyWith<$Res> {
  factory _$$_CabinetCopyWith(
          _$_Cabinet value, $Res Function(_$_Cabinet) then) =
      __$$_CabinetCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'cabinet_name') String? cabinetName,
      int? price});
}

/// @nodoc
class __$$_CabinetCopyWithImpl<$Res> extends _$CabinetCopyWithImpl<$Res>
    implements _$$_CabinetCopyWith<$Res> {
  __$$_CabinetCopyWithImpl(_$_Cabinet _value, $Res Function(_$_Cabinet) _then)
      : super(_value, (v) => _then(v as _$_Cabinet));

  @override
  _$_Cabinet get _value => super._value as _$_Cabinet;

  @override
  $Res call({
    Object? id = freezed,
    Object? cabinetName = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_Cabinet(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: cabinetName == freezed
          ? _value.cabinetName
          : cabinetName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.cabinetName, cabinetName) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(cabinetName),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$_CabinetCopyWith<_$_Cabinet> get copyWith =>
      __$$_CabinetCopyWithImpl<_$_Cabinet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CabinetToJson(this);
  }
}

abstract class _Cabinet implements Cabinet {
  const factory _Cabinet(
      {required final String id,
      @JsonKey(name: 'cabinet_name') final String? cabinetName,
      final int? price}) = _$_Cabinet;

  factory _Cabinet.fromJson(Map<String, dynamic> json) = _$_Cabinet.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cabinet_name')
  String? get cabinetName => throw _privateConstructorUsedError;
  @override
  int? get price => throw _privateConstructorUsedError;
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
      _$NavigationItemCabinetCopyWithImpl<$Res>;
  $Res call({String oid, @JsonKey(name: 'cabinet_name') String? cabinetName});
}

/// @nodoc
class _$NavigationItemCabinetCopyWithImpl<$Res>
    implements $NavigationItemCabinetCopyWith<$Res> {
  _$NavigationItemCabinetCopyWithImpl(this._value, this._then);

  final NavigationItemCabinet _value;
  // ignore: unused_field
  final $Res Function(NavigationItemCabinet) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? cabinetName = freezed,
  }) {
    return _then(_value.copyWith(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: cabinetName == freezed
          ? _value.cabinetName
          : cabinetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_NavigationItemCabinetCopyWith<$Res>
    implements $NavigationItemCabinetCopyWith<$Res> {
  factory _$$_NavigationItemCabinetCopyWith(_$_NavigationItemCabinet value,
          $Res Function(_$_NavigationItemCabinet) then) =
      __$$_NavigationItemCabinetCopyWithImpl<$Res>;
  @override
  $Res call({String oid, @JsonKey(name: 'cabinet_name') String? cabinetName});
}

/// @nodoc
class __$$_NavigationItemCabinetCopyWithImpl<$Res>
    extends _$NavigationItemCabinetCopyWithImpl<$Res>
    implements _$$_NavigationItemCabinetCopyWith<$Res> {
  __$$_NavigationItemCabinetCopyWithImpl(_$_NavigationItemCabinet _value,
      $Res Function(_$_NavigationItemCabinet) _then)
      : super(_value, (v) => _then(v as _$_NavigationItemCabinet));

  @override
  _$_NavigationItemCabinet get _value =>
      super._value as _$_NavigationItemCabinet;

  @override
  $Res call({
    Object? oid = freezed,
    Object? cabinetName = freezed,
  }) {
    return _then(_$_NavigationItemCabinet(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as String,
      cabinetName: cabinetName == freezed
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
            const DeepCollectionEquality().equals(other.oid, oid) &&
            const DeepCollectionEquality()
                .equals(other.cabinetName, cabinetName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(oid),
      const DeepCollectionEquality().hash(cabinetName));

  @JsonKey(ignore: true)
  @override
  _$$_NavigationItemCabinetCopyWith<_$_NavigationItemCabinet> get copyWith =>
      __$$_NavigationItemCabinetCopyWithImpl<_$_NavigationItemCabinet>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NavigationItemCabinetToJson(this);
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
  String get oid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cabinet_name')
  String? get cabinetName => throw _privateConstructorUsedError;
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
      _$NavigationItemCopyWithImpl<$Res>;
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
class _$NavigationItemCopyWithImpl<$Res>
    implements $NavigationItemCopyWith<$Res> {
  _$NavigationItemCopyWithImpl(this._value, this._then);

  final NavigationItem _value;
  // ignore: unused_field
  final $Res Function(NavigationItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? count = freezed,
    Object? categoryType = freezed,
    Object? personalSchedule = freezed,
    Object? cabinetSchedule = freezed,
    Object? cabinets = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int?,
      personalSchedule: personalSchedule == freezed
          ? _value.personalSchedule
          : personalSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
      cabinetSchedule: cabinetSchedule == freezed
          ? _value.cabinetSchedule
          : cabinetSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
      cabinets: cabinets == freezed
          ? _value.cabinets
          : cabinets // ignore: cast_nullable_to_non_nullable
              as List<NavigationItemCabinet>?,
    ));
  }
}

/// @nodoc
abstract class _$$_NavigationItemCopyWith<$Res>
    implements $NavigationItemCopyWith<$Res> {
  factory _$$_NavigationItemCopyWith(
          _$_NavigationItem value, $Res Function(_$_NavigationItem) then) =
      __$$_NavigationItemCopyWithImpl<$Res>;
  @override
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
    extends _$NavigationItemCopyWithImpl<$Res>
    implements _$$_NavigationItemCopyWith<$Res> {
  __$$_NavigationItemCopyWithImpl(
      _$_NavigationItem _value, $Res Function(_$_NavigationItem) _then)
      : super(_value, (v) => _then(v as _$_NavigationItem));

  @override
  _$_NavigationItem get _value => super._value as _$_NavigationItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? count = freezed,
    Object? categoryType = freezed,
    Object? personalSchedule = freezed,
    Object? cabinetSchedule = freezed,
    Object? cabinets = freezed,
  }) {
    return _then(_$_NavigationItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int?,
      personalSchedule: personalSchedule == freezed
          ? _value.personalSchedule
          : personalSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
      cabinetSchedule: cabinetSchedule == freezed
          ? _value.cabinetSchedule
          : cabinetSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
      cabinets: cabinets == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality()
                .equals(other.categoryType, categoryType) &&
            const DeepCollectionEquality()
                .equals(other.personalSchedule, personalSchedule) &&
            const DeepCollectionEquality()
                .equals(other.cabinetSchedule, cabinetSchedule) &&
            const DeepCollectionEquality().equals(other._cabinets, _cabinets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(categoryType),
      const DeepCollectionEquality().hash(personalSchedule),
      const DeepCollectionEquality().hash(cabinetSchedule),
      const DeepCollectionEquality().hash(_cabinets));

  @JsonKey(ignore: true)
  @override
  _$$_NavigationItemCopyWith<_$_NavigationItem> get copyWith =>
      __$$_NavigationItemCopyWithImpl<_$_NavigationItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NavigationItemToJson(this);
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
  String get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  int? get categoryType => throw _privateConstructorUsedError;
  @override
  bool? get personalSchedule => throw _privateConstructorUsedError;
  @override
  bool? get cabinetSchedule => throw _privateConstructorUsedError;
  @override
  List<NavigationItemCabinet>? get cabinets =>
      throw _privateConstructorUsedError;
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
  String get specialization => throw _privateConstructorUsedError; //?
  int get price => throw _privateConstructorUsedError;
  int get categoryType => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  List<int> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorCopyWith<Doctor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) then) =
      _$DoctorCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String lastName,
      String firstName,
      String middleName,
      String specializationId,
      String specialization,
      int price,
      int categoryType,
      bool isFavorite,
      List<int> categories});
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res> implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._value, this._then);

  final Doctor _value;
  // ignore: unused_field
  final $Res Function(Doctor) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? specializationId = freezed,
    Object? specialization = freezed,
    Object? price = freezed,
    Object? categoryType = freezed,
    Object? isFavorite = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      specializationId: specializationId == freezed
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: specialization == freezed
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$$_DoctorCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$$_DoctorCopyWith(_$_Doctor value, $Res Function(_$_Doctor) then) =
      __$$_DoctorCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String lastName,
      String firstName,
      String middleName,
      String specializationId,
      String specialization,
      int price,
      int categoryType,
      bool isFavorite,
      List<int> categories});
}

/// @nodoc
class __$$_DoctorCopyWithImpl<$Res> extends _$DoctorCopyWithImpl<$Res>
    implements _$$_DoctorCopyWith<$Res> {
  __$$_DoctorCopyWithImpl(_$_Doctor _value, $Res Function(_$_Doctor) _then)
      : super(_value, (v) => _then(v as _$_Doctor));

  @override
  _$_Doctor get _value => super._value as _$_Doctor;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? specializationId = freezed,
    Object? specialization = freezed,
    Object? price = freezed,
    Object? categoryType = freezed,
    Object? isFavorite = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$_Doctor(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      specializationId: specializationId == freezed
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: specialization == freezed
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      required final List<int> categories})
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
  final int price;
  @override
  final int categoryType;
  @override
  final bool isFavorite;
  final List<int> _categories;
  @override
  List<int> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'Doctor(id: $id, lastName: $lastName, firstName: $firstName, middleName: $middleName, specializationId: $specializationId, specialization: $specialization, price: $price, categoryType: $categoryType, isFavorite: $isFavorite, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Doctor &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality()
                .equals(other.middleName, middleName) &&
            const DeepCollectionEquality()
                .equals(other.specializationId, specializationId) &&
            const DeepCollectionEquality()
                .equals(other.specialization, specialization) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.categoryType, categoryType) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(middleName),
      const DeepCollectionEquality().hash(specializationId),
      const DeepCollectionEquality().hash(specialization),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(categoryType),
      const DeepCollectionEquality().hash(isFavorite),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  _$$_DoctorCopyWith<_$_Doctor> get copyWith =>
      __$$_DoctorCopyWithImpl<_$_Doctor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoctorToJson(this);
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
      required final int price,
      required final int categoryType,
      required final bool isFavorite,
      required final List<int> categories}) = _$_Doctor;

  factory _Doctor.fromJson(Map<String, dynamic> json) = _$_Doctor.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get middleName => throw _privateConstructorUsedError;
  @override
  String get specializationId => throw _privateConstructorUsedError;
  @override
  String get specialization => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  int get categoryType => throw _privateConstructorUsedError;
  @override
  bool get isFavorite => throw _privateConstructorUsedError;
  @override
  List<int> get categories => throw _privateConstructorUsedError;
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
  int get price => throw _privateConstructorUsedError;
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
      _$ResearchCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      int price,
      int categoryType,
      int scheduleType,
      String buildingId});
}

/// @nodoc
class _$ResearchCopyWithImpl<$Res> implements $ResearchCopyWith<$Res> {
  _$ResearchCopyWithImpl(this._value, this._then);

  final Research _value;
  // ignore: unused_field
  final $Res Function(Research) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? categoryType = freezed,
    Object? scheduleType = freezed,
    Object? buildingId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleType: scheduleType == freezed
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as int,
      buildingId: buildingId == freezed
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ResearchCopyWith<$Res> implements $ResearchCopyWith<$Res> {
  factory _$$_ResearchCopyWith(
          _$_Research value, $Res Function(_$_Research) then) =
      __$$_ResearchCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      int price,
      int categoryType,
      int scheduleType,
      String buildingId});
}

/// @nodoc
class __$$_ResearchCopyWithImpl<$Res> extends _$ResearchCopyWithImpl<$Res>
    implements _$$_ResearchCopyWith<$Res> {
  __$$_ResearchCopyWithImpl(
      _$_Research _value, $Res Function(_$_Research) _then)
      : super(_value, (v) => _then(v as _$_Research));

  @override
  _$_Research get _value => super._value as _$_Research;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? categoryType = freezed,
    Object? scheduleType = freezed,
    Object? buildingId = freezed,
  }) {
    return _then(_$_Research(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleType: scheduleType == freezed
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as int,
      buildingId: buildingId == freezed
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
  final int price;
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.categoryType, categoryType) &&
            const DeepCollectionEquality()
                .equals(other.scheduleType, scheduleType) &&
            const DeepCollectionEquality()
                .equals(other.buildingId, buildingId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(categoryType),
      const DeepCollectionEquality().hash(scheduleType),
      const DeepCollectionEquality().hash(buildingId));

  @JsonKey(ignore: true)
  @override
  _$$_ResearchCopyWith<_$_Research> get copyWith =>
      __$$_ResearchCopyWithImpl<_$_Research>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResearchToJson(this);
  }
}

abstract class _Research implements Research {
  const factory _Research(
      {required final String id,
      required final String name,
      required final int price,
      required final int categoryType,
      required final int scheduleType,
      required final String buildingId}) = _$_Research;

  factory _Research.fromJson(Map<String, dynamic> json) = _$_Research.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  int get categoryType => throw _privateConstructorUsedError;
  @override
  int get scheduleType => throw _privateConstructorUsedError;
  @override
  String get buildingId => throw _privateConstructorUsedError;
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
      _$FavoriteDoctorCopyWithImpl<$Res>;
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
class _$FavoriteDoctorCopyWithImpl<$Res>
    implements $FavoriteDoctorCopyWith<$Res> {
  _$FavoriteDoctorCopyWithImpl(this._value, this._then);

  final FavoriteDoctor _value;
  // ignore: unused_field
  final $Res Function(FavoriteDoctor) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? specializationId = freezed,
    Object? specialization = freezed,
    Object? categoryType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      specializationId: specializationId == freezed
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: specialization == freezed
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_FavoriteDoctorCopyWith<$Res>
    implements $FavoriteDoctorCopyWith<$Res> {
  factory _$$_FavoriteDoctorCopyWith(
          _$_FavoriteDoctor value, $Res Function(_$_FavoriteDoctor) then) =
      __$$_FavoriteDoctorCopyWithImpl<$Res>;
  @override
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
    extends _$FavoriteDoctorCopyWithImpl<$Res>
    implements _$$_FavoriteDoctorCopyWith<$Res> {
  __$$_FavoriteDoctorCopyWithImpl(
      _$_FavoriteDoctor _value, $Res Function(_$_FavoriteDoctor) _then)
      : super(_value, (v) => _then(v as _$_FavoriteDoctor));

  @override
  _$_FavoriteDoctor get _value => super._value as _$_FavoriteDoctor;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? specializationId = freezed,
    Object? specialization = freezed,
    Object? categoryType = freezed,
  }) {
    return _then(_$_FavoriteDoctor(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      specializationId: specializationId == freezed
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: specialization == freezed
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: categoryType == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality()
                .equals(other.middleName, middleName) &&
            const DeepCollectionEquality()
                .equals(other.specializationId, specializationId) &&
            const DeepCollectionEquality()
                .equals(other.specialization, specialization) &&
            const DeepCollectionEquality()
                .equals(other.categoryType, categoryType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(middleName),
      const DeepCollectionEquality().hash(specializationId),
      const DeepCollectionEquality().hash(specialization),
      const DeepCollectionEquality().hash(categoryType));

  @JsonKey(ignore: true)
  @override
  _$$_FavoriteDoctorCopyWith<_$_FavoriteDoctor> get copyWith =>
      __$$_FavoriteDoctorCopyWithImpl<_$_FavoriteDoctor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteDoctorToJson(this);
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
  String get id => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get middleName => throw _privateConstructorUsedError;
  @override
  String get specializationId => throw _privateConstructorUsedError;
  @override
  String get specialization => throw _privateConstructorUsedError;
  @override
  int get categoryType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteDoctorCopyWith<_$_FavoriteDoctor> get copyWith =>
      throw _privateConstructorUsedError;
}
