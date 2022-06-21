import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/api/api_interceptors.dart';

class Api {
  static BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrlEnv01,
    responseType: ResponseType.json,
    connectTimeout: 90000,
    receiveTimeout: 60000,
  );

  final Dio _dio = Dio(options);

  Api() {
    _dio.interceptors.add(DioInterceptors());

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Dio get dio => _dio;
}
