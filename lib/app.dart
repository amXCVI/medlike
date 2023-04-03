import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:medlike/data/repository/clinics_repository.dart';
import 'package:medlike/data/repository/diary_repository.dart';
import 'package:medlike/data/repository/medcard_repository.dart';
import 'package:medlike/data/repository/subscribe_repository.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/domain/app/cubit/prompt/prompt_cubit.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/modules/main_page/splash_page.dart';
import 'package:medlike/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medlike/utils/helpers/auth_check_helpers.dart';
import 'package:medlike/utils/inactivity_manager/inactivity_manager.dart';
import 'package:medlike/utils/notifications/push_notifications_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:get_it/get_it.dart';

import 'navigation/router.gr.dart';

final getIt = GetIt.instance;


class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = getIt<AppRouter>();

  final mediator = UserMediator();

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = AppointmentsCubit(AppointmentsRepository(), mediator);
    final userCubit = UserCubit(UserRepository(), mediator);

    FCMService.onMessage((message) {
      mediator.sendTo<AppointmentsCubit>(userCubit, UserMediatorEvent.pushNotification);
      mediator.sendTo<UserCubit>(appointmentCubit, UserMediatorEvent.pushNotification);
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => userCubit),
        BlocProvider(
            create: (context) => SubscribeCubit(SubscribeRepository(), mediator)),
        BlocProvider(create: (context) => ClinicsCubit(ClinicsRepository(), mediator)),
        BlocProvider(
            create: (context) => appointmentCubit),
        BlocProvider(create: (context) => MedcardCubit(MedcardRepository(), mediator)),
        BlocProvider(create: (context) => DiaryCubit(DiaryRepository(), mediator)),
        BlocProvider(create: (context) => PromptCubit()),
        BlocProvider(create: (context) => TourCubit()..fetchStatus())
      ],
      child: InactivityManager(
        child: FutureBuilder<bool>(
          future: checkIsSavedPinCode(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if(!snapshot.hasData) {
              return const SplashPage();
            }
            return MaterialApp.router(
              title: 'Medlike',
              theme: AppTheme.lightAppTheme,
              routerDelegate: AutoRouterDelegate(
                _router,
                initialRoutes: [
                  if(snapshot.data!) const CheckPinCodeRoute(),
                  if(!snapshot.data!) StartPhoneNumberRoute()
                ],
                navigatorObservers: () => [
                  FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
                  SentryNavigatorObserver()
                ],
              ),
              routeInformationParser: _router.defaultRouteParser(),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: const [Locale('en')],
            );
          }
        ),
      ),
    );
  }
}
