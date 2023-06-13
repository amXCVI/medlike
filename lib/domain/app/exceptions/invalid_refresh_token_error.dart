import 'package:dio/dio.dart';

class InvalidRefreshTokenError extends DioException {
  String _message = 'InvalidRefreshTokenError';

  InvalidRefreshTokenError({required requestOptions})
      : super(requestOptions: requestOptions) {
    _message = message!;
  }

  @override
  String toString() {
    return _message;
  }
}
