import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/api/api_interceptors.dart';
import 'package:sentry_dio/sentry_dio.dart';

class Api {
  static BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  late Dio _dio;
  static bool isContextSet = false;

  Api() {
    _dio = Dio()
    ..options = options
    ..interceptors.add(DioInterceptors())
    ..addSentry(
      captureFailedRequests: true
    );

    initSSLCert();
  }

  void initSSLCert() async {
    final sslCert1 = await   
      rootBundle.load('assets/security_certs/mis-api-nornik-ru.pem');

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      if(!kIsWeb) {
        var sccontext = SecurityContext.defaultContext;
        if(Api.isContextSet == false) {
          sccontext.setTrustedCertificatesBytes(sslCert1.buffer.asInt8List());
          Api.isContextSet = true;
        }

        HttpClient client = HttpClient(context: sccontext);
        return client;
      }

      return client;
    };
  }

  Dio get dio => _dio;
}
