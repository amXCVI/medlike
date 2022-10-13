import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';

class PasswordPageBottomNavigationBar extends StatelessWidget {
  const PasswordPageBottomNavigationBar({Key? key, this.phoneNumber})
      : super(key: key);

  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    void _handleTapCannotLogin() {
      context.read<UserCubit>().forceLogout();
      if (phoneNumber != null) {
        context.router.push(RecoverPasswordSmsRoute(phoneNumber: phoneNumber!));
      } else {
        context.router.push(StartPhoneNumberRoute());
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 24),
      child: TextButton(
        onPressed: _handleTapCannotLogin,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Не можете войти?',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.mainBrandColor)),
        ),
      ),
    );
  }
}
