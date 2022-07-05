import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/phone_number_page/phone_number_input.dart';
import 'package:medlike/navigation/routes_names_map.dart';

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
              // ]),
              const PhoneNumberInput(),
              MaterialButton(onPressed: () => {
                context.read<UserCubit>().signIn('79090000011', 'Qwerty11@')
              },
                child: const Text('Default login'),
              )
            ],
          ),
        );
      },
    );
  }
}
