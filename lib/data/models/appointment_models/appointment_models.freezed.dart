// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'appointment_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) {
  return _AppointmentModel.fromJson(json);
}

/// @nodoc
mixin _$AppointmentModel {
  int get status => throw _privateConstructorUsedError;
  bool get needConfirmation => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String get researchPlace => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get appointmentDateTime => throw _privateConstructorUsedError;
  PatientInfoModel get patientInfo => throw _privateConstructorUsedError;
  ClinicInfoModel get clinicInfo => throw _privateConstructorUsedError;
  DoctorInfoModel get doctorInfo => throw _privateConstructorUsedError;
  List<ResearchesModel> get researches => throw _privateConstructorUsedError;
  int get categoryType => throw _privateConstructorUsedError;
  bool get isVideo => throw _privateConstructorUsedError;
  String get payType => throw _privateConstructorUsedError;
  bool get isDraft => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String get scheduleId => throw _privateConstructorUsedError;
  int get paymentStatus => throw _privateConstructorUsedError;
  String? get recommendations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentModelCopyWith<AppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentModelCopyWith<$Res> {
  factory $AppointmentModelCopyWith(
          AppointmentModel value, $Res Function(AppointmentModel) then) =
      _$AppointmentModelCopyWithImpl<$Res>;
  $Res call(
      {int status,
      bool needConfirmation,
      String? comment,
      String researchPlace,
      String id,
      DateTime appointmentDateTime,
      PatientInfoModel patientInfo,
      ClinicInfoModel clinicInfo,
      DoctorInfoModel doctorInfo,
      List<ResearchesModel> researches,
      int categoryType,
      bool isVideo,
      String payType,
      bool isDraft,
      String? orderId,
      String scheduleId,
      int paymentStatus,
      String? recommendations});

  $PatientInfoModelCopyWith<$Res> get patientInfo;
  $ClinicInfoModelCopyWith<$Res> get clinicInfo;
  $DoctorInfoModelCopyWith<$Res> get doctorInfo;
}

/// @nodoc
class _$AppointmentModelCopyWithImpl<$Res>
    implements $AppointmentModelCopyWith<$Res> {
  _$AppointmentModelCopyWithImpl(this._value, this._then);

  final AppointmentModel _value;
  // ignore: unused_field
  final $Res Function(AppointmentModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? needConfirmation = freezed,
    Object? comment = freezed,
    Object? researchPlace = freezed,
    Object? id = freezed,
    Object? appointmentDateTime = freezed,
    Object? patientInfo = freezed,
    Object? clinicInfo = freezed,
    Object? doctorInfo = freezed,
    Object? researches = freezed,
    Object? categoryType = freezed,
    Object? isVideo = freezed,
    Object? payType = freezed,
    Object? isDraft = freezed,
    Object? orderId = freezed,
    Object? scheduleId = freezed,
    Object? paymentStatus = freezed,
    Object? recommendations = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      needConfirmation: needConfirmation == freezed
          ? _value.needConfirmation
          : needConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      researchPlace: researchPlace == freezed
          ? _value.researchPlace
          : researchPlace // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDateTime: appointmentDateTime == freezed
          ? _value.appointmentDateTime
          : appointmentDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      patientInfo: patientInfo == freezed
          ? _value.patientInfo
          : patientInfo // ignore: cast_nullable_to_non_nullable
              as PatientInfoModel,
      clinicInfo: clinicInfo == freezed
          ? _value.clinicInfo
          : clinicInfo // ignore: cast_nullable_to_non_nullable
              as ClinicInfoModel,
      doctorInfo: doctorInfo == freezed
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorInfoModel,
      researches: researches == freezed
          ? _value.researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<ResearchesModel>,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isVideo: isVideo == freezed
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      payType: payType == freezed
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      isDraft: isDraft == freezed
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      recommendations: recommendations == freezed
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PatientInfoModelCopyWith<$Res> get patientInfo {
    return $PatientInfoModelCopyWith<$Res>(_value.patientInfo, (value) {
      return _then(_value.copyWith(patientInfo: value));
    });
  }

  @override
  $ClinicInfoModelCopyWith<$Res> get clinicInfo {
    return $ClinicInfoModelCopyWith<$Res>(_value.clinicInfo, (value) {
      return _then(_value.copyWith(clinicInfo: value));
    });
  }

  @override
  $DoctorInfoModelCopyWith<$Res> get doctorInfo {
    return $DoctorInfoModelCopyWith<$Res>(_value.doctorInfo, (value) {
      return _then(_value.copyWith(doctorInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_AppointmentModelCopyWith<$Res>
    implements $AppointmentModelCopyWith<$Res> {
  factory _$$_AppointmentModelCopyWith(
          _$_AppointmentModel value, $Res Function(_$_AppointmentModel) then) =
      __$$_AppointmentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int status,
      bool needConfirmation,
      String? comment,
      String researchPlace,
      String id,
      DateTime appointmentDateTime,
      PatientInfoModel patientInfo,
      ClinicInfoModel clinicInfo,
      DoctorInfoModel doctorInfo,
      List<ResearchesModel> researches,
      int categoryType,
      bool isVideo,
      String payType,
      bool isDraft,
      String? orderId,
      String scheduleId,
      int paymentStatus,
      String? recommendations});

  @override
  $PatientInfoModelCopyWith<$Res> get patientInfo;
  @override
  $ClinicInfoModelCopyWith<$Res> get clinicInfo;
  @override
  $DoctorInfoModelCopyWith<$Res> get doctorInfo;
}

/// @nodoc
class __$$_AppointmentModelCopyWithImpl<$Res>
    extends _$AppointmentModelCopyWithImpl<$Res>
    implements _$$_AppointmentModelCopyWith<$Res> {
  __$$_AppointmentModelCopyWithImpl(
      _$_AppointmentModel _value, $Res Function(_$_AppointmentModel) _then)
      : super(_value, (v) => _then(v as _$_AppointmentModel));

  @override
  _$_AppointmentModel get _value => super._value as _$_AppointmentModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? needConfirmation = freezed,
    Object? comment = freezed,
    Object? researchPlace = freezed,
    Object? id = freezed,
    Object? appointmentDateTime = freezed,
    Object? patientInfo = freezed,
    Object? clinicInfo = freezed,
    Object? doctorInfo = freezed,
    Object? researches = freezed,
    Object? categoryType = freezed,
    Object? isVideo = freezed,
    Object? payType = freezed,
    Object? isDraft = freezed,
    Object? orderId = freezed,
    Object? scheduleId = freezed,
    Object? paymentStatus = freezed,
    Object? recommendations = freezed,
  }) {
    return _then(_$_AppointmentModel(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      needConfirmation: needConfirmation == freezed
          ? _value.needConfirmation
          : needConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      researchPlace: researchPlace == freezed
          ? _value.researchPlace
          : researchPlace // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDateTime: appointmentDateTime == freezed
          ? _value.appointmentDateTime
          : appointmentDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      patientInfo: patientInfo == freezed
          ? _value.patientInfo
          : patientInfo // ignore: cast_nullable_to_non_nullable
              as PatientInfoModel,
      clinicInfo: clinicInfo == freezed
          ? _value.clinicInfo
          : clinicInfo // ignore: cast_nullable_to_non_nullable
              as ClinicInfoModel,
      doctorInfo: doctorInfo == freezed
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorInfoModel,
      researches: researches == freezed
          ? _value._researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<ResearchesModel>,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isVideo: isVideo == freezed
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      payType: payType == freezed
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      isDraft: isDraft == freezed
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      recommendations: recommendations == freezed
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppointmentModel implements _AppointmentModel {
  const _$_AppointmentModel(
      {required this.status,
      required this.needConfirmation,
      required this.comment,
      required this.researchPlace,
      required this.id,
      required this.appointmentDateTime,
      required this.patientInfo,
      required this.clinicInfo,
      required this.doctorInfo,
      required final List<ResearchesModel> researches,
      required this.categoryType,
      required this.isVideo,
      required this.payType,
      required this.isDraft,
      required this.orderId,
      required this.scheduleId,
      required this.paymentStatus,
      required this.recommendations})
      : _researches = researches;

  factory _$_AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentModelFromJson(json);

  @override
  final int status;
  @override
  final bool needConfirmation;
  @override
  final String? comment;
  @override
  final String researchPlace;
  @override
  final String id;
  @override
  final DateTime appointmentDateTime;
  @override
  final PatientInfoModel patientInfo;
  @override
  final ClinicInfoModel clinicInfo;
  @override
  final DoctorInfoModel doctorInfo;
  final List<ResearchesModel> _researches;
  @override
  List<ResearchesModel> get researches {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_researches);
  }

  @override
  final int categoryType;
  @override
  final bool isVideo;
  @override
  final String payType;
  @override
  final bool isDraft;
  @override
  final String? orderId;
  @override
  final String scheduleId;
  @override
  final int paymentStatus;
  @override
  final String? recommendations;

  @override
  String toString() {
    return 'AppointmentModel(status: $status, needConfirmation: $needConfirmation, comment: $comment, researchPlace: $researchPlace, id: $id, appointmentDateTime: $appointmentDateTime, patientInfo: $patientInfo, clinicInfo: $clinicInfo, doctorInfo: $doctorInfo, researches: $researches, categoryType: $categoryType, isVideo: $isVideo, payType: $payType, isDraft: $isDraft, orderId: $orderId, scheduleId: $scheduleId, paymentStatus: $paymentStatus, recommendations: $recommendations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentModel &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.needConfirmation, needConfirmation) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.researchPlace, researchPlace) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.appointmentDateTime, appointmentDateTime) &&
            const DeepCollectionEquality()
                .equals(other.patientInfo, patientInfo) &&
            const DeepCollectionEquality()
                .equals(other.clinicInfo, clinicInfo) &&
            const DeepCollectionEquality()
                .equals(other.doctorInfo, doctorInfo) &&
            const DeepCollectionEquality()
                .equals(other._researches, _researches) &&
            const DeepCollectionEquality()
                .equals(other.categoryType, categoryType) &&
            const DeepCollectionEquality().equals(other.isVideo, isVideo) &&
            const DeepCollectionEquality().equals(other.payType, payType) &&
            const DeepCollectionEquality().equals(other.isDraft, isDraft) &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality()
                .equals(other.scheduleId, scheduleId) &&
            const DeepCollectionEquality()
                .equals(other.paymentStatus, paymentStatus) &&
            const DeepCollectionEquality()
                .equals(other.recommendations, recommendations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(needConfirmation),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(researchPlace),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(appointmentDateTime),
      const DeepCollectionEquality().hash(patientInfo),
      const DeepCollectionEquality().hash(clinicInfo),
      const DeepCollectionEquality().hash(doctorInfo),
      const DeepCollectionEquality().hash(_researches),
      const DeepCollectionEquality().hash(categoryType),
      const DeepCollectionEquality().hash(isVideo),
      const DeepCollectionEquality().hash(payType),
      const DeepCollectionEquality().hash(isDraft),
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(scheduleId),
      const DeepCollectionEquality().hash(paymentStatus),
      const DeepCollectionEquality().hash(recommendations));

  @JsonKey(ignore: true)
  @override
  _$$_AppointmentModelCopyWith<_$_AppointmentModel> get copyWith =>
      __$$_AppointmentModelCopyWithImpl<_$_AppointmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentModelToJson(
      this,
    );
  }
}

abstract class _AppointmentModel implements AppointmentModel {
  const factory _AppointmentModel(
      {required final int status,
      required final bool needConfirmation,
      required final String? comment,
      required final String researchPlace,
      required final String id,
      required final DateTime appointmentDateTime,
      required final PatientInfoModel patientInfo,
      required final ClinicInfoModel clinicInfo,
      required final DoctorInfoModel doctorInfo,
      required final List<ResearchesModel> researches,
      required final int categoryType,
      required final bool isVideo,
      required final String payType,
      required final bool isDraft,
      required final String? orderId,
      required final String scheduleId,
      required final int paymentStatus,
      required final String? recommendations}) = _$_AppointmentModel;

  factory _AppointmentModel.fromJson(Map<String, dynamic> json) =
      _$_AppointmentModel.fromJson;

  @override
  int get status;
  @override
  bool get needConfirmation;
  @override
  String? get comment;
  @override
  String get researchPlace;
  @override
  String get id;
  @override
  DateTime get appointmentDateTime;
  @override
  PatientInfoModel get patientInfo;
  @override
  ClinicInfoModel get clinicInfo;
  @override
  DoctorInfoModel get doctorInfo;
  @override
  List<ResearchesModel> get researches;
  @override
  int get categoryType;
  @override
  bool get isVideo;
  @override
  String get payType;
  @override
  bool get isDraft;
  @override
  String? get orderId;
  @override
  String get scheduleId;
  @override
  int get paymentStatus;
  @override
  String? get recommendations;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentModelCopyWith<_$_AppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientInfoModel _$PatientInfoModelFromJson(Map<String, dynamic> json) {
  return _PatientInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PatientInfoModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientInfoModelCopyWith<PatientInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientInfoModelCopyWith<$Res> {
  factory $PatientInfoModelCopyWith(
          PatientInfoModel value, $Res Function(PatientInfoModel) then) =
      _$PatientInfoModelCopyWithImpl<$Res>;
  $Res call({String? id, String? name});
}

/// @nodoc
class _$PatientInfoModelCopyWithImpl<$Res>
    implements $PatientInfoModelCopyWith<$Res> {
  _$PatientInfoModelCopyWithImpl(this._value, this._then);

  final PatientInfoModel _value;
  // ignore: unused_field
  final $Res Function(PatientInfoModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PatientInfoModelCopyWith<$Res>
    implements $PatientInfoModelCopyWith<$Res> {
  factory _$$_PatientInfoModelCopyWith(
          _$_PatientInfoModel value, $Res Function(_$_PatientInfoModel) then) =
      __$$_PatientInfoModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$_PatientInfoModelCopyWithImpl<$Res>
    extends _$PatientInfoModelCopyWithImpl<$Res>
    implements _$$_PatientInfoModelCopyWith<$Res> {
  __$$_PatientInfoModelCopyWithImpl(
      _$_PatientInfoModel _value, $Res Function(_$_PatientInfoModel) _then)
      : super(_value, (v) => _then(v as _$_PatientInfoModel));

  @override
  _$_PatientInfoModel get _value => super._value as _$_PatientInfoModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_PatientInfoModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientInfoModel implements _PatientInfoModel {
  const _$_PatientInfoModel({required this.id, required this.name});

  factory _$_PatientInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_PatientInfoModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'PatientInfoModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientInfoModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_PatientInfoModelCopyWith<_$_PatientInfoModel> get copyWith =>
      __$$_PatientInfoModelCopyWithImpl<_$_PatientInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientInfoModelToJson(
      this,
    );
  }
}

abstract class _PatientInfoModel implements PatientInfoModel {
  const factory _PatientInfoModel(
      {required final String? id,
      required final String? name}) = _$_PatientInfoModel;

  factory _PatientInfoModel.fromJson(Map<String, dynamic> json) =
      _$_PatientInfoModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_PatientInfoModelCopyWith<_$_PatientInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicInfoModel _$ClinicInfoModelFromJson(Map<String, dynamic> json) {
  return _ClinicInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ClinicInfoModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClinicInfoModelCopyWith<ClinicInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicInfoModelCopyWith<$Res> {
  factory $ClinicInfoModelCopyWith(
          ClinicInfoModel value, $Res Function(ClinicInfoModel) then) =
      _$ClinicInfoModelCopyWithImpl<$Res>;
  $Res call({String? id, String? name, String? address});
}

/// @nodoc
class _$ClinicInfoModelCopyWithImpl<$Res>
    implements $ClinicInfoModelCopyWith<$Res> {
  _$ClinicInfoModelCopyWithImpl(this._value, this._then);

  final ClinicInfoModel _value;
  // ignore: unused_field
  final $Res Function(ClinicInfoModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ClinicInfoModelCopyWith<$Res>
    implements $ClinicInfoModelCopyWith<$Res> {
  factory _$$_ClinicInfoModelCopyWith(
          _$_ClinicInfoModel value, $Res Function(_$_ClinicInfoModel) then) =
      __$$_ClinicInfoModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, String? address});
}

/// @nodoc
class __$$_ClinicInfoModelCopyWithImpl<$Res>
    extends _$ClinicInfoModelCopyWithImpl<$Res>
    implements _$$_ClinicInfoModelCopyWith<$Res> {
  __$$_ClinicInfoModelCopyWithImpl(
      _$_ClinicInfoModel _value, $Res Function(_$_ClinicInfoModel) _then)
      : super(_value, (v) => _then(v as _$_ClinicInfoModel));

  @override
  _$_ClinicInfoModel get _value => super._value as _$_ClinicInfoModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_ClinicInfoModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClinicInfoModel implements _ClinicInfoModel {
  const _$_ClinicInfoModel(
      {required this.id, required this.name, required this.address});

  factory _$_ClinicInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClinicInfoModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? address;

  @override
  String toString() {
    return 'ClinicInfoModel(id: $id, name: $name, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClinicInfoModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_ClinicInfoModelCopyWith<_$_ClinicInfoModel> get copyWith =>
      __$$_ClinicInfoModelCopyWithImpl<_$_ClinicInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClinicInfoModelToJson(
      this,
    );
  }
}

abstract class _ClinicInfoModel implements ClinicInfoModel {
  const factory _ClinicInfoModel(
      {required final String? id,
      required final String? name,
      required final String? address}) = _$_ClinicInfoModel;

  factory _ClinicInfoModel.fromJson(Map<String, dynamic> json) =
      _$_ClinicInfoModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$_ClinicInfoModelCopyWith<_$_ClinicInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorInfoModel _$DoctorInfoModelFromJson(Map<String, dynamic> json) {
  return _DoctorInfoModel.fromJson(json);
}

/// @nodoc
mixin _$DoctorInfoModel {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get specializationId => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorInfoModelCopyWith<DoctorInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorInfoModelCopyWith<$Res> {
  factory $DoctorInfoModelCopyWith(
          DoctorInfoModel value, $Res Function(DoctorInfoModel) then) =
      _$DoctorInfoModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? specializationId,
      String? specialization});
}

/// @nodoc
class _$DoctorInfoModelCopyWithImpl<$Res>
    implements $DoctorInfoModelCopyWith<$Res> {
  _$DoctorInfoModelCopyWithImpl(this._value, this._then);

  final DoctorInfoModel _value;
  // ignore: unused_field
  final $Res Function(DoctorInfoModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? specializationId = freezed,
    Object? specialization = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      specializationId: specializationId == freezed
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: specialization == freezed
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_DoctorInfoModelCopyWith<$Res>
    implements $DoctorInfoModelCopyWith<$Res> {
  factory _$$_DoctorInfoModelCopyWith(
          _$_DoctorInfoModel value, $Res Function(_$_DoctorInfoModel) then) =
      __$$_DoctorInfoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? specializationId,
      String? specialization});
}

/// @nodoc
class __$$_DoctorInfoModelCopyWithImpl<$Res>
    extends _$DoctorInfoModelCopyWithImpl<$Res>
    implements _$$_DoctorInfoModelCopyWith<$Res> {
  __$$_DoctorInfoModelCopyWithImpl(
      _$_DoctorInfoModel _value, $Res Function(_$_DoctorInfoModel) _then)
      : super(_value, (v) => _then(v as _$_DoctorInfoModel));

  @override
  _$_DoctorInfoModel get _value => super._value as _$_DoctorInfoModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? specializationId = freezed,
    Object? specialization = freezed,
  }) {
    return _then(_$_DoctorInfoModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      specializationId: specializationId == freezed
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: specialization == freezed
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DoctorInfoModel implements _DoctorInfoModel {
  const _$_DoctorInfoModel(
      {required this.id,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.specializationId,
      required this.specialization});

  factory _$_DoctorInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_DoctorInfoModelFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? lastName;
  @override
  final String? specializationId;
  @override
  final String? specialization;

  @override
  String toString() {
    return 'DoctorInfoModel(id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, specializationId: $specializationId, specialization: $specialization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoctorInfoModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality()
                .equals(other.middleName, middleName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.specializationId, specializationId) &&
            const DeepCollectionEquality()
                .equals(other.specialization, specialization));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(middleName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(specializationId),
      const DeepCollectionEquality().hash(specialization));

  @JsonKey(ignore: true)
  @override
  _$$_DoctorInfoModelCopyWith<_$_DoctorInfoModel> get copyWith =>
      __$$_DoctorInfoModelCopyWithImpl<_$_DoctorInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoctorInfoModelToJson(
      this,
    );
  }
}

abstract class _DoctorInfoModel implements DoctorInfoModel {
  const factory _DoctorInfoModel(
      {required final String? id,
      required final String? firstName,
      required final String? middleName,
      required final String? lastName,
      required final String? specializationId,
      required final String? specialization}) = _$_DoctorInfoModel;

  factory _DoctorInfoModel.fromJson(Map<String, dynamic> json) =
      _$_DoctorInfoModel.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get middleName;
  @override
  String? get lastName;
  @override
  String? get specializationId;
  @override
  String? get specialization;
  @override
  @JsonKey(ignore: true)
  _$$_DoctorInfoModelCopyWith<_$_DoctorInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ResearchesModel _$ResearchesModelFromJson(Map<String, dynamic> json) {
  return _ResearchesModel.fromJson(json);
}

/// @nodoc
mixin _$ResearchesModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResearchesModelCopyWith<ResearchesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResearchesModelCopyWith<$Res> {
  factory $ResearchesModelCopyWith(
          ResearchesModel value, $Res Function(ResearchesModel) then) =
      _$ResearchesModelCopyWithImpl<$Res>;
  $Res call({String? id, String? name});
}

/// @nodoc
class _$ResearchesModelCopyWithImpl<$Res>
    implements $ResearchesModelCopyWith<$Res> {
  _$ResearchesModelCopyWithImpl(this._value, this._then);

  final ResearchesModel _value;
  // ignore: unused_field
  final $Res Function(ResearchesModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ResearchesModelCopyWith<$Res>
    implements $ResearchesModelCopyWith<$Res> {
  factory _$$_ResearchesModelCopyWith(
          _$_ResearchesModel value, $Res Function(_$_ResearchesModel) then) =
      __$$_ResearchesModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$_ResearchesModelCopyWithImpl<$Res>
    extends _$ResearchesModelCopyWithImpl<$Res>
    implements _$$_ResearchesModelCopyWith<$Res> {
  __$$_ResearchesModelCopyWithImpl(
      _$_ResearchesModel _value, $Res Function(_$_ResearchesModel) _then)
      : super(_value, (v) => _then(v as _$_ResearchesModel));

  @override
  _$_ResearchesModel get _value => super._value as _$_ResearchesModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_ResearchesModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResearchesModel implements _ResearchesModel {
  const _$_ResearchesModel({required this.id, required this.name});

  factory _$_ResearchesModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResearchesModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ResearchesModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResearchesModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_ResearchesModelCopyWith<_$_ResearchesModel> get copyWith =>
      __$$_ResearchesModelCopyWithImpl<_$_ResearchesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResearchesModelToJson(
      this,
    );
  }
}

abstract class _ResearchesModel implements ResearchesModel {
  const factory _ResearchesModel(
      {required final String? id,
      required final String? name}) = _$_ResearchesModel;

  factory _ResearchesModel.fromJson(Map<String, dynamic> json) =
      _$_ResearchesModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_ResearchesModelCopyWith<_$_ResearchesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentInfoModel _$AppointmentInfoModelFromJson(Map<String, dynamic> json) {
  return _AppointmentInfoModel.fromJson(json);
}

/// @nodoc
mixin _$AppointmentInfoModel {
  int get price => throw _privateConstructorUsedError;
  bool get noPayment => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  String get payType => throw _privateConstructorUsedError;
  List<RecommendationItemModel> get recommendations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentInfoModelCopyWith<AppointmentInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentInfoModelCopyWith<$Res> {
  factory $AppointmentInfoModelCopyWith(AppointmentInfoModel value,
          $Res Function(AppointmentInfoModel) then) =
      _$AppointmentInfoModelCopyWithImpl<$Res>;
  $Res call(
      {int price,
      bool noPayment,
      String serviceName,
      String payType,
      List<RecommendationItemModel> recommendations});
}

/// @nodoc
class _$AppointmentInfoModelCopyWithImpl<$Res>
    implements $AppointmentInfoModelCopyWith<$Res> {
  _$AppointmentInfoModelCopyWithImpl(this._value, this._then);

  final AppointmentInfoModel _value;
  // ignore: unused_field
  final $Res Function(AppointmentInfoModel) _then;

  @override
  $Res call({
    Object? price = freezed,
    Object? noPayment = freezed,
    Object? serviceName = freezed,
    Object? payType = freezed,
    Object? recommendations = freezed,
  }) {
    return _then(_value.copyWith(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      noPayment: noPayment == freezed
          ? _value.noPayment
          : noPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      payType: payType == freezed
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: recommendations == freezed
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<RecommendationItemModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_AppointmentInfoModelCopyWith<$Res>
    implements $AppointmentInfoModelCopyWith<$Res> {
  factory _$$_AppointmentInfoModelCopyWith(_$_AppointmentInfoModel value,
          $Res Function(_$_AppointmentInfoModel) then) =
      __$$_AppointmentInfoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int price,
      bool noPayment,
      String serviceName,
      String payType,
      List<RecommendationItemModel> recommendations});
}

/// @nodoc
class __$$_AppointmentInfoModelCopyWithImpl<$Res>
    extends _$AppointmentInfoModelCopyWithImpl<$Res>
    implements _$$_AppointmentInfoModelCopyWith<$Res> {
  __$$_AppointmentInfoModelCopyWithImpl(_$_AppointmentInfoModel _value,
      $Res Function(_$_AppointmentInfoModel) _then)
      : super(_value, (v) => _then(v as _$_AppointmentInfoModel));

  @override
  _$_AppointmentInfoModel get _value => super._value as _$_AppointmentInfoModel;

  @override
  $Res call({
    Object? price = freezed,
    Object? noPayment = freezed,
    Object? serviceName = freezed,
    Object? payType = freezed,
    Object? recommendations = freezed,
  }) {
    return _then(_$_AppointmentInfoModel(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      noPayment: noPayment == freezed
          ? _value.noPayment
          : noPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      payType: payType == freezed
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: recommendations == freezed
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<RecommendationItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppointmentInfoModel implements _AppointmentInfoModel {
  const _$_AppointmentInfoModel(
      {required this.price,
      required this.noPayment,
      required this.serviceName,
      required this.payType,
      required final List<RecommendationItemModel> recommendations})
      : _recommendations = recommendations;

  factory _$_AppointmentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentInfoModelFromJson(json);

  @override
  final int price;
  @override
  final bool noPayment;
  @override
  final String serviceName;
  @override
  final String payType;
  final List<RecommendationItemModel> _recommendations;
  @override
  List<RecommendationItemModel> get recommendations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  String toString() {
    return 'AppointmentInfoModel(price: $price, noPayment: $noPayment, serviceName: $serviceName, payType: $payType, recommendations: $recommendations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentInfoModel &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.noPayment, noPayment) &&
            const DeepCollectionEquality()
                .equals(other.serviceName, serviceName) &&
            const DeepCollectionEquality().equals(other.payType, payType) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(noPayment),
      const DeepCollectionEquality().hash(serviceName),
      const DeepCollectionEquality().hash(payType),
      const DeepCollectionEquality().hash(_recommendations));

  @JsonKey(ignore: true)
  @override
  _$$_AppointmentInfoModelCopyWith<_$_AppointmentInfoModel> get copyWith =>
      __$$_AppointmentInfoModelCopyWithImpl<_$_AppointmentInfoModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentInfoModelToJson(
      this,
    );
  }
}

abstract class _AppointmentInfoModel implements AppointmentInfoModel {
  const factory _AppointmentInfoModel(
          {required final int price,
          required final bool noPayment,
          required final String serviceName,
          required final String payType,
          required final List<RecommendationItemModel> recommendations}) =
      _$_AppointmentInfoModel;

  factory _AppointmentInfoModel.fromJson(Map<String, dynamic> json) =
      _$_AppointmentInfoModel.fromJson;

  @override
  int get price;
  @override
  bool get noPayment;
  @override
  String get serviceName;
  @override
  String get payType;
  @override
  List<RecommendationItemModel> get recommendations;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentInfoModelCopyWith<_$_AppointmentInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendationItemModel _$RecommendationItemModelFromJson(
    Map<String, dynamic> json) {
  return _RecommendationItemModel.fromJson(json);
}

/// @nodoc
mixin _$RecommendationItemModel {
  String get serviceId => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendationItemModelCopyWith<RecommendationItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationItemModelCopyWith<$Res> {
  factory $RecommendationItemModelCopyWith(RecommendationItemModel value,
          $Res Function(RecommendationItemModel) then) =
      _$RecommendationItemModelCopyWithImpl<$Res>;
  $Res call({String serviceId, String serviceName, String recommendation});
}

/// @nodoc
class _$RecommendationItemModelCopyWithImpl<$Res>
    implements $RecommendationItemModelCopyWith<$Res> {
  _$RecommendationItemModelCopyWithImpl(this._value, this._then);

  final RecommendationItemModel _value;
  // ignore: unused_field
  final $Res Function(RecommendationItemModel) _then;

  @override
  $Res call({
    Object? serviceId = freezed,
    Object? serviceName = freezed,
    Object? recommendation = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: recommendation == freezed
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RecommendationItemModelCopyWith<$Res>
    implements $RecommendationItemModelCopyWith<$Res> {
  factory _$$_RecommendationItemModelCopyWith(_$_RecommendationItemModel value,
          $Res Function(_$_RecommendationItemModel) then) =
      __$$_RecommendationItemModelCopyWithImpl<$Res>;
  @override
  $Res call({String serviceId, String serviceName, String recommendation});
}

/// @nodoc
class __$$_RecommendationItemModelCopyWithImpl<$Res>
    extends _$RecommendationItemModelCopyWithImpl<$Res>
    implements _$$_RecommendationItemModelCopyWith<$Res> {
  __$$_RecommendationItemModelCopyWithImpl(_$_RecommendationItemModel _value,
      $Res Function(_$_RecommendationItemModel) _then)
      : super(_value, (v) => _then(v as _$_RecommendationItemModel));

  @override
  _$_RecommendationItemModel get _value =>
      super._value as _$_RecommendationItemModel;

  @override
  $Res call({
    Object? serviceId = freezed,
    Object? serviceName = freezed,
    Object? recommendation = freezed,
  }) {
    return _then(_$_RecommendationItemModel(
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: recommendation == freezed
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecommendationItemModel implements _RecommendationItemModel {
  const _$_RecommendationItemModel(
      {required this.serviceId,
      required this.serviceName,
      required this.recommendation});

  factory _$_RecommendationItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecommendationItemModelFromJson(json);

  @override
  final String serviceId;
  @override
  final String serviceName;
  @override
  final String recommendation;

  @override
  String toString() {
    return 'RecommendationItemModel(serviceId: $serviceId, serviceName: $serviceName, recommendation: $recommendation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecommendationItemModel &&
            const DeepCollectionEquality().equals(other.serviceId, serviceId) &&
            const DeepCollectionEquality()
                .equals(other.serviceName, serviceName) &&
            const DeepCollectionEquality()
                .equals(other.recommendation, recommendation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serviceId),
      const DeepCollectionEquality().hash(serviceName),
      const DeepCollectionEquality().hash(recommendation));

  @JsonKey(ignore: true)
  @override
  _$$_RecommendationItemModelCopyWith<_$_RecommendationItemModel>
      get copyWith =>
          __$$_RecommendationItemModelCopyWithImpl<_$_RecommendationItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecommendationItemModelToJson(
      this,
    );
  }
}

abstract class _RecommendationItemModel implements RecommendationItemModel {
  const factory _RecommendationItemModel(
      {required final String serviceId,
      required final String serviceName,
      required final String recommendation}) = _$_RecommendationItemModel;

  factory _RecommendationItemModel.fromJson(Map<String, dynamic> json) =
      _$_RecommendationItemModel.fromJson;

  @override
  String get serviceId;
  @override
  String get serviceName;
  @override
  String get recommendation;
  @override
  @JsonKey(ignore: true)
  _$$_RecommendationItemModelCopyWith<_$_RecommendationItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

CreateNewAppointmentResponseModel _$CreateNewAppointmentResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CreateNewAppointmentResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CreateNewAppointmentResponseModel {
  String get result => throw _privateConstructorUsedError;
  String get information => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateNewAppointmentResponseModelCopyWith<CreateNewAppointmentResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNewAppointmentResponseModelCopyWith<$Res> {
  factory $CreateNewAppointmentResponseModelCopyWith(
          CreateNewAppointmentResponseModel value,
          $Res Function(CreateNewAppointmentResponseModel) then) =
      _$CreateNewAppointmentResponseModelCopyWithImpl<$Res>;
  $Res call({String result, String information});
}

/// @nodoc
class _$CreateNewAppointmentResponseModelCopyWithImpl<$Res>
    implements $CreateNewAppointmentResponseModelCopyWith<$Res> {
  _$CreateNewAppointmentResponseModelCopyWithImpl(this._value, this._then);

  final CreateNewAppointmentResponseModel _value;
  // ignore: unused_field
  final $Res Function(CreateNewAppointmentResponseModel) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? information = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateNewAppointmentResponseModelCopyWith<$Res>
    implements $CreateNewAppointmentResponseModelCopyWith<$Res> {
  factory _$$_CreateNewAppointmentResponseModelCopyWith(
          _$_CreateNewAppointmentResponseModel value,
          $Res Function(_$_CreateNewAppointmentResponseModel) then) =
      __$$_CreateNewAppointmentResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({String result, String information});
}

/// @nodoc
class __$$_CreateNewAppointmentResponseModelCopyWithImpl<$Res>
    extends _$CreateNewAppointmentResponseModelCopyWithImpl<$Res>
    implements _$$_CreateNewAppointmentResponseModelCopyWith<$Res> {
  __$$_CreateNewAppointmentResponseModelCopyWithImpl(
      _$_CreateNewAppointmentResponseModel _value,
      $Res Function(_$_CreateNewAppointmentResponseModel) _then)
      : super(_value, (v) => _then(v as _$_CreateNewAppointmentResponseModel));

  @override
  _$_CreateNewAppointmentResponseModel get _value =>
      super._value as _$_CreateNewAppointmentResponseModel;

  @override
  $Res call({
    Object? result = freezed,
    Object? information = freezed,
  }) {
    return _then(_$_CreateNewAppointmentResponseModel(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateNewAppointmentResponseModel
    implements _CreateNewAppointmentResponseModel {
  const _$_CreateNewAppointmentResponseModel(
      {required this.result, required this.information});

  factory _$_CreateNewAppointmentResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_CreateNewAppointmentResponseModelFromJson(json);

  @override
  final String result;
  @override
  final String information;

  @override
  String toString() {
    return 'CreateNewAppointmentResponseModel(result: $result, information: $information)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateNewAppointmentResponseModel &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality()
                .equals(other.information, information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(information));

  @JsonKey(ignore: true)
  @override
  _$$_CreateNewAppointmentResponseModelCopyWith<
          _$_CreateNewAppointmentResponseModel>
      get copyWith => __$$_CreateNewAppointmentResponseModelCopyWithImpl<
          _$_CreateNewAppointmentResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateNewAppointmentResponseModelToJson(
      this,
    );
  }
}

abstract class _CreateNewAppointmentResponseModel
    implements CreateNewAppointmentResponseModel {
  const factory _CreateNewAppointmentResponseModel(
          {required final String result, required final String information}) =
      _$_CreateNewAppointmentResponseModel;

  factory _CreateNewAppointmentResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$_CreateNewAppointmentResponseModel.fromJson;

  @override
  String get result;
  @override
  String get information;
  @override
  @JsonKey(ignore: true)
  _$$_CreateNewAppointmentResponseModelCopyWith<
          _$_CreateNewAppointmentResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

RegisterOrderResponseModel _$RegisterOrderResponseModelFromJson(
    Map<String, dynamic> json) {
  return _RegisterOrderResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterOrderResponseModel {
  bool get result => throw _privateConstructorUsedError;
  String get paymentUrl => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterOrderResponseModelCopyWith<RegisterOrderResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterOrderResponseModelCopyWith<$Res> {
  factory $RegisterOrderResponseModelCopyWith(RegisterOrderResponseModel value,
          $Res Function(RegisterOrderResponseModel) then) =
      _$RegisterOrderResponseModelCopyWithImpl<$Res>;
  $Res call({bool result, String paymentUrl, String? error});
}

/// @nodoc
class _$RegisterOrderResponseModelCopyWithImpl<$Res>
    implements $RegisterOrderResponseModelCopyWith<$Res> {
  _$RegisterOrderResponseModelCopyWithImpl(this._value, this._then);

  final RegisterOrderResponseModel _value;
  // ignore: unused_field
  final $Res Function(RegisterOrderResponseModel) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? paymentUrl = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentUrl: paymentUrl == freezed
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_RegisterOrderResponseModelCopyWith<$Res>
    implements $RegisterOrderResponseModelCopyWith<$Res> {
  factory _$$_RegisterOrderResponseModelCopyWith(
          _$_RegisterOrderResponseModel value,
          $Res Function(_$_RegisterOrderResponseModel) then) =
      __$$_RegisterOrderResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({bool result, String paymentUrl, String? error});
}

/// @nodoc
class __$$_RegisterOrderResponseModelCopyWithImpl<$Res>
    extends _$RegisterOrderResponseModelCopyWithImpl<$Res>
    implements _$$_RegisterOrderResponseModelCopyWith<$Res> {
  __$$_RegisterOrderResponseModelCopyWithImpl(
      _$_RegisterOrderResponseModel _value,
      $Res Function(_$_RegisterOrderResponseModel) _then)
      : super(_value, (v) => _then(v as _$_RegisterOrderResponseModel));

  @override
  _$_RegisterOrderResponseModel get _value =>
      super._value as _$_RegisterOrderResponseModel;

  @override
  $Res call({
    Object? result = freezed,
    Object? paymentUrl = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_RegisterOrderResponseModel(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentUrl: paymentUrl == freezed
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterOrderResponseModel implements _RegisterOrderResponseModel {
  const _$_RegisterOrderResponseModel(
      {required this.result, required this.paymentUrl, required this.error});

  factory _$_RegisterOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterOrderResponseModelFromJson(json);

  @override
  final bool result;
  @override
  final String paymentUrl;
  @override
  final String? error;

  @override
  String toString() {
    return 'RegisterOrderResponseModel(result: $result, paymentUrl: $paymentUrl, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterOrderResponseModel &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality()
                .equals(other.paymentUrl, paymentUrl) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(paymentUrl),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterOrderResponseModelCopyWith<_$_RegisterOrderResponseModel>
      get copyWith => __$$_RegisterOrderResponseModelCopyWithImpl<
          _$_RegisterOrderResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterOrderResponseModelToJson(
      this,
    );
  }
}

abstract class _RegisterOrderResponseModel
    implements RegisterOrderResponseModel {
  const factory _RegisterOrderResponseModel(
      {required final bool result,
      required final String paymentUrl,
      required final String? error}) = _$_RegisterOrderResponseModel;

  factory _RegisterOrderResponseModel.fromJson(Map<String, dynamic> json) =
      _$_RegisterOrderResponseModel.fromJson;

  @override
  bool get result;
  @override
  String get paymentUrl;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterOrderResponseModelCopyWith<_$_RegisterOrderResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
