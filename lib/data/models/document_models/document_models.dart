import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'document_models.freezed.dart';
part 'document_models.g.dart';

@freezed
class DocumentModel with _$DocumentModel {
  const factory DocumentModel({
    required String documentName,
    required String documentURL,
    required int status,
    required String clinicAddress,
    required DateTime documentSubscribeDate,
    required DateTime documentCreateDate,
    required String userName,
  }) = _DocumentModelModel;

  factory DocumentModel.fromJson(Map<String, Object?> json) =>
      _$DocumentModelFromJson(json);
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
