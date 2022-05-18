import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/modules/app/bloc/user_bloc.dart';
import 'package:medlike/modules/app/repository/user_repository.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/themes/themes.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => UserRepository(),
        child: BlocProvider(
          create: (context) => UserBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          ),
          child: MaterialApp.router(
            title: 'Medlike Base App',
            theme: lightTheme,
            routerDelegate: _router.delegate(),
            routeInformationParser: _router.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
          ),
        ));
  }
}
