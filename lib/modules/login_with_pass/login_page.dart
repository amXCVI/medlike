import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('login page'),),
      body: Center(
        child: Column(
          children: [
            Text('login page', style: Theme.of(context).textTheme.bodyText2,),
            TextButton(onPressed: () => context.router.navigateBack(), child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
