import 'package:flutter/material.dart';
import 'package:medlike/modules/login/password_page/password_bottom_navigator.dart';
import 'package:medlike/modules/login/password_page/password_view.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      child: PasswordPageWidget(),
      appBarTitle: 'Заполярье',
      bottomNavigationBar: PasswordPageBottomNavigationBar(),
    );
  }
}
