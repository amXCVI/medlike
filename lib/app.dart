import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/guards.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medlike/utils/inactivity_manager/inactivity_manager.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = AppRouter(
    checkIsAuthUser: CheckIsAuthUser(),
    checkIsSavedPinCode: CheckIsSavedPinCode(),
  );

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(UserRepository())),
        BlocProvider(
            create: (context) => SubscribeCubit(SubscribeRepository())),
        BlocProvider(create: (context) => ClinicsCubit(ClinicsRepository())),
        BlocProvider(
            create: (context) => AppointmentsCubit(AppointmentsRepository())),
        BlocProvider(create: (context) => MedcardCubit(MedcardRepository())),
        BlocProvider(create: (context) => DiaryCubit(DiaryRepository())),
      ],
      child: InactivityManager(
        child: MaterialApp.router(
          title: 'Medlike',
          theme: AppTheme.lightAppTheme,
          routerDelegate: _router.delegate(),
          routeInformationParser: _router.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en')
          ],
        ),
      ),
    );
  }
}
