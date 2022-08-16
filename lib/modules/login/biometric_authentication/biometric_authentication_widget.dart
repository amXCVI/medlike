import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class BiometricAuthenticationWidget extends StatelessWidget {
  BiometricAuthenticationWidget(
      {Key? key, required this.onSuccess, required this.onCancel})
      : super(key: key);

  final void Function() onSuccess;
  final void Function() onCancel;

  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Прикоснитесь к сенсору устройства',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          sensitiveTransaction: true,
          biometricOnly: true,
        ),
        authMessages: <AuthMessages>[
          const AndroidAuthMessages(
            biometricRequiredTitle: 'Прикоснитесь к сенсору устройства',
            cancelButton: 'Отмена',
            signInTitle: 'Авторизация',
            biometricHint: '',
          ),
          const IOSAuthMessages(
            cancelButton: 'Отмена',
          ),
        ],
      );
    } on PlatformException catch (e) {
      print(e);
      return;
    }

    if (authenticated) {
      onSuccess();
    } else {
      onCancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    _authenticate();

    return Container();
  }
}
