// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequestModel _$SignInRequestModelFromJson(Map<String, dynamic> json) =>
    SignInRequestModel(
      json['phone'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$SignInRequestModelToJson(SignInRequestModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };
