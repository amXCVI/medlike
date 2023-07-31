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
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DocumentMetaLpuModel get lpu => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DocumentMetaSignEmployerModel? get signEmployer =>
      throw _privateConstructorUsedError;
  bool get isSignByPatient => throw _privateConstructorUsedError;
  DateTime? get signedByPatientAt => throw _privateConstructorUsedError;
  bool get isSignByEmployee => throw _privateConstructorUsedError;
  DateTime? get signedByEmployeeAt => throw _privateConstructorUsedError;

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
      {String id,
      String name,
      DocumentMetaLpuModel lpu,
      DateTime? updatedAt,
      DocumentMetaSignEmployerModel? signEmployer,
      bool isSignByPatient,
      DateTime? signedByPatientAt,
      bool isSignByEmployee,
      DateTime? signedByEmployeeAt});

  $DocumentMetaLpuModelCopyWith<$Res> get lpu;
  $DocumentMetaSignEmployerModelCopyWith<$Res>? get signEmployer;
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
    Object? id = null,
    Object? name = null,
    Object? lpu = null,
    Object? updatedAt = freezed,
    Object? signEmployer = freezed,
    Object? isSignByPatient = null,
    Object? signedByPatientAt = freezed,
    Object? isSignByEmployee = null,
    Object? signedByEmployeeAt = freezed,
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
      lpu: null == lpu
          ? _value.lpu
          : lpu // ignore: cast_nullable_to_non_nullable
              as DocumentMetaLpuModel,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      signEmployer: freezed == signEmployer
          ? _value.signEmployer
          : signEmployer // ignore: cast_nullable_to_non_nullable
              as DocumentMetaSignEmployerModel?,
      isSignByPatient: null == isSignByPatient
          ? _value.isSignByPatient
          : isSignByPatient // ignore: cast_nullable_to_non_nullable
              as bool,
      signedByPatientAt: freezed == signedByPatientAt
          ? _value.signedByPatientAt
          : signedByPatientAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSignByEmployee: null == isSignByEmployee
          ? _value.isSignByEmployee
          : isSignByEmployee // ignore: cast_nullable_to_non_nullable
              as bool,
      signedByEmployeeAt: freezed == signedByEmployeeAt
          ? _value.signedByEmployeeAt
          : signedByEmployeeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentMetaLpuModelCopyWith<$Res> get lpu {
    return $DocumentMetaLpuModelCopyWith<$Res>(_value.lpu, (value) {
      return _then(_value.copyWith(lpu: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentMetaSignEmployerModelCopyWith<$Res>? get signEmployer {
    if (_value.signEmployer == null) {
      return null;
    }

    return $DocumentMetaSignEmployerModelCopyWith<$Res>(_value.signEmployer!,
        (value) {
      return _then(_value.copyWith(signEmployer: value) as $Val);
    });
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
      {String id,
      String name,
      DocumentMetaLpuModel lpu,
      DateTime? updatedAt,
      DocumentMetaSignEmployerModel? signEmployer,
      bool isSignByPatient,
      DateTime? signedByPatientAt,
      bool isSignByEmployee,
      DateTime? signedByEmployeeAt});

  @override
  $DocumentMetaLpuModelCopyWith<$Res> get lpu;
  @override
  $DocumentMetaSignEmployerModelCopyWith<$Res>? get signEmployer;
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
    Object? id = null,
    Object? name = null,
    Object? lpu = null,
    Object? updatedAt = freezed,
    Object? signEmployer = freezed,
    Object? isSignByPatient = null,
    Object? signedByPatientAt = freezed,
    Object? isSignByEmployee = null,
    Object? signedByEmployeeAt = freezed,
  }) {
    return _then(_$_DocumentModelModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lpu: null == lpu
          ? _value.lpu
          : lpu // ignore: cast_nullable_to_non_nullable
              as DocumentMetaLpuModel,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      signEmployer: freezed == signEmployer
          ? _value.signEmployer
          : signEmployer // ignore: cast_nullable_to_non_nullable
              as DocumentMetaSignEmployerModel?,
      isSignByPatient: null == isSignByPatient
          ? _value.isSignByPatient
          : isSignByPatient // ignore: cast_nullable_to_non_nullable
              as bool,
      signedByPatientAt: freezed == signedByPatientAt
          ? _value.signedByPatientAt
          : signedByPatientAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSignByEmployee: null == isSignByEmployee
          ? _value.isSignByEmployee
          : isSignByEmployee // ignore: cast_nullable_to_non_nullable
              as bool,
      signedByEmployeeAt: freezed == signedByEmployeeAt
          ? _value.signedByEmployeeAt
          : signedByEmployeeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentModelModel implements _DocumentModelModel {
  const _$_DocumentModelModel(
      {required this.id,
      required this.name,
      required this.lpu,
      required this.updatedAt,
      required this.signEmployer,
      required this.isSignByPatient,
      required this.signedByPatientAt,
      required this.isSignByEmployee,
      required this.signedByEmployeeAt});

  factory _$_DocumentModelModel.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentModelModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DocumentMetaLpuModel lpu;
  @override
  final DateTime? updatedAt;
  @override
  final DocumentMetaSignEmployerModel? signEmployer;
  @override
  final bool isSignByPatient;
  @override
  final DateTime? signedByPatientAt;
  @override
  final bool isSignByEmployee;
  @override
  final DateTime? signedByEmployeeAt;

  @override
  String toString() {
    return 'DocumentModel(id: $id, name: $name, lpu: $lpu, updatedAt: $updatedAt, signEmployer: $signEmployer, isSignByPatient: $isSignByPatient, signedByPatientAt: $signedByPatientAt, isSignByEmployee: $isSignByEmployee, signedByEmployeeAt: $signedByEmployeeAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentModelModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lpu, lpu) || other.lpu == lpu) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.signEmployer, signEmployer) ||
                other.signEmployer == signEmployer) &&
            (identical(other.isSignByPatient, isSignByPatient) ||
                other.isSignByPatient == isSignByPatient) &&
            (identical(other.signedByPatientAt, signedByPatientAt) ||
                other.signedByPatientAt == signedByPatientAt) &&
            (identical(other.isSignByEmployee, isSignByEmployee) ||
                other.isSignByEmployee == isSignByEmployee) &&
            (identical(other.signedByEmployeeAt, signedByEmployeeAt) ||
                other.signedByEmployeeAt == signedByEmployeeAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      lpu,
      updatedAt,
      signEmployer,
      isSignByPatient,
      signedByPatientAt,
      isSignByEmployee,
      signedByEmployeeAt);

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
      {required final String id,
      required final String name,
      required final DocumentMetaLpuModel lpu,
      required final DateTime? updatedAt,
      required final DocumentMetaSignEmployerModel? signEmployer,
      required final bool isSignByPatient,
      required final DateTime? signedByPatientAt,
      required final bool isSignByEmployee,
      required final DateTime? signedByEmployeeAt}) = _$_DocumentModelModel;

  factory _DocumentModelModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentModelModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DocumentMetaLpuModel get lpu;
  @override
  DateTime? get updatedAt;
  @override
  DocumentMetaSignEmployerModel? get signEmployer;
  @override
  bool get isSignByPatient;
  @override
  DateTime? get signedByPatientAt;
  @override
  bool get isSignByEmployee;
  @override
  DateTime? get signedByEmployeeAt;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentModelModelCopyWith<_$_DocumentModelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentMetaModel _$DocumentMetaModelFromJson(Map<String, dynamic> json) {
  return _DocumentMetaModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentMetaModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DocumentMetaLpuModel get lpu => throw _privateConstructorUsedError;
  DocumentMetaPatientModel get patient => throw _privateConstructorUsedError;
  DocumentMetaDocumentCreatorModel? get documentCreator =>
      throw _privateConstructorUsedError;
  DocumentMetaSignEmployerModel? get signEmployer =>
      throw _privateConstructorUsedError;
  bool get isSignByPatient => throw _privateConstructorUsedError;
  DateTime? get signedByPatientAt => throw _privateConstructorUsedError;
  bool get isSignByEmployee => throw _privateConstructorUsedError;
  DateTime? get signedByEmployeeAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentMetaModelCopyWith<DocumentMetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentMetaModelCopyWith<$Res> {
  factory $DocumentMetaModelCopyWith(
          DocumentMetaModel value, $Res Function(DocumentMetaModel) then) =
      _$DocumentMetaModelCopyWithImpl<$Res, DocumentMetaModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime updatedAt,
      DocumentMetaLpuModel lpu,
      DocumentMetaPatientModel patient,
      DocumentMetaDocumentCreatorModel? documentCreator,
      DocumentMetaSignEmployerModel? signEmployer,
      bool isSignByPatient,
      DateTime? signedByPatientAt,
      bool isSignByEmployee,
      DateTime? signedByEmployeeAt});

  $DocumentMetaLpuModelCopyWith<$Res> get lpu;
  $DocumentMetaPatientModelCopyWith<$Res> get patient;
  $DocumentMetaDocumentCreatorModelCopyWith<$Res>? get documentCreator;
  $DocumentMetaSignEmployerModelCopyWith<$Res>? get signEmployer;
}

/// @nodoc
class _$DocumentMetaModelCopyWithImpl<$Res, $Val extends DocumentMetaModel>
    implements $DocumentMetaModelCopyWith<$Res> {
  _$DocumentMetaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? updatedAt = null,
    Object? lpu = null,
    Object? patient = null,
    Object? documentCreator = freezed,
    Object? signEmployer = freezed,
    Object? isSignByPatient = null,
    Object? signedByPatientAt = freezed,
    Object? isSignByEmployee = null,
    Object? signedByEmployeeAt = freezed,
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lpu: null == lpu
          ? _value.lpu
          : lpu // ignore: cast_nullable_to_non_nullable
              as DocumentMetaLpuModel,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as DocumentMetaPatientModel,
      documentCreator: freezed == documentCreator
          ? _value.documentCreator
          : documentCreator // ignore: cast_nullable_to_non_nullable
              as DocumentMetaDocumentCreatorModel?,
      signEmployer: freezed == signEmployer
          ? _value.signEmployer
          : signEmployer // ignore: cast_nullable_to_non_nullable
              as DocumentMetaSignEmployerModel?,
      isSignByPatient: null == isSignByPatient
          ? _value.isSignByPatient
          : isSignByPatient // ignore: cast_nullable_to_non_nullable
              as bool,
      signedByPatientAt: freezed == signedByPatientAt
          ? _value.signedByPatientAt
          : signedByPatientAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSignByEmployee: null == isSignByEmployee
          ? _value.isSignByEmployee
          : isSignByEmployee // ignore: cast_nullable_to_non_nullable
              as bool,
      signedByEmployeeAt: freezed == signedByEmployeeAt
          ? _value.signedByEmployeeAt
          : signedByEmployeeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentMetaLpuModelCopyWith<$Res> get lpu {
    return $DocumentMetaLpuModelCopyWith<$Res>(_value.lpu, (value) {
      return _then(_value.copyWith(lpu: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentMetaPatientModelCopyWith<$Res> get patient {
    return $DocumentMetaPatientModelCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentMetaDocumentCreatorModelCopyWith<$Res>? get documentCreator {
    if (_value.documentCreator == null) {
      return null;
    }

    return $DocumentMetaDocumentCreatorModelCopyWith<$Res>(
        _value.documentCreator!, (value) {
      return _then(_value.copyWith(documentCreator: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentMetaSignEmployerModelCopyWith<$Res>? get signEmployer {
    if (_value.signEmployer == null) {
      return null;
    }

    return $DocumentMetaSignEmployerModelCopyWith<$Res>(_value.signEmployer!,
        (value) {
      return _then(_value.copyWith(signEmployer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DocumentMetaModelCopyWith<$Res>
    implements $DocumentMetaModelCopyWith<$Res> {
  factory _$$_DocumentMetaModelCopyWith(_$_DocumentMetaModel value,
          $Res Function(_$_DocumentMetaModel) then) =
      __$$_DocumentMetaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime updatedAt,
      DocumentMetaLpuModel lpu,
      DocumentMetaPatientModel patient,
      DocumentMetaDocumentCreatorModel? documentCreator,
      DocumentMetaSignEmployerModel? signEmployer,
      bool isSignByPatient,
      DateTime? signedByPatientAt,
      bool isSignByEmployee,
      DateTime? signedByEmployeeAt});

  @override
  $DocumentMetaLpuModelCopyWith<$Res> get lpu;
  @override
  $DocumentMetaPatientModelCopyWith<$Res> get patient;
  @override
  $DocumentMetaDocumentCreatorModelCopyWith<$Res>? get documentCreator;
  @override
  $DocumentMetaSignEmployerModelCopyWith<$Res>? get signEmployer;
}

/// @nodoc
class __$$_DocumentMetaModelCopyWithImpl<$Res>
    extends _$DocumentMetaModelCopyWithImpl<$Res, _$_DocumentMetaModel>
    implements _$$_DocumentMetaModelCopyWith<$Res> {
  __$$_DocumentMetaModelCopyWithImpl(
      _$_DocumentMetaModel _value, $Res Function(_$_DocumentMetaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? updatedAt = null,
    Object? lpu = null,
    Object? patient = null,
    Object? documentCreator = freezed,
    Object? signEmployer = freezed,
    Object? isSignByPatient = null,
    Object? signedByPatientAt = freezed,
    Object? isSignByEmployee = null,
    Object? signedByEmployeeAt = freezed,
  }) {
    return _then(_$_DocumentMetaModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lpu: null == lpu
          ? _value.lpu
          : lpu // ignore: cast_nullable_to_non_nullable
              as DocumentMetaLpuModel,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as DocumentMetaPatientModel,
      documentCreator: freezed == documentCreator
          ? _value.documentCreator
          : documentCreator // ignore: cast_nullable_to_non_nullable
              as DocumentMetaDocumentCreatorModel?,
      signEmployer: freezed == signEmployer
          ? _value.signEmployer
          : signEmployer // ignore: cast_nullable_to_non_nullable
              as DocumentMetaSignEmployerModel?,
      isSignByPatient: null == isSignByPatient
          ? _value.isSignByPatient
          : isSignByPatient // ignore: cast_nullable_to_non_nullable
              as bool,
      signedByPatientAt: freezed == signedByPatientAt
          ? _value.signedByPatientAt
          : signedByPatientAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSignByEmployee: null == isSignByEmployee
          ? _value.isSignByEmployee
          : isSignByEmployee // ignore: cast_nullable_to_non_nullable
              as bool,
      signedByEmployeeAt: freezed == signedByEmployeeAt
          ? _value.signedByEmployeeAt
          : signedByEmployeeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentMetaModel implements _DocumentMetaModel {
  _$_DocumentMetaModel(
      {required this.id,
      required this.name,
      required this.updatedAt,
      required this.lpu,
      required this.patient,
      required this.documentCreator,
      required this.signEmployer,
      required this.isSignByPatient,
      required this.signedByPatientAt,
      required this.isSignByEmployee,
      required this.signedByEmployeeAt});

  factory _$_DocumentMetaModel.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentMetaModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime updatedAt;
  @override
  final DocumentMetaLpuModel lpu;
  @override
  final DocumentMetaPatientModel patient;
  @override
  final DocumentMetaDocumentCreatorModel? documentCreator;
  @override
  final DocumentMetaSignEmployerModel? signEmployer;
  @override
  final bool isSignByPatient;
  @override
  final DateTime? signedByPatientAt;
  @override
  final bool isSignByEmployee;
  @override
  final DateTime? signedByEmployeeAt;

  @override
  String toString() {
    return 'DocumentMetaModel(id: $id, name: $name, updatedAt: $updatedAt, lpu: $lpu, patient: $patient, documentCreator: $documentCreator, signEmployer: $signEmployer, isSignByPatient: $isSignByPatient, signedByPatientAt: $signedByPatientAt, isSignByEmployee: $isSignByEmployee, signedByEmployeeAt: $signedByEmployeeAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentMetaModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lpu, lpu) || other.lpu == lpu) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.documentCreator, documentCreator) ||
                other.documentCreator == documentCreator) &&
            (identical(other.signEmployer, signEmployer) ||
                other.signEmployer == signEmployer) &&
            (identical(other.isSignByPatient, isSignByPatient) ||
                other.isSignByPatient == isSignByPatient) &&
            (identical(other.signedByPatientAt, signedByPatientAt) ||
                other.signedByPatientAt == signedByPatientAt) &&
            (identical(other.isSignByEmployee, isSignByEmployee) ||
                other.isSignByEmployee == isSignByEmployee) &&
            (identical(other.signedByEmployeeAt, signedByEmployeeAt) ||
                other.signedByEmployeeAt == signedByEmployeeAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      updatedAt,
      lpu,
      patient,
      documentCreator,
      signEmployer,
      isSignByPatient,
      signedByPatientAt,
      isSignByEmployee,
      signedByEmployeeAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentMetaModelCopyWith<_$_DocumentMetaModel> get copyWith =>
      __$$_DocumentMetaModelCopyWithImpl<_$_DocumentMetaModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentMetaModelToJson(
      this,
    );
  }
}

abstract class _DocumentMetaModel implements DocumentMetaModel {
  factory _DocumentMetaModel(
      {required final String id,
      required final String name,
      required final DateTime updatedAt,
      required final DocumentMetaLpuModel lpu,
      required final DocumentMetaPatientModel patient,
      required final DocumentMetaDocumentCreatorModel? documentCreator,
      required final DocumentMetaSignEmployerModel? signEmployer,
      required final bool isSignByPatient,
      required final DateTime? signedByPatientAt,
      required final bool isSignByEmployee,
      required final DateTime? signedByEmployeeAt}) = _$_DocumentMetaModel;

  factory _DocumentMetaModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentMetaModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get updatedAt;
  @override
  DocumentMetaLpuModel get lpu;
  @override
  DocumentMetaPatientModel get patient;
  @override
  DocumentMetaDocumentCreatorModel? get documentCreator;
  @override
  DocumentMetaSignEmployerModel? get signEmployer;
  @override
  bool get isSignByPatient;
  @override
  DateTime? get signedByPatientAt;
  @override
  bool get isSignByEmployee;
  @override
  DateTime? get signedByEmployeeAt;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentMetaModelCopyWith<_$_DocumentMetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentMetaLpuModel _$DocumentMetaLpuModelFromJson(Map<String, dynamic> json) {
  return _DocumentMetaLpuModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentMetaLpuModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentMetaLpuModelCopyWith<DocumentMetaLpuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentMetaLpuModelCopyWith<$Res> {
  factory $DocumentMetaLpuModelCopyWith(DocumentMetaLpuModel value,
          $Res Function(DocumentMetaLpuModel) then) =
      _$DocumentMetaLpuModelCopyWithImpl<$Res, DocumentMetaLpuModel>;
  @useResult
  $Res call({String id, String name, String address});
}

/// @nodoc
class _$DocumentMetaLpuModelCopyWithImpl<$Res,
        $Val extends DocumentMetaLpuModel>
    implements $DocumentMetaLpuModelCopyWith<$Res> {
  _$DocumentMetaLpuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentMetaLpuModelCopyWith<$Res>
    implements $DocumentMetaLpuModelCopyWith<$Res> {
  factory _$$_DocumentMetaLpuModelCopyWith(_$_DocumentMetaLpuModel value,
          $Res Function(_$_DocumentMetaLpuModel) then) =
      __$$_DocumentMetaLpuModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String address});
}

/// @nodoc
class __$$_DocumentMetaLpuModelCopyWithImpl<$Res>
    extends _$DocumentMetaLpuModelCopyWithImpl<$Res, _$_DocumentMetaLpuModel>
    implements _$$_DocumentMetaLpuModelCopyWith<$Res> {
  __$$_DocumentMetaLpuModelCopyWithImpl(_$_DocumentMetaLpuModel _value,
      $Res Function(_$_DocumentMetaLpuModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_$_DocumentMetaLpuModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentMetaLpuModel implements _DocumentMetaLpuModel {
  const _$_DocumentMetaLpuModel(
      {required this.id, required this.name, required this.address});

  factory _$_DocumentMetaLpuModel.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentMetaLpuModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;

  @override
  String toString() {
    return 'DocumentMetaLpuModel(id: $id, name: $name, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentMetaLpuModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentMetaLpuModelCopyWith<_$_DocumentMetaLpuModel> get copyWith =>
      __$$_DocumentMetaLpuModelCopyWithImpl<_$_DocumentMetaLpuModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentMetaLpuModelToJson(
      this,
    );
  }
}

abstract class _DocumentMetaLpuModel implements DocumentMetaLpuModel {
  const factory _DocumentMetaLpuModel(
      {required final String id,
      required final String name,
      required final String address}) = _$_DocumentMetaLpuModel;

  factory _DocumentMetaLpuModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentMetaLpuModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentMetaLpuModelCopyWith<_$_DocumentMetaLpuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentMetaPatientModel _$DocumentMetaPatientModelFromJson(
    Map<String, dynamic> json) {
  return _DocumentMetaPatientModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentMetaPatientModel {
  String get lastname => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get middlename => throw _privateConstructorUsedError;
  String? get adresses => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentMetaPatientModelCopyWith<DocumentMetaPatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentMetaPatientModelCopyWith<$Res> {
  factory $DocumentMetaPatientModelCopyWith(DocumentMetaPatientModel value,
          $Res Function(DocumentMetaPatientModel) then) =
      _$DocumentMetaPatientModelCopyWithImpl<$Res, DocumentMetaPatientModel>;
  @useResult
  $Res call(
      {String lastname,
      String firstname,
      String middlename,
      String? adresses,
      String birthday,
      String sex});
}

/// @nodoc
class _$DocumentMetaPatientModelCopyWithImpl<$Res,
        $Val extends DocumentMetaPatientModel>
    implements $DocumentMetaPatientModelCopyWith<$Res> {
  _$DocumentMetaPatientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastname = null,
    Object? firstname = null,
    Object? middlename = null,
    Object? adresses = freezed,
    Object? birthday = null,
    Object? sex = null,
  }) {
    return _then(_value.copyWith(
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      middlename: null == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String,
      adresses: freezed == adresses
          ? _value.adresses
          : adresses // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentMetaPatientModelCopyWith<$Res>
    implements $DocumentMetaPatientModelCopyWith<$Res> {
  factory _$$_DocumentMetaPatientModelCopyWith(
          _$_DocumentMetaPatientModel value,
          $Res Function(_$_DocumentMetaPatientModel) then) =
      __$$_DocumentMetaPatientModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lastname,
      String firstname,
      String middlename,
      String? adresses,
      String birthday,
      String sex});
}

/// @nodoc
class __$$_DocumentMetaPatientModelCopyWithImpl<$Res>
    extends _$DocumentMetaPatientModelCopyWithImpl<$Res,
        _$_DocumentMetaPatientModel>
    implements _$$_DocumentMetaPatientModelCopyWith<$Res> {
  __$$_DocumentMetaPatientModelCopyWithImpl(_$_DocumentMetaPatientModel _value,
      $Res Function(_$_DocumentMetaPatientModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastname = null,
    Object? firstname = null,
    Object? middlename = null,
    Object? adresses = freezed,
    Object? birthday = null,
    Object? sex = null,
  }) {
    return _then(_$_DocumentMetaPatientModel(
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      middlename: null == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String,
      adresses: freezed == adresses
          ? _value.adresses
          : adresses // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentMetaPatientModel implements _DocumentMetaPatientModel {
  const _$_DocumentMetaPatientModel(
      {required this.lastname,
      required this.firstname,
      required this.middlename,
      required this.adresses,
      required this.birthday,
      required this.sex});

  factory _$_DocumentMetaPatientModel.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentMetaPatientModelFromJson(json);

  @override
  final String lastname;
  @override
  final String firstname;
  @override
  final String middlename;
  @override
  final String? adresses;
  @override
  final String birthday;
  @override
  final String sex;

  @override
  String toString() {
    return 'DocumentMetaPatientModel(lastname: $lastname, firstname: $firstname, middlename: $middlename, adresses: $adresses, birthday: $birthday, sex: $sex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentMetaPatientModel &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.adresses, adresses) ||
                other.adresses == adresses) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.sex, sex) || other.sex == sex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, lastname, firstname, middlename, adresses, birthday, sex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentMetaPatientModelCopyWith<_$_DocumentMetaPatientModel>
      get copyWith => __$$_DocumentMetaPatientModelCopyWithImpl<
          _$_DocumentMetaPatientModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentMetaPatientModelToJson(
      this,
    );
  }
}

abstract class _DocumentMetaPatientModel implements DocumentMetaPatientModel {
  const factory _DocumentMetaPatientModel(
      {required final String lastname,
      required final String firstname,
      required final String middlename,
      required final String? adresses,
      required final String birthday,
      required final String sex}) = _$_DocumentMetaPatientModel;

  factory _DocumentMetaPatientModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentMetaPatientModel.fromJson;

  @override
  String get lastname;
  @override
  String get firstname;
  @override
  String get middlename;
  @override
  String? get adresses;
  @override
  String get birthday;
  @override
  String get sex;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentMetaPatientModelCopyWith<_$_DocumentMetaPatientModel>
      get copyWith => throw _privateConstructorUsedError;
}

DocumentMetaDocumentCreatorModel _$DocumentMetaDocumentCreatorModelFromJson(
    Map<String, dynamic> json) {
  return _DocumentMetaDocumentCreatorModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentMetaDocumentCreatorModel {
  String get firstname => throw _privateConstructorUsedError;
  String get middlename => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentMetaDocumentCreatorModelCopyWith<DocumentMetaDocumentCreatorModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentMetaDocumentCreatorModelCopyWith<$Res> {
  factory $DocumentMetaDocumentCreatorModelCopyWith(
          DocumentMetaDocumentCreatorModel value,
          $Res Function(DocumentMetaDocumentCreatorModel) then) =
      _$DocumentMetaDocumentCreatorModelCopyWithImpl<$Res,
          DocumentMetaDocumentCreatorModel>;
  @useResult
  $Res call({String firstname, String middlename, String lastname});
}

/// @nodoc
class _$DocumentMetaDocumentCreatorModelCopyWithImpl<$Res,
        $Val extends DocumentMetaDocumentCreatorModel>
    implements $DocumentMetaDocumentCreatorModelCopyWith<$Res> {
  _$DocumentMetaDocumentCreatorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? middlename = null,
    Object? lastname = null,
  }) {
    return _then(_value.copyWith(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      middlename: null == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentMetaDocumentCreatorModelCopyWith<$Res>
    implements $DocumentMetaDocumentCreatorModelCopyWith<$Res> {
  factory _$$_DocumentMetaDocumentCreatorModelCopyWith(
          _$_DocumentMetaDocumentCreatorModel value,
          $Res Function(_$_DocumentMetaDocumentCreatorModel) then) =
      __$$_DocumentMetaDocumentCreatorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstname, String middlename, String lastname});
}

/// @nodoc
class __$$_DocumentMetaDocumentCreatorModelCopyWithImpl<$Res>
    extends _$DocumentMetaDocumentCreatorModelCopyWithImpl<$Res,
        _$_DocumentMetaDocumentCreatorModel>
    implements _$$_DocumentMetaDocumentCreatorModelCopyWith<$Res> {
  __$$_DocumentMetaDocumentCreatorModelCopyWithImpl(
      _$_DocumentMetaDocumentCreatorModel _value,
      $Res Function(_$_DocumentMetaDocumentCreatorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? middlename = null,
    Object? lastname = null,
  }) {
    return _then(_$_DocumentMetaDocumentCreatorModel(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      middlename: null == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentMetaDocumentCreatorModel
    implements _DocumentMetaDocumentCreatorModel {
  const _$_DocumentMetaDocumentCreatorModel(
      {required this.firstname,
      required this.middlename,
      required this.lastname});

  factory _$_DocumentMetaDocumentCreatorModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_DocumentMetaDocumentCreatorModelFromJson(json);

  @override
  final String firstname;
  @override
  final String middlename;
  @override
  final String lastname;

  @override
  String toString() {
    return 'DocumentMetaDocumentCreatorModel(firstname: $firstname, middlename: $middlename, lastname: $lastname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentMetaDocumentCreatorModel &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstname, middlename, lastname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentMetaDocumentCreatorModelCopyWith<
          _$_DocumentMetaDocumentCreatorModel>
      get copyWith => __$$_DocumentMetaDocumentCreatorModelCopyWithImpl<
          _$_DocumentMetaDocumentCreatorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentMetaDocumentCreatorModelToJson(
      this,
    );
  }
}

abstract class _DocumentMetaDocumentCreatorModel
    implements DocumentMetaDocumentCreatorModel {
  const factory _DocumentMetaDocumentCreatorModel(
      {required final String firstname,
      required final String middlename,
      required final String lastname}) = _$_DocumentMetaDocumentCreatorModel;

  factory _DocumentMetaDocumentCreatorModel.fromJson(
      Map<String, dynamic> json) = _$_DocumentMetaDocumentCreatorModel.fromJson;

  @override
  String get firstname;
  @override
  String get middlename;
  @override
  String get lastname;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentMetaDocumentCreatorModelCopyWith<
          _$_DocumentMetaDocumentCreatorModel>
      get copyWith => throw _privateConstructorUsedError;
}

DocumentMetaSignEmployerModel _$DocumentMetaSignEmployerModelFromJson(
    Map<String, dynamic> json) {
  return _DocumentMetaSignEmployerModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentMetaSignEmployerModel {
  String get firstname => throw _privateConstructorUsedError;
  String get middlename => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentMetaSignEmployerModelCopyWith<DocumentMetaSignEmployerModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentMetaSignEmployerModelCopyWith<$Res> {
  factory $DocumentMetaSignEmployerModelCopyWith(
          DocumentMetaSignEmployerModel value,
          $Res Function(DocumentMetaSignEmployerModel) then) =
      _$DocumentMetaSignEmployerModelCopyWithImpl<$Res,
          DocumentMetaSignEmployerModel>;
  @useResult
  $Res call({String firstname, String middlename, String lastname});
}

/// @nodoc
class _$DocumentMetaSignEmployerModelCopyWithImpl<$Res,
        $Val extends DocumentMetaSignEmployerModel>
    implements $DocumentMetaSignEmployerModelCopyWith<$Res> {
  _$DocumentMetaSignEmployerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? middlename = null,
    Object? lastname = null,
  }) {
    return _then(_value.copyWith(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      middlename: null == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentMetaSignEmployerModelCopyWith<$Res>
    implements $DocumentMetaSignEmployerModelCopyWith<$Res> {
  factory _$$_DocumentMetaSignEmployerModelCopyWith(
          _$_DocumentMetaSignEmployerModel value,
          $Res Function(_$_DocumentMetaSignEmployerModel) then) =
      __$$_DocumentMetaSignEmployerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstname, String middlename, String lastname});
}

/// @nodoc
class __$$_DocumentMetaSignEmployerModelCopyWithImpl<$Res>
    extends _$DocumentMetaSignEmployerModelCopyWithImpl<$Res,
        _$_DocumentMetaSignEmployerModel>
    implements _$$_DocumentMetaSignEmployerModelCopyWith<$Res> {
  __$$_DocumentMetaSignEmployerModelCopyWithImpl(
      _$_DocumentMetaSignEmployerModel _value,
      $Res Function(_$_DocumentMetaSignEmployerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? middlename = null,
    Object? lastname = null,
  }) {
    return _then(_$_DocumentMetaSignEmployerModel(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      middlename: null == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentMetaSignEmployerModel
    implements _DocumentMetaSignEmployerModel {
  const _$_DocumentMetaSignEmployerModel(
      {required this.firstname,
      required this.middlename,
      required this.lastname});

  factory _$_DocumentMetaSignEmployerModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_DocumentMetaSignEmployerModelFromJson(json);

  @override
  final String firstname;
  @override
  final String middlename;
  @override
  final String lastname;

  @override
  String toString() {
    return 'DocumentMetaSignEmployerModel(firstname: $firstname, middlename: $middlename, lastname: $lastname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentMetaSignEmployerModel &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstname, middlename, lastname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentMetaSignEmployerModelCopyWith<_$_DocumentMetaSignEmployerModel>
      get copyWith => __$$_DocumentMetaSignEmployerModelCopyWithImpl<
          _$_DocumentMetaSignEmployerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentMetaSignEmployerModelToJson(
      this,
    );
  }
}

abstract class _DocumentMetaSignEmployerModel
    implements DocumentMetaSignEmployerModel {
  const factory _DocumentMetaSignEmployerModel(
      {required final String firstname,
      required final String middlename,
      required final String lastname}) = _$_DocumentMetaSignEmployerModel;

  factory _DocumentMetaSignEmployerModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentMetaSignEmployerModel.fromJson;

  @override
  String get firstname;
  @override
  String get middlename;
  @override
  String get lastname;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentMetaSignEmployerModelCopyWith<_$_DocumentMetaSignEmployerModel>
      get copyWith => throw _privateConstructorUsedError;
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
