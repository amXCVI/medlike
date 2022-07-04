import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class PasswordPageBottomNavigationBar extends StatelessWidget {
  const PasswordPageBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 24),
      child: TextButton(
        onPressed: () {},
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Не можете войти?',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.mainBrandColor)),
        ),
      ),
    );
  }
}
