import 'package:flutter/material.dart';
import 'package:medlike/modules/login/recover_passvord/sms_code_input.dart';
import 'package:medlike/widgets/default_login_animation/default_login_animation.dart';

class RecoverPasswordSmsView extends StatelessWidget {
  const RecoverPasswordSmsView({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DefaultLoginAnimation(),
          SmsCodeInput(phoneNumber: phoneNumber),
        ],
      ),
    );
  }
}
