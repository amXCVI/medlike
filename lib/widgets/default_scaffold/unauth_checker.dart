import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/utils/helpers/project_determiner.dart';

class UnAuthChecker extends StatelessWidget {
  const UnAuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO Проверка не работает для web проектов
    if (ProjectDeterminer.getProjectType() == Projects.WEB) {
      return const SizedBox();
    }
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
