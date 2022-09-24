import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/modules/login/auth_user_agreements/checker_screen_user_agreements.dart';
import 'package:medlike/modules/login/auth_user_agreements/full_screen_user_agreements.dart';
import 'package:medlike/navigation/router.gr.dart';

class AuthUserAgreementsPage extends StatelessWidget {
  const AuthUserAgreementsPage({Key? key, this.isFullScreen = false})
      : super(key: key);

  /// Показать документы на весь экран?
  /// Если переход со страницы логина, а не для подписи
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    void closePage() {
      context.router.replaceAll([StartPhoneNumberRoute()]);
    }

    return WillPopScope(
        onWillPop: () async {
          closePage();
          return false;
        },
        child: isFullScreen
            ? const FullScreenUserAgreements()
            : const CheckerScreenUserAgreements());
  }
}
