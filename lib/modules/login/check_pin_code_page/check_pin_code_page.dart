import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/modules/login/check_pin_code_page/check_pin_code.dart';
import 'package:medlike/modules/login/password_page/password_bottom_navigator.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class CheckPinCodePage extends StatelessWidget {
  const CheckPinCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onPressedAppLogo() {
      context.router.navigateNamed(AppRoutes.loginPhone);
    }

    return DefaultScaffold(
      child: const CheckPinCode(),
      appBarTitle: 'Заполярье',
      bottomNavigationBar: const PasswordPageBottomNavigationBar(),
      onPressedAppLogo: _onPressedAppLogo,
    );
  }
}
