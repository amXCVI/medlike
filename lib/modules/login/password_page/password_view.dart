import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/password_page/password_input.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_login_animation/default_login_animation.dart';

class PasswordPageWidget extends StatelessWidget {
  const PasswordPageWidget({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.authStatus == UserAuthStatuses.successAuth) {
          RouteData.of(context)
              .router
              .navigateNamed(AppRoutes.loginPinCodeCreate);
        }

        return SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DefaultLoginAnimation(),
              PasswordInput(phoneNumber: phoneNumber),
            ],
          ),
        );
      },
    );
  }
}
