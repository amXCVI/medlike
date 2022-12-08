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
external Promise<dynamic> sendBotEvent(Object objectParams);

@JS('sendClientEvent')
external Promise<dynamic> sendClientEvent(Object objectParams);

//? {
//?    String method,
//?    Object? params,
//?    int? timeout,
//?    dynamic? files,
//?    bool? guaranteed_delivery_required,
//? }

class SmartAppClient {
  Future<dynamic> get(String endpoint, {Options? options}) async {
    print('GET $endpoint');

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

    return await promiseToFuture(sendBotEvent(const JsonEncoder().convert({
      'method': 'proxy_request',
      'params': {
        'url': '${ApiConstants.baseUrl}$endpoint',
        'headers': options != null ? options.headers : defaultHeaders,
        'method': 'GET',
        'body': {},
        'params': '',
      },
    })).then(js.allowInterop((data) {
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа  по $endpoint: $jsonResponseObject');
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
          statusCode: parsedResponse.payload.result.statusCode,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.content,
          statusCode: parsedResponse.payload.result.statusCode,
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

  Future<dynamic> post(String endpoint,
      {Map<String, dynamic>? data, Options? options}) async {
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

    return await promiseToFuture(sendBotEvent(const JsonEncoder().convert({
      'method': 'proxy_request',
      'params': {
        'url': '${ApiConstants.baseUrl}$endpoint',
        'headers': options != null ? options.headers : defaultHeaders,
        'method': 'POST',
        'body': data,
        'params': '',
      },
    })).then(js.allowInterop((data) {
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа  по $endpoint: $jsonResponseObject');
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
          statusCode: parsedResponse.payload.result.statusCode,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.content,
          statusCode: parsedResponse.payload.result.statusCode,
        );
      }
      print('<<<< coздан объект Response');
      print('<<<< response.data: ${response.data}');
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

    return await promiseToFuture(sendBotEvent(const JsonEncoder().convert({
      'method': 'proxy_request',
      'params': {
        'url': '${ApiConstants.baseUrl}$endpoint',
        'headers': options != null ? options.headers : defaultHeaders,
        'method': 'DELETE',
        'body': data,
        'params': '',
      },
    })).then(js.allowInterop((data) {
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа  по $endpoint: $jsonResponseObject');
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
          statusCode: parsedResponse.payload.result.statusCode,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.content,
          statusCode: parsedResponse.payload.result.statusCode,
        );
      }
      print('<<<< coздан объект Response');
      print('<<<< response.data: ${response.data}');
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

    return await promiseToFuture(sendBotEvent({
      'method': 'proxy_request',
      'params': {
        'url': '${ApiConstants.baseUrl}$endpoint',
        'headers': options != null ? options.headers : defaultHeaders,
        'method': 'PUT',
        'body': data,
        'params': '',
      },
    }).then(js.allowInterop((data) {
      dynamic jsonResponseObject = json.decode(data);
      print('>>>> Ответ из смартаппа  по $endpoint: $jsonResponseObject');
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
          statusCode: parsedResponse.payload.result.statusCode,
        );
      } catch (err) {
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          data: parsedResponse.payload.result.content,
          statusCode: parsedResponse.payload.result.statusCode,
        );
      }
      print('<<<< coздан объект Response');
      print('<<<< response.data: ${response.data}');
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

    return await promiseToFuture(sendBotEvent(const JsonEncoder().convert({
      'method': 'proxy_request',
      'params': {
        'url': '${ApiConstants.baseUrl}$endpoint',
        'headers': options != null ? options.headers : defaultHeaders,
        'method': 'GET_IMAGE',
        'body': {},
        'params': '',
      },
    })).then(js.allowInterop((data) {
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

    return await promiseToFuture(sendBotEvent({
      'method': 'proxy_request',
      'params': {
        'url': '${ApiConstants.baseUrl}$endpoint',
        'headers': options != null ? options.headers : defaultHeaders,
        'method': 'POST_FORM_DATA',
        'body': data,
        'params': '',
      },
    }).then(js.allowInterop((data) {
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
    return await promiseToFuture(sendBotEvent(const JsonEncoder().convert({
      'method': 'get_open_id_token',
      'params': {},
    })).then(js.allowInterop((data) {
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
