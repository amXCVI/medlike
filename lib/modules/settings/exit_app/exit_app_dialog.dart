import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/dividers/default_divider.dart';

class ExitAppDialog extends StatelessWidget {
  const ExitAppDialog({Key? key, this.goToLoginPage = true}) : super(key: key);

  /// Определяет, выходить из приложения на страницу лигина или закрывать приложение
  final bool goToLoginPage;

  @override
  Widget build(BuildContext context) {
    void confirmSignOut() {
      if (goToLoginPage) {
        context.read<UserCubit>().forceLogout();
        context.router.replaceAll([StartPhoneNumberRoute()]);
      } else {
        context.read<UserCubit>().signOut();
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
      }
    }

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      actionsAlignment: MainAxisAlignment.spaceAround,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Text(
        'Вы уверены, что хотите выйти из приложения?',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(height: 24),
          DefaultDivider(),
        ],
      ),
      actions: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Text(
              'Отмена'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.mainText),
            ),
          ),
        ),
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return InkWell(
              onTap: confirmSignOut,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
                child: Text(
                  'Выйти'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.mainBrandColor),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
