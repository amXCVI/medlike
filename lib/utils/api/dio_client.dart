import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/api/api_interceptors.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class Api {
  static BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  late Dio _dio;

  Api() {
    _dio = Dio()
    ..options = options
    ..interceptors.add(DioInterceptors());


    initSSLCert();
  }

  void initSSLCert() async {
    if(!kIsWeb) {
      _dio.interceptors.add(CertificatePinningInterceptor(
        allowedSHAFingerprints: ApiConstants.sha256
      ));
    }

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      return client;
    };
  }

  Dio get dio => _dio;
}
