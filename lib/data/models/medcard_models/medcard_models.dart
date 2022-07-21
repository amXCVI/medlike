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