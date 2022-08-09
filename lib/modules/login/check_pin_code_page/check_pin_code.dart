import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/pin_code/pin_code_view.dart';
import 'package:medlike/themes/colors.dart';

class CheckPinCode extends StatelessWidget {
  const CheckPinCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _checkPinCode(List<int> pinCode) async {
      bool isSuccess =
          await context.read<UserCubit>().checkPinCodeToStorage(pinCode);
      if (isSuccess) {
        context.router.replaceAll([const MainRoute()]);
      }
    }

    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
              child: Text(
            'Введите пин - код',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: AppColors.mainText),
            textAlign: TextAlign.center,
          )),
        ),
        const SizedBox(height: 4),
        PinCodeView(setPinCode: _checkPinCode, key: const Key('2')),
      ],
    );
  }
}
