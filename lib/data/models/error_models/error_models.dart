import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'error_models.freezed.dart';
part 'error_models.g.dart';

@freezed
class DefaultErrorModel with _$DefaultErrorModel {
  const factory DefaultErrorModel({
    required String message,
  }) = _DefaultErrorModel;

  factory DefaultErrorModel.fromJson(Map<String, Object?> json) =>
      _$DefaultErrorModelFromJson(json);
}
