import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/utils/api/smaptapp_client.dart';

Future<bool> smartappAuth(String data, BuildContext context) async {
  return await context.read<UserCubit>().smartappAuth(smartappToken: data);
}

Future<bool> getSmartappTokenHelper(BuildContext context) async {
  print('start getting smartapp token in helper');

  /// Запрашиваем токен в Смартаппе
  return SmartAppClient.getSmartAppToken().then((data) async {
    /// Если токен пришел, авторизовываемся у себя через него
    print(
        'Токен из смартаппа пришел, его удалось распарсить, передан во внутреннюю авторизацию: $data');
    return await smartappAuth(data, context).then((value) async {
      if (value) {
        /// Если авторизация успешна, переходим далее
        print(
            '!!!!!!!!!! SUCCESS AUTH WITH SMARTAPP TOKEN !!!!!!!!!!!!!!!');
        return true;
      } else {
        print(
            '!!!!!!!!!! ERROR AUTH WITH SMARTAPP TOKEN !!!!!!!!!!!!!!!');
        return false;
      }
    });
  }).catchError((onError) {
    print('ERROR: $onError');
    return false;
  });
}
