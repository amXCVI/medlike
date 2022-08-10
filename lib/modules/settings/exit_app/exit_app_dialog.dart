import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/dividers/default_divider.dart';

class ExitAppDialog extends StatelessWidget {
  const ExitAppDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void confirmSignOut() {
      context.read<UserCubit>().signOut();
      context.router.pushNamed(AppRoutes.loginPhone);
    }

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      actionsAlignment: MainAxisAlignment.spaceAround,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: const Text(
        'Вы уверены, что хотите выйти из приложения?',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(height: 24),
          DefaultDivider(),
        ],
      ),
      actions: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Text(
              'Отмена'.toUpperCase(),
            ),
          ),
        ),
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return InkWell(
              onTap: confirmSignOut,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
                child: Text(
                  'Выйти'.toUpperCase(),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}