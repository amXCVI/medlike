import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

Future<bool> checkIsSavedPinCode() async {
  final isSavedPinCode =
        '${await UserSecureStorage.getField(AppConstants.isSavedPinCodeForAuth)}' ==
            'true';
    final token =
        '${await UserSecureStorage.getField(AppConstants.accessToken)}';

    return token != 'null' && token.toString().isNotEmpty && isSavedPinCode;
}
