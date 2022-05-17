import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/navigation/routes_names_map.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('main page'),
          Text('data', style: Theme.of(context).textTheme.bodyText1),
          TextButton(
              onPressed: () => AutoRouter.of(context).navigateNamed(AppRoutes.login),
              child: const Text('login'),
          )
        ],
      ),
    );
  }
}
