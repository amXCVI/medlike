import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/themes.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserRepository()),
      child: MaterialApp.router(
        title: 'Medlike Base App',
        theme: AppTheme.lightAppTheme,
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
