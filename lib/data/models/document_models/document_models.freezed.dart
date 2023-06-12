// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'document_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) {
  return _DocumentModelModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentModel {
  String get documentName => throw _privateConstructorUsedError;
  String get documentURL => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String get clinicAddress => throw _privateConstructorUsedError;
  DateTime get documentSubscribeDate => throw _privateConstructorUsedError;
  DateTime get documentCreateDate => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentModelCopyWith<DocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentModelCopyWith<$Res> {
  factory $DocumentModelCopyWith(
          DocumentModel value, $Res Function(DocumentModel) then) =
      _$DocumentModelCopyWithImpl<$Res>;
  $Res call(
      {String documentName,
      String documentURL,
      int status,
      String clinicAddress,
      DateTime documentSubscribeDate,
      DateTime documentCreateDate,
      String userName});
}

/// @nodoc
class _$DocumentModelCopyWithImpl<$Res>
    implements $DocumentModelCopyWith<$Res> {
  _$DocumentModelCopyWithImpl(this._value, this._then);

  final DocumentModel _value;
  // ignore: unused_field
  final $Res Function(DocumentModel) _then;

  @override
  $Res call({
    Object? documentName = freezed,
    Object? documentURL = freezed,
    Object? status = freezed,
    Object? clinicAddress = freezed,
    Object? documentSubscribeDate = freezed,
    Object? documentCreateDate = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      documentName: documentName == freezed
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      documentURL: documentURL == freezed
          ? _value.documentURL
          : documentURL // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      clinicAddress: clinicAddress == freezed
          ? _value.clinicAddress
          : clinicAddress // ignore: cast_nullable_to_non_nullable
              as String,
      documentSubscribeDate: documentSubscribeDate == freezed
          ? _value.documentSubscribeDate
          : documentSubscribeDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      documentCreateDate: documentCreateDate == freezed
          ? _value.documentCreateDate
          : documentCreateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DocumentModelModelCopyWith<$Res>
    implements $DocumentModelCopyWith<$Res> {
  factory _$$_DocumentModelModelCopyWith(_$_DocumentModelModel value,
          $Res Function(_$_DocumentModelModel) then) =
      __$$_DocumentModelModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String documentName,
      String documentURL,
      int status,
      String clinicAddress,
      DateTime documentSubscribeDate,
      DateTime documentCreateDate,
      String userName});
}

/// @nodoc
class __$$_DocumentModelModelCopyWithImpl<$Res>
    extends _$DocumentModelCopyWithImpl<$Res>
    implements _$$_DocumentModelModelCopyWith<$Res> {
  __$$_DocumentModelModelCopyWithImpl(
      _$_DocumentModelModel _value, $Res Function(_$_DocumentModelModel) _then)
      : super(_value, (v) => _then(v as _$_DocumentModelModel));

  @override
  _$_DocumentModelModel get _value => super._value as _$_DocumentModelModel;

  @override
  $Res call({
    Object? documentName = freezed,
    Object? documentURL = freezed,
    Object? status = freezed,
    Object? clinicAddress = freezed,
    Object? documentSubscribeDate = freezed,
    Object? documentCreateDate = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$_DocumentModelModel(
      documentName: documentName == freezed
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      documentURL: documentURL == freezed
          ? _value.documentURL
          : documentURL // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      clinicAddress: clinicAddress == freezed
          ? _value.clinicAddress
          : clinicAddress // ignore: cast_nullable_to_non_nullable
              as String,
      documentSubscribeDate: documentSubscribeDate == freezed
          ? _value.documentSubscribeDate
          : documentSubscribeDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      documentCreateDate: documentCreateDate == freezed
          ? _value.documentCreateDate
          : documentCreateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentModelModel implements _DocumentModelModel {
  const _$_DocumentModelModel(
      {required this.documentName,
      required this.documentURL,
      required this.status,
      required this.clinicAddress,
      required this.documentSubscribeDate,
      required this.documentCreateDate,
      required this.userName});

  factory _$_DocumentModelModel.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentModelModelFromJson(json);

  @override
  final String documentName;
  @override
  final String documentURL;
  @override
  final int status;
  @override
  final String clinicAddress;
  @override
  final DateTime documentSubscribeDate;
  @override
  final DateTime documentCreateDate;
  @override
  final String userName;

  @override
  String toString() {
    return 'DocumentModel(documentName: $documentName, documentURL: $documentURL, status: $status, clinicAddress: $clinicAddress, documentSubscribeDate: $documentSubscribeDate, documentCreateDate: $documentCreateDate, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentModelModel &&
            const DeepCollectionEquality()
                .equals(other.documentName, documentName) &&
            const DeepCollectionEquality()
                .equals(other.documentURL, documentURL) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.clinicAddress, clinicAddress) &&
            const DeepCollectionEquality()
                .equals(other.documentSubscribeDate, documentSubscribeDate) &&
            const DeepCollectionEquality()
                .equals(other.documentCreateDate, documentCreateDate) &&
            const DeepCollectionEquality().equals(other.userName, userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(documentName),
      const DeepCollectionEquality().hash(documentURL),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(clinicAddress),
      const DeepCollectionEquality().hash(documentSubscribeDate),
      const DeepCollectionEquality().hash(documentCreateDate),
      const DeepCollectionEquality().hash(userName));

  @JsonKey(ignore: true)
  @override
  _$$_DocumentModelModelCopyWith<_$_DocumentModelModel> get copyWith =>
      __$$_DocumentModelModelCopyWithImpl<_$_DocumentModelModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentModelModelToJson(this);
  }
}

abstract class _DocumentModelModel implements DocumentModel {
  const factory _DocumentModelModel(
      {required final String documentName,
      required final String documentURL,
      required final int status,
      required final String clinicAddress,
      required final DateTime documentSubscribeDate,
      required final DateTime documentCreateDate,
      required final String userName}) = _$_DocumentModelModel;

  factory _DocumentModelModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentModelModel.fromJson;

  @override
  String get documentName => throw _privateConstructorUsedError;
  @override
  String get documentURL => throw _privateConstructorUsedError;
  @override
  int get status => throw _privateConstructorUsedError;
  @override
  String get clinicAddress => throw _privateConstructorUsedError;
  @override
  DateTime get documentSubscribeDate => throw _privateConstructorUsedError;
  @override
  DateTime get documentCreateDate => throw _privateConstructorUsedError;
  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentModelModelCopyWith<_$_DocumentModelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentFilterItemModel _$DocumentFilterItemModelFromJson(
    Map<String, dynamic> json) {
  return _DocumentFilterItemModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentFilterItemModel {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get categoryLabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentFilterItemModelCopyWith<DocumentFilterItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentFilterItemModelCopyWith<$Res> {
  factory $DocumentFilterItemModelCopyWith(DocumentFilterItemModel value,
          $Res Function(DocumentFilterItemModel) then) =
      _$DocumentFilterItemModelCopyWithImpl<$Res>;
  $Res call({String label, String value, String categoryLabel});
}

/// @nodoc
class _$DocumentFilterItemModelCopyWithImpl<$Res>
    implements $DocumentFilterItemModelCopyWith<$Res> {
  _$DocumentFilterItemModelCopyWithImpl(this._value, this._then);

  final DocumentFilterItemModel _value;
  // ignore: unused_field
  final $Res Function(DocumentFilterItemModel) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
    Object? categoryLabel = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      categoryLabel: categoryLabel == freezed
          ? _value.categoryLabel
          : categoryLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DocumentFilterItemModelCopyWith<$Res>
    implements $DocumentFilterItemModelCopyWith<$Res> {
  factory _$$_DocumentFilterItemModelCopyWith(_$_DocumentFilterItemModel value,
          $Res Function(_$_DocumentFilterItemModel) then) =
      __$$_DocumentFilterItemModelCopyWithImpl<$Res>;
  @override
  $Res call({String label, String value, String categoryLabel});
}

/// @nodoc
class __$$_DocumentFilterItemModelCopyWithImpl<$Res>
    extends _$DocumentFilterItemModelCopyWithImpl<$Res>
    implements _$$_DocumentFilterItemModelCopyWith<$Res> {
  __$$_DocumentFilterItemModelCopyWithImpl(_$_DocumentFilterItemModel _value,
      $Res Function(_$_DocumentFilterItemModel) _then)
      : super(_value, (v) => _then(v as _$_DocumentFilterItemModel));

  @override
  _$_DocumentFilterItemModel get _value =>
      super._value as _$_DocumentFilterItemModel;

  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
    Object? categoryLabel = freezed,
  }) {
    return _then(_$_DocumentFilterItemModel(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      categoryLabel: categoryLabel == freezed
          ? _value.categoryLabel
          : categoryLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentFilterItemModel implements _DocumentFilterItemModel {
  const _$_DocumentFilterItemModel(
      {required this.label, required this.value, required this.categoryLabel});

  factory _$_DocumentFilterItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentFilterItemModelFromJson(json);

  @override
  final String label;
  @override
  final String value;
  @override
  final String categoryLabel;

  @override
  String toString() {
    return 'DocumentFilterItemModel(label: $label, value: $value, categoryLabel: $categoryLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentFilterItemModel &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.categoryLabel, categoryLabel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(categoryLabel));

  @JsonKey(ignore: true)
  @override
  _$$_DocumentFilterItemModelCopyWith<_$_DocumentFilterItemModel>
      get copyWith =>
          __$$_DocumentFilterItemModelCopyWithImpl<_$_DocumentFilterItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentFilterItemModelToJson(this);
  }
}

abstract class _DocumentFilterItemModel implements DocumentFilterItemModel {
  const factory _DocumentFilterItemModel(
      {required final String label,
      required final String value,
      required final String categoryLabel}) = _$_DocumentFilterItemModel;

  factory _DocumentFilterItemModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentFilterItemModel.fromJson;

  @override
  String get label => throw _privateConstructorUsedError;
  @override
  String get value => throw _privateConstructorUsedError;
  @override
  String get categoryLabel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentFilterItemModelCopyWith<_$_DocumentFilterItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

DocumentFilterModel _$DocumentFilterModelFromJson(Map<String, dynamic> json) {
  return _DocumentFilterModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentFilterModel {
  String get title => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  List<DocumentFilterItemModel> get filters =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentFilterModelCopyWith<DocumentFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentFilterModelCopyWith<$Res> {
  factory $DocumentFilterModelCopyWith(
          DocumentFilterModel value, $Res Function(DocumentFilterModel) then) =
      _$DocumentFilterModelCopyWithImpl<$Res>;
  $Res call(
      {String title, String value, List<DocumentFilterItemModel> filters});
}

/// @nodoc
class _$DocumentFilterModelCopyWithImpl<$Res>
    implements $DocumentFilterModelCopyWith<$Res> {
  _$DocumentFilterModelCopyWithImpl(this._value, this._then);

  final DocumentFilterModel _value;
  // ignore: unused_field
  final $Res Function(DocumentFilterModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? value = freezed,
    Object? filters = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      filters: filters == freezed
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<DocumentFilterItemModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_DocumentFilterModelCopyWith<$Res>
    implements $DocumentFilterModelCopyWith<$Res> {
  factory _$$_DocumentFilterModelCopyWith(_$_DocumentFilterModel value,
          $Res Function(_$_DocumentFilterModel) then) =
      __$$_DocumentFilterModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title, String value, List<DocumentFilterItemModel> filters});
}

/// @nodoc
class __$$_DocumentFilterModelCopyWithImpl<$Res>
    extends _$DocumentFilterModelCopyWithImpl<$Res>
    implements _$$_DocumentFilterModelCopyWith<$Res> {
  __$$_DocumentFilterModelCopyWithImpl(_$_DocumentFilterModel _value,
      $Res Function(_$_DocumentFilterModel) _then)
      : super(_value, (v) => _then(v as _$_DocumentFilterModel));

  @override
  _$_DocumentFilterModel get _value => super._value as _$_DocumentFilterModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? value = freezed,
    Object? filters = freezed,
  }) {
    return _then(_$_DocumentFilterModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      filters: filters == freezed
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<DocumentFilterItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentFilterModel implements _DocumentFilterModel {
  const _$_DocumentFilterModel(
      {required this.title,
      required this.value,
      required final List<DocumentFilterItemModel> filters})
      : _filters = filters;

  factory _$_DocumentFilterModel.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentFilterModelFromJson(json);

  @override
  final String title;
  @override
  final String value;
  final List<DocumentFilterItemModel> _filters;
  @override
  List<DocumentFilterItemModel> get filters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  String toString() {
    return 'DocumentFilterModel(title: $title, value: $value, filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentFilterModel &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(_filters));

  @JsonKey(ignore: true)
  @override
  _$$_DocumentFilterModelCopyWith<_$_DocumentFilterModel> get copyWith =>
      __$$_DocumentFilterModelCopyWithImpl<_$_DocumentFilterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentFilterModelToJson(this);
  }
}

abstract class _DocumentFilterModel implements DocumentFilterModel {
  const factory _DocumentFilterModel(
          {required final String title,
          required final String value,
          required final List<DocumentFilterItemModel> filters}) =
      _$_DocumentFilterModel;

  factory _DocumentFilterModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentFilterModel.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get value => throw _privateConstructorUsedError;
  @override
  List<DocumentFilterItemModel> get filters =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentFilterModelCopyWith<_$_DocumentFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
