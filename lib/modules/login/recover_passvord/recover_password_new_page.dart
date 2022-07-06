import 'package:flutter/material.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_new_view.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class RecoverPasswordNewPage extends StatelessWidget {
  const RecoverPasswordNewPage({Key? key, required this.smsToken})
      : super(key: key);

  final String smsToken;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: RecoverPasswordNewView(smsToken: smsToken),
      appBarTitle: 'Пароль',
      isChildrenPage: true,
      bottomNavigationBar: const SizedBox(),
    );
  }
}
