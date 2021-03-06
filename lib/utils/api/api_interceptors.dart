import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
      print('DATA: ${options.data.toString()}');
    }
    options.headers = {
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': 'Medlike',
      'Authorization': 'Bearer ${await UserSecureStorage.getField(AppConstants().accessToken)}',
    };

    return super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      print('DATA: ${response.data.toString()}');
    }
    return super.onResponse(response, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('ERROR[${err.message}] => PATH: ${err.requestOptions.path}');
    }
    return super.onError(err, handler);
  }
}