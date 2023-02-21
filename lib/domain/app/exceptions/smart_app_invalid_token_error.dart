import 'package:dio/dio.dart';

class SmartAppInvalidTokenError extends DioError {
  String _message = 'InvalidRefreshTokenError';

  SmartAppInvalidTokenError({required requestOptions}) : super(requestOptions: requestOptions) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
