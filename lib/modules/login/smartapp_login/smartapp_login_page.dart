import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/api/smaptapp_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';

class SmartappLoginPage extends StatelessWidget {
  const SmartappLoginPage({Key? key, this.resolver}) : super(key: key);

  final NavigationResolver? resolver;

  @override
  Widget build(BuildContext context) {
    Future<bool> smartappAuth(String data) async {
      return await context.read<UserCubit>().smartappAuth(smartappToken: data);
    }

    void getSmartappTokenForce() async {
      print('start getting smartapp token');

      /// Запрашиваем токен в Смартаппе
      SmartAppClient.getSmartAppToken().then((data) async {
        /// Если токен пришел, авторизовываемся у себя через него
        print(
            'Токен из смартаппа пришел, его удалось распарсить, передан во внутреннюю авторизацию: $data');
        await smartappAuth(data).then((value) async {
          if (value) {
            /// Если авторизация успешна, переходим далее
            print(
                '!!!!!!!!!! SUCCESS AUTH WITH SMARTAPP TOKEN !!!!!!!!!!!!!!!');
            if (resolver != null) {
              resolver!.next(true);
              return;
            } else {
              context.router.replaceAll([const MainRoute()]);
            }
          } else {
            print('Не удалось авторизоваться через smartapp token');
            print('Повторная попытка');
            await smartappAuth(data).then((value) {
              if (value) {
                print('Повторная попытка успешна!!!');
                if (resolver != null) {
                  resolver!.next(true);
                  return;
                } else {
                  context.router.replaceAll([const MainRoute()]);
                }
              } else {
                /// Тут кидаем на ошибку
                print('Повторная попытка тоже не удалась ((');
                context.router.replaceAll([const WrongLoginRoute()]);
              }
            });
          }
        });
      }).catchError((onError) {
        print('ERROR: $onError');
      });
    }

    Future<bool> getSmartappToken() async {
      print('start getting smartapp token');

      /// Запрашиваем токен в Смартаппе
      return await SmartAppClient.getSmartAppToken().then((data) async {
        /// Если токен пришел, авторизовываемся у себя через него
        print(
            'Токен из смартаппа пришел, его удалось распарсить, передан во внутреннюю авторизацию: $data');
        return await context
            .read<UserCubit>()
            .smartappAuth(smartappToken: data)
            .then((value) {
          if (value) {
            /// Если авторизация успешна, переходим на главную
            print(
                '!!!!!!!!!! SUCCESS AUTH WITH SMARTAPP TOKEN !!!!!!!!!!!!!!!');
            return true;
          } else {
            print('Не удалось авторизоваться через smartapp token.');
            return false;
          }
        });
      }).catchError((onError) {
        print('ERROR: $onError');
        return false;
      });
    }

    void goToLoginPage() {
      UserSecureStorage.setField(AppConstants.smartappToken, 'smartappToken');
      context.router.replaceAll([StartPhoneNumberRoute()]);
    }

    void goToMainPage() {
      context.router.replaceAll([const MainRoute()]);
    }

    Future<bool> getAuthStatus() async {
       final token =
        '${await UserSecureStorage.getField(AppConstants.accessToken)}';
    final isAuth =
        '${await UserSecureStorage.getField(AppConstants.isAuth)}' == 'true';

    /// Должен быть токен, он не пустой, и то же самое для смартапп-токена
    return token != 'null' &&
        token.toString().isNotEmpty &&
        isAuth;
    }

    /// Вызываем в builder что не есть хорошо!
    getAuthStatus().then((isAuth) {
      if (!isAuth) {
        getSmartappTokenForce();
      } else {
        context.router.replaceAll([const MainRoute()]);
      }
    });

    return Center(
      child: GestureDetector(
        onDoubleTap: getSmartappTokenForce,
        child: const CircularLoader(
          radius: 50,
        ),
      ),

      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     MaterialButton(
      //       color: AppColors.mainSeparatorAlpha,
      //       onPressed: getSmartappTokenForce,
      //       child: const Text('auth with smartapp token (sendBotEvent)'),
      //     ),
      //     const SizedBox(height: 24),
      //     MaterialButton(
      //       color: AppColors.mainSeparatorAlpha,
      //       onPressed: goToLoginPage,
      //       child: const Text('go to login page'),
      //     ),
      //     const SizedBox(height: 24),
      //     MaterialButton(
      //       color: AppColors.mainSeparatorAlpha,
      //       onPressed: goToMainPage,
      //       child: const Text('go to main page'),
      //     ),
      //   ],
      // ),
    );
  }
}
