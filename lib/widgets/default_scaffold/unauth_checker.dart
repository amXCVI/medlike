import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.dart';

class UnAuthChecker extends StatelessWidget {
  const UnAuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.authStatus == UserAuthStatuses.unAuth &&
            !context.router.current.path.contains('login')) {
          context.router.replaceAll([const CheckPinCodeRoute()]);
        }
        return Container();
      },
    );
  }
}
