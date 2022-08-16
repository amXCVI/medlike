import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/biometric_authentication/biometric_authentication_widget.dart';
import 'package:medlike/modules/login/biometric_authentication/local_auth_service.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/pin_code/pin_code_view.dart';
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
  late bool isBiometricAuthenticate = false;

  @override
  void initState() {
    initBiometricValue();
    super.initState();
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

  void onSuccessBiometricAuthenticate() {
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
        context.router.replaceAll([const MainRoute()]);
      } else {
        AppToast.showAppToast(msg: 'Неверный пин-код');
      }
    }

    void handleBiometricAuthentication() async {
      setState(() {
        isBiometricAuthenticate = true;
      });
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
            ? PinCodeView(
                setPinCode: _saveInitialPinCode,
                key: const Key('0'),
                handleBiometricMethod: handleBiometricAuthentication,
              )
            : PinCodeView(
                setPinCode: _checkRepeatPinCode,
                key: const Key('1'),
                handleBiometricMethod: () {}),
        isBiometricAuthenticate
            ? BiometricAuthenticationWidget(
                onSuccess: onSuccessBiometricAuthenticate,
                onCancel: onCancelBiometricAuthenticate,
              )
            : const SizedBox(),
      ],
    );
  }
}
