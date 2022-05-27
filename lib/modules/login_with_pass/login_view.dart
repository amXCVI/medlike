import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login_with_pass/password_input.dart';
import 'package:medlike/modules/login_with_pass/phone_number_input.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/app_bar/unauth_app_bar/unauth_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const UnAuthAppBar(title: 'Заполярье'),
      body: BlocProvider(
          create: (context) => UserCubit(UserRepository()),
          child: const LoginPageWidget()),
      bottomNavigationBar: const LoginPageBottomNavigationBar(),
    );
  }
}

class LoginPageBottomNavigationBar extends StatelessWidget {
  const LoginPageBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 24),
      child: TextButton(
        onPressed: () {},
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Используя приложение, вы принимаете условия ',
            style: Theme.of(context).textTheme.bodySmall,
            children: <TextSpan>[
              TextSpan(
                  text: 'пользовательского соглашения',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.mainBrandColor)),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.authStatus == UserAuthStatuses.successAuth) {
          RouteData.of(context).router.navigateNamed(AppRoutes.main);
        }
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 0, top: 6, right: 0, bottom: 0),
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        left: 0, top: 6, right: 0, bottom: 35),
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                      ),
                      child: Lottie.asset(
                          'assets/animations/onboarding_animation.json'),
                    )),
              ]),
              state.authScreen == UserAuthScreens.inputPhone
                  ? const PhoneNumberInput()
                  : const PasswordInput(),
              state.authStatus == UserAuthStatuses.loadingAuth
                  ? const CircularProgressIndicator()
                  : const Text(''),
            ],
          ),
        );
      },
    );
  }
}
