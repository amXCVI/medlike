import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'document_models.freezed.dart';
part 'document_models.g.dart';

@freezed
class DocumentModel with _$DocumentModel {
  const factory DocumentModel({
    required String id,
    required String name,
    required DocumentMetaLpuModel lpu,
    required DateTime updatedAt,
    required DocumentPatientModel? patient,
    required bool isSignByPatient,
    required DateTime? signedByPatientAt,
    required bool isSignByEmployee,
    required DateTime? signedByEmployeeAt,
  }) = _DocumentModelModel;

  factory DocumentModel.fromJson(Map<String, Object?> json) =>
      _$DocumentModelFromJson(json);
}

@freezed
class DocumentMetaModel with _$DocumentMetaModel {
  factory DocumentMetaModel({
    required String id,
    required String name,
    required DateTime updatedAt,
    required DocumentMetaLpuModel lpu,
    required DocumentMetaPatientModel patient,
    required DocumentMetaDocumentCreatorModel? documentCreator,
    required DocumentMetaSignEmployerModel? signEmployer,
    required bool isSignByPatient,
    required DateTime? signedByPatientAt,
    required bool isSignByEmployee,
    required DateTime? signedByEmployeeAt,
  }) = _DocumentMetaModel;

  factory DocumentMetaModel.fromJson(Map<String, Object?> json) =>
      _$DocumentMetaModelFromJson(json);
}

@freezed
class DocumentMetaLpuModel with _$DocumentMetaLpuModel {
  const factory DocumentMetaLpuModel({
    required String id,
    required String name,
    required String address,
  }) = _DocumentMetaLpuModel;

  factory DocumentMetaLpuModel.fromJson(Map<String, Object?> json) =>
      _$DocumentMetaLpuModelFromJson(json);
}

@freezed
class DocumentMetaPatientModel with _$DocumentMetaPatientModel {
  const factory DocumentMetaPatientModel({
    required String id,
    required String lastname,
    required String firstname,
    required String middlename,
    required String? adresses,
    required DateTime birthday,
    required String sex,
  }) = _DocumentMetaPatientModel;

  factory DocumentMetaPatientModel.fromJson(Map<String, Object?> json) =>
      _$DocumentMetaPatientModelFromJson(json);
}

@freezed
class DocumentMetaDocumentCreatorModel with _$DocumentMetaDocumentCreatorModel {
  const factory DocumentMetaDocumentCreatorModel({
    required String firstname,
    required String middlename,
    required String lastname,
  }) = _DocumentMetaDocumentCreatorModel;

  factory DocumentMetaDocumentCreatorModel.fromJson(
          Map<String, Object?> json) =>
      _$DocumentMetaDocumentCreatorModelFromJson(json);
}

@freezed
class DocumentMetaSignEmployerModel with _$DocumentMetaSignEmployerModel {
  const factory DocumentMetaSignEmployerModel({
    required String firstname,
    required String middlename,
    required String lastname,
  }) = _DocumentMetaSignEmployerModel;

  factory DocumentMetaSignEmployerModel.fromJson(Map<String, Object?> json) =>
      _$DocumentMetaSignEmployerModelFromJson(json);
}

@freezed
class DocumentPatientModel with _$DocumentPatientModel {
  const factory DocumentPatientModel({
    required String id,
    required String firstname,
    required String middlename,
    required String lastname,
  }) = _DocumentPatientModel;

  factory DocumentPatientModel.fromJson(Map<String, Object?> json) =>
      _$DocumentPatientModelFromJson(json);
}

@freezed
class DocumentFilterItemModel with _$DocumentFilterItemModel {
  const factory DocumentFilterItemModel({
    required String label,
    required String value,
    required String categoryLabel,
  }) = _DocumentFilterItemModel;

  factory DocumentFilterItemModel.fromJson(Map<String, Object?> json) =>
      _$DocumentFilterItemModelFromJson(json);
}

@freezed
class DocumentFilterModel with _$DocumentFilterModel {
  const factory DocumentFilterModel({
    required String title,
    required String value,
    required List<DocumentFilterItemModel> filters,
  }) = _DocumentFilterModel;

  factory DocumentFilterModel.fromJson(Map<String, Object?> json) =>
      _$DocumentFilterModelFromJson(json);
}
