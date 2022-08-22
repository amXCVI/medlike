import 'package:flutter/material.dart';
import 'package:medlike/modules/login/create_pin_code_page/initial_pin_code.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

class CreatePinCodePage extends StatelessWidget {
  const CreatePinCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      child: InitialPinCode(),
      appBarTitle: 'Пин-код',
      actions: [UnauthSupportButton()],
      isChildrenPage: true,
      bottomNavigationBar: SizedBox(),
    );
  }
}
