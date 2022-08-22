import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'medcard_models.freezed.dart';

part 'medcard_models.g.dart';

@freezed
class FilterDateItemModel with _$FilterDateItemModel {
  const factory FilterDateItemModel({
    required String label,
    required DateTime startDate,
    required DateTime endDate,
    required Duration duration,
  }) = _FilterDateItemModel;

  factory FilterDateItemModel.fromJson(Map<String, Object?> json) =>
      _$FilterDateItemModelFromJson(json);
}

@freezed
class FilterCategoryItemModel with _$FilterCategoryItemModel {
  const factory FilterCategoryItemModel({
    required String label,
    required String categoryName,
  }) = _FilterCategoryItemModel;

  factory FilterCategoryItemModel.fromJson(Map<String, Object?> json) =>
      _$FilterCategoryItemModelFromJson(json);
}

@freezed
class MedcardFiltersItemModel with _$MedcardFiltersItemModel {
  const factory MedcardFiltersItemModel({
    required String label,
    String? categoryName,
    DateTime? startDate,
    DateTime? endDate,
    Duration? duration,
  }) = _MedcardFiltersItemModel;

  factory MedcardFiltersItemModel.fromJson(Map<String, Object?> json) =>
      _$MedcardFiltersItemModelFromJson(json);
}

@freezed
class MedcardDocsModel with _$MedcardDocsModel {
  const factory MedcardDocsModel({
    required String mdocId,
    required String section,
    required String prescId,
    required String nameDoc,
    required DateTime dateSign,
    required DateTime lastModifiedDate,
  }) = _MedcardDocsModel;

  factory MedcardDocsModel.fromJson(Map<String, Object?> json) =>
      _$MedcardDocsModelFromJson(json);
}

@freezed
class MedcardUserFileModel with _$MedcardUserFileModel {
  const factory MedcardUserFileModel({
    required String id,
    required String filename,
    required String type,
    required DateTime uploadDate,
    required int length,
    required bool hasPreview,
  }) = _MedcardUserFileModel;

  factory MedcardUserFileModel.fromJson(Map<String, Object?> json) =>
      _$MedcardUserFileModelFromJson(json);
}

@freezed
class DeleteUserFileResponseModel with _$DeleteUserFileResponseModel {
  const factory DeleteUserFileResponseModel({
  required bool result,
  required String? information,
  }) = _DeleteUserFileResponseModel;

  factory DeleteUserFileResponseModel.fromJson(Map<String, Object?> json) =>
      _$DeleteUserFileResponseModelFromJson(json);
}

@freezed
class MedcardFilterItemModel with _$MedcardFilterItemModel {
  const factory MedcardFilterItemModel({
    required String label,
    required String value,
    required String categoryLabel,
  }) = _MedcardFilterItemModel;

  factory MedcardFilterItemModel.fromJson(Map<String, Object?> json) =>
      _$MedcardFilterItemModelFromJson(json);
}

@freezed
class MedcardFilterModel with _$MedcardFilterModel {
  const factory MedcardFilterModel({
    required String title,
    required String value,
    required List<MedcardFilterItemModel> filters,
  }) = _MedcardFilterModel;

  factory MedcardFilterModel.fromJson(Map<String, Object?> json) =>
      _$MedcardFilterModelFromJson(json);
}