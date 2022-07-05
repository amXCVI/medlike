import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/pin_code_page/pin_code_view.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

class InitialPinCode extends StatefulWidget {
  const InitialPinCode({Key? key}) : super(key: key);

  @override
  State<InitialPinCode> createState() => _InitialPinCodeState();
}

class _InitialPinCodeState extends State<InitialPinCode> {
  late List<int> initialPinCode;
  late int step = 0;

  @override
  Widget build(BuildContext context) {
    void _savePinCode(List<int> pinCode) {
      context.read<UserCubit>().setPinCodeToStorage(pinCode);
    }

    void _saveInitialPinCode(List<int> initialCode) {
      setState(() {
        initialPinCode = initialCode;
        step = 1;
      });
    }

    void _checkRepeatPinCode(List<int> repeatPinCode) {
      if (initialPinCode.join('') == repeatPinCode.join('')) {
        _savePinCode(repeatPinCode);
        RouteData.of(context).router.navigateNamed(AppRoutes.main);
      } else {
        AppToast.showAppToast(msg: 'Неверный пин-код');
      }
    }

    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
              child: Text(
            step == 0
                ? 'Придумайте пин-код\nдля быстрого входа в приложение'
                : 'Повторите пин-код',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: AppColors.mainText),
            textAlign: TextAlign.center,
          )),
        ),
        const SizedBox(height: 4),
        step == 0
            ? PinCodeView(setPinCode: _saveInitialPinCode, key: const Key('0'))
            : PinCodeView(setPinCode: _checkRepeatPinCode, key: const Key('1')),
      ],
    );
  }
}
