// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  String? get researchPlace => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get appointmentDateTime => throw _privateConstructorUsedError;
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
  List<ResearchWidthPriceInAppointmentModel>? get items =>
      throw _privateConstructorUsedError;
  String? get checkURI => throw _privateConstructorUsedError;
  AppointmentReviewModel? get review => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentModelCopyWith<AppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentModelCopyWith<$Res> {
  factory $AppointmentModelCopyWith(
          AppointmentModel value, $Res Function(AppointmentModel) then) =
      _$AppointmentModelCopyWithImpl<$Res, AppointmentModel>;
  @useResult
  $Res call(
      {int status,
      bool needConfirmation,
      String? comment,
      String? researchPlace,
      String id,
      String appointmentDateTime,
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
      String? recommendations,
      List<ResearchWidthPriceInAppointmentModel>? items,
      String? checkURI,
      AppointmentReviewModel? review});

  $PatientInfoModelCopyWith<$Res> get patientInfo;
  $ClinicInfoModelCopyWith<$Res> get clinicInfo;
  $DoctorInfoModelCopyWith<$Res> get doctorInfo;
  $AppointmentReviewModelCopyWith<$Res>? get review;
}

/// @nodoc
class _$AppointmentModelCopyWithImpl<$Res, $Val extends AppointmentModel>
    implements $AppointmentModelCopyWith<$Res> {
  _$AppointmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? needConfirmation = null,
    Object? comment = freezed,
    Object? researchPlace = freezed,
    Object? id = null,
    Object? appointmentDateTime = null,
    Object? patientInfo = null,
    Object? clinicInfo = null,
    Object? doctorInfo = null,
    Object? researches = null,
    Object? categoryType = null,
    Object? isVideo = null,
    Object? payType = null,
    Object? isDraft = null,
    Object? orderId = freezed,
    Object? scheduleId = null,
    Object? paymentStatus = null,
    Object? recommendations = freezed,
    Object? items = freezed,
    Object? checkURI = freezed,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      needConfirmation: null == needConfirmation
          ? _value.needConfirmation
          : needConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      researchPlace: freezed == researchPlace
          ? _value.researchPlace
          : researchPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDateTime: null == appointmentDateTime
          ? _value.appointmentDateTime
          : appointmentDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      patientInfo: null == patientInfo
          ? _value.patientInfo
          : patientInfo // ignore: cast_nullable_to_non_nullable
              as PatientInfoModel,
      clinicInfo: null == clinicInfo
          ? _value.clinicInfo
          : clinicInfo // ignore: cast_nullable_to_non_nullable
              as ClinicInfoModel,
      doctorInfo: null == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorInfoModel,
      researches: null == researches
          ? _value.researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<ResearchesModel>,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      recommendations: freezed == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ResearchWidthPriceInAppointmentModel>?,
      checkURI: freezed == checkURI
          ? _value.checkURI
          : checkURI // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as AppointmentReviewModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientInfoModelCopyWith<$Res> get patientInfo {
    return $PatientInfoModelCopyWith<$Res>(_value.patientInfo, (value) {
      return _then(_value.copyWith(patientInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClinicInfoModelCopyWith<$Res> get clinicInfo {
    return $ClinicInfoModelCopyWith<$Res>(_value.clinicInfo, (value) {
      return _then(_value.copyWith(clinicInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DoctorInfoModelCopyWith<$Res> get doctorInfo {
    return $DoctorInfoModelCopyWith<$Res>(_value.doctorInfo, (value) {
      return _then(_value.copyWith(doctorInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppointmentReviewModelCopyWith<$Res>? get review {
    if (_value.review == null) {
      return null;
    }

    return $AppointmentReviewModelCopyWith<$Res>(_value.review!, (value) {
      return _then(_value.copyWith(review: value) as $Val);
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
  @useResult
  $Res call(
      {int status,
      bool needConfirmation,
      String? comment,
      String? researchPlace,
      String id,
      String appointmentDateTime,
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
      String? recommendations,
      List<ResearchWidthPriceInAppointmentModel>? items,
      String? checkURI,
      AppointmentReviewModel? review});

  @override
  $PatientInfoModelCopyWith<$Res> get patientInfo;
  @override
  $ClinicInfoModelCopyWith<$Res> get clinicInfo;
  @override
  $DoctorInfoModelCopyWith<$Res> get doctorInfo;
  @override
  $AppointmentReviewModelCopyWith<$Res>? get review;
}

/// @nodoc
class __$$_AppointmentModelCopyWithImpl<$Res>
    extends _$AppointmentModelCopyWithImpl<$Res, _$_AppointmentModel>
    implements _$$_AppointmentModelCopyWith<$Res> {
  __$$_AppointmentModelCopyWithImpl(
      _$_AppointmentModel _value, $Res Function(_$_AppointmentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? needConfirmation = null,
    Object? comment = freezed,
    Object? researchPlace = freezed,
    Object? id = null,
    Object? appointmentDateTime = null,
    Object? patientInfo = null,
    Object? clinicInfo = null,
    Object? doctorInfo = null,
    Object? researches = null,
    Object? categoryType = null,
    Object? isVideo = null,
    Object? payType = null,
    Object? isDraft = null,
    Object? orderId = freezed,
    Object? scheduleId = null,
    Object? paymentStatus = null,
    Object? recommendations = freezed,
    Object? items = freezed,
    Object? checkURI = freezed,
    Object? review = freezed,
  }) {
    return _then(_$_AppointmentModel(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      needConfirmation: null == needConfirmation
          ? _value.needConfirmation
          : needConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      researchPlace: freezed == researchPlace
          ? _value.researchPlace
          : researchPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDateTime: null == appointmentDateTime
          ? _value.appointmentDateTime
          : appointmentDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      patientInfo: null == patientInfo
          ? _value.patientInfo
          : patientInfo // ignore: cast_nullable_to_non_nullable
              as PatientInfoModel,
      clinicInfo: null == clinicInfo
          ? _value.clinicInfo
          : clinicInfo // ignore: cast_nullable_to_non_nullable
              as ClinicInfoModel,
      doctorInfo: null == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorInfoModel,
      researches: null == researches
          ? _value._researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<ResearchesModel>,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      recommendations: freezed == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ResearchWidthPriceInAppointmentModel>?,
      checkURI: freezed == checkURI
          ? _value.checkURI
          : checkURI // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as AppointmentReviewModel?,
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
      required this.recommendations,
      required final List<ResearchWidthPriceInAppointmentModel>? items,
      required this.checkURI,
      required this.review})
      : _researches = researches,
        _items = items;

  factory _$_AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentModelFromJson(json);

  @override
  final int status;
  @override
  final bool needConfirmation;
  @override
  final String? comment;
  @override
  final String? researchPlace;
  @override
  final String id;
  @override
  final String appointmentDateTime;
  @override
  final PatientInfoModel patientInfo;
  @override
  final ClinicInfoModel clinicInfo;
  @override
  final DoctorInfoModel doctorInfo;
  final List<ResearchesModel> _researches;
  @override
  List<ResearchesModel> get researches {
    if (_researches is EqualUnmodifiableListView) return _researches;
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
  final List<ResearchWidthPriceInAppointmentModel>? _items;
  @override
  List<ResearchWidthPriceInAppointmentModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? checkURI;
  @override
  final AppointmentReviewModel? review;

  @override
  String toString() {
    return 'AppointmentModel(status: $status, needConfirmation: $needConfirmation, comment: $comment, researchPlace: $researchPlace, id: $id, appointmentDateTime: $appointmentDateTime, patientInfo: $patientInfo, clinicInfo: $clinicInfo, doctorInfo: $doctorInfo, researches: $researches, categoryType: $categoryType, isVideo: $isVideo, payType: $payType, isDraft: $isDraft, orderId: $orderId, scheduleId: $scheduleId, paymentStatus: $paymentStatus, recommendations: $recommendations, items: $items, checkURI: $checkURI, review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.needConfirmation, needConfirmation) ||
                other.needConfirmation == needConfirmation) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.researchPlace, researchPlace) ||
                other.researchPlace == researchPlace) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.appointmentDateTime, appointmentDateTime) ||
                other.appointmentDateTime == appointmentDateTime) &&
            (identical(other.patientInfo, patientInfo) ||
                other.patientInfo == patientInfo) &&
            (identical(other.clinicInfo, clinicInfo) ||
                other.clinicInfo == clinicInfo) &&
            (identical(other.doctorInfo, doctorInfo) ||
                other.doctorInfo == doctorInfo) &&
            const DeepCollectionEquality()
                .equals(other._researches, _researches) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.isVideo, isVideo) || other.isVideo == isVideo) &&
            (identical(other.payType, payType) || other.payType == payType) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.checkURI, checkURI) ||
                other.checkURI == checkURI) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        needConfirmation,
        comment,
        researchPlace,
        id,
        appointmentDateTime,
        patientInfo,
        clinicInfo,
        doctorInfo,
        const DeepCollectionEquality().hash(_researches),
        categoryType,
        isVideo,
        payType,
        isDraft,
        orderId,
        scheduleId,
        paymentStatus,
        recommendations,
        const DeepCollectionEquality().hash(_items),
        checkURI,
        review
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      required final String? researchPlace,
      required final String id,
      required final String appointmentDateTime,
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
      required final String? recommendations,
      required final List<ResearchWidthPriceInAppointmentModel>? items,
      required final String? checkURI,
      required final AppointmentReviewModel? review}) = _$_AppointmentModel;

  factory _AppointmentModel.fromJson(Map<String, dynamic> json) =
      _$_AppointmentModel.fromJson;

  @override
  int get status;
  @override
  bool get needConfirmation;
  @override
  String? get comment;
  @override
  String? get researchPlace;
  @override
  String get id;
  @override
  String get appointmentDateTime;
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
  List<ResearchWidthPriceInAppointmentModel>? get items;
  @override
  String? get checkURI;
  @override
  AppointmentReviewModel? get review;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentModelCopyWith<_$_AppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentModelWithTimeZoneOffset _$AppointmentModelWithTimeZoneOffsetFromJson(
    Map<String, dynamic> json) {
  return _AppointmentModelWithTimeZoneOffset.fromJson(json);
}

/// @nodoc
mixin _$AppointmentModelWithTimeZoneOffset {
  int get status => throw _privateConstructorUsedError;
  bool get needConfirmation => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get researchPlace => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get appointmentDateTime => throw _privateConstructorUsedError;
  int get timeZoneOffset => throw _privateConstructorUsedError;
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
  List<ResearchWidthPriceInAppointmentModel>? get items =>
      throw _privateConstructorUsedError;
  String? get checkURI => throw _privateConstructorUsedError;
  AppointmentReviewModel? get review => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentModelWithTimeZoneOffsetCopyWith<
          AppointmentModelWithTimeZoneOffset>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentModelWithTimeZoneOffsetCopyWith<$Res> {
  factory $AppointmentModelWithTimeZoneOffsetCopyWith(
          AppointmentModelWithTimeZoneOffset value,
          $Res Function(AppointmentModelWithTimeZoneOffset) then) =
      _$AppointmentModelWithTimeZoneOffsetCopyWithImpl<$Res,
          AppointmentModelWithTimeZoneOffset>;
  @useResult
  $Res call(
      {int status,
      bool needConfirmation,
      String? comment,
      String? researchPlace,
      String id,
      @TimestampConverter() DateTime appointmentDateTime,
      int timeZoneOffset,
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
      String? recommendations,
      List<ResearchWidthPriceInAppointmentModel>? items,
      String? checkURI,
      AppointmentReviewModel? review});

  $PatientInfoModelCopyWith<$Res> get patientInfo;
  $ClinicInfoModelCopyWith<$Res> get clinicInfo;
  $DoctorInfoModelCopyWith<$Res> get doctorInfo;
  $AppointmentReviewModelCopyWith<$Res>? get review;
}

/// @nodoc
class _$AppointmentModelWithTimeZoneOffsetCopyWithImpl<$Res,
        $Val extends AppointmentModelWithTimeZoneOffset>
    implements $AppointmentModelWithTimeZoneOffsetCopyWith<$Res> {
  _$AppointmentModelWithTimeZoneOffsetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? needConfirmation = null,
    Object? comment = freezed,
    Object? researchPlace = freezed,
    Object? id = null,
    Object? appointmentDateTime = null,
    Object? timeZoneOffset = null,
    Object? patientInfo = null,
    Object? clinicInfo = null,
    Object? doctorInfo = null,
    Object? researches = null,
    Object? categoryType = null,
    Object? isVideo = null,
    Object? payType = null,
    Object? isDraft = null,
    Object? orderId = freezed,
    Object? scheduleId = null,
    Object? paymentStatus = null,
    Object? recommendations = freezed,
    Object? items = freezed,
    Object? checkURI = freezed,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      needConfirmation: null == needConfirmation
          ? _value.needConfirmation
          : needConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      researchPlace: freezed == researchPlace
          ? _value.researchPlace
          : researchPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDateTime: null == appointmentDateTime
          ? _value.appointmentDateTime
          : appointmentDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeZoneOffset: null == timeZoneOffset
          ? _value.timeZoneOffset
          : timeZoneOffset // ignore: cast_nullable_to_non_nullable
              as int,
      patientInfo: null == patientInfo
          ? _value.patientInfo
          : patientInfo // ignore: cast_nullable_to_non_nullable
              as PatientInfoModel,
      clinicInfo: null == clinicInfo
          ? _value.clinicInfo
          : clinicInfo // ignore: cast_nullable_to_non_nullable
              as ClinicInfoModel,
      doctorInfo: null == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorInfoModel,
      researches: null == researches
          ? _value.researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<ResearchesModel>,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      recommendations: freezed == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ResearchWidthPriceInAppointmentModel>?,
      checkURI: freezed == checkURI
          ? _value.checkURI
          : checkURI // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as AppointmentReviewModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientInfoModelCopyWith<$Res> get patientInfo {
    return $PatientInfoModelCopyWith<$Res>(_value.patientInfo, (value) {
      return _then(_value.copyWith(patientInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClinicInfoModelCopyWith<$Res> get clinicInfo {
    return $ClinicInfoModelCopyWith<$Res>(_value.clinicInfo, (value) {
      return _then(_value.copyWith(clinicInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DoctorInfoModelCopyWith<$Res> get doctorInfo {
    return $DoctorInfoModelCopyWith<$Res>(_value.doctorInfo, (value) {
      return _then(_value.copyWith(doctorInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppointmentReviewModelCopyWith<$Res>? get review {
    if (_value.review == null) {
      return null;
    }

    return $AppointmentReviewModelCopyWith<$Res>(_value.review!, (value) {
      return _then(_value.copyWith(review: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppointmentModelWithTimeZoneOffsetCopyWith<$Res>
    implements $AppointmentModelWithTimeZoneOffsetCopyWith<$Res> {
  factory _$$_AppointmentModelWithTimeZoneOffsetCopyWith(
          _$_AppointmentModelWithTimeZoneOffset value,
          $Res Function(_$_AppointmentModelWithTimeZoneOffset) then) =
      __$$_AppointmentModelWithTimeZoneOffsetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int status,
      bool needConfirmation,
      String? comment,
      String? researchPlace,
      String id,
      @TimestampConverter() DateTime appointmentDateTime,
      int timeZoneOffset,
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
      String? recommendations,
      List<ResearchWidthPriceInAppointmentModel>? items,
      String? checkURI,
      AppointmentReviewModel? review});

  @override
  $PatientInfoModelCopyWith<$Res> get patientInfo;
  @override
  $ClinicInfoModelCopyWith<$Res> get clinicInfo;
  @override
  $DoctorInfoModelCopyWith<$Res> get doctorInfo;
  @override
  $AppointmentReviewModelCopyWith<$Res>? get review;
}

/// @nodoc
class __$$_AppointmentModelWithTimeZoneOffsetCopyWithImpl<$Res>
    extends _$AppointmentModelWithTimeZoneOffsetCopyWithImpl<$Res,
        _$_AppointmentModelWithTimeZoneOffset>
    implements _$$_AppointmentModelWithTimeZoneOffsetCopyWith<$Res> {
  __$$_AppointmentModelWithTimeZoneOffsetCopyWithImpl(
      _$_AppointmentModelWithTimeZoneOffset _value,
      $Res Function(_$_AppointmentModelWithTimeZoneOffset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? needConfirmation = null,
    Object? comment = freezed,
    Object? researchPlace = freezed,
    Object? id = null,
    Object? appointmentDateTime = null,
    Object? timeZoneOffset = null,
    Object? patientInfo = null,
    Object? clinicInfo = null,
    Object? doctorInfo = null,
    Object? researches = null,
    Object? categoryType = null,
    Object? isVideo = null,
    Object? payType = null,
    Object? isDraft = null,
    Object? orderId = freezed,
    Object? scheduleId = null,
    Object? paymentStatus = null,
    Object? recommendations = freezed,
    Object? items = freezed,
    Object? checkURI = freezed,
    Object? review = freezed,
  }) {
    return _then(_$_AppointmentModelWithTimeZoneOffset(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      needConfirmation: null == needConfirmation
          ? _value.needConfirmation
          : needConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      researchPlace: freezed == researchPlace
          ? _value.researchPlace
          : researchPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDateTime: null == appointmentDateTime
          ? _value.appointmentDateTime
          : appointmentDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeZoneOffset: null == timeZoneOffset
          ? _value.timeZoneOffset
          : timeZoneOffset // ignore: cast_nullable_to_non_nullable
              as int,
      patientInfo: null == patientInfo
          ? _value.patientInfo
          : patientInfo // ignore: cast_nullable_to_non_nullable
              as PatientInfoModel,
      clinicInfo: null == clinicInfo
          ? _value.clinicInfo
          : clinicInfo // ignore: cast_nullable_to_non_nullable
              as ClinicInfoModel,
      doctorInfo: null == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorInfoModel,
      researches: null == researches
          ? _value._researches
          : researches // ignore: cast_nullable_to_non_nullable
              as List<ResearchesModel>,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as int,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      recommendations: freezed == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ResearchWidthPriceInAppointmentModel>?,
      checkURI: freezed == checkURI
          ? _value.checkURI
          : checkURI // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as AppointmentReviewModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppointmentModelWithTimeZoneOffset
    implements _AppointmentModelWithTimeZoneOffset {
  const _$_AppointmentModelWithTimeZoneOffset(
      {required this.status,
      required this.needConfirmation,
      required this.comment,
      required this.researchPlace,
      required this.id,
      @TimestampConverter() required this.appointmentDateTime,
      required this.timeZoneOffset,
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
      required this.recommendations,
      required final List<ResearchWidthPriceInAppointmentModel>? items,
      required this.checkURI,
      required this.review})
      : _researches = researches,
        _items = items;

  factory _$_AppointmentModelWithTimeZoneOffset.fromJson(
          Map<String, dynamic> json) =>
      _$$_AppointmentModelWithTimeZoneOffsetFromJson(json);

  @override
  final int status;
  @override
  final bool needConfirmation;
  @override
  final String? comment;
  @override
  final String? researchPlace;
  @override
  final String id;
  @override
  @TimestampConverter()
  final DateTime appointmentDateTime;
  @override
  final int timeZoneOffset;
  @override
  final PatientInfoModel patientInfo;
  @override
  final ClinicInfoModel clinicInfo;
  @override
  final DoctorInfoModel doctorInfo;
  final List<ResearchesModel> _researches;
  @override
  List<ResearchesModel> get researches {
    if (_researches is EqualUnmodifiableListView) return _researches;
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
  final List<ResearchWidthPriceInAppointmentModel>? _items;
  @override
  List<ResearchWidthPriceInAppointmentModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? checkURI;
  @override
  final AppointmentReviewModel? review;

  @override
  String toString() {
    return 'AppointmentModelWithTimeZoneOffset(status: $status, needConfirmation: $needConfirmation, comment: $comment, researchPlace: $researchPlace, id: $id, appointmentDateTime: $appointmentDateTime, timeZoneOffset: $timeZoneOffset, patientInfo: $patientInfo, clinicInfo: $clinicInfo, doctorInfo: $doctorInfo, researches: $researches, categoryType: $categoryType, isVideo: $isVideo, payType: $payType, isDraft: $isDraft, orderId: $orderId, scheduleId: $scheduleId, paymentStatus: $paymentStatus, recommendations: $recommendations, items: $items, checkURI: $checkURI, review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentModelWithTimeZoneOffset &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.needConfirmation, needConfirmation) ||
                other.needConfirmation == needConfirmation) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.researchPlace, researchPlace) ||
                other.researchPlace == researchPlace) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.appointmentDateTime, appointmentDateTime) ||
                other.appointmentDateTime == appointmentDateTime) &&
            (identical(other.timeZoneOffset, timeZoneOffset) ||
                other.timeZoneOffset == timeZoneOffset) &&
            (identical(other.patientInfo, patientInfo) ||
                other.patientInfo == patientInfo) &&
            (identical(other.clinicInfo, clinicInfo) ||
                other.clinicInfo == clinicInfo) &&
            (identical(other.doctorInfo, doctorInfo) ||
                other.doctorInfo == doctorInfo) &&
            const DeepCollectionEquality()
                .equals(other._researches, _researches) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.isVideo, isVideo) || other.isVideo == isVideo) &&
            (identical(other.payType, payType) || other.payType == payType) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.checkURI, checkURI) ||
                other.checkURI == checkURI) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        needConfirmation,
        comment,
        researchPlace,
        id,
        appointmentDateTime,
        timeZoneOffset,
        patientInfo,
        clinicInfo,
        doctorInfo,
        const DeepCollectionEquality().hash(_researches),
        categoryType,
        isVideo,
        payType,
        isDraft,
        orderId,
        scheduleId,
        paymentStatus,
        recommendations,
        const DeepCollectionEquality().hash(_items),
        checkURI,
        review
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentModelWithTimeZoneOffsetCopyWith<
          _$_AppointmentModelWithTimeZoneOffset>
      get copyWith => __$$_AppointmentModelWithTimeZoneOffsetCopyWithImpl<
          _$_AppointmentModelWithTimeZoneOffset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentModelWithTimeZoneOffsetToJson(
      this,
    );
  }
}

abstract class _AppointmentModelWithTimeZoneOffset
    implements AppointmentModelWithTimeZoneOffset {
  const factory _AppointmentModelWithTimeZoneOffset(
          {required final int status,
          required final bool needConfirmation,
          required final String? comment,
          required final String? researchPlace,
          required final String id,
          @TimestampConverter() required final DateTime appointmentDateTime,
          required final int timeZoneOffset,
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
          required final String? recommendations,
          required final List<ResearchWidthPriceInAppointmentModel>? items,
          required final String? checkURI,
          required final AppointmentReviewModel? review}) =
      _$_AppointmentModelWithTimeZoneOffset;

  factory _AppointmentModelWithTimeZoneOffset.fromJson(
          Map<String, dynamic> json) =
      _$_AppointmentModelWithTimeZoneOffset.fromJson;

  @override
  int get status;
  @override
  bool get needConfirmation;
  @override
  String? get comment;
  @override
  String? get researchPlace;
  @override
  String get id;
  @override
  @TimestampConverter()
  DateTime get appointmentDateTime;
  @override
  int get timeZoneOffset;
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
  List<ResearchWidthPriceInAppointmentModel>? get items;
  @override
  String? get checkURI;
  @override
  AppointmentReviewModel? get review;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentModelWithTimeZoneOffsetCopyWith<
          _$_AppointmentModelWithTimeZoneOffset>
      get copyWith => throw _privateConstructorUsedError;
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
      _$PatientInfoModelCopyWithImpl<$Res, PatientInfoModel>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$PatientInfoModelCopyWithImpl<$Res, $Val extends PatientInfoModel>
    implements $PatientInfoModelCopyWith<$Res> {
  _$PatientInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientInfoModelCopyWith<$Res>
    implements $PatientInfoModelCopyWith<$Res> {
  factory _$$_PatientInfoModelCopyWith(
          _$_PatientInfoModel value, $Res Function(_$_PatientInfoModel) then) =
      __$$_PatientInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$_PatientInfoModelCopyWithImpl<$Res>
    extends _$PatientInfoModelCopyWithImpl<$Res, _$_PatientInfoModel>
    implements _$$_PatientInfoModelCopyWith<$Res> {
  __$$_PatientInfoModelCopyWithImpl(
      _$_PatientInfoModel _value, $Res Function(_$_PatientInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_PatientInfoModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      _$ClinicInfoModelCopyWithImpl<$Res, ClinicInfoModel>;
  @useResult
  $Res call({String? id, String? name, String? address});
}

/// @nodoc
class _$ClinicInfoModelCopyWithImpl<$Res, $Val extends ClinicInfoModel>
    implements $ClinicInfoModelCopyWith<$Res> {
  _$ClinicInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClinicInfoModelCopyWith<$Res>
    implements $ClinicInfoModelCopyWith<$Res> {
  factory _$$_ClinicInfoModelCopyWith(
          _$_ClinicInfoModel value, $Res Function(_$_ClinicInfoModel) then) =
      __$$_ClinicInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? address});
}

/// @nodoc
class __$$_ClinicInfoModelCopyWithImpl<$Res>
    extends _$ClinicInfoModelCopyWithImpl<$Res, _$_ClinicInfoModel>
    implements _$$_ClinicInfoModelCopyWith<$Res> {
  __$$_ClinicInfoModelCopyWithImpl(
      _$_ClinicInfoModel _value, $Res Function(_$_ClinicInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_ClinicInfoModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
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

AppointmentReviewModel _$AppointmentReviewModelFromJson(
    Map<String, dynamic> json) {
  return _AppointmentReviewModel.fromJson(json);
}

/// @nodoc
mixin _$AppointmentReviewModel {
  num get rate => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get visibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentReviewModelCopyWith<AppointmentReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentReviewModelCopyWith<$Res> {
  factory $AppointmentReviewModelCopyWith(AppointmentReviewModel value,
          $Res Function(AppointmentReviewModel) then) =
      _$AppointmentReviewModelCopyWithImpl<$Res, AppointmentReviewModel>;
  @useResult
  $Res call({num rate, String caption, String message, int visibility});
}

/// @nodoc
class _$AppointmentReviewModelCopyWithImpl<$Res,
        $Val extends AppointmentReviewModel>
    implements $AppointmentReviewModelCopyWith<$Res> {
  _$AppointmentReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? caption = null,
    Object? message = null,
    Object? visibility = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as num,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppointmentReviewModelCopyWith<$Res>
    implements $AppointmentReviewModelCopyWith<$Res> {
  factory _$$_AppointmentReviewModelCopyWith(_$_AppointmentReviewModel value,
          $Res Function(_$_AppointmentReviewModel) then) =
      __$$_AppointmentReviewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num rate, String caption, String message, int visibility});
}

/// @nodoc
class __$$_AppointmentReviewModelCopyWithImpl<$Res>
    extends _$AppointmentReviewModelCopyWithImpl<$Res,
        _$_AppointmentReviewModel>
    implements _$$_AppointmentReviewModelCopyWith<$Res> {
  __$$_AppointmentReviewModelCopyWithImpl(_$_AppointmentReviewModel _value,
      $Res Function(_$_AppointmentReviewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? caption = null,
    Object? message = null,
    Object? visibility = null,
  }) {
    return _then(_$_AppointmentReviewModel(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as num,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppointmentReviewModel implements _AppointmentReviewModel {
  const _$_AppointmentReviewModel(
      {required this.rate,
      required this.caption,
      required this.message,
      required this.visibility});

  factory _$_AppointmentReviewModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentReviewModelFromJson(json);

  @override
  final num rate;
  @override
  final String caption;
  @override
  final String message;
  @override
  final int visibility;

  @override
  String toString() {
    return 'AppointmentReviewModel(rate: $rate, caption: $caption, message: $message, visibility: $visibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentReviewModel &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rate, caption, message, visibility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentReviewModelCopyWith<_$_AppointmentReviewModel> get copyWith =>
      __$$_AppointmentReviewModelCopyWithImpl<_$_AppointmentReviewModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentReviewModelToJson(
      this,
    );
  }
}

abstract class _AppointmentReviewModel implements AppointmentReviewModel {
  const factory _AppointmentReviewModel(
      {required final num rate,
      required final String caption,
      required final String message,
      required final int visibility}) = _$_AppointmentReviewModel;

  factory _AppointmentReviewModel.fromJson(Map<String, dynamic> json) =
      _$_AppointmentReviewModel.fromJson;

  @override
  num get rate;
  @override
  String get caption;
  @override
  String get message;
  @override
  int get visibility;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentReviewModelCopyWith<_$_AppointmentReviewModel> get copyWith =>
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
  String? get imagePreviewLocation => throw _privateConstructorUsedError;
  String? get imageFullSizeLocation => throw _privateConstructorUsedError;
  String? get shortInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorInfoModelCopyWith<DoctorInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorInfoModelCopyWith<$Res> {
  factory $DoctorInfoModelCopyWith(
          DoctorInfoModel value, $Res Function(DoctorInfoModel) then) =
      _$DoctorInfoModelCopyWithImpl<$Res, DoctorInfoModel>;
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? specializationId,
      String? specialization,
      String? imagePreviewLocation,
      String? imageFullSizeLocation,
      String? shortInfo});
}

/// @nodoc
class _$DoctorInfoModelCopyWithImpl<$Res, $Val extends DoctorInfoModel>
    implements $DoctorInfoModelCopyWith<$Res> {
  _$DoctorInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? specializationId = freezed,
    Object? specialization = freezed,
    Object? imagePreviewLocation = freezed,
    Object? imageFullSizeLocation = freezed,
    Object? shortInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      specializationId: freezed == specializationId
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePreviewLocation: freezed == imagePreviewLocation
          ? _value.imagePreviewLocation
          : imagePreviewLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFullSizeLocation: freezed == imageFullSizeLocation
          ? _value.imageFullSizeLocation
          : imageFullSizeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      shortInfo: freezed == shortInfo
          ? _value.shortInfo
          : shortInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DoctorInfoModelCopyWith<$Res>
    implements $DoctorInfoModelCopyWith<$Res> {
  factory _$$_DoctorInfoModelCopyWith(
          _$_DoctorInfoModel value, $Res Function(_$_DoctorInfoModel) then) =
      __$$_DoctorInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? specializationId,
      String? specialization,
      String? imagePreviewLocation,
      String? imageFullSizeLocation,
      String? shortInfo});
}

/// @nodoc
class __$$_DoctorInfoModelCopyWithImpl<$Res>
    extends _$DoctorInfoModelCopyWithImpl<$Res, _$_DoctorInfoModel>
    implements _$$_DoctorInfoModelCopyWith<$Res> {
  __$$_DoctorInfoModelCopyWithImpl(
      _$_DoctorInfoModel _value, $Res Function(_$_DoctorInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? specializationId = freezed,
    Object? specialization = freezed,
    Object? imagePreviewLocation = freezed,
    Object? imageFullSizeLocation = freezed,
    Object? shortInfo = freezed,
  }) {
    return _then(_$_DoctorInfoModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      specializationId: freezed == specializationId
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePreviewLocation: freezed == imagePreviewLocation
          ? _value.imagePreviewLocation
          : imagePreviewLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFullSizeLocation: freezed == imageFullSizeLocation
          ? _value.imageFullSizeLocation
          : imageFullSizeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      shortInfo: freezed == shortInfo
          ? _value.shortInfo
          : shortInfo // ignore: cast_nullable_to_non_nullable
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
      required this.specialization,
      required this.imagePreviewLocation,
      required this.imageFullSizeLocation,
      required this.shortInfo});

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
  final String? imagePreviewLocation;
  @override
  final String? imageFullSizeLocation;
  @override
  final String? shortInfo;

  @override
  String toString() {
    return 'DoctorInfoModel(id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, specializationId: $specializationId, specialization: $specialization, imagePreviewLocation: $imagePreviewLocation, imageFullSizeLocation: $imageFullSizeLocation, shortInfo: $shortInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoctorInfoModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.specializationId, specializationId) ||
                other.specializationId == specializationId) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.imagePreviewLocation, imagePreviewLocation) ||
                other.imagePreviewLocation == imagePreviewLocation) &&
            (identical(other.imageFullSizeLocation, imageFullSizeLocation) ||
                other.imageFullSizeLocation == imageFullSizeLocation) &&
            (identical(other.shortInfo, shortInfo) ||
                other.shortInfo == shortInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      middleName,
      lastName,
      specializationId,
      specialization,
      imagePreviewLocation,
      imageFullSizeLocation,
      shortInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      required final String? specialization,
      required final String? imagePreviewLocation,
      required final String? imageFullSizeLocation,
      required final String? shortInfo}) = _$_DoctorInfoModel;

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
  String? get imagePreviewLocation;
  @override
  String? get imageFullSizeLocation;
  @override
  String? get shortInfo;
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
      _$ResearchesModelCopyWithImpl<$Res, ResearchesModel>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$ResearchesModelCopyWithImpl<$Res, $Val extends ResearchesModel>
    implements $ResearchesModelCopyWith<$Res> {
  _$ResearchesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResearchesModelCopyWith<$Res>
    implements $ResearchesModelCopyWith<$Res> {
  factory _$$_ResearchesModelCopyWith(
          _$_ResearchesModel value, $Res Function(_$_ResearchesModel) then) =
      __$$_ResearchesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$_ResearchesModelCopyWithImpl<$Res>
    extends _$ResearchesModelCopyWithImpl<$Res, _$_ResearchesModel>
    implements _$$_ResearchesModelCopyWith<$Res> {
  __$$_ResearchesModelCopyWithImpl(
      _$_ResearchesModel _value, $Res Function(_$_ResearchesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_ResearchesModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      _$AppointmentInfoModelCopyWithImpl<$Res, AppointmentInfoModel>;
  @useResult
  $Res call(
      {int price,
      bool noPayment,
      String serviceName,
      String payType,
      List<RecommendationItemModel> recommendations});
}

/// @nodoc
class _$AppointmentInfoModelCopyWithImpl<$Res,
        $Val extends AppointmentInfoModel>
    implements $AppointmentInfoModelCopyWith<$Res> {
  _$AppointmentInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? noPayment = null,
    Object? serviceName = null,
    Object? payType = null,
    Object? recommendations = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      noPayment: null == noPayment
          ? _value.noPayment
          : noPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<RecommendationItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppointmentInfoModelCopyWith<$Res>
    implements $AppointmentInfoModelCopyWith<$Res> {
  factory _$$_AppointmentInfoModelCopyWith(_$_AppointmentInfoModel value,
          $Res Function(_$_AppointmentInfoModel) then) =
      __$$_AppointmentInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int price,
      bool noPayment,
      String serviceName,
      String payType,
      List<RecommendationItemModel> recommendations});
}

/// @nodoc
class __$$_AppointmentInfoModelCopyWithImpl<$Res>
    extends _$AppointmentInfoModelCopyWithImpl<$Res, _$_AppointmentInfoModel>
    implements _$$_AppointmentInfoModelCopyWith<$Res> {
  __$$_AppointmentInfoModelCopyWithImpl(_$_AppointmentInfoModel _value,
      $Res Function(_$_AppointmentInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? noPayment = null,
    Object? serviceName = null,
    Object? payType = null,
    Object? recommendations = null,
  }) {
    return _then(_$_AppointmentInfoModel(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      noPayment: null == noPayment
          ? _value.noPayment
          : noPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
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
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
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
            (identical(other.price, price) || other.price == price) &&
            (identical(other.noPayment, noPayment) ||
                other.noPayment == noPayment) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.payType, payType) || other.payType == payType) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, price, noPayment, serviceName,
      payType, const DeepCollectionEquality().hash(_recommendations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      _$RecommendationItemModelCopyWithImpl<$Res, RecommendationItemModel>;
  @useResult
  $Res call({String serviceId, String serviceName, String recommendation});
}

/// @nodoc
class _$RecommendationItemModelCopyWithImpl<$Res,
        $Val extends RecommendationItemModel>
    implements $RecommendationItemModelCopyWith<$Res> {
  _$RecommendationItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? serviceName = null,
    Object? recommendation = null,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecommendationItemModelCopyWith<$Res>
    implements $RecommendationItemModelCopyWith<$Res> {
  factory _$$_RecommendationItemModelCopyWith(_$_RecommendationItemModel value,
          $Res Function(_$_RecommendationItemModel) then) =
      __$$_RecommendationItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String serviceId, String serviceName, String recommendation});
}

/// @nodoc
class __$$_RecommendationItemModelCopyWithImpl<$Res>
    extends _$RecommendationItemModelCopyWithImpl<$Res,
        _$_RecommendationItemModel>
    implements _$$_RecommendationItemModelCopyWith<$Res> {
  __$$_RecommendationItemModelCopyWithImpl(_$_RecommendationItemModel _value,
      $Res Function(_$_RecommendationItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? serviceName = null,
    Object? recommendation = null,
  }) {
    return _then(_$_RecommendationItemModel(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
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
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, serviceId, serviceName, recommendation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      _$CreateNewAppointmentResponseModelCopyWithImpl<$Res,
          CreateNewAppointmentResponseModel>;
  @useResult
  $Res call({String result, String information});
}

/// @nodoc
class _$CreateNewAppointmentResponseModelCopyWithImpl<$Res,
        $Val extends CreateNewAppointmentResponseModel>
    implements $CreateNewAppointmentResponseModelCopyWith<$Res> {
  _$CreateNewAppointmentResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? information = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  @useResult
  $Res call({String result, String information});
}

/// @nodoc
class __$$_CreateNewAppointmentResponseModelCopyWithImpl<$Res>
    extends _$CreateNewAppointmentResponseModelCopyWithImpl<$Res,
        _$_CreateNewAppointmentResponseModel>
    implements _$$_CreateNewAppointmentResponseModelCopyWith<$Res> {
  __$$_CreateNewAppointmentResponseModelCopyWithImpl(
      _$_CreateNewAppointmentResponseModel _value,
      $Res Function(_$_CreateNewAppointmentResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? information = null,
  }) {
    return _then(_$_CreateNewAppointmentResponseModel(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
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
      _$RegisterOrderResponseModelCopyWithImpl<$Res,
          RegisterOrderResponseModel>;
  @useResult
  $Res call({bool result, String paymentUrl, String? error});
}

/// @nodoc
class _$RegisterOrderResponseModelCopyWithImpl<$Res,
        $Val extends RegisterOrderResponseModel>
    implements $RegisterOrderResponseModelCopyWith<$Res> {
  _$RegisterOrderResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? paymentUrl = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentUrl: null == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
  @useResult
  $Res call({bool result, String paymentUrl, String? error});
}

/// @nodoc
class __$$_RegisterOrderResponseModelCopyWithImpl<$Res>
    extends _$RegisterOrderResponseModelCopyWithImpl<$Res,
        _$_RegisterOrderResponseModel>
    implements _$$_RegisterOrderResponseModelCopyWith<$Res> {
  __$$_RegisterOrderResponseModelCopyWithImpl(
      _$_RegisterOrderResponseModel _value,
      $Res Function(_$_RegisterOrderResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? paymentUrl = null,
    Object? error = freezed,
  }) {
    return _then(_$_RegisterOrderResponseModel(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentUrl: null == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
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
            (identical(other.result, result) || other.result == result) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, paymentUrl, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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

ResearchWidthPriceInAppointmentModel
    _$ResearchWidthPriceInAppointmentModelFromJson(Map<String, dynamic> json) {
  return _ResearchWidthPriceInAppointmentModel.fromJson(json);
}

/// @nodoc
mixin _$ResearchWidthPriceInAppointmentModel {
  String? get id => throw _privateConstructorUsedError;
  String? get service => throw _privateConstructorUsedError;
  String? get prescType => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get paid => throw _privateConstructorUsedError;
  String? get billUslug => throw _privateConstructorUsedError;
  String? get presc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResearchWidthPriceInAppointmentModelCopyWith<
          ResearchWidthPriceInAppointmentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResearchWidthPriceInAppointmentModelCopyWith<$Res> {
  factory $ResearchWidthPriceInAppointmentModelCopyWith(
          ResearchWidthPriceInAppointmentModel value,
          $Res Function(ResearchWidthPriceInAppointmentModel) then) =
      _$ResearchWidthPriceInAppointmentModelCopyWithImpl<$Res,
          ResearchWidthPriceInAppointmentModel>;
  @useResult
  $Res call(
      {String? id,
      String? service,
      String? prescType,
      int? price,
      int? paid,
      String? billUslug,
      String? presc});
}

/// @nodoc
class _$ResearchWidthPriceInAppointmentModelCopyWithImpl<$Res,
        $Val extends ResearchWidthPriceInAppointmentModel>
    implements $ResearchWidthPriceInAppointmentModelCopyWith<$Res> {
  _$ResearchWidthPriceInAppointmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? service = freezed,
    Object? prescType = freezed,
    Object? price = freezed,
    Object? paid = freezed,
    Object? billUslug = freezed,
    Object? presc = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      prescType: freezed == prescType
          ? _value.prescType
          : prescType // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      billUslug: freezed == billUslug
          ? _value.billUslug
          : billUslug // ignore: cast_nullable_to_non_nullable
              as String?,
      presc: freezed == presc
          ? _value.presc
          : presc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResearchWidthPriceInAppointmentModelCopyWith<$Res>
    implements $ResearchWidthPriceInAppointmentModelCopyWith<$Res> {
  factory _$$_ResearchWidthPriceInAppointmentModelCopyWith(
          _$_ResearchWidthPriceInAppointmentModel value,
          $Res Function(_$_ResearchWidthPriceInAppointmentModel) then) =
      __$$_ResearchWidthPriceInAppointmentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? service,
      String? prescType,
      int? price,
      int? paid,
      String? billUslug,
      String? presc});
}

/// @nodoc
class __$$_ResearchWidthPriceInAppointmentModelCopyWithImpl<$Res>
    extends _$ResearchWidthPriceInAppointmentModelCopyWithImpl<$Res,
        _$_ResearchWidthPriceInAppointmentModel>
    implements _$$_ResearchWidthPriceInAppointmentModelCopyWith<$Res> {
  __$$_ResearchWidthPriceInAppointmentModelCopyWithImpl(
      _$_ResearchWidthPriceInAppointmentModel _value,
      $Res Function(_$_ResearchWidthPriceInAppointmentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? service = freezed,
    Object? prescType = freezed,
    Object? price = freezed,
    Object? paid = freezed,
    Object? billUslug = freezed,
    Object? presc = freezed,
  }) {
    return _then(_$_ResearchWidthPriceInAppointmentModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      prescType: freezed == prescType
          ? _value.prescType
          : prescType // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      billUslug: freezed == billUslug
          ? _value.billUslug
          : billUslug // ignore: cast_nullable_to_non_nullable
              as String?,
      presc: freezed == presc
          ? _value.presc
          : presc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResearchWidthPriceInAppointmentModel
    implements _ResearchWidthPriceInAppointmentModel {
  const _$_ResearchWidthPriceInAppointmentModel(
      {required this.id,
      required this.service,
      required this.prescType,
      required this.price,
      required this.paid,
      required this.billUslug,
      required this.presc});

  factory _$_ResearchWidthPriceInAppointmentModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_ResearchWidthPriceInAppointmentModelFromJson(json);

  @override
  final String? id;
  @override
  final String? service;
  @override
  final String? prescType;
  @override
  final int? price;
  @override
  final int? paid;
  @override
  final String? billUslug;
  @override
  final String? presc;

  @override
  String toString() {
    return 'ResearchWidthPriceInAppointmentModel(id: $id, service: $service, prescType: $prescType, price: $price, paid: $paid, billUslug: $billUslug, presc: $presc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResearchWidthPriceInAppointmentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.prescType, prescType) ||
                other.prescType == prescType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.billUslug, billUslug) ||
                other.billUslug == billUslug) &&
            (identical(other.presc, presc) || other.presc == presc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, service, prescType, price, paid, billUslug, presc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResearchWidthPriceInAppointmentModelCopyWith<
          _$_ResearchWidthPriceInAppointmentModel>
      get copyWith => __$$_ResearchWidthPriceInAppointmentModelCopyWithImpl<
          _$_ResearchWidthPriceInAppointmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResearchWidthPriceInAppointmentModelToJson(
      this,
    );
  }
}

abstract class _ResearchWidthPriceInAppointmentModel
    implements ResearchWidthPriceInAppointmentModel {
  const factory _ResearchWidthPriceInAppointmentModel(
      {required final String? id,
      required final String? service,
      required final String? prescType,
      required final int? price,
      required final int? paid,
      required final String? billUslug,
      required final String? presc}) = _$_ResearchWidthPriceInAppointmentModel;

  factory _ResearchWidthPriceInAppointmentModel.fromJson(
          Map<String, dynamic> json) =
      _$_ResearchWidthPriceInAppointmentModel.fromJson;

  @override
  String? get id;
  @override
  String? get service;
  @override
  String? get prescType;
  @override
  int? get price;
  @override
  int? get paid;
  @override
  String? get billUslug;
  @override
  String? get presc;
  @override
  @JsonKey(ignore: true)
  _$$_ResearchWidthPriceInAppointmentModelCopyWith<
          _$_ResearchWidthPriceInAppointmentModel>
      get copyWith => throw _privateConstructorUsedError;
}
