import 'package:flutter/material.dart';
import 'package:medlike/modules/login/start_phone_number_page/phone_number_input.dart';
import 'package:medlike/widgets/default_login_animation/default_login_animation.dart';

class StartPhoneNumberView extends StatelessWidget {
  const StartPhoneNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          DefaultLoginAnimation(),
          PhoneNumberInput(),
        ],
      ),
    );
  }
}
