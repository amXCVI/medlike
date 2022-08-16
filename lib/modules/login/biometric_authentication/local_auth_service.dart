import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  late LocalAuthentication auth = LocalAuthentication();

  static Future<bool> authenticateUser() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication _localAuthentication = LocalAuthentication();
    //status of authentication.
    bool isAuthenticated = false;
    //check if device supports biometrics authentication.
    bool isBiometricSupported = await _localAuthentication.isDeviceSupported();
    //check if user has enabled biometrics.
    //check
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;

    //if device supports biometrics and user has enabled biometrics, then authenticate.
    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await _localAuthentication.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      } on PlatformException catch (e) {
        print(e);
      }
    }
    return isAuthenticated;
  }

  /// Проверяет, есть ли вообще на устройстве возможность использовать биометрию
  static Future<bool> canCheckBiometrics() async {
    final LocalAuthentication _localAuthentication = LocalAuthentication();
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    bool isBiometricSupported = await _localAuthentication.isDeviceSupported();

    return canCheckBiometrics && isBiometricSupported;
  }

  static Future<List<BiometricType>> getAvailableBiometrics() async {
    final LocalAuthentication _localAuthentication = LocalAuthentication();

    List<BiometricType> availableBiometrics =
        await _localAuthentication.getAvailableBiometrics();

    return availableBiometrics;
  }
}
