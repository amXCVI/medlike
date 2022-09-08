import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/error_models/error_models.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

class DioInterceptors extends Interceptor {
  late final Dio loggedDio = Dio(); //for logged
  late final Dio tokenDio = Dio();

  final _dio = Dio();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
      print('DATA: ${options.data.toString()}');
    }
    options.headers = {
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': 'Medlike',
      'VerApp': '1.0',
      'Platform': Platform.isAndroid ? '1' : '2',
      'Authorization':
          'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}',
    };

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      print('DATA: ${response.data.toString()}');
    }
    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      print('ERROR[${err.message}] => PATH: ${err.requestOptions.path}');
    }
    if (err.response?.statusCode == 401) {
      final requestOptions = err.response!.requestOptions;
      _lockDio();
      if (requestOptions.headers['Retry-Count'] == 1) {
        _unlockDio();
        UserSecureStorage.deleteField(AppConstants.accessToken);
        UserSecureStorage.deleteField(AppConstants.refreshToken);
        UserSecureStorage.setField(AppConstants.isAuth, 'false');
        AppToast.showAppToast(
            msg: 'Время вашей сессии истекло. Авторизуйтесь заново');
        //TODO: logout user here
        // return err;
      }
      return _dio
          .post('${ApiConstants.baseUrl}/api/v1.0/auth/token/refresh', data: {
        'Token': await UserSecureStorage.getField(AppConstants.accessToken),
        'RefreshToken':
            await UserSecureStorage.getField(AppConstants.refreshToken),
      }).then((response) {
        if (kDebugMode) {
          print('REFRESH TOKEN. ${response.statusCode}');
        }
        if (response.statusCode == 200 || response.statusCode == 201) {
          RefreshTokenResponseModel parsedResponse =
          RefreshTokenResponseModel.fromJson(response.data);
          UserSecureStorage.setField(
              AppConstants.accessToken, parsedResponse.token);
          UserSecureStorage.setField(
              AppConstants.refreshToken, parsedResponse.refreshToken);
        }
      }).whenComplete(() {
        _unlockDio();
      }).then((e) async {
        requestOptions.headers['Retry-Count'] = 1;
        err.requestOptions.headers["Authorization"] =
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}';
        final opts = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers);
        final cloneReq = await _dio.request(
          '${ApiConstants.baseUrl}${err.requestOptions.path}',
          options: opts,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );

        return handler.resolve(cloneReq);
      }).catchError((e) {
        AppToast.showAppToast(
            msg:
                'Время вашей сессии истекло. Пожалуйста, авторизуйтесь заново');
        //TODO: logout user here
        return e;
      });
    } else {
      String? errStr = DefaultErrorModel.fromJson(err.response!.data).message;
      if (errStr == null) {
        return super.onError(err, handler);
      }
      AppToast.showAppToast(msg: errStr.isNotEmpty ? errStr : err.message);
      return super.onError(err, handler);
    }
  }

  void _lockDio() {
    loggedDio.lock();
    loggedDio.interceptors.responseLock.lock();
    loggedDio.interceptors.errorLock.lock();
  }

  void _unlockDio() {
    loggedDio.unlock();
    loggedDio.interceptors.responseLock.unlock();
    loggedDio.interceptors.errorLock.unlock();
  }


}
