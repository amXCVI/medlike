import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:flutter/foundation.dart';
//import 'package:sentry_flutter/sentry_flutter.dart';

class ResumeHelper {
  static Future<bool> isAppBlocked() async {
    const dur = Duration(
      minutes: kDebugMode ? 60 : AppConstants.timeoutDurationMinutes
    );

    final timeString = await UserSecureStorage.getField(AppConstants.timeoutStart);
    if(timeString != null) {
      final time = DateTime.tryParse(timeString);
      if(time == null || DateTime.now().difference(time) >= dur) {
        //Sentry.captureMessage("PINCODE: $timeString | $time | ${DateTime.now()}");
        return true;
      }
    }
    return false;
  }

  static void resume() {
    UserSecureStorage.deleteField(AppConstants.timeoutStart);
  }
}
