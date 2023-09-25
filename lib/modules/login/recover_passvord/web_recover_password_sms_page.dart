import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_sms_view.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/default_scaffold/web_auth_pages_body_container.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

@RoutePage()
class WebRecoverPasswordSmsPage extends StatelessWidget {
  const WebRecoverPasswordSmsPage({
    Key? key,
    required this.phoneNumber,
    required this.timerEnd,
  }) : super(key: key);

  final String phoneNumber;
  final DateTime? timerEnd;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isAuth: false,
      appBarTitle: 'SMS-код',
      actions: const [UnauthSupportButton()],
      isChildrenPage: true,
      bottomNavigationBar: const SizedBox(),
      child: WebAuthPagesBodyContainer(
        child: RecoverPasswordSmsView(
          phoneNumber: phoneNumber,
          timerEnd: timerEnd,
        ),
      ),
    );
  }
}
