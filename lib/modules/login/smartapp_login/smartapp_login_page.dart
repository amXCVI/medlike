import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/api/smaptapp_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class SmartappLoginPage extends StatelessWidget {
  const SmartappLoginPage({Key? key, this.resolver}) : super(key: key);

  final NavigationResolver? resolver;

  @override
  Widget build(BuildContext context) {
    void getSmartappToken() {
      print('start getting smartapp token');

      /// Запрашиваем токен в Смартаппе
      SmartAppClient.getSmartAppToken().then((data) {
        /// Если токен пришел, авторизовываемся у себя через него
        print(
            'Токен из смартаппа пришел, его удалось распарсить, передан во внутреннюю авторизацию: $data');
        context
            .read<UserCubit>()
            .smartappAuth(smartappToken: data)
            .then((value) {
          if (value) {
            /// Если авторизация успешна, переходим на главную
            print(
                '!!!!!!!!!! SUCCESS AUTH WITH SMARTAPP TOKEN !!!!!!!!!!!!!!!');
            Future.delayed(const Duration(seconds: 2), () {
              context.router.replaceAll([const MainRoute()]);
            });
          } else {
            print(
                'Не удалось авторизоваться через smartapp token. Проверьте пользователя');
          }
        });
      }).catchError((onError) {
        print('ERROR: $onError');
      });
    }

    void goToLoginPage() {
      context.router.replaceAll([StartPhoneNumberRoute()]);
    }

    void goToMainPage() {
      context.router.replaceAll([const MainRoute()]);
    }

    Future<bool> getTestToken() async {
      //! Запросить токен из смартаппа
      return Future.delayed(const Duration(seconds: 2), () {
        return true;
      });
    }

    getTestToken().then((bool value) {
      if (value) {
        //! Записать все токены в localStorage
        // UserSecureStorage.setField(AppConstants.accessToken, 'value');
        // UserSecureStorage.setField(AppConstants.refreshToken, 'value');
        UserSecureStorage.setField(AppConstants.smartappToken, 'value');
        UserSecureStorage.setField(AppConstants.isAuth, 'true');
        resolver!.next(true);
        return;
      }
    }).catchError((onError) {
      // AppToast.showAppToast(
      //     msg: 'Ошибка авторизации. Не удалось получить KeyCloack токен');
    });

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          color: AppColors.mainSeparatorAlpha,
          onPressed: getSmartappToken,
          child: const Text('auth with smartapp token (sendBotEvent)'),
        ),
        const SizedBox(height: 24),
        MaterialButton(
          color: AppColors.mainSeparatorAlpha,
          onPressed: goToLoginPage,
          child: const Text('go to login page'),
        ),
        const SizedBox(height: 24),
        MaterialButton(
          color: AppColors.mainSeparatorAlpha,
          onPressed: goToMainPage,
          child: const Text('go to main page'),
        ),
      ],
    ));
  }
}
