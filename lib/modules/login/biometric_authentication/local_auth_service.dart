import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/helpers/project_determiner.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class AuthService {
  /// Checking if we could use bio to authenticate user
  static Future<bool> couldUseBio() async {
    if (ProjectDeterminer.getProjectType() == Projects.WEB) return false;

    String authMethod =
        '${await UserSecureStorage.getField(AppConstants.useBiometricMethodAuthentication)}';
    bool isSupportedBiometric = await canCheckBiometrics();
    if (authMethod == SelectedAuthMethods.pinCode.toString() ||
        authMethod == 'null' ||
        !isSupportedBiometric) {
      return false;
    }

    return true;
  }

  /// Check if we could use Face id to authenticate
  static Future<bool> canUseFaceId() async =>
      (await getAvailableBiometrics()).contains(BiometricType.face);

  /// Check if we can use finger print to authenticate user
  static Future<bool> canUseFingerprint() async =>
      (await getAvailableBiometrics()).contains(BiometricType.fingerprint);

  /// Chech if user allows authentication
  /// via biometric in phone settings
  static Future<bool> userAllowsBioAuthSystem() async =>
      await LocalAuthentication().isDeviceSupported();

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
    if (ProjectDeterminer.getProjectType() == Projects.WEB) return false;
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
