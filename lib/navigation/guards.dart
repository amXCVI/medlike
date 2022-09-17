import 'package:auto_route/auto_route.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class CheckIsAuthUser extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token =
        '${await UserSecureStorage.getField(AppConstants.accessToken)}';
    final isSavedPinCode =
        '${await UserSecureStorage.getField(AppConstants.isSavedPinCodeForAuth)}' ==
            'true';
    final isAuth =
        '${await UserSecureStorage.getField(AppConstants.isAuth)}' == 'true';

    /// Должен быть токен, он не пустой, и пин-код для быстрого входа в приложение сохранен
    if (token != 'null' &&
        token.toString().isNotEmpty &&
        isAuth &&
        isSavedPinCode) {
      resolver.next(true);
    } else {
      router.navigateNamed(AppRoutes.loginPinCodeCheck);
    }
  }
}

class CheckIsSavedPinCode extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isSavedPinCode =
        '${await UserSecureStorage.getField(AppConstants.isSavedPinCodeForAuth)}' ==
            'true';
    final token =
        '${await UserSecureStorage.getField(AppConstants.accessToken)}';

    if (token != 'null' && token.toString().isNotEmpty && isSavedPinCode) {
      resolver.next(true);
    } else {
      router.navigateNamed(AppRoutes.loginPhone);
    }
  }
}
