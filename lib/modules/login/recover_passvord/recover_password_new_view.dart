import 'package:flutter/material.dart';
import 'package:medlike/modules/login/recover_passvord/new_password_input.dart';
import 'package:medlike/widgets/default_login_animation/default_login_animation.dart';

class RecoverPasswordNewView extends StatelessWidget {
  const RecoverPasswordNewView({
    Key? key, 
    required this.smsToken,
    required this.phoneNumberFromState,
    required this.onAuth,
  }) : super(key: key);

  final String smsToken;
  final String phoneNumberFromState;
  final void Function({required String password}) onAuth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DefaultLoginAnimation(),
          NewPasswordInput(
            token: smsToken,
            onAuth: onAuth,
            phoneNumberFromState: phoneNumberFromState,
          ),
        ],
      ),
    );
  }
}
