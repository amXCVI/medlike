// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$DocumentModelCopyWithImpl<$Res, DocumentModel>;
  @useResult
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
class _$DocumentModelCopyWithImpl<$Res, $Val extends DocumentModel>
    implements $DocumentModelCopyWith<$Res> {
  _$DocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentName = null,
    Object? documentURL = null,
    Object? status = null,
    Object? clinicAddress = null,
    Object? documentSubscribeDate = null,
    Object? documentCreateDate = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      documentURL: null == documentURL
          ? _value.documentURL
          : documentURL // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      clinicAddress: null == clinicAddress
          ? _value.clinicAddress
          : clinicAddress // ignore: cast_nullable_to_non_nullable
              as String,
      documentSubscribeDate: null == documentSubscribeDate
          ? _value.documentSubscribeDate
          : documentSubscribeDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      documentCreateDate: null == documentCreateDate
          ? _value.documentCreateDate
          : documentCreateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentModelModelCopyWith<$Res>
    implements $DocumentModelCopyWith<$Res> {
  factory _$$_DocumentModelModelCopyWith(_$_DocumentModelModel value,
          $Res Function(_$_DocumentModelModel) then) =
      __$$_DocumentModelModelCopyWithImpl<$Res>;
  @override
  @useResult
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
    extends _$DocumentModelCopyWithImpl<$Res, _$_DocumentModelModel>
    implements _$$_DocumentModelModelCopyWith<$Res> {
  __$$_DocumentModelModelCopyWithImpl(
      _$_DocumentModelModel _value, $Res Function(_$_DocumentModelModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentName = null,
    Object? documentURL = null,
    Object? status = null,
    Object? clinicAddress = null,
    Object? documentSubscribeDate = null,
    Object? documentCreateDate = null,
    Object? userName = null,
  }) {
    return _then(_$_DocumentModelModel(
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      documentURL: null == documentURL
          ? _value.documentURL
          : documentURL // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      clinicAddress: null == clinicAddress
          ? _value.clinicAddress
          : clinicAddress // ignore: cast_nullable_to_non_nullable
              as String,
      documentSubscribeDate: null == documentSubscribeDate
          ? _value.documentSubscribeDate
          : documentSubscribeDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      documentCreateDate: null == documentCreateDate
          ? _value.documentCreateDate
          : documentCreateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: null == userName
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
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.documentURL, documentURL) ||
                other.documentURL == documentURL) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.clinicAddress, clinicAddress) ||
                other.clinicAddress == clinicAddress) &&
            (identical(other.documentSubscribeDate, documentSubscribeDate) ||
                other.documentSubscribeDate == documentSubscribeDate) &&
            (identical(other.documentCreateDate, documentCreateDate) ||
                other.documentCreateDate == documentCreateDate) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentName,
      documentURL,
      status,
      clinicAddress,
      documentSubscribeDate,
      documentCreateDate,
      userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentModelModelCopyWith<_$_DocumentModelModel> get copyWith =>
      __$$_DocumentModelModelCopyWithImpl<_$_DocumentModelModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentModelModelToJson(
      this,
    );
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
  String get documentName;
  @override
  String get documentURL;
  @override
  int get status;
  @override
  String get clinicAddress;
  @override
  DateTime get documentSubscribeDate;
  @override
  DateTime get documentCreateDate;
  @override
  String get userName;
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
      _$DocumentFilterItemModelCopyWithImpl<$Res, DocumentFilterItemModel>;
  @useResult
  $Res call({String label, String value, String categoryLabel});
}

/// @nodoc
class _$DocumentFilterItemModelCopyWithImpl<$Res,
        $Val extends DocumentFilterItemModel>
    implements $DocumentFilterItemModelCopyWith<$Res> {
  _$DocumentFilterItemModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_DocumentFilterItemModelCopyWith<$Res>
    implements $DocumentFilterItemModelCopyWith<$Res> {
  factory _$$_DocumentFilterItemModelCopyWith(_$_DocumentFilterItemModel value,
          $Res Function(_$_DocumentFilterItemModel) then) =
      __$$_DocumentFilterItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value, String categoryLabel});
}

/// @nodoc
class __$$_DocumentFilterItemModelCopyWithImpl<$Res>
    extends _$DocumentFilterItemModelCopyWithImpl<$Res,
        _$_DocumentFilterItemModel>
    implements _$$_DocumentFilterItemModelCopyWith<$Res> {
  __$$_DocumentFilterItemModelCopyWithImpl(_$_DocumentFilterItemModel _value,
      $Res Function(_$_DocumentFilterItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? categoryLabel = null,
  }) {
    return _then(_$_DocumentFilterItemModel(
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
  _$$_DocumentFilterItemModelCopyWith<_$_DocumentFilterItemModel>
      get copyWith =>
          __$$_DocumentFilterItemModelCopyWithImpl<_$_DocumentFilterItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentFilterItemModelToJson(
      this,
    );
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
  String get label;
  @override
  String get value;
  @override
  String get categoryLabel;
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
      _$DocumentFilterModelCopyWithImpl<$Res, DocumentFilterModel>;
  @useResult
  $Res call(
      {String title, String value, List<DocumentFilterItemModel> filters});
}

/// @nodoc
class _$DocumentFilterModelCopyWithImpl<$Res, $Val extends DocumentFilterModel>
    implements $DocumentFilterModelCopyWith<$Res> {
  _$DocumentFilterModelCopyWithImpl(this._value, this._then);

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
              as List<DocumentFilterItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentFilterModelCopyWith<$Res>
    implements $DocumentFilterModelCopyWith<$Res> {
  factory _$$_DocumentFilterModelCopyWith(_$_DocumentFilterModel value,
          $Res Function(_$_DocumentFilterModel) then) =
      __$$_DocumentFilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String value, List<DocumentFilterItemModel> filters});
}

/// @nodoc
class __$$_DocumentFilterModelCopyWithImpl<$Res>
    extends _$DocumentFilterModelCopyWithImpl<$Res, _$_DocumentFilterModel>
    implements _$$_DocumentFilterModelCopyWith<$Res> {
  __$$_DocumentFilterModelCopyWithImpl(_$_DocumentFilterModel _value,
      $Res Function(_$_DocumentFilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? filters = null,
  }) {
    return _then(_$_DocumentFilterModel(
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
    if (_filters is EqualUnmodifiableListView) return _filters;
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
  _$$_DocumentFilterModelCopyWith<_$_DocumentFilterModel> get copyWith =>
      __$$_DocumentFilterModelCopyWithImpl<_$_DocumentFilterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentFilterModelToJson(
      this,
    );
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
  String get title;
  @override
  String get value;
  @override
  List<DocumentFilterItemModel> get filters;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentFilterModelCopyWith<_$_DocumentFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
