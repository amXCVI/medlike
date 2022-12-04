import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
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
import 'package:medlike/navigation/guards.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medlike/utils/api/smaptapp_client.dart';
import 'package:medlike/utils/inactivity_manager/inactivity_manager.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = AppRouter(
    checkIsAuthUser: CheckIsAuthUser(),
    checkIsSavedPinCode: CheckIsSavedPinCode(),
  );

  final mediator = UserMediator();

  @override
  Widget build(BuildContext context) {
    final appointmentCubit =
        AppointmentsCubit(AppointmentsRepository(), mediator);
    final userCubit = UserCubit(UserRepository(), mediator);

    try {
      SmartAppClient.getSmartAppToken();
    } catch (err) {
      rethrow;
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => userCubit),
        BlocProvider(
            create: (context) => UserCubit(UserRepository(), mediator)),
        BlocProvider(
            create: (context) =>
                SubscribeCubit(SubscribeRepository(), mediator)),
        BlocProvider(
            create: (context) => ClinicsCubit(ClinicsRepository(), mediator)),
        BlocProvider(
            create: (context) =>
                AppointmentsCubit(AppointmentsRepository(), mediator)),
        BlocProvider(create: (context) => appointmentCubit),
        BlocProvider(
            create: (context) => MedcardCubit(MedcardRepository(), mediator)),
        BlocProvider(
            create: (context) => DiaryCubit(DiaryRepository(), mediator)),
        BlocProvider(
            create: (context) => DiaryCubit(DiaryRepository(), mediator)),
        BlocProvider(create: (context) => PromptCubit()),
        BlocProvider(create: (context) => TourCubit()..fetchStatus())
      ],
      child: InactivityManager(
        child: MaterialApp.router(
          title: 'Medlike',
          theme: AppTheme.lightAppTheme,
          routerDelegate: AutoRouterDelegate(
            _router,
            navigatorObservers: () => [],
          ),
          routeInformationParser: _router.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
        ),
      ),
    );
  }
}
