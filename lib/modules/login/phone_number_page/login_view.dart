import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/phone_number_page/phone_number_input.dart';
import 'package:medlike/widgets/default_login_animation/default_login_animation.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DefaultLoginAnimation(),
              PhoneNumberInput(),
              // MaterialButton(onPressed: () => {
              //   context.read<UserCubit>().signIn('79090000011', 'Qwerty11@')
              // },
              //   child: const Text('Default login'),
              // )
            ],
          ),
        );
      },
    );
  }
}
