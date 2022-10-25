import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class AppVersionChecker extends StatelessWidget {
  const AppVersionChecker({Key? key}) : super(key: key);

  void checkAppVersion(BuildContext context) async {
    String? isActualAppVersion =
        await UserSecureStorage.getField(AppConstants.isActualAppVersion);
    if (isActualAppVersion =='false') {
      context.router.replaceAll([const RequireUpdateAppRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {

    checkAppVersion(context);

    return const SizedBox();
  }
}
