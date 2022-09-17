import 'package:flutter/material.dart';
import 'package:medlike/modules/login/auth_user_agreements/agreements_list.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

class FullScreenUserAgreements extends StatelessWidget {
  const FullScreenUserAgreements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isChildrenPage: true,
      actions: const [UnauthSupportButton()],
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const AgreementsList()),
      appBarTitle: 'Документы',
      bottomNavigationBar: const SizedBox(),
    );
  }
}
