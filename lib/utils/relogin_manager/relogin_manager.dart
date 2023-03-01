import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';

class ReloginManager extends StatelessWidget {
  const ReloginManager({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: ((previous, current) => 
        previous.tokenTryCount != current.tokenTryCount
      ),
      listener: (context, state) {
        print('######## ReloginManager ##########');
        print('######## Кол-во предыдущих попыток: ${state.tokenTryCount} ###########');
        if(state.tokenTryCount > 1) {
          context.router.replaceAll([const WrongLoginRoute()]);
        }
      },
      child: const SizedBox()
    );
  }
}
