import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/navigation/router.dart';

class UnauthSupportButton extends StatelessWidget {
  const UnauthSupportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleTapOnSupport() {
      context.router.push(const UnauthSupportRoute());
    }

    return IconButton(
        onPressed: _handleTapOnSupport,
        icon: SvgPicture.asset('assets/icons/app_bar/unauth_support.svg'));
  }
}
