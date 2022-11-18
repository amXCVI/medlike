@JS()
library main;

import 'dart:convert';

import 'package:js/js.dart';
import 'dart:js_util';
import 'package:dio/dio.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/smartapp_models/smartapp_models.dart';

import 'dart:js' as js;

import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

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
    // await testJS().then(allowInterop((arg) {
    //   print('@@@@@@@@@$arg');
    // })).catchIt((err) {
    //   print('########$err');
    // });

    // var result = await sendBotEvent({
    //   'method': 'get_$endpoint',
    //   'params': jsonEncode(params),
    // }).then(allowInterop(arg) {
    //     print('@@@@@@@@@');
    //   }).catchIt((err) {
    //     print('########');
    //   });
    // print(result);

    return await promiseToFuture(sendBotEvent({
      'method': 'get_$endpoint',
      'params': {
        'url': endpoint,
        'method': 'get',
        'options': options,
      },
    }).then(js.allowInterop((data) {
      print('SUCCESS: $data');
      return data;
    }), js.allowInterop((err) {
      print('ERROR: $err');
      return err;
    })));
  }

  Future<dynamic> post(String endpoint,
      {Object? data, Options? options}) async {
    return await promiseToFuture(sendBotEvent({
      'method': 'post_$endpoint',
      'params': {
        'url': endpoint,
        'method': 'post',
        'options': options,
        'data': data,
      },
    }).then(js.allowInterop((data) {
      return data;
    }), js.allowInterop((err) {
      return err;
    })));
  }

  Future<dynamic> delete(String endpoint,
      {Object? data, Options? options}) async {
    return await promiseToFuture(sendBotEvent({
      'method': 'delete_$endpoint',
      'params': {
        'url': endpoint,
        'method': 'delete',
        'options': options,
        'data': data,
      },
    }).then(js.allowInterop((data) {
      return data;
    }), js.allowInterop((err) {
      return err;
    })));
  }

  Future<dynamic> put(String endpoint, {Object? data, Options? options}) async {
    return await promiseToFuture(sendBotEvent({
      'method': 'put_$endpoint',
      'params': {
        'url': endpoint,
        'method': 'put',
        'options': options,
        'data': data,
      },
    }).then(js.allowInterop((data) {
      return data;
    }), js.allowInterop((err) {
      return err;
    })));
  }

  static Future<dynamic> getSmartAppToken() async {
    return await promiseToFuture(sendBotEvent(const JsonEncoder().convert({
      'method': 'get_open_id_token',
      'params': {},
    })).then(js.allowInterop((data) {
      print('>>>> Ответ из смартаппа пришел');
      String smartappToken =
          SmartappSendBotEventResponseModel.fromJson(data).payload.result;
      print('>>>> Ответ прочитан и преобразован в объект');
      print('SUCCESS GET SMARTAPP TOKEN: $smartappToken');

      UserSecureStorage.setField(
          AppConstants.smartappToken, smartappToken);
      print('>>>> Токен записан в localStorage');
      return smartappToken;
    }), js.allowInterop((err) {
      print('ERROR GET SMARTAPP TOKEN: $err');
      print('>>>> Ошибка при получении токена смартапп');
      return err;
    })));
  }
}
