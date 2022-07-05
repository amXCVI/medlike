import 'package:flutter/material.dart';
import 'package:medlike/modules/login/pin_code_page/initial_pin_code.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class PinCodePage extends StatelessWidget {
  const PinCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      child: InitialPinCode(),
      appBarTitle: 'Пин-код',
      isChildrenPage: true,
      bottomNavigationBar: SizedBox(),
    );
  }
}
