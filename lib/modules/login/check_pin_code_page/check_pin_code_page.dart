import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:medlike/modules/login/check_pin_code_page/check_pin_code.dart';
import 'package:medlike/modules/login/password_page/password_bottom_navigator.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

@RoutePage()
class CheckPinCodePage extends StatelessWidget {
  const CheckPinCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onPressedAppLogo() {
      SystemNavigator.pop();
    }

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: DefaultScaffold(
        child: const CheckPinCode(),
        appBarTitle: AppConstants.appName,
        actions: const [UnauthSupportButton()],
        bottomNavigationBar: const PasswordPageBottomNavigationBar(),
        onPressedAppLogo: _onPressedAppLogo,
      ),
    );
  }
}
