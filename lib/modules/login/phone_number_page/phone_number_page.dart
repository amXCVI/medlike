import 'package:flutter/material.dart';
import 'package:medlike/modules/login/phone_number_page/login_view.dart';
import 'package:medlike/modules/login/phone_number_page/phone_number_bottom_navigator.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      child: LoginPageWidget(),
      appBarTitle: 'Заполярье',
      bottomNavigationBar: LoginPageBottomNavigationBar(),
    );
  }
}
