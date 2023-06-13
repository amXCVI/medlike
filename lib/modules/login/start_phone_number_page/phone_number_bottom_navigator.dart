import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';

class LoginPageBottomNavigationBar extends StatelessWidget {
  const LoginPageBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleTapOnAgreements() {
      context.router.push(AuthUserAgreementsRoute(isFullScreen: true));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 24),
      child: TextButton(
        onPressed: handleTapOnAgreements,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Используя приложение, вы принимаете условия ',
            style: Theme.of(context).textTheme.bodySmall,
            children: <TextSpan>[
              TextSpan(
                  text: 'пользовательского соглашения',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.mainBrandColor)),
            ],
          ),
        ),
      ),
    );
  }
}
