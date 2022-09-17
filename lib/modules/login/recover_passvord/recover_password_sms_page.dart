import 'package:flutter/material.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_sms_view.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

class RecoverPasswordSmsPage extends StatelessWidget {
  const RecoverPasswordSmsPage({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: RecoverPasswordSmsView(phoneNumber: phoneNumber),
      appBarTitle: 'SMS-код',
      actions: const [UnauthSupportButton()],
      isChildrenPage: true,
      bottomNavigationBar: const SizedBox(),
    );
  }
}
