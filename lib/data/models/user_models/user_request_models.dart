import 'package:json_annotation/json_annotation.dart';

part 'user_request_models.g.dart';

@JsonSerializable()
class SignInRequestModel {
  SignInRequestModel(this.phone, this.password);

  final String phone;
  final String password;

  factory SignInRequestModel.fromJson(Map<String, Object?> json) =>
      _$SignInRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
}
