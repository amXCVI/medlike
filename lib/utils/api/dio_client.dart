import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/api/api_interceptors.dart';

class Api {
  static BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    responseType: ResponseType.json,
    connectTimeout: 90000,
    receiveTimeout: 60000,
  );

  final Dio _dio = Dio(options);

  Api() {
    _dio.interceptors.add(DioInterceptors());

    if(_dio.httpClientAdapter is DefaultHttpClientAdapter){
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;

        if (!kIsWeb) {
          (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
              (client) {
            client.badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
            return client;
          };
        }

        return client;
      };
    }
  }

  Dio get dio => _dio;
}
