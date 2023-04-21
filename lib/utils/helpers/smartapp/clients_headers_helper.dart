import 'package:medlike/utils/api/api_constants.dart';

Map<String, dynamic> getHeadersHelper(
  String token,
  String userAgent, {
    Map<String, dynamic>? headers
  }
) {
  Map<String, dynamic> defaultHeaders = {
    'User-Agent': userAgent,
    'Accept': 'application/json; charset=utf-8',
    'Content-Type': 'application/json',
    'Project': ApiConstants.env,
    'VerApp': ApiConstants.appVersion,
    'Platform': '6',
    'Authorization': token,
  };

  if(headers != null) {
    return {
      ...headers,
      'User-Agent': userAgent,
      'Platform': '6',
    };
  }

  return defaultHeaders;
}
