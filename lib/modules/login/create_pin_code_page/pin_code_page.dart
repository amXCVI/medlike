import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/modules/login/create_pin_code_page/initial_pin_code.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

class CreatePinCodePage extends StatelessWidget {
  const CreatePinCodePage({Key? key, this.noUsedBiometric}) : super(key: key);

  final bool? noUsedBiometric;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        MediaQuery.of(context).size.height <= AppConstants.mdScreenHeight;

    return DefaultScaffold(
      child: InitialPinCode(noUsedBiometric: noUsedBiometric),
      appBarTitle: 'Пин-код',
      actions: const [UnauthSupportButton()],
      isChildrenPage: true,
      bottomNavigationBar: SizedBox(
        height: isSmallScreen ? 20 : 0,
      ),
    );
  }
}
