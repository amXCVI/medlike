import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/modules/login/password_page/password_bottom_navigator.dart';
import 'package:medlike/modules/login/password_page/password_view.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.router.replaceAll([StartPhoneNumberRoute()]);
        return false;
      },
      child: DefaultScaffold(
        child: PasswordPageWidget(phoneNumber: phoneNumber),
        appBarTitle: 'Заполярье',
        onPressedAppLogo: () {
          context.router.replaceAll([StartPhoneNumberRoute()]);
        },
        bottomNavigationBar:
            PasswordPageBottomNavigationBar(phoneNumber: phoneNumber),
      ),
    );
  }
}
