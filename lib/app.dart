import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:medlike/data/repository/clinics_repository.dart';
import 'package:medlike/data/repository/subscribe_repository.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/themes.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(UserRepository())),
        BlocProvider(
            create: (context) => SubscribeCubit(SubscribeRepository())),
        BlocProvider(create: (context) => ClinicsCubit(ClinicsRepository())),
        BlocProvider(
            create: (context) => AppointmentsCubit(AppointmentsRepository())),
      ],
      child: StyledToast(
        locale: const Locale('ru', 'RU'),
        child: MaterialApp.router(
          title: 'Medlike Base App',
          theme: AppTheme.lightAppTheme,
          routerDelegate: _router.delegate(),
          routeInformationParser: _router.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
