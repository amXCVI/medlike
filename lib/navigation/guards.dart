import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/helpers/resume_helper.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

final getIt = GetIt.instance;

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
    final isLogged = token != 'null' &&
      token.toString().isNotEmpty &&
      isAuth &&
      isSavedPinCode;

    final isBlocked = await ResumeHelper.isAppBlocked();
    
    if (isLogged && !isBlocked) {
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

abstract class CheckIsOneClinic extends AutoRouteGuard {
  void redirect(ClinicModel clinic, StackRouter router);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final context = router.navigatorKey.currentContext;
    final clinicsList = context?.read<ClinicsCubit>().state.clinicsList;

    if (clinicsList?.length == 1) {
      redirect(clinicsList![0], router);
    } else {
      resolver.next(true);
    }
  }
}

abstract class CheckIsOneProfile extends AutoRouteGuard {
  void redirect(UserProfile user, StackRouter router);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final context = router.navigatorKey.currentContext;
    final usersList = context?.read<UserCubit>().state.userProfiles;

    if(usersList != null && usersList.length == 1) {
      context?.read<UserCubit>().setSelectedUserId(usersList[0].id);
      redirect(usersList[0], router);
    } else {
      resolver.next(true);
    }
  }
}

abstract class CheckIsOneAvaliableClinic extends AutoRouteGuard {
  void redirect(AvailableClinic clinic, String userId, StackRouter router);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final context = router.navigatorKey.currentContext;
    final clinicsList = context?.read<SubscribeCubit>().state.availableClinicsList;
    final userId = context?.read<UserCubit>().state.selectedUserId;

    if(clinicsList != null && userId != null && clinicsList.length == 1) {
      final building = clinicsList[0];
      context?.read<SubscribeCubit>().setSelectedBuilding(building);
      redirect(building, userId, router);
    } else {
      resolver.next(true);
    }
  }
}

class CheckIsOneClinicForSubscribe extends CheckIsOneAvaliableClinic {
  @override
  void redirect(AvailableClinic clinic, String userId, StackRouter router) {
    router.push(ServicesListRoute(
      clinicId: clinic.id,
      buildingId: clinic.buildingId,
      userId: userId
    ));
  }
}

class CheckIsOneClinicForPrice extends CheckIsOneClinic {
  @override
  void redirect(ClinicModel clinic, StackRouter router) {
    router.push(PriceRoute(clinicId: clinic.id));
  }
}

class CheckIsOneClinicForDetails extends CheckIsOneClinic {
  @override
  void redirect(ClinicModel clinic, StackRouter router) {
    router
      .push(ClinicDetailWithBottomSheetsRoute(selectedClinic: clinic));
  }
}

class CheckIsOneClinicForMain extends CheckIsOneClinic {
  @override
  void redirect(ClinicModel clinic, StackRouter router) {
    router
      .push(const MainRoute());
  }
}

class CheckIsOneProfileForSubscribe extends CheckIsOneProfile {
  @override
  void redirect(UserProfile user, StackRouter router) {
    router.push(ClinicsListRoute(
      userId: user.id, 
      isChildrenPage: false
    ));
  }
}

class CheckIsOneProfileForHealth extends CheckIsOneProfile {
  @override
  void redirect(UserProfile user, StackRouter router) {

    router
      .push(CardsRoute(
        isChildrenPage: false,
        needToGet: true 
      ));
  }
}

class CheckIsOneProfileForMain extends CheckIsOneProfile {
  @override
  void redirect(UserProfile user, StackRouter router) {

    router
      .push(const MainRoute());
  }
}
