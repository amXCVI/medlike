import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'faq_models.freezed.dart';
part 'faq_models.g.dart';

@freezed
class FAQItemModel with _$FAQItemModel {
  const factory FAQItemModel({
    required String id,
    required String question,
    required String answer,
  }) = _FAQItemModel;

  factory FAQItemModel.fromJson(Map<String, Object?> json) =>
      _$FAQItemModelFromJson(json);
}
