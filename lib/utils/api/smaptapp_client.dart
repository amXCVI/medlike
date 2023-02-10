@JS()
library main;

import 'dart:convert';

import 'package:js/js.dart';
import 'dart:js_util';
import 'package:dio/dio.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/smartapp_models/smartapp_models.dart';
import 'package:medlike/utils/api/api_constants.dart';

import 'dart:js' as js;

import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

typedef Callback<T> = dynamic Function(T arg);

@JS()
class Promise<T> {
  external Promise<T> then(Callback<T> successCallback,
      [Function errorCallback]);

  external Promise<T> catchIt(Function errorCallback);
}

@JS('sendBotEvent')
external Promise<dynamic> sendBotEvent(Object objectParams, dynamic? data);

@JS('sendClientEvent')
external Promise<dynamic> sendClientEvent(Object objectParams);

class SmartAppClient {
  Future<dynamic> get(String endpoint,
      {Options? options, Map<String, String>? queryParameters}) async {
    var paramsStr = '';
    if (queryParameters != null) {
      paramsStr = queryParameters.keys
          .map((key) =>
              "${Uri.encodeComponent(key)}=${Uri.encodeComponent(queryParameters[key]!)}")
          .join("&");
    }

    print('GET $endpoint${paramsStr.isNotEmpty ? '?$paramsStr' : ''}');

    final token =
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}';
    Map<String, dynamic> defaultHeaders = {
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': ApiConstants.env,
      'VerApp': ApiConstants.appVersion,
      'Platform': '4',
      'Authorization': token,
    };

    return await promiseToFuture(sendBotEvent(
      const JsonEncoder().convert({
        'method': 'proxy_request',
        'params': {
          'url':
              '${ApiConstants.baseUrl}$endpoint${paramsStr.isNotEmpty ? '?$paramsStr' : ''}',
          'headers': options != null ? options.headers : defaultHeaders,
          'method': 'GET',
          'body': {},
          'params': '',
        },
      }),
      null,
    ).then(js.allowInterop((data) {
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа  по GET $endpoint: $jsonResponseObject');
      SmartappSendBotEventResponseModel parsedResponse =
          SmartappSendBotEventResponseModel.fromJson(jsonResponseObject);
      if (parsedResponse.payload.status != 'ok') {
        AppToast.showAppToast(msg: 'Непредвиденная ошибка соединения');
        throw ('Где-то ошибка, смотри логи'); //! Заменить??????
      }
      dynamic response;
      try {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: json.decode(parsedResponse.payload.result.content),
          statusCode: parsedResponse.payload.result.code,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.content,
          statusCode: parsedResponse.payload.result.code,
        );
      }
      return response;
    }), js.allowInterop((err) {
      print('ERROR_GET: $err');
      return err;
    })));
  }

  Future<dynamic> post(String endpoint,
      {dynamic? data, Options? options}) async {
    print('POST $endpoint');

    final token =
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}';
    Map<String, dynamic> defaultHeaders = {
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': ApiConstants.env,
      'VerApp': ApiConstants.appVersion,
      'Platform': '4',
      'Authorization': token,
    };
    bool isDataRuntimeType = false;
    try {
      isDataRuntimeType =
          data.runtimeType.toString() == FormData().runtimeType.toString();
      print(data.runtimeType.toString());
      print(isDataRuntimeType);
    } catch (err) {
      print("не удалось определить тип объекта data");
      print(err);
    }

    return await promiseToFuture(sendBotEvent(
      const JsonEncoder().convert({
        'method': 'proxy_request',
        'params': {
          'url': '${ApiConstants.baseUrl}$endpoint',
          'headers': options != null ? options.headers : defaultHeaders,
          'method': 'POST',
          'body': isDataRuntimeType ? null : data,
          'params': '',
        },
      }),
      isDataRuntimeType ? data : null,
    ).then(js.allowInterop((data) {
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа  по POST $endpoint: $jsonResponseObject');
      SmartappSendBotEventResponseModel parsedResponse =
          SmartappSendBotEventResponseModel.fromJson(jsonResponseObject);
      if (parsedResponse.payload.status != 'ok') {
        AppToast.showAppToast(msg: 'Непредвиденная ошибка соединения');
        throw ('Где-то ошибка, смотри логи'); //! Заменить??????
      }
      dynamic response;
      try {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: json.decode(parsedResponse.payload.result.content),
          statusCode: parsedResponse.payload.result.code,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.content,
          statusCode: parsedResponse.payload.result.code,
        );
      }
      return response;
    }), js.allowInterop((err) {
      print('ERROR: $err');
      return err;
    })));
  }

  Future<dynamic> delete(String endpoint,
      {Map<String, dynamic>? data, Options? options}) async {
    print('DELETE $endpoint');
    final token =
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}';
    Map<String, dynamic> defaultHeaders = {
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': ApiConstants.env,
      'VerApp': ApiConstants.appVersion,
      'Platform': '4',
      'Authorization': token,
    };

    return await promiseToFuture(sendBotEvent(
      const JsonEncoder().convert({
        'method': 'proxy_request',
        'params': {
          'url': '${ApiConstants.baseUrl}$endpoint',
          'headers': options != null ? options.headers : defaultHeaders,
          'method': 'DELETE',
          'body': data,
          'params': '',
        },
      }),
      null,
    ).then(js.allowInterop((data) {
      dynamic jsonResponseObject = json.decode(data);
      print(
          '>>>> Ответ из смартаппа  по DELETE $endpoint: $jsonResponseObject');
      SmartappSendBotEventResponseModel parsedResponse =
          SmartappSendBotEventResponseModel.fromJson(jsonResponseObject);
      SmartappSendBotEventResponseModel.fromJson(jsonResponseObject);
      if (parsedResponse.payload.status != 'ok') {
        AppToast.showAppToast(msg: 'Непредвиденная ошибка соединения');
        throw ('Где-то ошибка, смотри логи'); //! Заменить??????
      }
      dynamic response;
      try {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: json.decode(parsedResponse.payload.result.content),
          statusCode: parsedResponse.payload.result.code,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.content,
          statusCode: parsedResponse.payload.result.code,
        );
      }
      return response;
    }), js.allowInterop((err) {
      print('ERROR: $err');
      return err;
    })));
  }

  Future<dynamic> put(String endpoint,
      {Map<String, dynamic>? data, Options? options}) async {
    print('PUT $endpoint');
    final token =
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}';
    Map<String, dynamic> defaultHeaders = {
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': ApiConstants.env,
      'VerApp': ApiConstants.appVersion,
      'Platform': '4', //Platform.isAndroid ? '1' : '2',
      'Authorization': token,
    };

    return await promiseToFuture(sendBotEvent(
      const JsonEncoder().convert({
        'method': 'proxy_request',
        'params': {
          'url': '${ApiConstants.baseUrl}$endpoint',
          'headers': options != null ? options.headers : defaultHeaders,
          'method': 'PUT',
          'body': data ?? '{}',
          'params': '',
        },
      }),
      data,
    ).then(js.allowInterop((data) {
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа  по PUT $endpoint: $jsonResponseObject');
      SmartappSendBotEventResponseModel parsedResponse =
          SmartappSendBotEventResponseModel.fromJson(jsonResponseObject);
      if (parsedResponse.payload.status != 'ok') {
        AppToast.showAppToast(msg: 'Непредвиденная ошибка соединения');
        throw ('Где-то ошибка, смотри логи'); //! Заменить??????
      }
      dynamic response;
      try {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: json.decode(parsedResponse.payload.result.content),
          statusCode: parsedResponse.payload.result.code,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.content,
          statusCode: parsedResponse.payload.result.code,
        );
      }
      return response;
    }), js.allowInterop((err) {
      print('ERROR: $err');
      return err;
    })));
  }

  Future<dynamic> getImage(String endpoint, {Options? options}) async {
    print('GET_IMAGE $endpoint');

    final token =
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}';
    Map<String, dynamic> defaultHeaders = {
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': ApiConstants.env,
      'VerApp': ApiConstants.appVersion,
      'Platform': '4', //Platform.isAndroid ? '1' : '2',
      'Authorization': token,
    };

    return await promiseToFuture(sendBotEvent(
      const JsonEncoder().convert({
        'method': 'get_file',
        'params': {
          'url': '${ApiConstants.baseUrl}$endpoint',
          'headers': options != null ? options.headers : defaultHeaders,
        },
      }),
      null,
    ).then(js.allowInterop((data) {
      print('>>>> Ответ из смартаппа  по GET_IMAGE $endpoint: $data');
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа кодирован в json');
      SmartappSendBotEventResponseModel parsedResponse =
          SmartappSendBotEventResponseModel.fromJson(jsonResponseObject);
      print('>>>> Ответ из смартаппа кодирован в объект');
      if (parsedResponse.payload.status != 'ok') {
        AppToast.showAppToast(msg: 'Непредвиденная ошибка соединения');
        throw ('Где-то ошибка, смотри логи'); //! Заменить??????
      }
      dynamic response;
      try {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: json.decode(parsedResponse.payload.result.content),
          statusCode: parsedResponse.payload.result.code,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.content,
          statusCode: parsedResponse.payload.result.code,
        );
      }
      print('<<<< coздан объект Response');
      print('<<<< response.data: ${response.data}');
      return response;
    }), js.allowInterop((err) {
      print('ERROR_GET: $err');
      return err;
    })));
  }

  Future<dynamic> getFile(String endpoint, String fileName,
      {Options? options}) async {
    print('GET_FILE $endpoint, $fileName');

    final token =
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}';
    Map<String, dynamic> defaultHeaders = {
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': ApiConstants.env,
      'VerApp': ApiConstants.appVersion,
      'Platform': '4', //Platform.isAndroid ? '1' : '2',
      'Authorization': token,
    };

    return await promiseToFuture(sendBotEvent(
      const JsonEncoder().convert({
        'method': 'get_file',
        'params': {
          'url': '${ApiConstants.baseUrl}$endpoint',
          'name': fileName,
          'headers': options != null ? options.headers : defaultHeaders,
        },
      }),
      null,
    ).then(js.allowInterop((data) {
      print('>>>> Ответ из смартаппа  по GET_FILE $endpoint: $data');
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа кодирован в json: $jsonResponseObject');
      SmartappSendBotEventResponseModel parsedResponse;
      try {
        parsedResponse =
            SmartappSendBotEventResponseModel.fromJson(jsonResponseObject);
        print('>>>> Ответ из смартаппа успешно кодирован в объект');
      } catch (err) {
        print('>>>> Не удалось преобразовать json в объект ((((');
        print(err);
        parsedResponse = const SmartappSendBotEventResponseModel(
          files: [],
          payload: SmartappSendBotEventPayloadModel(
              result: SmartappSendBotEventPayloadResultModel(
                content: 'error loading file',
                code: 500,
                status: 'error',
              ),
              status: ''),
          ref: 'ref',
          type: 'type',
        );
      }

      if (parsedResponse.payload.status != 'ok') {
        AppToast.showAppToast(msg: 'Непредвиденная ошибка');
        throw ('Где-то ошибка, смотри логи'); //! Заменить??????
      }
      return promiseToFuture(sendClientEvent(
        const JsonEncoder().convert({
          'method': 'open_file',
          'params': parsedResponse.files!.isNotEmpty
              ? parsedResponse.files?.first
              : 'NULL',
        }),
      ).then((arg) {
        print('ОТВЕТ ИЗ BOT_X ПО ФАЙЛАМ:');
        print(arg);
        print(json.decode(arg));
      }).catchIt((errorCallback) {
        print(errorCallback);
        return errorCallback;
      }));
    }), js.allowInterop((err) {
      print('ERROR_GET_FILE: $err');
      return err;
    })));
  }

  Future<dynamic> getStatic(String endpoint, {Options? options}) async {
    print('GET_STATIC $endpoint');

    final token =
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}';
    Map<String, dynamic> defaultHeaders = {
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': ApiConstants.env,
      'VerApp': ApiConstants.appVersion,
      'Platform': '4', //Platform.isAndroid ? '1' : '2',
      'Authorization': token,
    };

    return await promiseToFuture(sendBotEvent(
      const JsonEncoder().convert({
        'method': 'get_static',
        'params': {
          'url': '${ApiConstants.baseUrl}$endpoint',
          'headers': options != null ? options.headers : defaultHeaders,
        },
      }),
      null,
    ).then(js.allowInterop((data) {
      print('>>>> Ответ из смартаппа  по GET_STATIC $endpoint: $data');
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа кодирован в json');
      SmartappSendBotEventStaticResponseModel parsedResponse =
          SmartappSendBotEventStaticResponseModel.fromJson(jsonResponseObject);
      print('>>>> Ответ из смартаппа кодирован в объект');
      if (parsedResponse.payload.status != 'ok') {
        AppToast.showAppToast(msg: 'Непредвиденная ошибка соединения');
        throw ('Где-то ошибка, смотри логи'); //! Заменить??????
      }
      dynamic response;
      try {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: json.decode(parsedResponse.payload.result.path),
          statusCode: 200,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.path,
          statusCode: 200,
        );
      }
      return response;
    }), js.allowInterop((err) {
      print('ERROR_GET_STATIC: $err');
      return err;
    })));
  }

  Future<dynamic> postFormData(String endpoint,
      {FormData? data, Options? options}) async {
    print('POST_FORM_DATA $endpoint');

    final token =
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}';
    Map<String, dynamic> defaultHeaders = {
      'Accept': 'application/json; charset=utf-8',
      'contentType': 'multipart/form-data',
      'Project': ApiConstants.env,
      'VerApp': ApiConstants.appVersion,
      'Platform': '4', //Platform.isAndroid ? '1' : '2',
      'Authorization': token,
    };

    return await promiseToFuture(sendBotEvent(
      {
        'method': 'proxy_request',
        'params': {
          'url': '${ApiConstants.baseUrl}$endpoint',
          'headers': options != null ? options.headers : defaultHeaders,
          'method': 'POST_FORM_DATA',
          'body': {},
          'params': '',
        }
      },
      data,
    ).then(js.allowInterop((data) {
      print('>>>> Ответ из смартаппа  по $endpoint: $data');
      dynamic response;
      try {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: json.decode(data),
          statusCode: 200,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: data,
          statusCode: 200,
        );
      }
      print('<<<< coздан объект Response');
      print('<<<< response.data: ${response.data}');
      return response;
    }), js.allowInterop((err) {
      print('ERROR_GET: $err');
      return err;
    })));
  }

  static Future<String> getSmartAppToken() async {
    // const jsons = 'abcdefgh';
    //
    // final enCodedJson = utf8.encode(jsons);
    // print(enCodedJson);
    // final gZipJson = GZipEncoder().encode(enCodedJson);
    // print('1');
    // final base64Json = base64.encode(gZipJson!);
    // print('2 $base64Json');
    //
    // final intsList = utf8.encode(
    //     "b'\x1f\x8b\x08\x00\x08|\xcfc\x02\xff\xf3H\xcd\xc9\xc9W(\xcf/\xcaI\x01\x00R\x9e\xd6\x8b\x0b\x00\x00\x00'");
    // print('3 $intsList');
    // final decodegZipJson = gzip.decode(intsList);
    // print('4 ${decodegZipJson.toString()}');
    // final originalJson = utf8.decode(decodegZipJson);
    // //
    // // print(gZipJson);
    // print('5 $originalJson');
    //
    // // print('#############');
    // // final decoded_data = GZipCodec().decode(utf8.encode('response.bodyBytes'));
    // // print('%%%%%%%%%%%%%%');
    // // print(utf8.decode(decoded_data, allowMalformed: true));
    // // print('^^^^^^^^^^^^^');

    return await promiseToFuture(sendBotEvent(
      const JsonEncoder().convert({
        'method': 'get_open_id_token',
        'params': {},
      }),
      null,
    ).then(js.allowInterop((data) {
      print('>>>> Ответ из смартаппа пришел: $data');
      dynamic jsonResponseObject;
      try {
        jsonResponseObject = json.decode(data);
      } catch (err) {
        jsonResponseObject = data;
      }
      print('>>>> res: $jsonResponseObject');
      SmartappSendBotEventTokenResponseModel parsedResponse =
          SmartappSendBotEventTokenResponseModel.fromJson(jsonResponseObject);
      print('>>>> Ответ прочитан и преобразован в объект: $parsedResponse');
      String smartappToken = parsedResponse.payload.result;
      print('SUCCESS GET SMARTAPP TOKEN: $smartappToken');
      UserSecureStorage.setField(AppConstants.smartappToken, smartappToken);
      print('>>>> Токен записан в localStorage');
      return smartappToken;
    }), js.allowInterop((err) {
      print('ERROR GET SMARTAPP TOKEN: $err');
      print('>>>> Ошибка при получении токена смартапп');
      return err;
    })));
  }
}
