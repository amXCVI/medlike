import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/modules/login/biometric_authentication/local_auth_service.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/pin_code/pin_code_view.dart';

class CheckPinCode extends StatefulWidget {
  const CheckPinCode({Key? key}) : super(key: key);

  @override
  State<CheckPinCode> createState() => _CheckPinCodeState();
}

class _CheckPinCodeState extends State<CheckPinCode> {
  late bool isBiometricAuthenticate = false;
  int countAttempts = 0;

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
                        if (resBiometricSupported &&
                            (resAuthMethod ==
                                    SelectedAuthMethods.touchId.toString() ||
                                resAuthMethod ==
                                    SelectedAuthMethods.faceId.toString()))
                          {
                            setState(() {
                              isBiometricAuthenticate = true;
                            })
                          }
                        else
                          {
                            setState(() {
                              isBiometricAuthenticate = false;
                            })
                          }
                      })
            });
  }

  void onSuccessBiometricAuthenticate(bool result) {
    setState(() {
      isBiometricAuthenticate = false;
    });
    if (result) {
      context.read<UserCubit>().signInBiometric();
      context.router.replaceAll([const MainRoute()]);
    }
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

  void _checkSavedPinCode(BuildContext context) async {
    String sha256savedCode =
        '${await UserSecureStorage.getField(AppConstants.authPinCode)}';
    if (sha256savedCode.isEmpty || sha256savedCode == 'null') {
      context.router.replace(StartPhoneNumberRoute());
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _checkPinCode(List<int> pinCode) async {
      bool isSuccess = await context.read<UserCubit>().checkPinCodeToStorage(
          pinCode, AppConstants.countLoginAttemps - countAttempts - 1);
      if (isSuccess) {
        context.router.replaceAll([const MainRoute()]);
        return true;
      } else {
        if (countAttempts + 1 == AppConstants.countLoginAttemps) {
          context.read<UserCubit>().signOut();
          context.router.replaceAll([StartPhoneNumberRoute()]);
          return false;
        }
        setState(() {
          countAttempts = countAttempts + 1;
        });
        return false;
      }
    }

    _checkSavedPinCode(context);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListView(
        children: [
          PinCodeView(
            pinCodeTitle: 'Введите пин - код',
            setPinCode: _checkPinCode,
            key: const Key('2'),
            height: constraints.maxHeight,
            handleBiometricMethod: onSuccessBiometricAuthenticate,
            isForcedShowingBiometricModal: isBiometricAuthenticate ?? false,
          ),
        ],
      );
    });
  }
}
