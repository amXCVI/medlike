import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/modules/login/biometric_authentication/local_auth_service.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/pin_code/pin_code_view.dart';
import 'package:medlike/themes/colors.dart';

class CheckPinCode extends StatefulWidget {
  const CheckPinCode({Key? key}) : super(key: key);

  @override
  State<CheckPinCode> createState() => _CheckPinCodeState();
}

class _CheckPinCodeState extends State<CheckPinCode> {
  late bool isBiometricAuthenticate;

  @override
  void initState() {
    super.initState();
    initBiometricValue();
  }

  void initBiometricValue() async {
    await AuthService.canCheckBiometrics()
        .then((resBiometricSupported) async => {
              await UserSecureStorage.getField(
                      AppConstants.useBiometricMethodAuthentication)
                  .then((resAuthMethod) => {
                        if (!resBiometricSupported || resAuthMethod == 'false')
                          {
                            setState(() {
                              isBiometricAuthenticate = false;
                            })
                          }
                        else
                          {
                            setState(() {
                              isBiometricAuthenticate = true;
                            })
                          }
                      })
            });
  }

  void onSuccessBiometricAuthenticate(bool result) {
    setState(() {
      isBiometricAuthenticate = false;
    });
    context.read<UserCubit>().signInBiometric();
    context.router.replaceAll([const MainRoute()]);
  }

  void onCancelBiometricAuthenticate() {
    setState(() {
      isBiometricAuthenticate = false;
    });
  }

  void handleBiometricMethod() {
    setState(() {
      isBiometricAuthenticate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _checkPinCode(List<int> pinCode) async {
      bool isSuccess =
          await context.read<UserCubit>().checkPinCodeToStorage(pinCode);
      if (isSuccess) {
        context.router.replaceAll([const MainRoute()]);
        return true;
      } else {
        return false;
      }
    }

    return ListView(
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
        PinCodeView(
          setPinCode: _checkPinCode,
          key: const Key('2'),
          handleBiometricMethod: onSuccessBiometricAuthenticate,
        ),
      ],
    );
  }
}
