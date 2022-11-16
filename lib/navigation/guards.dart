import 'package:auto_route/auto_route.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

/// Авторизован ли пользователь в смартаппе
/// (токен смартаппа)
class CheckIsAuthSmartappUser extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token =
        '${await UserSecureStorage.getField(AppConstants.accessToken)}';
    final smartappToken =
        '${await UserSecureStorage.getField(AppConstants.smartappToken)}';
    final isAuth =
        '${await UserSecureStorage.getField(AppConstants.isAuth)}' == 'true';

    /// Должен быть токен, он не пустой, и то же самое для смартапп-токена
    if (token != 'null' &&
        token.toString().isNotEmpty &&
        smartappToken != 'null' &&
        smartappToken.toString().isNotEmpty &&
        isAuth) {
      resolver.next(true);
    } else {
      router.navigate(SmartappLoginRoute(resolver: resolver));
    }
  }
}

class CheckIsAuthUser extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token =
        '${await UserSecureStorage.getField(AppConstants.accessToken)}';
    final isAuth =
        '${await UserSecureStorage.getField(AppConstants.isAuth)}' == 'true';

    /// Должен быть токен, он не пустой, и пин-код для быстрого входа в приложение сохранен
    if (token != 'null' &&
        token.toString().isNotEmpty &&
        isAuth) {
      resolver.next(true);
    } else {
      router.navigateNamed(AppRoutes.smartappLoginPage);
    }
  }
}

class CheckIsSavedPinCode extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token =
        '${await UserSecureStorage.getField(AppConstants.accessToken)}';

    if (token != 'null' && token.toString().isNotEmpty) {
      resolver.next(true);
    } else {
      router.navigateNamed(AppRoutes.smartappLoginPage);
    }
  }
}
