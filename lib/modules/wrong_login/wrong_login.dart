import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';
import 'package:medlike/widgets/not_found_data/wrong_list_widget.dart';

class WrongLoginPage extends StatelessWidget {
  const WrongLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void forceLoginAttempt() async {
      if(await context.read<UserCubit>().forceLogout(
        isRelogin: true
      )) {
        context.read<UserCubit>().resetTokenTryCount();
        context.router.replaceAll([const MainRoute()]);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: SizedBox(
          width: 275,
          child: WrongListWidget(
            imgPath: 'assets/images/wrong_login.png',
            title: 'Не удалось авторизоваться',
            label:
                'Если вы не проходили регистрацию в сервисе, обратитесь в клинику',
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: PrimaryButton(
            label: Text(
              'Обновить'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              forceLoginAttempt();
            }),
      ),
    );
  }
}
