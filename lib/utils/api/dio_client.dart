import 'package:dio/dio.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/api/api_interceptors.dart';


class Api {
  static BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrlEnv01,
    responseType: ResponseType.json,
    connectTimeout: 50000,
    receiveTimeout: 30000,
  );

  final Dio _dio = Dio(options);

  Api() {
    _dio.interceptors.add(DioInterceptors());
  }

  Dio get dio => _dio;
}
