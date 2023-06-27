import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/api/smaptapp_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';

class SmartappLoginPage extends StatefulWidget {
  const SmartappLoginPage({Key? key, this.resolver}) : super(key: key);

  final NavigationResolver? resolver;

  @override
  State<SmartappLoginPage> createState() => _SmartappLoginPageState();
}

class _SmartappLoginPageState extends State<SmartappLoginPage> {
  @override
  Widget build(BuildContext context) {
    Future<bool> smartappAuth(String data) async {
      return await context.read<UserCubit>().smartappAuth(smartappToken: data);
    }

    void saveSmartappToken() {
      context.read<UserCubit>().saveSmartappToken();
    }

    void getSmartappToken() async {
      print('start getting smartapp token');

      /// Запрашиваем токен в Смартаппе
      SmartAppClient.getSmartAppToken().then((data) async {
        /// Если токен пришел, проверяем изменился ли он
        /// Если да, авторизовываемся у себя через него
        final savedToken = await UserSecureStorage.getField(AppConstants.smartappToken);
        print(
            'Токен из смартаппа пришел, его удалось распарсить, передан во внутреннюю авторизацию: $data');

        if(savedToken == data && mounted) {
          print('Сохранненый смартапп-токен совпадает');
          print('Реавторизация не требуется');
          saveSmartappToken();

          context.router.replaceAll([const MainRoute()]);
          return;
        }    
        await smartappAuth(data).then((value) async {
          if (value) {
            /// Если авторизация успешна, переходим далее
            print(
                '!!!!!!!!!! SUCCESS AUTH WITH SMARTAPP TOKEN !!!!!!!!!!!!!!!');
            if (widget.resolver != null) {
              widget.resolver!.next(true);
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
                if (widget.resolver != null) {
                  widget.resolver!.next(true);
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
        getSmartappToken();
      } else {
        context.router.replaceAll([const MainRoute()]);
      }
    });

    return Center(
      child: GestureDetector(
        onDoubleTap: getSmartappToken,
        child: const SizedBox(),
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
