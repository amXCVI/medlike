import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/api/api_interceptors.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

class Api {
  static BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  final Dio _dio = Dio()
    ..options = options
    ..interceptors.add(DioInterceptors());

  Api() {
    initSSLCert();
  }

  void initSSLCert() async {
    ByteData certData = await PlatformAssetBundle()
        .load('assets/security_certs/certificate.pem');
    ByteData certData1 = await PlatformAssetBundle()
        .load('assets/security_certs/certificate_1.pem');

    print(_getStringFromBytes(certData));
    print(
        '###################################################\n###############################');

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        if (cert.pem == _getStringFromBytes(certData)) {
          return true;
        } else if (cert.pem == _getStringFromBytes(certData1)) {
          return true;
        }
        AppToast.showAppToast(
            msg:
                'Просроченный ssl-сертификат. Пожалуйста, обратитесь к администратору');
        throw('Просроченный ssl-сертификат');
      };
    };
  }

  String _getStringFromBytes(ByteData data) {
    final buffer = data.buffer;
    var list = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return utf8.decode(list);
  }

  Dio get dio => _dio;
}
//
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/services.dart';
// import 'package:medlike/utils/api/api_constants.dart';
// import 'package:medlike/utils/api/api_interceptors.dart';
// import 'package:medlike/widgets/fluttertoast/toast.dart';
//
// class Api {
//   static BaseOptions options = BaseOptions(
//     baseUrl: ApiConstants.baseUrl,
//     responseType: ResponseType.json,
//     connectTimeout: 30000,
//     receiveTimeout: 30000,
//   );
//
//   Future<Null Function(HttpClient client)> init() async {
//     print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
//     ByteData certData = await PlatformAssetBundle()
//         .load('assets/security_certs/certificate.pem');
//     ByteData certData1 = await PlatformAssetBundle()
//         .load('assets/security_certs/certificate_1.pem');
//
//     return (_dio.httpClientAdapter as DefaultHttpClientAdapter)
//         .onHttpClientCreate = (HttpClient client) {
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) {
//         print('111111');
//         if (cert.pem == _getStringFromBytes(certData)) {
//           print('2222222');
//           return true;
//         } else if (cert.pem == _getStringFromBytes(certData1)) {
//           print('33333333');
//           return true;
//         }
//         print('4444444');
//         AppToast.showAppToast(
//             msg:
//                 'Просроченный ssl-сертификат. Пожалуйста, обратитесь к администратору');
//         throw ('!!!!!!!!!!!err!!!!!!!!!!!!!');
//         return false;
//       };
//     };
//   }
//
//   final Dio _dio = Dio()
//     ..options = options
//     ..interceptors.add(DioInterceptors())
//     ..httpClientAdapter = init();
//
//   Api() {
//     init();
//   }
//
//   String _getStringFromBytes(ByteData data) {
//     final buffer = data.buffer;
//     var list = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//     return utf8.decode(list);
//   }
//
//   Dio get dio => _dio;
// }
